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


			class myToken
			{
			     const ALPHA = 'abcdefghijklmnopqrstvwxyz';
			     const NUMERIC = '0123456789';

			     public static function make( $length = 64, $chars = "" )
			     {
			          if ( $chars == "" ) {
			               $chars .= self::NUMERIC . self::ALPHA . strtoupper( self::ALPHA );
			          }
			          $token = "";
			          for ( $i = 0; $i < $length; $i++ ) {
			               $token .= $chars[mt_rand( 0, strlen( $chars ) - 1 )];
			          }
			          return $token;
			     }

			}