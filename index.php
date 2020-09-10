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
			include ( 'inc/load.php' );

			// check for session
			$session = new mySession(true);
            $session->setName( 'metro_shrink' );
			$data = $session->get();
            
            // for non ajax requests
            $value='';
            $qrcode = 'display:none;';
            $error = '';     
                   
			// check if have session
            if (isset($data['data']['status'])){
                if($data['data']['status']=='custom_old'){
                    $value = $data['data']['full'];
                    $error = 'Custom name already taken!';
                } else{
                    $value = $data['data']['url'];
                    $qrcode = 'background-image:url(' . $data['data']['url'] . '.qrcode?s=100);';
                }
            }
            
            // handle errors
            if (isset($data['error'])){
                $error = $data['error']['msg'];
            }
            $show_error = $error==''?'display:none;':'';
            
            // kill session data
			$session->kill();
            include ( 'inc/templates/index.tpl' );