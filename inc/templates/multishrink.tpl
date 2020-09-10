<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8"/>
<title><?php echo $config['site_name']; ?> | کوتاه کردن چندين لينک همزمان</title>
<meta name="description" content="<?php echo $config['site_name']; ?> MultiShrink">
<link rel="stylesheet" href="<?php echo $config['base_url'];?>stylesheets/basic.css">
<link rel="stylesheet" href="<?php echo $config['base_url'];?>stylesheets/multi.css">
<link rel="stylesheet" href="<?php echo $config['base_url'];?>stylesheets/date-picker.css">
<link rel="shortcut icon" href="<?php echo $config['base_url'];?>images/favicon.ico">
</head>
<body>
<div id="wrapper">
    <header>
        <h1><a href="<?php echo $config['base_url']; ?>multishrink.html"><span style="color:#b4b4b4;">کوتاه کننده </span> <span style="color:#FF0068;">چندين لينک</span></a></h1>
    </header>
	<div id="main">	
            <form method="post" id="multishrink">
                <textarea name="urls" placeholder="آدرس سايت ها را در هر خط وارد کنيد."><?php echo $new_urls; ?></textarea>
                <input type="text" id="password" name="password" maxlength="10" placeholder="رمز لينک" value="<?php echo $getPassword; ?>"/>
                <input type="number" id="uses" name="uses" min="0" max="100000" step="10" placeholder="بازديد" pattern="[0-9]" value="<?php echo $getUses; ?>"/>
                <input type="text" id="expire" name="expire" placeholder="انقضا" readonly="readonly" value="<?php echo $getExpire ? $_POST['expire'] : null; ?>"/>
                <input type="checkbox" name="private" id="private"/><label for="private">خصوصي</label>
                <input type="checkbox" name="download" id="download"/><label for="download">دانلود</label>
                <input type="submit" class="button" value="کوتاه کن!" style="float:right;"/>    
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
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="<?php echo $config['base_url'];?>js/libs/jquery-1.7.1.min.js"><\/script>')</script>
    <script src="<?php echo $config['base_url'];?>js/jquery.datepick.js"></script>
    <script>
        jQuery(document).ready(function($) {
            // date picker
            $('#expire').datepick({
                minDate: +1,
                showAnim: '',
            });              
        });
    </script>
    <script>
      var _gaq=[["_setAccount","<?php echo $config['google_tracking']; ?>"],["_trackPageview"]];
      (function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];g.async=1;
      g.src=("https:"==location.protocol?"//ssl":"//www")+".google-analytics.com/ga.js";
      s.parentNode.insertBefore(g,s)}(document,"script"));
    </script>
</div>
</body>
</html>