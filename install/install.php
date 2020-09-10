<?php

			//	persianscript.ir - install script ;)
			// load required files
			include ( '../inc/config.php' );
			include ( '../inc/classes/core.class.php' );
			include ( '../inc/classes/token.class.php' );

			// set memory and time limit higher
			ini_set( 'memory_limit', '5120M' );
			set_time_limit( 0 );

			// remove sql comments
			function remove_comments( &$output )
			{
			     $lines = explode( "\n", $output );
			     $output = "";
			     $linecount = count( $lines );
			     $in_comment = false;
			     for ( $i = 0; $i < $linecount; $i++ ) {
			          if ( preg_match( "/^\/\*/", preg_quote( $lines[$i] ) ) ) {
			               $in_comment = true;
			          }

			          if ( !$in_comment ) {
			               $output .= $lines[$i] . "\n";
			          }

			          if ( preg_match( "/\*\/$/", preg_quote( $lines[$i] ) ) ) {
			               $in_comment = false;
			          }
			     }
			     unset( $lines );
			     return $output;
			}

			// remove remarks
			function remove_remarks( $sql )
			{
			     $lines = explode( "\n", $sql );
			     $sql = "";
			     $linecount = count( $lines );
			     $output = "";
			     for ( $i = 0; $i < $linecount; $i++ ) {
			          if ( ( $i != ( $linecount - 1 ) ) || ( strlen( $lines[$i] ) > 0 ) ) {
			               if ( isset( $lines[$i][0] ) && $lines[$i][0] != "#" ) {
			                    $output .= $lines[$i] . "\n";
			               } else {
			                    $output .= "\n";
			               }
			               $lines[$i] = "";
			          }
			     }
			     return $output;
			}

			// splits sql file
			function split_sql_file( $sql, $delimiter )
			{
			     $tokens = explode( $delimiter, $sql );
			     $sql = "";
			     $output = array();
			     $matches = array();
			     $token_count = count( $tokens );
			     for ( $i = 0; $i < $token_count; $i++ ) {
			          if ( ( $i != ( $token_count - 1 ) ) || ( strlen( $tokens[$i] > 0 ) ) ) {
			               $total_quotes = preg_match_all( "/'/", $tokens[$i], $matches );
			               $escaped_quotes = preg_match_all( "/(?<!\\\\)(\\\\\\\\)*\\\\'/", $tokens[$i], $matches );
			               $unescaped_quotes = $total_quotes - $escaped_quotes;
			               if ( ( $unescaped_quotes % 2 ) == 0 ) {
			                    $output[] = $tokens[$i];

			                    $tokens[$i] = "";
			               } else {
			                    $temp = $tokens[$i] . $delimiter;
			                    $tokens[$i] = "";
			                    $complete_stmt = false;

			                    for ( $j = $i + 1; ( !$complete_stmt && ( $j < $token_count ) ); $j++ ) {
			                         $total_quotes = preg_match_all( "/'/", $tokens[$j], $matches );
			                         $escaped_quotes = preg_match_all( "/(?<!\\\\)(\\\\\\\\)*\\\\'/", $tokens[$j], $matches );

			                         $unescaped_quotes = $total_quotes - $escaped_quotes;

			                         if ( ( $unescaped_quotes % 2 ) == 1 ) {
			                              $output[] = $temp . $tokens[$j];
			                              $tokens[$j] = "";
			                              $temp = "";

			                              $complete_stmt = true;
			                              $i = $j;
			                         } else {
			                              $temp .= $tokens[$j] . $delimiter;
			                              $tokens[$j] = "";
			                         }

			                    }
			               }
			          }
			     }
			     return $output;
			}

			// run
			$dump = 'persianscript-install.sql';
			if ( !file_exists( $dump ) )
			     die( 'Error no sql file' );

			$conn = mysql_connect( MYSQL_HOST, MYSQL_USERNAME, MYSQL_PASSWORD ) or die( 'Error connecting to mysql' );
			mysql_select_db( MYSQL_DATABASE, $conn ) or die( 'Error database selection' );


			// get base url
			$base_url = str_replace( 'install/' . basename( __file__ ), '', core::getCurrentUrl() );

			// check for tables
			$query = 'SELECT * from settings';
			$data = mysql_query( $query );

			if ( !$data ) {
			     $sql_query = @fread( @fopen( $dump, 'r' ), @filesize( $dump ) ) or die( 'Error: opening ' . $dump );
			     $sql_query = remove_remarks( $sql_query );
			     $sql_query = split_sql_file( $sql_query, ';' );

			     $i = 1;
			     foreach ( $sql_query as $sql ) {
			          mysql_query( $sql ) or die( 'Error in query' );
			          $i++;
			     }

			     // make new token
			     $query = 'UPDATE settings SET base_url="' . $base_url . '", token="' . myToken::make() . '" WHERE ID="1"';
			     mysql_query( $query );
			     $i++;

			     echo 'Total Queries: ' . $i . '<br>';
			     echo '<strong style="color:green;">Nasb Tamam Shod - Poshe install Ra delete konid</strong>';
			} else {
			     echo '<strong style="color:green;">Script Ghablan Nasb shodeh! :| Folder install Ra Delete Konid</strong>';
			}

			// close connection
			mysql_close( $conn );
