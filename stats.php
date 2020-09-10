<?php



			/**************************************************************************************************
			| 
			| http://alternanetworks.com
			| ask@alternanetworks.com
			|
			|**************************************************************************************************
			|
			| By using this software you agree that you have read and acknowledged our End-User License 
			| Agreement available at http://envato.com/ and to be bound by it.
			|
			| Copyright (c) 2010 - 2012 alternanetworks.com All rights reserved.
			|
			| http://codecanyon.net/user/AlternaNetworks 
			|**************************************************************************************************/

			//error_reporting( E_ALL );
			//ini_set( 'display_errors', '1' );

			
            // load the system
			include_once ( 'inc/load.php' );

			// catch data
			$id = isset( $_GET['id'] ) ? core::sanitize( $_GET['id'] ) : false;
			$password = isset( $_POST['password'] ) ? core::sanitize( $_POST['password'] ) : false;

			// check for database
			$query = 'SELECT * FROM ' . $config['table_prefix'] . $config['table_name'] . ' WHERE BINARY short="' . $id . '"ORDER BY ID LIMIT 0,1';

			// check if url already exist
			$data = $db->fetch( $query );
			if ( isset( $data[0]['ID'] ) && $data[0]['ID'] != '' ) {

			     $data = $data[0];

			     // quick checks
			     $inactive = $data['inactive'] == 1 ? true : false;
			     $expire = $data['expire'] != '0000-00-00 00:00:00' ? true : false;
			     $uses = $data['uses'] != '' ? true : false;
			     $password = $data['password'] != '' ? true : false;
			     $ads = $config['use_ads'] == true && $data['ads'] == 1 ? true : false;
			     $remove = false;

			     // if url is inactive
			     if ( $inactive ) {
			          $msg = 'This Url is inactive';
			     }

			     // expired
			     if ( $expire ) {
			          $diff = strtotime( $data['expire'] ) - time();
			          if ( $diff <= 0 ) {
			               $msg = 'This Url has expired';
			          }
			     }

			     // uses
			     if ( $uses ) {
			          if ( $data['uses'] == 0 ) {
			               $msg = 'Number of clicks ran out!';
			          }
			     }

			     // handle errors
			     if ( isset( $msg ) ) {
			          include ( 'inc/templates/error.tpl' );
			          die();
			     }

			     // password protected?
			     $session = new mySession();
			     $session->setName( $id );
			     $check_session = $session->get() ? true : false;
			     if ( !$check_session ) {
			          if ( $password ) {
			               $session->setName( $id . '_redir' );
			               $session->set( $config['base_url'] . $data['short'] . '/stats' );
			               header( 'Location:' . $config['base_url'] . $data['short'] . '/unlock' );
			               die();
			          }
			     }
			     include_once ( 'inc/templates/stats.tpl' );
			} else {
			     // invalid id
			     header( 'HTTP/1.0 404 Not Found' );
			     $msg = 'Invalid ID';
			     include ( 'inc/templates/error.tpl' );
			}
