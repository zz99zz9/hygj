
<!DOCTYPE html>
<html lang="en">
<head>
<!--#include file="hhconn.asp"-->
<!--#Include File="Function.Asp"-->
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
		
</head>

<body>
<%
  Dim action
  action=Trim(Request.QueryString("Action"))
  select case action
  case ""
  set oRs=Server.CreateObject("ADODB.Recordset")
  oRs.Open "select * From Table_SiteInfo ",conn,1,3
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
						<h2><i class="icon-edit"></i> 基本信息管理</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<foRm class="form-horizontal" method="POST" action="WebInfo.Asp?action=Upda"  name="form1">
						  <fieldset>

							<div class="control-group">
							  <label class="control-label" for="typeahead">网站名称 </label>
							  <div class="controls">
								<input class="input-xlarge focused" id="focusedInput3" type="text" name="SiteName" value="<%=oRs("SiteName")%>">
							  </div>
							</div>
							<div class="control-group">
							  <label class="control-label" for="date01">网站标题</label>
							  <div class="controls">
								<input class="input-xlarge focused" id="focusedInput3" type="text" name="SiteTitle" value="<%=oRs("SiteTitle")%>">
							  </div>
							</div>
							<div class="control-group">
							  <label class="control-label" for="focusedInput3">网站关键字</label>
							  <div class="controls">
							    <input class="input-xlarge focused" id="focusedInput3" type="text" name="SiteKey" value="<%=oRs("SiteKey")%>">
						      </div>
						    </div>
							<div class="control-group">
							  <label class="control-label" for="focusedInput4">网站描述信息</label>
							  <div class="controls">
							    <input class="input-xlarge focused" id="focusedInput4" type="text" name="SiteCont" value="<%=oRs("SiteCont")%>">
						      </div>
						    </div>
							<div class="control-group">
							  <label class="control-label" for="focusedInput5">网站地址</label>
							  <div class="controls">
							    <input class="input-xlarge focused" id="focusedInput5" type="text" name="SiteURl" value="<%=oRs("SiteURl")%>">
						      </div>
						    </div>
                            <div class="control-group">
							  <label class="control-label" for="focusedInput5">版权信息</label>
							  <div class="controls">
							    <input class="input-xlarge focused" id="focusedInput5" type="text" name="SiteCopyRight" value="<%=oRs("SiteCopyRight")%>">
							  </div>
                            </div>
                            <div class="control-group">
							  <label class="control-label" for="focusedInput5">备案信息</label>
							  <div class="controls">
							    <input class="input-xlarge focused" id="focusedInput5" type="text" name="Sitebeian" value="<%=oRs("Sitebeian")%>">
						      </div>
                            </div>
                              <div class="control-group">
							  <label class="control-label" for="focusedInput5">企业联系人</label>
							  <div class="controls">
							    <input class="input-xlarge focused" id="focusedInput5" type="text" name="WebmasteRName" value="<%=oRs("WebmasteRName")%>">
						      </div>
						    </div>
                            <div class="control-group">
                                <label class="control-label" for="focusedInput2">手机号码</label>
                                <div class="controls">
                                  <input class="input-xlarge focused" id="focusedInput2" type="text" name="WebmasteREmail" value="<%=oRs("WebmasteREmail")%>">
                                </div>
                              </div>
                            <div class="control-group">
                                <label class="control-label" for="focusedInput6">公司名称</label>
                                <div class="controls">
                                  <input class="input-xlarge focused" id="focusedInput6" type="text" name="CoName" value="<%=oRs("CoName")%>">
                                </div>
                              </div>
                            <div class="control-group">
                                <label class="control-label" for="focusedInput7">公司电话</label>
                                <div class="controls">
                                  <input class="input-xlarge focused" id="focusedInput7" type="text" name="CoTel" value="<%=oRs("CoTel")%>">
                                </div>
                              </div>
                            <div class="control-group">
                                <label class="control-label" for="focusedInput8">公司传真</label>
                                <div class="controls">
                                  <input class="input-xlarge focused" id="focusedInput8" type="text" name="CoFax" value="<%=oRs("CoFax")%>">
                                </div>
                              </div>
                            <div class="control-group">
                                <label class="control-label" for="focusedInput9">公司地址</label>
                                <div class="controls">
                                  <input class="input-xlarge focused" id="focusedInput9" type="text" name="Coaddr" value="<%=oRs("Coaddr")%>">
                                </div>
                              </div>
                              <div class="control-group">
                                <label class="control-label" for="focusedInput10">公司邮编</label>
                                <div class="controls">
                                  <input class="input-xlarge focused" id="focusedInput10" type="text" name="CoCode" value="<%=oRs("CoCode")%>">
                                </div>
                              </div>
                              <div class="control-group">
                                <label class="control-label" for="focusedInput10">企业邮局</label>
                                <div class="controls">
                                  <input class="input-xlarge focused" id="focusedInput10" type="text" name="CoMail" value="<%=oRs("CoMail")%>">
                                </div>
                              </div>
							<div class="form-actions">
                            <input type="hidden" Name="id" Value="<%=oRs("id")%>">
							  <button type="submit" class="btn btn-primary">保存信息</button>
							  <button type="reset" class="btn" onClick="history.back();">取消修改</button>
							</div>
						  </fieldset>
						</form>   
<%oRs.close
set oRs=Nothing
case "Upda"
id=Trim(Request.Form("id"))
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from Table_SiteInfo where id="&id,conn,1,3
oRs("sitename")=Trim(Request.Form("Sitename"))
oRs("siteTitle")=Trim(Request.Form("SiteTitle"))
oRs("siteKey")=Trim(Request.Form("SiteKey"))
oRs("siteCont")=Trim(Request.Form("SiteCont"))
oRs("siteUrl")=Trim(Request.Form("SiteUrl"))
oRs("siteCopyRight")=Trim(Request.Form("SiteCopyRight"))
oRs("sitebeian")=Trim(Request.Form("Sitebeian"))
oRs("WebMasterName")=Trim(Request.Form("WebMasterName"))
oRs("WebMasterEmail")=Trim(Request.Form("WebMasterEmail"))
oRs("Comail")=Trim(Request.Form("Comail"))
oRs("CoName")=Trim(Request.Form("CoName"))
oRs("CoTel")=Trim(Request.Form("CoTel"))
oRs("CoFax")=Trim(Request.Form("CoFax"))
oRs("CoAddr")=Trim(Request.Form("CoAddr"))
oRs("CoCode")=Trim(Request.Form("CoCode"))
oRs.Update
Set oRs=Nothing
call showPop("信息修改成功！","WebInfo.Asp",1)
case Else
call showPop("错误的参数信息！","-1",2)
End select
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
