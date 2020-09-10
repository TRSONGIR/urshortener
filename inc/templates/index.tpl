<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="fa"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="fa"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="fa"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="fa"> <!--<![endif]-->
<head>
	<meta charset="utf-8">
	<title><?php echo $config['site_name']; ?> | Url shortened service</title>
	<meta name="description" content="<?php echo $config['site_name']; ?> url shortener service">
	<meta name="author" content="persianscript.ir">
    <link rel="alternate" type="application/rss+xml" title="Latest Urls" href="<?php echo $is_admin ? $config['base_url'].'feed.rss?token='.$config['token']:$config['base_url'].'feed.rss'; ?>" />
    <link rel="stylesheet" href="stylesheets/basic.css">
    <link rel="stylesheet" href="stylesheets/app.css">
    <link rel="stylesheet" href="stylesheets/date-picker.css">
	<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	<link rel="shortcut icon" href="images/favicon.ico">
</head>
<body>
    <div id="wrapper">
        <header>
            <div id="logo"><a href="<?php echo $config['base_url']; ?>"><?php echo $config['site_name']; ?></a></div>
        </header>
        <div id="main" role="main">
            <div id="info"><p style="<?php echo $show_error; ?>"><?php echo $error; ?></p></div>
            <form action="<?php echo $config['base_url'];?>API/write/post" method="post" id="mainform" autocomplete="off">
            <div id="qrCode">
                <div class="qrTooltip" style="<?php echo $qrcode; ?>"></div>
            </div>            
                <input type="text" id="url" name="url" value="<?php echo $value; ?>" placeholder="Enter website url!"/>
                <input type="submit" id="submit" class="button submit normal" value="shrink" name="submit">
                <div id="tools">
                    <input type="text" class="inputaData" id="custom" name="custom" maxlength="60" placeholder="نام دلخواه"/>
                    <input type="text" class="inputaData" id="password" name="password" maxlength="10" placeholder="رمز"/>
                    <input type="number" class="inputaData" id="uses" name="uses" min="0" max="100000" step="10" placeholder="بازدید" pattern="[0-9]"/>
                    <input type="text" class="inputaData" id="expire" name="expire" placeholder="انقضا" readonly="readonly"/>
                    <span class="checkbox unchecked">
                        <label>public</label>
                        <input type="checkbox" name="private" id="private" />
                    </span>                
                </div>
            </form>
        </div>
        <footer>
            <p><a href="<?php echo $config['base_url']; ?>" data-tip="بازگشت به خانه!">خانه</a>
			| <a href="#" id="custom_link" class="arrow-center" data-tip="ميخواهيد لينک دلخواه خود را داشته باشيد؟">دلخواه</a>
			| <a href="<?php echo $config['base_url'];?>multishrink.html" class="arrow-center" data-tip="چندین لینک دارید؟ اینجا کلیک کنید">کوتاه کردن چندین لینک</a>
			| <a href="javascript:var%20e=document.createElement('script');e.setAttribute('language','javascript');e.setAttribute('src','<?php echo $config['base_url']; ?>bookmarlet/load.js?url='+encodeURIComponent(location.href));document.body.appendChild(e);void(0);" class="arrow-center" data-tip="به علاقه مندی مرورگر اضافه کنید">بوکمارک</a>
			| <a href="<?php echo $config['base_url']; ?>developer.html" class="arrow-center" data-tip="Hi Developer, use our API!">API</a> | <a href="<?php echo $config['base_url']; ?>stats.html" class="arrow-center" data-tip="Public stats!">آمار</a>
			| <a href="http://mtro.us/P" class="arrow-center" data-tip="ما رو دوست دارید؟ &hearts;">فیسبوک</a></p>
        </footer>            
    </div><!-- wrapper -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/libs/jquery-1.7.1.min.js"><\/script>')</script>
    <script src="js/jquery.datepick.js"></script>
    <script src="js/script.min.js"></script>
    <script>
      var _gaq=[["_setAccount","<?php echo $config['google_tracking']; ?>"],["_trackPageview"]];
      (function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];g.async=1;
      g.src=("https:"==location.protocol?"//ssl":"//www")+".google-analytics.com/ga.js";
      s.parentNode.insertBefore(g,s)}(document,"script"));
    </script>
</body>
</html>