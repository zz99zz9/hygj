<% Option Explicit 
Dim ObjTotest(26,4)

ObjTotest(0,0) = "MSWC.AdRotator"
ObjTotest(1,0) = "MSWC.BrowserType"
ObjTotest(2,0) = "MSWC.NextLink"
ObjTotest(3,0) = "MSWC.Tools"
ObjTotest(4,0) = "MSWC.Status"
ObjTotest(5,0) = "MSWC.Counters"
ObjTotest(6,0) = "IISSample.ContentRotator"
ObjTotest(7,0) = "IISSample.PageCounter"
ObjTotest(8,0) = "MSWC.PermissionChecker"
ObjTotest(9,0) = "Scripting.FileSystemObject"
	ObjTotest(9,1) = "(FSO �ı��ļ���д)"
ObjTotest(10,0) = "adodb.connection"
	ObjTotest(10,1) = "(ADO ���ݶ���)"
	
ObjTotest(11,0) = "SoftArtisans.FileUp"
	ObjTotest(11,1) = "(SA-FileUp �ļ��ϴ�)"
ObjTotest(12,0) = "SoftArtisans.FileManager"
	ObjTotest(12,1) = "(SoftArtisans �ļ�����)"
ObjTotest(13,0) = "LyfUpload.UploadFile"
	ObjTotest(13,1) = "(���Ʒ���ļ��ϴ����)"
ObjTotest(14,0) = "Persits.Upload.1"
	ObjTotest(14,1) = "(ASPUpload �ļ��ϴ�)"
ObjTotest(15,0) = "w3.upload"
	ObjTotest(15,1) = "(Dimac �ļ��ϴ�)"

ObjTotest(16,0) = "JMail.SmtpMail"
	ObjTotest(16,1) = "(Dimac JMail �ʼ��շ�) <a href='http://www.ajiang.net'>�����ֲ�����</a>"
ObjTotest(17,0) = "CDONTS.NewMail"
	ObjTotest(17,1) = "(���� SMTP ����)"
ObjTotest(18,0) = "Persits.Mailgraph2er"
	ObjTotest(18,1) = "(ASPemail ����)"
ObjTotest(19,0) = "SMTPsvg.Mailer"
	ObjTotest(19,1) = "(ASPmail ����)"
ObjTotest(20,0) = "DkQmail.Qmail"
	ObjTotest(20,1) = "(dkQmail ����)"
ObjTotest(21,0) = "Geocel.Mailer"
	ObjTotest(21,1) = "(Geocel ����)"
ObjTotest(22,0) = "IISmail.Iismail.1"
	ObjTotest(22,1) = "(IISmail ����)"
ObjTotest(23,0) = "SmtpMail.SmtpMail.1"
	ObjTotest(23,1) = "(SmtpMail ����)"
	
ObjTotest(24,0) = "SoftArtisans.ImageGen"
	ObjTotest(24,1) = "(SA ��ͼ���д���)"
ObjTotest(25,0) = "W3Image.Image"
	ObjTotest(25,1) = "(Dimac ��ͼ���д���)"

public IsObj,VerObj

'������֧��������汾

dim i
for i=0 to 25
	on error resume next
	IsObj=false
	VerObj=""
	dim TestObj
	set TestObj=server.CreateObject(ObjTotest(i,0))
	If -2147221005 <> Err then
		IsObj = True
		VerObj = TestObj.version
		if VerObj="" or isnull(VerObj) then VerObj=TestObj.about
	end if
	ObjTotest(i,2)=IsObj
	ObjTotest(i,3)=VerObj
next

'�������Ƿ�֧�ּ�����汾
sub ObjTest(strObj)
	on error resume next
	IsObj=false
	VerObj=""
	dim TestObj
	set TestObj=server.CreateObject (strObj)
	If -2147221005 <> Err then
		IsObj = True
		VerObj = TestObj.version
		if VerObj="" or isnull(VerObj) then VerObj=TestObj.about
	end if	
End sub
%>
<!DOCTYPE html>
<html lang="en">
<!--#include file="hhconn.asp"-->
<head>

	<meta charset="gb2312">
	<title>��վ��Ϣ</title>
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
	font-family: "΢���ź�", sans-serif;
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
						<a href="#">��ҳ</a> <span class="divider">/</span>
					</li>
					<li>
						<a href="#">������Ϣ</a>
					</li>
				</ul>
			</div>
			
			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-edit"></i> ���������йز���</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">

		<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" id="AutoNumber3" height="0" width="100%"> 
<tr> <td align="center">
                          <table width="98%" height="132" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
							<tr class="hback"> 
							  <td width="19%" height="25" align=left class="xingmu">&nbsp;��������</td>
							  <td width="81%" height="25">&nbsp;<%=Request.ServerVariables("SERVER_NAME")%></td>
                            </tr>
                            <tr class="hback"> 
                              <td height="25" align=left class="xingmu">&nbsp;������IP</td>
                              <td height="25">&nbsp;<%=Request.ServerVariables("LOCAL_ADDR")%></td>
                            </tr>
                            <tr class="hback"> 
                              <td height="25" align=left class="xingmu">&nbsp;�������˿�</td>
                              <td height="25">&nbsp;<%=Request.ServerVariables("SERVER_PORT")%></td>
                            </tr>
                            <tr class="hback"> 
                              <td height="25" align=left class="xingmu">&nbsp;������ʱ��</td>
                              <td height="25">&nbsp;<%=now%></td>
                            </tr>
                            <tr class="hback"> 
                              <td height="25" align=left class="xingmu">&nbsp;IIS�汾</td>
                              <td height="25">&nbsp;<%=Request.ServerVariables("SERVER_SOFTWARE")%></td>
                            </tr>
                            <tr class="hback"> 
                              <td height="25" align=left class="xingmu">&nbsp;�ű���ʱʱ��</td>
                              <td height="25">&nbsp;<%=Server.ScriptTimeout%> ��</td>
                            </tr>
                            <tr class="hback"> 
                              <td height="25" align=left class="xingmu">&nbsp;���ļ�·��</td>
                              <td height="25">&nbsp;<%=server.mappath(Request.ServerVariables("SCRIPT_NAME"))%></td>
                            </tr>
                            <tr class="hback"> 
                              <td height="25" align=left class="xingmu">&nbsp;������CPU����</td>
                              <td height="25">&nbsp;<%=Request.ServerVariables("NUMBER_OF_PROCESSORS")%> 
                              ��</td>
                            </tr>
                            <tr class="hback"> 
                              <td height="25" align=left class="xingmu">&nbsp;��������������</td>
                              <td height="25">&nbsp;<%=ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %></td>
                            </tr>
                            <tr class="hback"> 
                              <td height="25" align=left class="xingmu">&nbsp;����������ϵͳ</td>
                              <td height="25">&nbsp;<%=Request.ServerVariables("OS")%></td>
                            </tr>
            </table>
		</td>
	</tr>
</table><br>
 
<%
Dim strClass
	strClass = Trim(Request.Form("classname"))
	If "" <> strClass then
	Response.Write "<br>��ָ��������ļ������"
	ObjTest(strClass)
	  If Not IsObj then 
		Response.Write "<br><font color=red>���ź����÷�������֧�� " & strclass & " �����</font>"
	  Else
		Response.Write "<br><font class=fonts>��ϲ���÷�����֧�� " & strclass & " �����������汾�ǣ�" & VerObj & "</font>"
	  End If
	  Response.Write "<br>"
	end if
	%> <br>
<table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
<tr class="hback">
  <td height="25" colspan="2" align="center" class="xingmu">�� IIS�Դ���ASP��� </td>
  </tr>
<tr class="hback">
 <td width=320 height="25">�� �� �� ��</td>
<td width=130 height="25">֧�ּ��汾</td>
</tr> 
<%For i=0 to 10%> 
<tr class="hback"> 
<td height="25" align=left>&nbsp;<%=ObjTotest(i,0) & "<font color=#888888>&nbsp;" & ObjTotest(i,1)%></td><td height="25" align=left>&nbsp; 
<%
		If Not ObjTotest(i,2) Then 
			Response.Write "<font color=red><b>��</b></font>"
		Else
			Response.Write "<font class=fonts><b>��</b></font> <a title='" & ObjTotest(i,3) & "'>" & left(ObjTotest(i,3),11) & "</a>"
		End If%> </td></tr> <%next%> </table>
<br>
<table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
<tr class="hback"> 
  <td height="25" colspan="2" align="center" class="xingmu">�� �������ļ��ϴ��͹������ </td>
  </tr>
<tr class="hback">
<td width=320 height="25">�� �� �� ��</td>
<td width=130 height="25">֧�ּ��汾</td>
</tr> 
<%For i=11 to 15%> <tr class="hback"> <td height="25" align=left>&nbsp;<%=ObjTotest(i,0) & "<font color=#888888>&nbsp;" & ObjTotest(i,1)%></td><td height="25" align=left>&nbsp; 
<%
		If Not ObjTotest(i,2) Then 
			Response.Write "<font color=red><b>��</b></font>"
		Else
			Response.Write "<font class=fonts><b>��</b></font> <a title='" & ObjTotest(i,3) & "'>" & left(ObjTotest(i,3),11) & "</a>"
		End If%> </td></tr> <%next%> </table>
		<br>
	  <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
<tr class="hback">
  <td height="25" colspan="2" align="center" class="xingmu">�� �������շ��ʼ����</td>
  </tr>
<tr class="hback">
<td width=320 height="25">�� �� �� ��</td>
<td width=130 height="25">֧�ּ��汾</td>
</tr> 
<%For i=16 to 23%> <tr class="hback"> <td height="25" align=left>&nbsp;<%=ObjTotest(i,0) & "<font color=#888888>&nbsp;" & ObjTotest(i,1)%></td><td height="25" align=left>&nbsp; 
<%
		If Not ObjTotest(i,2) Then 
			Response.Write "<font color=red><b>��</b></font>"
		Else
			Response.Write "<font class=fonts><b>��</b></font> <a title='" & ObjTotest(i,3) & "'>" & left(ObjTotest(i,3),11) & "</a>"
		End If%> </td></tr> <%next%> </table>
<br>
<table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
<tr class="hback">
  <td height="25" colspan="2" align="center" class="xingmu">�� ͼ������� </td>
  </tr>
<tr class="hback">
<td width=320 height="25">�� �� �� ��</td>
<td width=130 height="25">֧�ּ��汾</td>
</tr> 
<%For i=24 to 25%> <tr class="hback"> <td height="39" align=left>&nbsp;<%=ObjTotest(i,0) & "<font color=#888888>&nbsp;" & ObjTotest(i,1)%></td><td align=left>&nbsp; 
<%
		If Not ObjTotest(i,2) Then 
			Response.Write "<font color=red><b>��</b></font>"
		Else
			Response.Write "<font class=fonts><b>��</b></font> <a title='" & ObjTotest(i,3) & "'>" & left(ObjTotest(i,3),11) & "</a>"
		End If%> </td></tr> <%next%> </table>
<br>
<br>
<table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table"> 
<tr class="hback">
  <td align=center height=30 class=xingmu>�������֧��������</td>
</tr>
<tr class="hback">
  <td align=center height=30>��������������������Ҫ���������ProgId��ClassId�� </td>
</tr>
<tr class="hback">
<form action=<%=Request.ServerVariables("SCRIPT_NAME")%> method=post id=form1 name=form1>
<td align=center height=30>
<input class=input type=text value="" name="classname" size=40> 
<input type=submit value=" ȷ �� " id=submit1 name=submit1> 
<input type=reset value=" �� �� "  id=reset1 name=reset1></td>
</form>
</tr>
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