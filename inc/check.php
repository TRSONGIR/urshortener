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

			// load the config
			include ( 'load.php' );

			// set correct headers
			header( 'Content-type: application/json' );

			// allow crossdomain serving
			header( 'Access-Control-Allow-Origin: *' );

			// print response
			echo json_encode( array( 'success' => true, 'version' => METROSHRINK_VERSION ) );
