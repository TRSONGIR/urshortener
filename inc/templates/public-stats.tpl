<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8"/>
<title><?php echo $config['site_name']; ?> | آمار عمومي</title>
<meta name="description" content="<?php echo $config['site_name']; ?> آمار عمومي">
<link rel="stylesheet" href="<?php echo $config['base_url']; ?>stylesheets/basic.css">
<link rel="stylesheet" href="<?php echo $config['base_url']; ?>stylesheets/stats.css">
<link rel="shortcut icon" href="<?php echo $config['base_url']; ?>images/favicon.ico">
</head>
<body>
<div id="wrapper">
    <header>
        <h1>آمار سایت</h1>
        <p style="color:#fff;font-size: 12px;font-family:tahoma">لينک هاي کوتاه شده: <?php echo $total_urls;?> | تعداد بازدید: <?php echo $total_hits;?> | بازدید امروز: <?php echo $today_urls;?> </p>
    </header>
	<div id="main" class="info">
        <ul class="urls">
        <li class="info"><span class="url">لینک کوتاه</a><span><span class="hits">بازدید</span></li>
<?php
    if ($urls){ 
        foreach($urls as $item){
            echo '<li class="normal">';
            echo '<span class="url"><a href="'.$config['base_url'].$item['short'].'/stats" data-tip="'.$item['url'].'">'.$config['base_url'].$item['short'].'</a></span>';
            echo '<span class="social"><div class="button facebook" data-tip="اشتراک در facebook"></div><div class="button twitter" data-tip="اشتراک در twitter"></div><div class="button googleplus" data-tip="اشتراک در google+"></div></span>';
            echo '<span class="hits">'.$item['hits'].'</span>';
            echo '</li>';
        }
    }
?>            
        </ul>
        <?php echo $pager->render(); ?>
    </div>
    <footer>
            <p><a href="<?php echo $config['base_url']; ?>" data-tip="بازگشت به خانه!">خانه</a>
			| <a href="#" id="custom_link" class="arrow-center" data-tip="ميخواهيد لينک دلخواه خود را داشته باشيد؟">دلخواه</a>
			| <a href="<?php echo $config['base_url'];?>multishrink.html" class="arrow-center" data-tip="چندین لینک دارید؟ اینجا کلیک کنید">کوتاه کردن چندین لینک</a>
			| <a href="javascript:var%20e=document.createElement('script');e.setAttribute('language','javascript');e.setAttribute('src','<?php echo $config['base_url']; ?>bookmarlet/load.js?url='+encodeURIComponent(location.href));document.body.appendChild(e);void(0);" class="arrow-center" data-tip="به علاقه مندی مرورگر اضافه کنید">بوکمارک</a>
			| <a href="<?php echo $config['base_url']; ?>developer.html" class="arrow-center" data-tip="Hi Developer, use our API!">API</a> | <a href="<?php echo $config['base_url']; ?>stats.html" class="arrow-center" data-tip="Public stats!">آمار</a>
			| <a href="http://mtro.us/P" class="arrow-center" data-tip="ما رو دوست دارید؟ &hearts;">فیسبوک</a></p>
        </footer>                     
</div>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/libs/jquery-1.7.1.min.js"><\/script>')</script>
    <script src="js/stats.js"></script>
    <script>
      var _gaq=[["_setAccount","<?php echo $config['google_tracking']; ?>"],["_trackPageview"]];
      (function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];g.async=1;
      g.src=("https:"==location.protocol?"//ssl":"//www")+".google-analytics.com/ga.js";
      s.parentNode.insertBefore(g,s)}(document,"script"));
    </script>
</body>
</html>