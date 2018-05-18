<!DOCTYPE html>
<html lang="en">
<head>
<!--#include file="hhconn.asp"-->

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
dim BigClassID,Action,rs,NewBigClassName,EnNewBigClassName,OldBigClassName,FoundErr,ErrMsg
BigClassID=trim(Request("BigClassID"))
Action=trim(Request("Action"))
Orderid=trim(Request("Orderid"))
NewBigClassName=trim(Request("NewBigClassName"))
EnNewBigClassName=trim(Request("EnNewBigClassName"))
OldBigClassName=trim(Request("OldBigClassName"))
pic_url=request("DefaultPicUrl")
mess=request("mess")

if BigClassID="" then
  response.Redirect("Pro_Class.asp")
end if
Set rs=Server.CreateObject("Adodb.RecordSet")
rs.Open "Select * from [Table_ProBigClass] where BigClassID=" & CLng(BigClassID),conn,1,3
if rs.Bof and rs.EOF then
	FoundErr=True
	ErrMsg=ErrMsg & "<br><li>此产品大类不存在！</li>"
else
	if Action="Modify" then
		if NewBigClassName="" then
			FoundErr=True
			ErrMsg=ErrMsg & "<br><li>产品大类名不能为空！</li>"
		end if
		if FoundErr<>True then
			rs("BigClassName")=NewBigClassName
			rs("EnBigClassName")=EnNewBigClassName
			rs("Admin")=Admin
			rs("Orderid")=Orderid
			rs("pic_url")=pic_url
			rs("mess")=mess
    	 	rs.update
			rs.Close
	     	set rs=Nothing
			'if NewBigClassName<>OldBigClassName then
				conn.execute "Update [Table_ProSmallclass] set BigClassName='" & NewBigClassName & "',EnbigclassName='" & EnNewBigClassName & "' where BigClassName='" & OldBigClassName & "'"
				conn.execute "Update [Table_Product] set BigClassName='" & NewBigClassName & "',EnbigclassName='" & EnNewBigClassName & "' where BigClassName='" & OldBigClassName & "'"
     		'end if		
			call CloseConn()
     		Response.Redirect "Pro_Class.asp" 
		end if
	end if
	if FoundErr=True then
		call WriteErrMsg()
	else
%>
<script language="JavaScript" type="text/JavaScript">
function checkBig()
{
  if (document.form1.BigClassName.value=="")
  {
    alert("大类名称不能为空！");
    document.form1.BigClassName.focus();
    return false;
  }
}
</script>
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
						<h2><i class="icon-edit"></i> 产品（服务）类别设置</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">



   <!------------------------------------------------------------->

<table width="500" border="0" align="center" cellpadding="0" cellspacing="2" class="table">
				<form name="form1" method="post" action="Pro_Class_Big_edit.asp">
				<tr class="back"> 
					<td height="25" colspan="2" align="center" class="xingmu"><strong>修改大类名称</strong></td>
				</tr>
				<tr class="back"> 
					<td width="104" height="25" align=right class="back"><strong>大类ID：</strong></td>
					<td width="820" height="25" class="back"> 
					<%=rs("BigClassID")%><input name="BigClassID" type="hidden" id="BigClassID" value="<%=rs("BigClassID")%>">
				  <input name="OldBigClassName" type="hidden" id="OldBigClassName" value="<%=rs("BigClassName")%>"></td>
				</tr>
				<tr class="back"> 
					<td width="104" height="25" align=right class="back"><strong>大类名称：</strong></td>
					<td height="25" class="back">
				  <input name="NewBigClassName" type="text" id="NewBigClassName" value="<%=rs("BigClassName")%>" size="20" maxlength="30"></td>
				</tr>
				 <tr>
      <td width="104" height="25" align="right" class="back"><strong>图片：</strong>        </td>
      <td width="820" height="25" class="back" valign="middle">
        <input name="DefaultPicUrl" type="text" id="DefaultPicUrl" size="35" value="<%=rs("pic_url")%>">
        <a class="btn btn-success" href="#" onClick="window.open('Yr_UpFile.Asp?formname=form1&editname=DefaultPicUrl&uppath=images/guanggao&filelx=jpg','','status=no,scrollbaRs=no,top=20,left=110,width=420,height=165')">
										<i class="icon-zoom-in icon-white"></i>  
										上传图片                                            
									</a></td>
    </tr>
		         <tr class="back">
                   <td height="22" align="right" class="back"><strong>排序ID：</strong></td>
		           <td height="22" align="left" class="back"><input name="OrderID" type="text" id="OrderID" size="20" value="<%=rs("Orderid")%>" maxlength="30" onKeyUp="if(event.keyCode !=37 && event.keyCode != 39) value=value.replace(/\D/g,'');"onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/\D/g,''))"></td>
	              </tr>
		         <tr class="back"> 
					<td width="104" height="111"  align=right class="back"><strong>简单描述：</strong></td>
					<td  class="back">
					  <textarea name="mess" cols="55" rows="7"><%=rs("mess")%></textarea>					 </td>
				</tr>
				<tr class="back"> 
					<td height="25" align="center" class="back">&nbsp;</td>
					<td height="25" align="center" class="back">
					<input name="Action" type="hidden" id="Action" value="Modify">
					<input name="Save" type="submit" id="Save" value=" 修 改 "></td>
				</tr>
				</form>	
</table> 
<%
end if
end if
rs.close
set rs=nothing
call CloseConn()
%>
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
