
<!DOCTYPE html>
<html lang="en">
<!--#include file="hhconn.asp"-->
<head>

	<meta charset="gb2312">
	<title>网站信息</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
	<meta name="author" content="Muhammad Usman">

	<!-- The styles -->
	<link id="bs-css" href="css/bootstrap-cerulean.css" rel="stylesheet">
	<style type="text/css">
	  body {
		padding-bottom: 40px;
	  }
	  .sidebar-nav {
		padding: 9px 0;
	  }
	</style>
	<link href="css/bootstrap-responsive.css" rel="stylesheet">
	<link href="css/charisma-app.css" rel="stylesheet">
	<link href="css/jquery-ui-1.8.21.custom.css" rel="stylesheet">
	<link href='css/fullcalendar.css' rel='stylesheet'>
	<link href='css/fullcalendar.print.css' rel='stylesheet'  media='print'>
	<link href='css/chosen.css' rel='stylesheet'>
	<link href='css/uniform.default.css' rel='stylesheet'>
	<link href='css/colorbox.css' rel='stylesheet'>
	<link href='css/jquery.cleditor.css' rel='stylesheet'>
	<link href='css/jquery.noty.css' rel='stylesheet'>
	<link href='css/noty_theme_default.css' rel='stylesheet'>
	<link href='css/elfinder.min.css' rel='stylesheet'>
	<link href='css/elfinder.theme.css' rel='stylesheet'>
	<link href='css/jquery.iphone.toggle.css' rel='stylesheet'>
	<link href='css/opa-icons.css' rel='stylesheet'>
	<link href='css/uploadify.css' rel='stylesheet'>

	<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

	<!-- The fav icon -->
	<link rel="shortcut icon" href="img/favicon.ico">
	<style type="text/css">
	h1,h2,h3,h4,h5,h6 {
	font-family: "微软雅黑", sans-serif;
}
    </style>

</head>

<body>

		<!--#include file="head.asp"-->
		<div class="container-fluid">
		<div class="row-fluid">
				
<!--#include file="leftmenu.asp"-->
			
			<noscript>
				<div class="alert alert-block span10">
					<h4 class="alert-heading">Warning!</h4>
					<p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
				</div>
			</noscript>
			
			<div id="content" class="span10">
			<!-- content starts -->
			

			<div>
				<ul class="breadcrumb">
					<li>
						<a href="#">首页</a> <span class="divider">/</span>
					</li>
					<li>
						<a href="#">基本信息</a>
					</li>
				</ul>
			</div>
			
			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-edit"></i> <%=type_wj%></h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
                    <form name="form1" method="post" action="reply.asp">
<%
 id=request("id")

if request("act")="reply" then
lyreply=replace(replace(request("replys"),",","，"),"'","’")
conn.execute "update lyb set lyreply='"&lyreply&"',lyname='"&Request.Form("lyname")&"',tel='"&Request.Form("tel")&"',adderss='"&Request.Form("adderss")&"',mianji='"&Request.Form("mianji")&"',huxing='"&Request.Form("huxing")&"',zhaoyuan='"&Request.Form("zhaoyuan")&"' where lyid="&id 
response.redirect "lylist.asp"
else
set rs=server.createobject("adodb.recordset")
sql="select * from lyb where lyid="&id
rs.open sql,conn,3,3
if rs.eof then
else

lytext=rs("content")

end if
%> <br>
<br>
<br>
<br>
  <table width="60%" height="132" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
    <tr >
      <td width="9%" height="25" align="center" >备注内容</td>
      <td width="91%" height="25" ><%=lytext%></td>
    </tr>
        <tr >
      <td height="25" align="center">姓名：</td>
      <td height="25"><input name="lyname" type="text" id="lyname" value="<%=rs("lyname")%>"></td>
    </tr>
            <tr >
      <td height="25" align="center">电话：</td>
      <td height="25"><input name="tel" type="text" id="tel" value="<%=rs("tel")%>"></td>
    </tr>
    <tr >
      <td height="25" align="center">地址：</td>
      <td height="25"><input name="adderss" type="text" id="adderss" value="<%=rs("adderss")%>"></td>
    </tr>
        <tr >
      <td height="25" align="center">面积：</td>
      <td height="25"><input name="mianji" type="text" id="mianji" value="<%=rs("mianji")%>"></td>
    </tr>
<tr >
      <td height="25" align="center">造园类型：</td>
      <td height="25"><input name="zhaoyuan" type="text" id="zhaoyuan" value="<%=rs("zhaoyuan")%>"></td>
    </tr>
    <tr >
      <td height="25" align="center">户型：</td>
      <td height="25"><input name="huxing" type="text" id="huxing" value="<%=rs("huxing")%>"></td>
    </tr>
    <tr >
      <td height="25" align="center">管理员备注</td>
      <td height="25"><textarea name="replys" rows="6" id="replys"><%=rs("lyreply")%></textarea></td>
    </tr>
    
<!--    <tr >
      <td height="25" align="center">首页显示</td>
      <td height="25"><input name="sh" type="checkbox" id="sh" value="yes" <%if Rs("sh")=True then%>checked<%End if%>></td>
    </tr>-->
    <tr >
      <td colspan="2" align="center"><input type="submit" name="Submit" value="提交"> <input type="button" onClick="history.back();" name="Submit" value="返回">
      <input name="act" type="hidden" id="act" value="reply">
      <input name="id" type="hidden" id="id" value="<%=id%>"></td>
    </tr>
  </table>
</form>
<%end if%>
					<!------------>
                    
					</div>
				</div><!--/span-->

			</div><!--/row-->


			<div class="row-fluid sortable"><!--/span-->
			
			</div><!--/row-->
			
			<div class="row-fluid sortable"><!--/span-->

			</div><!--/row-->
    
					<!-- content ends -->
			</div><!--/#content.span10-->
				</div><!--/fluid-row-->
				
		<hr>

		<div class="modal hide fade" id="myModal">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h3>Settings</h3>
			</div>
			<div class="modal-body">
				<p>Here settings can be configured...</p>
			</div>
			<div class="modal-footer">
				<a href="#" class="btn" data-dismiss="modal">Close</a>
				<a href="#" class="btn btn-primary">Save changes</a>
			</div>
		</div>

<!--#include file="footer.asp"-->
		
	</div><!--/.fluid-container-->

	<!-- external javascript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

	<!-- jQuery -->
	<script src="js/jquery-1.7.2.min.js"></script>
	<!-- jQuery UI -->
	<script src="js/jquery-ui-1.8.21.custom.min.js"></script>
	<!-- transition / effect library -->
	<script src="js/bootstrap-transition.js"></script>
	<!-- alert enhancer library -->
	<script src="js/bootstrap-alert.js"></script>
	<!-- modal / dialog library -->
	<script src="js/bootstrap-modal.js"></script>
	<!-- custom dropdown library -->
	<script src="js/bootstrap-dropdown.js"></script>
	<!-- scrolspy library -->
	<script src="js/bootstrap-scrollspy.js"></script>
	<!-- library for creating tabs -->
	<script src="js/bootstrap-tab.js"></script>
	<!-- library for advanced tooltip -->
	<script src="js/bootstrap-tooltip.js"></script>
	<!-- popover effect library -->
	<script src="js/bootstrap-popover.js"></script>
	<!-- button enhancer library -->
	<script src="js/bootstrap-button.js"></script>
	<!-- accordion library (optional, not used in demo) -->
	<script src="js/bootstrap-collapse.js"></script>
	<!-- carousel slideshow library (optional, not used in demo) -->
	<script src="js/bootstrap-carousel.js"></script>
	<!-- autocomplete library -->
	<script src="js/bootstrap-typeahead.js"></script>
	<!-- tour library -->
	<script src="js/bootstrap-tour.js"></script>
	<!-- library for cookie management -->
	<script src="js/jquery.cookie.js"></script>
	<!-- calander plugin -->
	<script src='js/fullcalendar.min.js'></script>
	<!-- data table plugin -->
	<script src='js/jquery.dataTables.min.js'></script>

	<!-- chart libraries start -->
	<script src="js/excanvas.js"></script>
	<script src="js/jquery.flot.min.js"></script>
	<script src="js/jquery.flot.pie.min.js"></script>
	<script src="js/jquery.flot.stack.js"></script>
	<script src="js/jquery.flot.resize.min.js"></script>
	<!-- chart libraries end -->

	<!-- select or dropdown enhancer -->
	<script src="js/jquery.chosen.min.js"></script>
	<!-- checkbox, radio, and file input styler -->
	<script src="js/jquery.uniform.min.js"></script>
	<!-- plugin for gallery image view -->
	<script src="js/jquery.colorbox.min.js"></script>
	<!-- rich text editor library -->
	<script src="js/jquery.cleditor.min.js"></script>
	<!-- notification plugin -->
	<script src="js/jquery.noty.js"></script>
	<!-- file manager library -->
	<script src="js/jquery.elfinder.min.js"></script>
	<!-- star rating plugin -->
	<script src="js/jquery.raty.min.js"></script>
	<!-- for iOS style toggle switch -->
	<script src="js/jquery.iphone.toggle.js"></script>
	<!-- autogrowing textarea plugin -->
	<script src="js/jquery.autogrow-textarea.js"></script>
	<!-- multiple file upload plugin -->
	<script src="js/jquery.uploadify-3.1.min.js"></script>
	<!-- history.js for cross-browser state change on ajax -->
	<script src="js/jquery.history.js"></script>
	<!-- application script for Charisma demo -->
	<script src="js/charisma.js"></script>
	
		
</body>
</html>
