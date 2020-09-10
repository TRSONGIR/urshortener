<!DOCTYPE html>
<html lang="fa">
<head>
<meta charset="utf-8"/>
<title><?php echo $config['site_name']; ?> | کوتاه کننده لينک</title>
<meta name="description" content="<?php echo $config['site_name']; ?> کوتاه کننده لينک">
<link rel="stylesheet" href="<?php echo $config['base_url']; ?>stylesheets/basic.css">
<link rel="stylesheet" href="<?php echo $config['base_url']; ?>stylesheets/multi.css">
<link rel="shortcut icon" href="<?php echo $config['base_url']; ?>images/favicon.ico">
</head>
<body>
<div id="wrapper">
    <header>
        <h1>آمار سايت</h1>
    </header>
	<div id="main" class="info" style="direction:rtl;">
        <div class="qrcode"><a href="<?php echo $config['base_url'].$data['short'];?>.qrcode?download" target="_parent" title="دريافت qrCode"><img src="<?php echo $config['base_url'].$data['short'];?>.qrcode?s=128" width="128" height="128" alt="qrcode"/></a></div>	
        <p style="font-size:20pt; font-weight:bold;font-family:BYekan;"><?php echo $data['hits']; ?> کليک</p>
        <p><span>آدرس:</span> <a href="<?php echo $config['base_url'] . $data['short']; ?>"><?php echo $config['base_url'] . $data['short']; ?></a></p>
        <p><span>ايجاد شده:</span> <?php echo $data['created']; ?></p>
        <p><span>آخرين بازديد:</span> <?php echo $data['last']; ?></p>
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
</body>
</html>