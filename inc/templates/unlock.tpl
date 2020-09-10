<!DOCTYPE html>
<html lang="fa">
<head>
<meta charset="utf-8"/>
<title><?php echo $config['site_name']; ?> | لينک رمز دار</title>
<meta name="description" content="<?php echo $config['site_name']; ?> لينک رمز دار">
<link rel="stylesheet" href="<?php echo $config['base_url'];?>stylesheets/basic.css">
<link rel="stylesheet" href="<?php echo $config['base_url'];?>stylesheets/multi.css">
<link rel="shortcut icon" href="<?php echo $config['base_url'];?>images/favicon.ico">
</head>
<body>
<div id="wrapper">
    <header>
        <h1>لينک رمز دار</h1>
    </header>
	<div id="main" style="margin-top:10px;">	
            <form method="post">
                <input type="password" id="password" name="password" maxlength="30" placeholder="password" style="margin:0 0 0 175px;padding:10px;width:240px;border:0;"/>
                <input type="submit" class="button" value="باز کن!"/>    
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
    <script>
      var _gaq=[["_setAccount","<?php echo $config['google_tracking']; ?>"],["_trackPageview"]];
      (function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];g.async=1;
      g.src=("https:"==location.protocol?"//ssl":"//www")+".google-analytics.com/ga.js";
      s.parentNode.insertBefore(g,s)}(document,"script"));
    </script>
</div>
</body>
</html>