
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<!--============================Head============================-->
<head>
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
			<meta name="robots" content="noindex,nofollow" />
						
<!--=========Title=========-->
            <title>Scoutbar Backend Interface</title>
            
<!--=========Stylesheets=========-->
            <link href="css/style.css" rel="stylesheet" type="text/css"/>
            <link href="css/blue.css" rel="stylesheet" type="text/css"/>
            <link href="css/invalid.css" rel="stylesheet" type="text/css"/>
            <!--[if lt IE 8]>
                        <link href="css/ie.css" rel="stylesheet" type="text/css"/>
			<![endif]-->
 

</head>
<!--End Head-->


<!--============================Body============================-->
<body>
<?
$current = "personen";
require('header.php');
?>



<!--============================ Template Content Background ============================-->
<div id="content_bg" class="clearfix">

<!--============================ Main Content Area ============================-->
<div class="content wrapper clearfix">
	<!--============================Sidebar============================-->
	<div class="sidebar">
		<!--=========History Box=========-->
		<div class="small_box">
			<div class="header">
				<img src="images/history_icon.png" alt="History" width="24" height="24" />History
			</div>
			<div class="body">
				<ul class="bulleted_list">
					<li><a href="@">Lorem ipsum dolor sit amet,<br />
						consectetur</a></li>
					<li><a href="@">Excepteur sint occaecat cupidatat</a></li>
				</ul>
			</div>
		</div>
		<!--End History Box-->
		<!--=========Calendar Box=========-->
		<div class="small_box">
			<div class="header">
				<img src="images/calendar_icon.png" alt="Calendar" width="24" height="24" />Calendar
			</div>
			<div class="body">
				<div id="date" class="clearfix">
				</div>
				<!--Date picker applied to any div of date id-->
			</div>
		</div>
		<!--End Calendar Box-->
		<!--=========Users Box=========-->
		<div class="small_box">
			<div class="header">
				<img src="images/users_icon.png" alt="History" width="24" height="24" />Online Users
			</div>
			<div class="body">
				<ul class="user_list">
					<li><img src="images/user_placeholder.gif" width="54" height="54" alt="Username" /><a href="#">John Doe</a><small>Administrator</small></li>
					<li><img src="images/user_placeholder.gif" width="54" height="54" alt="Username" /><a href="#">John Doe</a><small>Administrator</small></li>
				</ul>
			</div>
		</div>
		<!--End Users Box-->
		<!--========= Accordion Box =========-->
		<div class="small_box clearfix">
			<div class="header">
				<img src="images/accordion_icon.png" alt="Accordion" width="24" height="24" />Accordion
			</div>
			<div class="body">
				<!--=== Accordion ===-->
				<div class="clearfix accordion">
					<!-- Accordion 1 -->
					<h2 class="current"> <img src="images/arrow_right.png" alt="" width="6" height="6" class="arrow_right" /> <img src="images/arrow_down.png" alt="" width="6" height="6" class="arrow_down" /> First pane </h2>
					<div class="pane">
						<!-- All div's with a class of .pane will become accordion panes -->
						<ul>
							<li>Sub Menu Item</li>
							<li>Sub Menu Item</li>
							<li>Sub Menu Item</li>
						</ul>
					</div>
					<!-- Accordion 2-->
					<h2> <img src="images/arrow_right.png" alt="" width="6" height="6" class="arrow_right" /> <img src="images/arrow_down.png" alt="" width="6" height="6" class="arrow_down" /> Second pane </h2>
					<div class="pane">
						<ul>
							<li>Sub Menu Item</li>
							<li>Sub Menu Item</li>
							<li>Sub Menu Item</li>
						</ul>
					</div>
					<!-- Accordion 3 -->
					<h2> <img src="images/arrow_right.png" alt="" width="6" height="6" class="arrow_right" /> <img src="images/arrow_down.png" alt="" width="6" height="6" class="arrow_down" /> Third pane </h2>
					<div class="pane">
						<ul>
							<li>Sub Menu Item</li>
							<li>Sub Menu Item</li>
							<li>Sub Menu Item</li>
						</ul>
					</div>
				</div>
				<!--End Accordion-->
			</div>
		</div>
		<!--End Accordion Box-->
	</div>
	<!--End sidebar-->
	<!--============================Main Column============================-->
	<div class="main_column">
		<!--=========Graph Box=========-->
		<div  class="box expose">
			<!-- A box with class of expose will call expose plugin automatically -->
			<div class="header">
				<img src="images/tables_icon.png" alt="Accordion" width="30" height="30" />Graphs
			
			</div>
			<div class="body">
                                           <div id="chart_div"></div>
			</div>
		</div>
		<!--End Graph Box-->
		<!--=========Tables Box=========-->
		<div class="box">
			<div class="header">
				<!--===Sub Navigation===-->
				<ul class="sub_nav">
					<!-- To make tabs in box header, just use "sub_nav" class on UL -->
					<li title="De laatste bestellingen"><a href="#" class="current">Laatste bestellingen</a></li>
					<li title="Alle bijschrijvingen"><a href="#">Laaste bijschrijving</a></li>
				</ul>
				<!--End sub navigation-->
				<img src="images/tables_icon.png" alt="Accordion" width="30" height="30" />Tables
			</div>
			<div class="body">
				<div class="panes">
					<!-- Any div under the class of "panes" will associate itself in the same order as the tabs defined above under "sub_nav"-->
					<!-- Pane 1 -->
					<div class="clearfix">
                                        
					</div>
					<!-- Pane 2 -->
					<div class="clearfix">
                                   
					</div>
                                </div>
                        </div>
                                       
		</div>
               
		<!--End Tables Box-->
                
                <!--=========Tables Box=========-->
		<div class="box">
			<div class="header">
				<!--===Sub Navigation===-->
				<ul class="sub_nav">
					<!-- To make tabs in box header, just use "sub_nav" class on UL -->
					<li title="De laatste bestellingen"><a href="#" class="current">Laatste bestellingen</a></li>
					<li title="Alle bijschrijvingen"><a href="#">Laaste bijschrijving</a></li>
				</ul>
				<!--End sub navigation-->
				<img src="images/tables_icon.png" alt="Accordion" width="30" height="30" />Tables
			</div>
			<div class="body">
				<div class="panes">
					<!-- Any div under the class of "panes" will associate itself in the same order as the tabs defined above under "sub_nav"-->
					<!-- Pane 1 -->
					<div class="clearfix">
                                        
					</div>
					<!-- Pane 2 -->
					<div class="clearfix">
                                   
					</div>
                                </div>
                        </div>
                                       
		</div>
	</div>

<!--End main content area-->
</div>
<!--End Template Content bacground-->



<!--============================Footer============================-->
<div id="footer">
	<div class="wrapper">
	Copyright (C) <? echo date('Y'); ?> Scouting Stadskanaal door Peter Mein en Tim Mein - SCOUTBAR BAR SYSTEM.
	</div>
</div>
<!--End Footer-->

<!--============================Modal============================-->

    <script type="text/javascript" src="https://www.google.com/jsapi"></script>

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

                        
            <script type="text/javascript">
    
    // Load the Visualization API and the piechart package.
    google.load('visualization', '1', {'packages':['corechart']});
      
    // Set a callback to run when the Google Visualization API is loaded.
    google.setOnLoadCallback(drawChart);
      
    function drawChart() {
      var jsonData = $.ajax({
          url: "getDataPersonen.php",
          dataType:"json",
          async: false
          }).responseText;
          
      // Create our data table out of JSON data loaded from server.
      var data = new google.visualization.DataTable(jsonData);
      var numRows = data.getNumberOfRows();
      
       var formatter = new google.visualization.NumberFormat(
      {prefix: '€', negativeColor: 'red'});
  formatter.format(data, 1); // Apply formatter to second column

      // Instantiate and draw our chart, passing in some options.
      var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
      var expectedHeight = (numRows * 30)-1;
            chart.draw(data, {width: '100%', height: expectedHeight,allowHtml: true});

     
    }

    </script>

<!--========= Feeling sorry for ie6=========-->
			<!--[if lt IE 7]>
						<script type="text/javascript" src="js/dd_png_fix.js"></script>
						<script>DD_belatedPNG.fix('img, div, a');</script>
			 <![endif]-->



</body>
<!--End Body-->



</html>