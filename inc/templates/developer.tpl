<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8"/>
<title><?php echo $config['site_name']; ?> | developer API</title>
<meta name="description" content="<?php echo $config['site_name']; ?> developer API">
<link rel="stylesheet" href="<?php echo $config['base_url']; ?>stylesheets/developer.css">
<link rel="shortcut icon" href="<?php echo $config['base_url']; ?>images/favicon.ico">
</head>
<body>
<div id="wrapper">

		<h1>API</h1>
		<br/><br/>
		<strong><?php echo $config['site_name']; ?> offers a powerful API to interact with other sites.</strong>
        <br/><br/>
		<h2>Simple API</h2>
		<ul>
			<li><strong>GET requests</strong>: <code><?php echo $config['base_url']; ?>api.php?url=YOUR-LONG-URL&custom=YOUR-CUSTOM-NAME</code></li>
		</ul>  
		<pre style="padding:10px 10px 0 10px;">
<?php echo $config['base_url']; ?>P
        </pre>              
		<br/><br/>
		<h2>Write API Endpoints:</h2>
		<ul>
			<li><strong>GET requests</strong>: <code><?php echo $config['base_url']; ?>API/write/get</code></li>
			<li><strong>POST requets</strong>: <code><?php echo $config['base_url']; ?>api/write/post</code></li>
		</ul>
		<br/>
		<h2>Variables:</h2>
		<br/>
		You can pass up to 8 variables to control the response or your application. <br/>
		<ul>
			<li><strong>url</strong>: <code>The url you want to shrink.</code> required.</li>
			<li><strong>custom</strong>: <code>Custom name.</code> optional.</li>
			<li><strong>type</strong>: <code>Response type (json|xml).</code> optional, default: json.</li>
            <li><strong>private</strong>: <code>Set url to private (not listed).</code> optional</li>
            <li><strong>password</strong>: <code>Set url password.</code> optional (max 10 chars)</li>
            <li><strong>uses</strong>: <code>Number of uses for the url.</code> optional</li>
            <li><strong>expire</strong>: <code>date in format MM/DD/YYYY to expire url.</code> optional</li>
            <li><strong>via</strong>: <code>Adds a signature to track your application.</code> optional</li>
		</ul>
		<h2>Example:</h2>
        <br />
		<code><?php echo $config['base_url']; ?>API/write/get?url=http://youtube.com&amp;custom=mycustomname&amp;type=xml</code>
		<br /><br />
		<h2>XML Response example:</h2><br />
		<pre>
    &lt;response&gt;
        &lt;success&gt;1&lt;/success&gt;
            &lt;data&gt;
                &lt;id&gt;mycustomname&lt;/id&gt;
                &lt;url&gt;<?php echo $config['base_url']; ?>mycustomname&lt;/url&gt;
                &lt;full&gt;http://youtube.com&lt;/full&gt;
                &lt;hits&gt;0&lt;/hits&gt;
                &lt;status&gt;custom_new&lt;/status&gt;
                &lt;via&gt;api&lt;/via&gt;
                &lt;date&gt;1330715001&lt;/date&gt;
                &lt;last&gt;1330719941&lt;/last&gt;
            &lt;/data&gt;
    &lt;/response&gt;
        </pre>
        <br/><br/>
		<h2>Read API Endpoints:</h2>
		<ul>
			<li><strong>GET requests</strong>: <code><?php echo $config['base_url']; ?>API/read/get</code></li>
			<li><strong>POST requets</strong>: <code><?php echo $config['base_url']; ?>api/read/post</code></li>
		</ul>
		<h2>Variables:</h2>
		<br/>
		You can pass up to three variables to control the response or your application. <br/>
		<ul>
			<li><strong>id</strong>: <code>ID of the url you want to access.</code> required.</li>
			<li><strong>password</strong>: <code>password for url (if protected).</code> optional.</li>
            <li><strong>type</strong>: <code>Response type (json|xml).</code> optional, default: json.</li>
		</ul>
		<h2>Example:</h2>
        <br />
		<code><?php echo $config['base_url']; ?>API/read/get?id=P&amp;password=0000&amp;type=xml</code>
        <br /><br />
		<h2>XML Response example:</h2><br />
		<pre>
    &lt;response&gt;
        &lt;success&gt;1&lt;/success&gt;
            &lt;data&gt;
                &lt;id&gt;P&lt;/id&gt;
                &lt;hits&gt;101&lt;/hits&gt;
                &lt;ads&gt;1&lt;/ads&gt;
                &lt;hits&gt;0&lt;/hits&gt;
                &lt;full&gt;http://google.com&lt;/full&gt;
                &lt;created&gt;1334239095&lt;/created&gt;
                &lt;last&gt;1334241124&lt;/last&gt;
            &lt;/data&gt;
    &lt;/response&gt;
        </pre>       
        <hr />  
        <h2>Tags:</h2>
        <ul>
            <li><strong>success</strong>: <code>(true|false) for request success.</code></li>
            <li>data:
                <ul>
                    <li><strong>id</strong>: <code>Unique identifier of url.</code></li>
                    <li><strong>url</strong>: <code>Shortened url.</code></li>
                    <li><strong>full</strong>: <code>Full url before shortened.</code></li>
                    <li><strong>uses</strong>: <code>Clicks left to inactivate url.</code></li>
                    <li><strong>hits</strong>: <code>Number of hits to the link.</code></li>
                    <li><strong>ads</strong>: <code>Indicate if url use ads.</code></li>
                    <li><strong>date</strong>: <code>Timestamp where the url was make.</code></li>
                    <li><strong>last</strong>: <code>Timestamp for the las click.</code></li>
                    <li><strong>last</strong>: <code>Timestamp to inactivate link.</code></li>                    
                </ul>
            </li>
        </ul>
		<br/><br/>    
		<h2>XML Error example:</h2><br />
		<pre>
    &lt;response&gt;
        &lt;success&gt;0&lt;/success&gt;
            &lt;error&gt;
                &lt;code&gt;0&lt;/code&gt;
                &lt;msg&gt;domain not allowed&lt;/msg&gt;
            &lt;/error&gt;
    &lt;/response&gt;
        </pre>
        <br/><br/>
        <h2>Tags:</h2>
        <ul>
            <li><strong>success</strong>: <code>(true|false) for request success.</code></li>
            <li>error:
                <ul>
                    <li><strong>code</strong>: <code>Error code: 0, 1 and 2.</code></li>
                    <li><strong>url</strong>: <code>Error msg.</code></li>
                </ul>
            </li>
        </ul>
		<br/><br/>
        <p>- <?php echo $config['site_name']; ?></p>
</div>
</body>
</html>