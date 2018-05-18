
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

<script language="javascript">
function checkform()
{
	if (document.form1.title.value=='')
		{
			alert("标题不能为空，请您填写！");
			document.form1.title.focus();
			return false;
		}
	return true;
}
</script>
<body>
<%
action=request("act")
kid_id=request("kid_id")


if action="add" then
set rs1=server.CreateObject("adodb.recordset")
        sql1="select * from kids where kid_id="&kid_id
		rs1.open sql1,conn,3,3		
		if rs1.eof then
		else
		kid_name=rs1("kid_name")
		end if
		rs1.close
		set rs1=nothing
IsTj=Trim(Request.Form("IsTj"))
if IsTj="" then
IsTj=0
Else
isTj=Trim(Request.Form("IsTj"))
End if



set rs=server.CreateObject("adodb.recordset")
sql="select * from [prod]"
rs.open sql,conn,3,3
rs.addnew
rs("prod_name")=request("prod_name")
if Request("DefaultPicUrl")<>"" then
rs("prod_pic")=request("DefaultPicUrl")
End if
rs("prod_gw")=request("prod_gw")
rs("orderid")=request("orderid")
rs("prod_ry")=request("prod_ry")
rs("prod_jl")=request("prod_jl")
rs("prod_xb")=request("prod_xb")
rs("prod_detail")=replace(replace(Request("Content"),",","，"),"'","’")
rs("kid_id")=request("kid_id")
rs("kid_name")=kid_name
Rs("smallclassId")=smallclassId
Rs("smallclass")=smallclassName
Rs("TwoClassName")=TwoClassName
Rs("IsTj")=IsTJ
rs("prod_GuiGe")=replace(replace(Request("prod_GuiGe"),",","，"),"'","’")
rs.update
rs.close
set rs=nothing
response.Redirect"prod.asp"	  
else	  
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
						<a href="#">造园师管理</a>
					</li>
				</ul>
			</div>
			
			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-edit"></i> 造园师添加</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
<!--------------------表单开始--------------------------->
<form name="form1" method="post" action="" onSubmit="return checkform();" class="form-horizontal">
							<div class="control-group">
							  <label class="control-label" for="typeahead">姓名 </label>
							  <div class="controls">
								<input class="input-xlarge focused" id="prod_name" type="text" name="prod_name" value=""><input name="yt" type="hidden" id="yt" value="<%=kinds%>">
							  </div>
                            </div>
                           <div class="control-group">
							  <label class="control-label" for="typeahead">性别 </label>
							  <div class="controls">
								<select name="Prod_xb" id="Prod_xb" >
         
          <option value="1" selected>先生</option>
          
          <option value="2" >女士</option>
         
      </select>
						     </div>
              </div>
                           <div class="control-group">
							  <label class="control-label" for="typeahead">照片 </label>
							  <div class="controls">
								<input class="input-xlarge focused" id="DefaultPicUrl" type="text" name="DefaultPicUrl" value=""> <a class="btn btn-success" href="#" onClick="window.open('Yr_UpFile.Asp?formname=form1&editname=DefaultPicUrl&uppath=images/guanggao&filelx=jpg','','status=no,scrollbaRs=no,top=20,left=110,width=420,height=165')">
										<i class="icon-zoom-in icon-white"></i>  
										上传图片                                            
									</a>
							  </div>
                            </div>
                            <div class="control-group">
							  <label class="control-label" for="typeahead">等级 </label>
							  <div class="controls">
								<select name="kid_id" id="kid_id" >
	  <%
	  set BoRs=Server.CreateObject("ADODB.Recordset")
	  BoRs.Open "select * from [kids] order by kid_id",conn,1,1
	  if boRs.eof then%>
	  <option value="" selected>暂无分类信息</option>
	  <%
	  Else
	  do while Not boRs.eof %>
	  <option value="<%=boRs("kid_id")%>" ><%=boRs("kid_name")%></option>
	  <%boRs.Movenext
	  Loop
	  End if
	  boRs.close
	  set boRs=Nothing
	  %>
	  </select>
							  </div>
                            </div>

                            <div class="control-group">
							  <label class="control-label" for="typeahead">感悟 </label>
							  <div class="controls">
								<textarea name="prod_gw" id="prod_gw" style="width:400px;height:100px;"></textarea>
							  </div>
                            </div>
                            <div class="control-group">
							  <label class="control-label" for="typeahead">荣誉 </label>
							  <div class="controls">
								<textarea name="Prod_ry" id="Prod_ry" style="width:400px;height:100px;"></textarea>
							  </div>
                            </div>
                                                        <div class="control-group">
							  <label class="control-label" for="typeahead">经历 </label>
							  <div class="controls">
							<textarea name="Prod_jl" id="Prod_jl" style="width:400px;height:100px;"></textarea>
							  </div>
                            </div>
                           <div class="control-group">
							  <label class="control-label" for="typeahead">排序编号 </label>
							  <div class="controls">
								<input class="input-xlarge focused" id="Orderid" type="text" name="Orderid" value="9999" onKeyup="if(this.value.length==17){document.all.cardid1.focus()}">
							  </div>
                            </div>
                            							<div class="form-actions">
<input type="submit" name="Submit" value="提交">
        <input type="reset" name="Submit2" value="重置">
        <input type="button" name="Submit3" value="返回" onClick="history.back();">
        <input name="act" type="hidden" id="act" value="add">
        <input name="prod_type" type="hidden" id="prod_type" value="<%=prod_type%>">
							</div>

</form>
<!---------------------------------新表--------------------->


	<%End if%>
<!--------------------表单结束---------------------------->

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

<!--------------------------------------------------------------------------->
