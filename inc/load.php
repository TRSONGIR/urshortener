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

			//error_reporting(E_ALL);
			//ini_set('display_errors', '1');

			define( 'METROSHRINK_VERSION', '2.1' );

			/* load configuration */
			include ( dirname( __file__ ) . '/config.php' );

			$config = array();
			$config['table_prefix'] = '';
			$config['table_name'] = 'urls';
			$config['table_settings'] = 'settings';
			$config['table_ads'] = 'ads';
			$config['table_domains_banned'] = 'banned_domains';
			$config['table_domains_allowed'] = 'allowed_domains';
            $config['table_clients'] = 'banned_clients';

			/* include required files */
			include ( dirname( __file__ ) . '/classes/grabvars.class.php' );
			include ( dirname( __file__ ) . '/classes/database.class.php' );
			include ( dirname( __file__ ) . '/classes/resolver.class.php' );
			include ( dirname( __file__ ) . '/classes/qrcode.class.php' );
			include ( dirname( __file__ ) . '/classes/serializer.class.php' );
			include ( dirname( __file__ ) . '/classes/session.class.php' );
			include ( dirname( __file__ ) . '/classes/core.class.php' );
            include ( dirname( __file__ ) . '/classes/tracking.class.php' );
			include ( dirname( __file__ ) . '/classes/myAuth.class.php' );
            include ( dirname( __file__ ) . '/classes/token.class.php' );
            include ( dirname( __file__ ) . '/classes/rss.class.php' );
			include ( dirname( __file__ ) . '/classes/myPager.class.php' );
			include ( dirname( __file__ ) . '/functions/functions.php' );

			/* mysql connect */
			$db = dbFacile::open( 'mysql', MYSQL_DATABASE, MYSQL_USERNAME, MYSQL_PASSWORD, MYSQL_HOST );

			// load settings
			$config_data = $db->fetch( 'SELECT * FROM ' . $config['table_prefix'] . $config['table_settings'] . ' ORDER BY ID LIMIT 0,1' );
			if ( isset( $config_data[0]['ID'] ) ) {
			     $config = array_merge( $config, $config_data[0] );
			} else {
			     die( 'ERROR: Check your Database settings.' );
			}

			// timezone
			date_default_timezone_set( $config['timezone'] );

			if ( empty( $config['base_url']) )
                die('Error: run installation script');

			// get own domain
			$own_domain = parse_url( $config['base_url'] );
			$config['domain'] = $own_domain['host'];

			// get allowed domains
			$getAD = $db->fetch( 'SELECT host FROM ' . $config['table_prefix'] . $config['table_domains_allowed'] . ' ORDER BY ID ASC' );

			$allowed_domains = array();
			foreach ( $getAD as $domain ) {
			     $allowed_domains[] = $domain['host'];
			}
			$config['allowed_domains'] = $allowed_domains;

			// get banned domains;
			$getBD = $db->fetch( 'SELECT host FROM ' . $config['table_prefix'] . $config['table_domains_banned'] . ' ORDER BY ID ASC' );

			$banned_domains = array();
			foreach ( $getBD as $domain ) {
			     $banned_domains[] = $domain['host'];
			}

			// merge own domain with banned ones
			$banned_domains = array_merge( array( $config['domain'] ), $banned_domains );
			$config['banned_domains'] = $banned_domains;


			// get banned clients;
			$getBC = $db->fetch( 'SELECT ip FROM ' . $config['table_prefix'] . $config['table_clients'] . ' ORDER BY ID ASC' );
			$banned_clients = array();
			foreach ( $getBC as $client ) {
			     $banned_clients[] = $client['ip'];
			}
			$config['banned_clients'] = $banned_clients;


			// check if admin is logged
			$check_ = new myAuth();
			$check_->setResource( 'mtro' );
			$is_admin = $check_->checkAuth();