
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
kinds=request("yt")
act=request("act")
if act="add" then
newspic=request("DefaultPicUrl")
title=request("title")
prod_id=request("prod_id")
text=replace(replace(request("Content"),",","，"),"'","’")
newsfrom=request("newsfrom")
sksj=request("sksj")
skdd=request("skdd")
jg=request("jg")
bmrx=request("bmrx")
EnNewsTitle=Trim(Request.Form("EnNewsTitle"))
EnNewsText=replace(replace(Trim(Request.Form("EnContent")),",","，"),"'","’")
EnNewsFrom=Trim(Request.Form("EnNewsFrom"))
Orderid=Trim(Request.Form("Orderid"))
'添加新闻
 set news=server.CreateObject("adodb.recordset")
     sql="select * from news "
	 news.open sql,conn,3,3	 
	 news.addnew	 
	 news("newstitle")=title
	 news("newstext")=text
	 news("newskinds")=kinds
	 news("newsfrom")=newsfrom  
	 news("sksj")=sksj
news("skdd")=skdd
news("jg")=jg
news("bmrx")=bmrx
	 news("prod_id")=prod_id
	 news("newspic")=newspic
	 News("EnNewsTitle")=EnNewsTitle
	 News("EnNewsFrom")=EnNewsFrom
	 News("EnNewsText")=EnNewsText
	 News("Orderid")=Orderid
     news.update
	 news.close
	 set news=nothing
response.write "<script language='javascript'>alert('提交成功');javascript:ToUrl('news.asp?yt="&kinds&"');</script>"
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
						<a href="#">基本信息</a>
					</li>
				</ul>
			</div>
			
			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-edit"></i> <%=kinds%></h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
<form name="form1" method="post" action="" onSubmit="return checkform();" class="form-horizontal">
							<div class="control-group">
							  <label class="control-label" for="typeahead"><%=kinds%>标题 </label>
							  <div class="controls">
								<input class="input-xlarge focused" id="title" type="text" name="title" value=""><input name="yt" type="hidden" id="yt" value="<%=kinds%>">
							  </div>
                            </div>
                           <div class="control-group">
							  <label class="control-label" for="typeahead"><%=kinds%>讲师 </label>
							  <div class="controls">
								<input class="input-xlarge focused" id="newsfrom" type="text" name="newsfrom" >
							  </div>
                            </div>
                            <div class="control-group">
							  <label class="control-label" for="typeahead">上课时间 </label>
							  <div class="controls">
								<input class="input-xlarge focused" id="sksj" type="text" name="sksj" > 
							  </div>
                            </div>
                                             <div class="control-group">
							  <label class="control-label" for="typeahead">上课地点 </label>
							  <div class="controls">
								<input class="input-xlarge focused" id="skdd" type="text" name="skdd" > 
							  </div>
                            </div>
                            <div class="control-group">
							  <label class="control-label" for="typeahead">价格 </label>
							  <div class="controls">
								<input class="input-xlarge focused" id="jg" type="text" name="jg">  
							  </div>
                            </div>
                            <div class="control-group">
							  <label class="control-label" for="typeahead">报名热线 </label>
							  <div class="controls">
								<input class="input-xlarge focused" id="bmrx" type="text" name="bmrx" >  
							  </div>
                            </div>
                           <div class="control-group">
							  <label class="control-label" for="typeahead"><%=kinds%>图片 </label>
							  <div class="controls">
								<input class="input-xlarge focused" id="DefaultPicUrl" type="text" name="DefaultPicUrl" value=""> <a class="btn btn-success" href="#" onClick="window.open('Yr_UpFile.Asp?formname=form1&editname=DefaultPicUrl&uppath=images/guanggao&filelx=jpg','','status=no,scrollbaRs=no,top=20,left=110,width=420,height=165')">
										<i class="icon-zoom-in icon-white"></i>  
										上传图片                                            
									</a>
							  </div>
                            </div>
                           <div class="control-group">
							  <label class="control-label" for="typeahead">课程介绍 </label>
							  <div class="controls">
								<%
Dim htmlData

htmlData = Request.Form("content")

Function htmlspecialchars(str)
	str = Replace(str, "&", "&amp;")
	str = Replace(str, "<", "&lt;")
	str = Replace(str, ">", "&gt;")
	str = Replace(str, """", "&quot;")
	htmlspecialchars = str
End Function
%>
	  	<link rel="stylesheet" href="kindeditor-4.1.10/themes/default/default.css" />
	<link rel="stylesheet" href="kindeditor-4.1.10/plugins/code/prettify.css" />
	<script src="kindeditor-4.1.10/kindeditor.js"></script>
	<script src="kindeditor-4.1.10/lang/zh_CN.js"></script>
	<script src="kindeditor-4.1.10/plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="content"]', {
				cssPath : 'kindeditor-4.1.10/plugins/code/prettify.css',
				uploadJson : 'kindeditor-4.1.10/asp/upload_json.asp',
				fileManagerJson : 'kindeditor-4.1.10/asp/file_manager_json.asp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						K('form[name=example]')[0].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						K('form[name=example]')[0].submit();
					});
				}
			});
			prettyPrint();
		});
	</script>
<textarea name="content" style="width:100%;height:450px;visibility:hidden;"><%=htmlspecialchars(htmlData)%></textarea> 
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
							</div>

</form>
<%end if%>
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
