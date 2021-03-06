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

            // auth 
            $auth = new myAuth();
            $auth->setResource('mtro');
            $auth->setBadLanding('login.php');
            $auth->setGoodLanding('banned.php');
            $auth->checkAuth();  
            $auth->forceAuth(false);          
            $auth->redirect();    
            
            // prepare arrays

            $array_by = array('ID','host','name','date');
            $array_order = array('DESC','ASC');
            $array_count = array('20','40','60','80','100');
            
            
            // catch the variables
            $results = isset($_GET['results']) && is_numeric($_GET['results'])? core::sanitize(min(max(intval($_GET['results']), 10), 100)) : 20;
            $order = isset($_GET['sort']) && in_array(strtoupper($_GET['sort']),$array_order) ? core::sanitize(strtoupper($_GET['sort'])) : 'DESC';
            $order_by = isset($_GET['order_by']) && in_array(strtolower($_GET['order_by']), $array_by)? core::sanitize(strtolower($_GET['order_by'])) : 'ID';

            // total items
            $total_urls = $db->fetch( 'SELECT COUNT(*) AS TOTAL FROM ' . $config['table_prefix'] . $config['table_domains_banned'] );
            $total_urls = $total_urls[0]['TOTAL'];

            // pager
            $pager = new myPager();
            $pager->setTotalItems($total_urls);
            $pager->setItemsPerPage($results);
            $pager->setQueryVar('page');
            $pager->setClass('nice');
            
            // the query
            $query = 'SELECT * FROM ' . $config['table_prefix'] . $config['table_domains_banned'] . ' ORDER BY ' . $order_by . ' ' . $order . ' LIMIT ' . $pager->getQueryLimit() . ',' . $pager->getQueryOffset();
            $urls = $db->fetch( $query );
            $urls = isset($urls[0]['ID']) ? $urls : false;                        
                  			
            include('inc/templates/banned.tpl');