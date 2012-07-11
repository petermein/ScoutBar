<?
require('config.php');
?>

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
$current = "home";
require('header.php');
?>



<!--============================ Template Content Background ============================-->
<div id="content_bg" class="clearfix">

<!--============================ Main Content Area ============================-->
<div class="content wrapper clearfix">
	<!--============================Sidebar============================-->
	<div class="sidebar">
		
		<!--=========Users Box=========-->
		<div class="small_box">
			<div class="header">
				<img src="images/users_icon.png" alt="History" width="24" height="24" />Wall of Fame
			</div>
			<div class="body">
				<ul class="user_list">
                                    <?
$sql_query = "SELECT * FROM personen WHERE saldo < 0 ORDER BY saldo ASC LIMIT 5";
if (!$con) {
    die('Could not connect: ' . mysql_error());
}
mysql_select_db($dbname, $con);
$result = mysql_query($sql_query);

while ($row = mysql_fetch_array($result)) {
					echo "<li><img src=\"../assets/". $row['imgpath'] ."\" width=\"41\" height=\"54\" alt=\"". htmlentities($row['voornaam']) ."\"/><a href=\"#\">". htmlentities($row['voornaam']) ." ". htmlentities($row['achternaam']) ."</a><br>Saldo ". number_format($row['saldo'], 2)."</li>";
}			
    ?>
    </ul>
			</div>
		</div>
	
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

                                             <div id="chart2_div"></div>

			</div>
		</div>
		<!--End Graph Box-->
		<!--=========Tables Box=========-->
	
                
	</div>
        
        
        
        	<!--=======================Forms and Further Sub-Navigations==========================-->
	<div class="box clear">
		<div class="header">
			<img src="images/tables_icon.png" alt="Accordion" width="30" height="30" />Statestieken
		</div>
		<div class="body_vertical_nav clearfix">
			<!-- Grey backgound applied to box body -->
			<!-- Vertical nav -->
			<ul class="vertical_nav">
				<li class="active"><a href="#">Producten overzicht</a></li>
				<li><a href="#">Laatste bestellingen</a></li>
				<li><a href="#">Personen overzicht</a></li>
				<li><a href="#">Personen history</a></li>
				<li><a href="#">Geschatte kassa inhoud</a></li>
			</ul>
			<div class="main_column">
				<!-- Content area that wil show the form and stuff -->
				<div class="panes_vertical">
					<!-- All divs inside this div will become panes for navigation above -->
					<div>
					<select name="productselect" id="select">
                                            <?
                                           			$sql_query = "SELECT * FROM product_product WHERE categorie < 4 ORDER BY categorie";
if (!$con) {
    die('Could not connect: ' . mysql_error());
}
mysql_select_db($dbname, $con);
$result = mysql_query($sql_query);

while ($row = mysql_fetch_array($result)) {
					echo "<option value=\"". $row['product_id'] ."\">". $row['naam'] ."</option>";
}
?>
					</select>
                                            <div id="product_chart_div"></div>
					</div>
					<div>
						  <div id="table_div"></div>
					</div>
					<div>
						<div id="chart3_div"></div>
					</div>
					<!-- Fourth Pane -->
					<div>
                                            					<select name="persoonselect" id="select">
                                            <?
                                           			$sql_query = "SELECT * FROM personen WHERE level <> 1 OR level IS NULL ORDER BY voornaam";
if (!$con) {
    die('Could not connect: ' . mysql_error());
}
mysql_select_db($dbname, $con);
$result = mysql_query($sql_query);

while ($row = mysql_fetch_array($result)) {
					echo "<option value=\"". $row['persoon_id'] ."\">". htmlentities($row['voornaam']) ." ". htmlentities($row['achternaam']) ."</option>";
}
?>
					</select>
                                            	<div id="chart4_div"></div>
					</div>
                                        <div>
						<div id="chart5_div"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--End Forms and Sub-Nav's Box-->

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
    google.load('visualization', '1', {'packages':['corechart', 'table']});
      
    // Set a callback to run when the Google Visualization API is loaded.
    google.setOnLoadCallback(drawChart);
      
    function drawChart() {
      var jsonData = $.ajax({
          url: "getData.php",
          dataType:"json",
          async: false
          }).responseText;
          
          var jsonData2 = $.ajax({
          url: "datatable.php",
          dataType:"json",
          async: false
          }).responseText;
          
            var jsonData3 = $.ajax({
          url: "getDataPersonen.php",
          dataType:"json",
          async: false
          }).responseText;
           
            var jsonData4 = $.ajax({
          url: "getDataKassa.php",
          dataType:"json",
          async: false
          }).responseText;
          
      // Create our data table out of JSON data loaded from server.
      var data = new google.visualization.DataTable(jsonData);
      var data2 = new google.visualization.DataTable(jsonData2);
      var data3 = new google.visualization.DataTable(jsonData3);
      var data4 = new google.visualization.DataTable(jsonData4);
      var numRows = data3.getNumberOfRows();
      
       var formatter = new google.visualization.NumberFormat(
      {prefix: '€', negativeColor: '#FF0000'});
        formatter.format(data, 1); // Apply formatter to second column
        formatter.format(data2, 1); // Apply formatter to second column
        formatter.format(data3, 1);
           formatter.format(data4, 2); 
              formatter.format(data4, 3); 
      // Instantiate and draw our chart, passing in some options.
      var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
      chart.draw(data, {width: '100%', height: 300});
            
       var chart2 = new google.visualization.ColumnChart(document.getElementById('chart2_div'));
       chart2.draw(data, {width: '100%', height: 300});

    var expectedHeight = (numRows * 30);
    var formatter2 = new google.visualization.BarFormat({width: 120});
        formatter2.format(data3, 1);
  
        var chart3 = new google.visualization.Table(document.getElementById('chart3_div'));
       chart3.draw(data3, {width: '100%', allowHtml: true});

        var table = new google.visualization.Table(document.getElementById('table_div'));
       table.draw(data2, {allowHtml: true, showRowNumbers: true});
        
          var table2 = new google.visualization.Table(document.getElementById('chart5_div'));
       table2.draw(data4, {allowHtml: true, showRowNumbers: true});
       
        
          productChart($("select[name='productselect']").val());
          persoonChart($("select[name='productselect']").val());

        }
        
        
        function productChart(product) {
            console.log("refresh for"+product)
            var d = new Date();
      var testData = $.ajax({
          url: "getdataproduct.php?p="+product,
          dataType:"json",
          async: false
          }).responseText;
          
          
      // Create our data table out of JSON data loaded from server.
      var datas = new google.visualization.DataTable(testData);
      
      // Instantiate and draw our chart, passing in some options.
      var charts = new google.visualization.ColumnChart(document.getElementById('product_chart_div'));
      charts.draw(datas, {width: '100%', height: 300});
   
            
        }
        
        
        function persoonChart(product) {
            console.log("refresh for"+product)
            var d = new Date();
      var testData2 = $.ajax({
          url: "getdataproductpersoon.php?p="+product,
          dataType:"json",
          async: false
          }).responseText;
          
          
      // Create our data table out of JSON data loaded from server.
      var datas2 = new google.visualization.DataTable(testData2);
      
      // Instantiate and draw our chart, passing in some options.
      var charts8 = new google.visualization.ColumnChart(document.getElementById('chart4_div'));
      charts8.draw(datas2, {width: '100%', height: 300});
        }
        
        
        

        $("select[name='productselect']").change(function() {
            productChart($(this).val());
        });
        
         $("select[name='persoonselect']").change(function() {
            persoonChart($(this).val());
        });
     

    </script>

<!--========= Feeling sorry for ie6=========-->
			<!--[if lt IE 7]>
						<script type="text/javascript" src="js/dd_png_fix.js"></script>
						<script>DD_belatedPNG.fix('img, div, a');</script>
			 <![endif]-->


</div>
</body>
<!--End Body-->



</html>