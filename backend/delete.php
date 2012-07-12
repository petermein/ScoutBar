


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<!--============================Head============================-->
<head>
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
			<meta name="robots" content="noindex,nofollow" />
						
<!--=========Title=========-->
            <title>Evolution Admin Backend Interface</title>
            
<!--=========Stylesheets=========-->
            <link href="css/style.css" rel="stylesheet" type="text/css"/>
            <link href="css/blue.css" rel="stylesheet" type="text/css"/>
            <link href="css/invalid.css" rel="stylesheet" type="text/css"/>
            <!--[if lt IE 8]>
                        <link href="css/ie.css" rel="stylesheet" type="text/css"/>
			<![endif]-->
 

</head>
<!--End Head-->

<!--============================Begin Body============================-->
<body id="login_page">

<!--Wrapper of 450px-->
<div class="wrapper content">
  <div class="error">
    <strong><img src="images/iinfo_icon.png" alt="Information" width="28" height="29" class="icon" /></strong>Row deleted.<a href="#" class="close_notification" title="Click to Close"><img src="images/close_icon.gif" width="6" height="6" alt="Close" /></a>
  </div>
  <div class="box">
    <!--Begin Login Header-->
    <div class="header">
      <p><img src="images/half_width_icon.png" alt="Half Width Box" width="30" height="30" />Verwijder bericht</p>
    </div>
    <!--End Login Header-->
    
    <div class="body">
      
        <? 
include('config.php'); 
$id = (int) $_GET['id']; 
mysql_query("DELETE FROM `news_ticker` WHERE `id` = '$id' ") ; 
?> 

<a href='index.php'>Back To Listing</a>
        
        
    </div>
  </div>

</div>
<!--End Wrapper-->


<!--=========jQuery and jQuery Tools		-->
            <script type="text/javascript" src="js/jquery.tools.min.js"></script> <!--Import jquery library and jquery tools from a single file-->
						
<!--=========Preload script for css and images=========-->
            <script type="text/javascript" src="js/preloadCssImages.jQuery_v5.js"></script>
            
<!--=========Scripts=========-->
            <script type="text/javascript" src="js/script.js"></script>
            
<!--=========Date picker=========-->
            <script type="text/javascript" src="js/jCal.js"></script>
            <script type="text/javascript" src="js/jquery.animate.clip.js"></script>
            
            
<!--=========Visualize for charting=========-->
            <script type="text/javascript" src="js/visualize.jQuery.js"></script>
            <!--[if IE]><script language="javascript" type="text/javascript" src="js/excanvas.min.js"></script><![endif]-->
            

<!--=========wysiwyg editor=========-->
            <script type="text/javascript" src="js/jquery.wysiwyg.js"></script>
            

<!--=========jExpand for Expanding Tables=========-->
            <script type="text/javascript" src="js/jExpand.js"></script>
            

<!--=========Data Tables=========-->
            <script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
			<script type="text/javascript" src="js/TableTools.min.js"></script>
			<script type="text/javascript" src="js/ZeroClipboard.js"></script>


<!--========= Feeling sorry for ie6=========-->
			<!--[if lt IE 7]>
						<script type="text/javascript" src="js/dd_png_fix.js"></script>
						<script>DD_belatedPNG.fix('img, div, a');</script>
			 <![endif]-->

</body>
<!--End Body-->


</html>
