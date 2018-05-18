
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
<%
if request("act")="del" then
id=request("id")
conn.execute "delete from lyb where lyid="&id
response.redirect"lylist.asp"
end if
%>

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
						<h2><i class="icon-edit"></i> 预约管理</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
					<!--内容开始-->
                    <%
dim intPage,page,pre,last,filepath 
set rs=server.CreateObject("adodb.recordset")
    sql="select * from lyb where (ly=0 or ly=1) order by lydate desc"
rs.PageSize = 10 '这里设定每页显示的记录数
rs.CursorLocation = 3
rs.open sql,conn,3,3

	
if rs.eof then
			
else
pre = true
last = true
page = trim(Request.QueryString("page"))

if len(page) = 0 then
intpage = 1
pre = false
else
if cint(page) =< 1 then
intpage = 1
pre = false
else
if cint(page) >= rs.PageCount then
intpage = rs.PageCount
last = false
else
intpage = cint(page)
end if
end if
end if
if not rs.eof then
rs.AbsolutePage = intpage
end if 
	do while not rs.eof and count<rs.PageSize
%>
  <table width="98%" height="132" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
    <tr>
      <td colspan="4"><a href="reply.asp?id=<%=rs("lyid")%>">填写预约备注</a>　　　<a href="lylist.asp?act=del&id=<%=rs("lyid")%>">删除</a></td>
    </tr>
    <tr>
      <td >联系人：</td>
      <td width="35%"><%=rs("LyName")%></td>
      <td width="15%" align="center" valign="middle">电话：</td>
      <td width="38%"><%=rs("tel")%></td>
    </tr>
    <tr>
      <td>预约时间：</td>
      <td><%=rs("lydate")%></td>
      <td align="center" valign="middle">面积：</td>
      <td><%=rs("mianji")%></td>
    </tr>
    <tr >
      <td >服务类型：</td>
      <td><%=rs("Ser")%></td>
      <td align="center" valign="middle" >造园类型：</td>
      <td><%=rs("zhaoyuan")%></td>
    </tr>
    <tr >
      <td >户型：</td>
      <td><%=rs("huxing")%></td>
      <td align="center">IP地址：</td>
      <td><%=rs("lyIp")%></td>
    </tr>
    <tr >
    <td>地址：</td>
    <td><%=rs("adderss")%></td>
    <td>预约说明：</td>
    <td><%=rs("content")%></td>
    </tr>
  <tr >
    <td width="12%">用户来源：</td>
    <td colspan="3"><%=rs("liaojie")%></td>
  </tr>
  
  <tr >
    <td >管理员备注：</td>
    <td colspan="3"><%=rs("lyreply")%></td>
  </tr>
</table>
<%
rs.movenext
count=count+1
loop
end if
%>
  <table width="98%" height="25" border="0" align="center" cellpadding="5" cellspacing="1" borderColorLight=#808080 borderColorDark=#ffffff class="table">
  <tr >
    <%if rs.pagecount > 0 then%>
    <td width="15%" align="center" valign="middle" class="back"  >当前页<%=intpage%>/<%=rs.PageCount%></td>
    <%else%>
    <td width="15%" align="center" valign="middle" class="back" >当前页0/0</td>
    <%end if%>
    <td width="70%" align="right" class="back" ><a href="?page=1">首页</a>|</span>
        <%if pre then%>
        <a href="?page=<%=intpage -1%>">上页</a>|</span>
        <%end if%>
        <%if last then%>
        <a href="?page=<%=intpage +1%>">下页</a> |</span>
        <%end if%>
        <a href="?page=<%=rs.PageCount%>">尾页</a>|转到第
      <select name="select" onChange="javascript:location=this.options[this.selectedIndex].value;">
          <%
for i = 1 to rs.PageCount
if i = intpage then%>
          <option value="?page=<%=i%>" selected><%=i%></option>
          <%else%>
          <option value="?page=<%=i%>"><%=i%></option>
          <%
end if
next
rs.close
set rs=nothing
%>
        </select>
    页</td>
  </tr>
</table>
                    <!--内容结束-->
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
