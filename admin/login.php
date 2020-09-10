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
			| Copyright (c) 2011 alternanetworks.com All rights reserved.
			|
			| http://codecanyon.net/user/AlternaNetworks 
			|**************************************************************************************************/
			
            //error_reporting( E_ALL );
			//ini_set( 'display_errors', '1' );

		
        	// load the system
			include ( "../inc/load.php" );
            
            //auth
            $auth = new myAuth();
            $auth->setResource('mtro');
            $auth->forceAuth(false);
            $auth->checkAuth();
            $auth->redirect(); 
            
            include('inc/templates/login.tpl');