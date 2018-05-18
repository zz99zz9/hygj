<!DOCTYPE html>
<html lang="en">
<head>
<!--#include file="hhconn.asp"-->

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
<%
dim sql,rsBigClass,rsSmallClass,ErrMsg
set rsBigClass=server.CreateObject("adodb.recordset")
rsBigClass.open "Select * from [Table_ProBigClass] order by Orderid",conn,1,3
%>
<script language="JavaScript" type="text/JavaScript">
function checkBig()
{
  if (document.form1.BigClassName.value=="")
  {
    alert("�������Ʋ���Ϊ�գ�");
    document.form1.BigClassName.focus();
    return false;
  }
}
function checkSmall()
{
  if (document.form2.BigClassName.value=="")
  {
    alert("�������Ӵ������ƣ�");
	document.form1.BigClassName.focus();
	return false;
  }

  if (document.form2.SmallClassName.value=="")
  {
    alert("С�����Ʋ���Ϊ�գ�");
	document.form2.SmallClassName.focus();
	return false;
  }
}
function ConfirmDelBig()
{
   if(confirm("ȷ��Ҫɾ���˴�����ɾ���˴���ͬʱ��ɾ����������С�࣬���Ҳ��ָܻ���"))
     return true;
   else
     return false;
	 
}

function ConfirmDelSmall()
{
   if(confirm("ȷ��Ҫɾ����С����һ��ɾ�������ָܻ���"))
     return true;
   else
     return false;
	 
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
						<h2><i class="icon-edit"></i> ��Ʒ�������������</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">

      <br>
      ����ѡ�<a href="Pro_Class_Add_Big.Asp">���Ӳ�Ʒ�����񣩴���</a><br>
      <br>

   <!------------------------------------------------------------->

<table class="table table-striped table-bordered bootstrap-datatable">
						  <thead>
							  <tr>
								  <th>�������</th>
								  <th>������</th>
								  <th>��Ʒ����</th>
								  <th>����С��</th>
								  <th>����</th>
							  </tr>
						  </thead>   
						  <tbody>
                          <%
do while not rsBigClass.eof
%>
							<tr>
								<td><%=rsBigClass("BigClassName")%></td>
								<td class="center"><%=rsBigClass("orderid")%></td>
								<td class="center">����</td>
								<td class="center">
									<a class="btn btn-success" href="Pro_Class_Add_Small.asp?BigClassId=<%=rsBigClass("BigClassId")%>">
										<i class="icon-zoom-in icon-white"></i>  
										����С��                                            
									</a>
								</td>
								<td class="center">
									<!--<a class="btn btn-success" href="#">
										<i class="icon-zoom-in icon-white"></i>  
										View                                            
									</a>-->
									<a class="btn btn-info" href="Pro_Class_Big_edit.asp?BigClassID=<%=rsBigClass("BigClassID")%>">
										<i class="icon-edit icon-white"></i>  
										�޸�                                            
									</a>
									<a class="btn btn-danger" href="Pro_Class_Del_Big.asp?BigClassId=<%=rsBigClass("BigClassId")%>" onClick="return ConfirmDelBig();">
										<i class="icon-trash icon-white"></i> 
										ɾ��
									</a>
								</td>
<%
set rsSmallClass=server.CreateObject("adodb.recordset")
rsSmallClass.open "Select * from [Table_ProSmallclass] Where BigClassId="&rsBigClass("BigClassID")&" order by orderid",conn,1,3
if not(rsSmallClass.bof and rsSmallClass.eof) then
do while not rsSmallClass.eof
%>
                                							<tr>
								<td>����<%=rsSmallClass("SmallClassName")%></td>
								<td class="center"><%=rsSmallClass("orderid")%></td>
								<td class="center">����</td>
								<td class="center">

								</td>
								<td class="center">
									<!--<a class="btn btn-success" href="#">
										<i class="icon-zoom-in icon-white"></i>  
										View                                            
									</a>-->
									<a class="btn btn-info" href="Pro_Class_Small_edit.asp?SmallClassID=<%=rsSmallClass("SmallClassID")%>&BigclassId=<%=rsSmallClass("BigClassId")%>">
										<i class="icon-edit icon-white"></i>  
										�޸�                                            
									</a>
									<a class="btn btn-danger" href="Pro_Class_Del_Small.asp?SmallClassId=<%=rsSmallClass("SmallClassID")%>" onClick="return ConfirmDelBig();">
										<i class="icon-trash icon-white"></i> 
										ɾ��
									</a>
								</td>
							</tr>
                            <%
rsSmallClass.movenext
loop
end if
rsSmallClass.close
set rsSmallClass=nothing	
rsBigClass.movenext
loop
%>
<%
rsBigClass.close
set rsBigClass=nothing
call CloseConn()
%>
						  </tbody>
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