<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/login.css" rel="stylesheet" type="text/css" />
<title>ورود - پنل مدیریت</title>
</head>
<body>
	<h1>کنترل پنل</h1>
	<p class="info">مشخصات مدير را وارد کنيد</p>
        <form action="<?php echo $config['base_url'].'admin/inc/';?>auth.php" method="post" autocomplete="off">
            <p>
                <input name="username" type="text" id="username" class="input large" placeholder="نام کاربري" />
            </p>
            <p>
                <input name="password" type="password" id="password" class="input large" placeholder="رمز عبور" />
            </p>
            <p>
                <input type="submit" name="Submit" id="button" value="ورود" class="submit"/>
                <div id="loader"></div>
            </p>
	</form>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../js/libs/jquery-1.7.1.min.js"><\/script>')</script>
    <script src="js/login.js"></script>            
</body>
</html>