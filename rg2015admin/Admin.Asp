
<!DOCTYPE html>
<html lang="en">
<!--#include file="hhconn.asp"-->
<!--#Include File="Function.Asp"-->
<!--#include File="Md5.Asp"-->
<head>

	<meta charset="gb2312">
	<title>管理员管理</title>
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
						<h2><i class="icon-edit"></i> 管理员信息</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
			<table width="600" border="0" align="center" cellpadding="5" cellspacing="1" class="table" style="margin-top:5px;">

</table>
<script language="javascript">
function ConfirmDel()
{
   if(confirm("确定要删除选中的项目吗？一旦删除将不能恢复！"))
     return true;
   else
     return false;	 
}

function checkAdminForm()
{
	if (document.Form1.AdminName.value=="")
		{
			alert("管理员名称不能为空，请您填写！")
			document.Form1.AdminName.focus();
			return false;
		}
	if (document.Form1.AdminPass.value=="")
		{
			alert("管理员密码不能为空，请您填写！")
			document.Form1.AdminPass.focus();
			return false;
		}
	if (document.Form1.AdminPass2.value=="")
		{
			alert("管理员确认密码不能为空，请您填写！")
			document.Form1.AdminPass2.focus();
			return false;
		}
	if (document.Form1.AdminPass.value!=document.Form1.AdminPass2.value)
		{
			alert("两次密码输入不一致！请重新输入!")
			document.Form1.AdminPass.value="";
			document.Form1.AdminPass2.value="";
			document.Form1.AdminPass.focus();
			return false;
		}
	return true;
}

function checkAdminForm2()
{
	if (document.Form1.AdminPass.value=="")
		{
			alert("管理员密码不能为空，请您填写！")
			document.Form1.AdminPass.focus();
			return false;
		}
	if (document.Form1.AdminPass2.value=="")
		{
			alert("管理员确认密码不能为空，请您填写！")
			document.Form1.AdminPass2.focus();
			return false;
		}
	if (document.Form1.AdminPass.value!=document.Form1.AdminPass2.value)
		{
			alert("两次密码输入不一致！请重新输入!")
			document.Form1.AdminPass.value="";
			document.Form1.AdminPass2.value="";
			document.Form1.AdminPass.focus();
			return false;
		}
	return true;
}				
		

function unselectall()
{
    if(document.del.chkAll.checked){
	document.del.chkAll.checked = document.del.chkAll.checked&0;
    } 	
}

function CheckAll(form)
  {
  for (var i=0;i<form.elements.length;i++)
    {
    var e = form.elements[i];
    if (e.Name != "chkAll")
       e.checked = form.chkAll.checked;
    }
  }
function ConfirmDel()
{
   if(confirm("确定要删除选中的管理员吗？一旦删除将不能恢复！"))
     return true;
   else
     return false;
	 
}

</SCRIPT>
<%
Dim Id
Id=Trim(Request.QueryString("id"))

Dim act

act=Trim(Request.QueryString("act"))
if act="del" and Id<>"" then
safeRequest(id)
	conn.execute "delete from [Table_manager] where adminId in ("&Id&")"
	call sHowPop("删除成功!","Admin.Asp",1)
End if
Dim Action
Action=Trim(Request.QueryString("Action"))
select case Action
case ""
%>
<table width="600" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
  <form Name="Form1" action="?Action=Save" method="Post" onSubmit="return checkAdminForm();">
  <tr>
    <td width="80" align="center" class="back">用户名：</td>
    <td width="106" align="left" class="hback"><input name="AdminName" type="text" id="AdminName" style=";height:18px;" size="12" ></td>
    <td width="60" align="center" class="back">密码：</td>
    <td width="106" align="left" class="hback"><input name="AdminPass" type="password" id="AdminPass" style="height:18px;" size="12" ></td>
    <td width="80" align="center" class="back">确认密码：</td>
    <td width="106" align="left" class="hback"><input name="AdminPass2" type="password" id="AdminPass2" style="height:18px;" size="12" ></td>
    <td width="60" align="center" class="back"><input type="submit" name="Submit" value="提交"></td>
  </tr>
  </form>
</table>
<%case "Edit"
safeRequest(id)
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [table_Manager] where adminid="&Id,conn,1,3
if Not oRs.eof then%>
<table width="600" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
  <form Name="Form1" action="?Action=Upda" method="Post" onSubmit="return checkAdminForm2();">
  <tr>
    <td width="80" align="center" class="back">用户名：</td>
    <td width="106" align="left" class="hback"><%=oRs("AdminName")%></td>
    <td width="60" align="center" class="back">密码：</td>
    <td width="106" align="left" class="hback"><input name="AdminPass" type="password" id="AdminPass" style="height:18px;" size="12" ></td>
    <td width="80" align="center" class="back">确认密码：</td>
    <td width="106" align="left" class="hback"><input name="AdminPass2" type="password" id="AdminPass2" style="height:18px;" size="12" ></td>
    <td width="60" align="center" class="back"><input type="submit" name="Submit" value="提交"><Input type="hidden" value="<%=Id%>" Name="Id"></td>
  </tr>
  </form>
</table>
<%
Else
call sHowPop("出错啦~~~\n\n·错误的管理员ID信息！\n\n·请返回！","-1",2)
End if
oRs.close
set oRs=Nothing

case "Save"

set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select Top 1 * from [table_Manager] where AdminName='"&Trim(Request.Form("AdminName"))&"' order by AdminId desc",conn,1,3
if Not oRs.Eof then
call sHowPop("出错啦~~~\n\n·该管理员用户名信息已经存在！\n\n·请返回更换用户名重试！","-1",2)
Else
oRs.Addnew
oRs("AdminName")=Trim(Request.Form("AdminName"))
oRs("AdminPass")=Md5(Trim(Request.Form("AdminPass")))
oRs.Update
End if
oRs.close
set oRs=Nothing
call sHowPop("管理员填加成功！","Admin.Asp",1)

case "Upda"
Id=Trim(Request.Form("id"))
safeRequest(id)
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [table_Manager] where adminid="&Id,conn,1,3
if Not oRs.eof then
'oRs("AdminName")=Trim(Request.Form("AdminName"))
oRs("AdminPass")=Md5(Trim(Request.Form("AdminPass")))
oRs.Update
Else
call sHowPop("出错啦~~~\n\n·错误的管理员ID信息！\n\n·请返回！","-1",2)
End if
oRs.close
set oRs=Nothing
call sHowPop("管理员修改成功！","Admin.Asp",1)

case Else
call sHowPop("出错啦~~~\n\n·错误的参数信息！\n\n·请返回！","Admin.Asp",1)
End select%>
<table width="600" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
  <tr>

    <td width="36" align="center" class="xingmu">ID</td>
    <td width="349" align="center" class="xingmu">管理员名称</td>
    <td width="85" align="center" class="xingmu">加入时间</td>
    <td width="43" align="center" class="xingmu">操作</td>
  </tr>
<form name="from1" action="Admin.Asp?act=del" method="post"> 
<%  
'开始分页


 
'打开数据库  
set rs=server.createobject("adodb.recordset")
sql="select * from [Table_Manager]  order by adminId desc"
rs.open sql,conn,3,3




       			dim i
	   			i=0
do while not rs.eof
%>   
  <tr>

    <td align="center" class="back"><%=Rs("AdminId")%></td>
    <td class="back"><%=Rs("AdminName")%></td>
    <td align="center" class="back"><%=ForMatDateTime(Rs("DateTime"),2)%></td>
    <td align="center" class="back"><a class="btn btn-info" href="?Action=Edit&Id=<%=Rs("adminId")%>">
										<i class="icon-edit icon-white"></i>  修改</a>
                                        <%if Rs("AdminName")<>"admin" then%><a class="btn btn-danger" href="?id=<%=rs("adminId")%>&act=del" onClick="return ConfirmDel();">
										<i class="icon-trash icon-white"></i> 
										删除
									</a><%end if%>
                                    </td>
  </tr>
<%
rs.movenext
	i=i+1
    loop
rs.close
set rs=nothing
%>   

</table>


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
