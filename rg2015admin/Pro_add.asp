<!DOCTYPE html>
<html lang="en">
<!--#include file="hhconn.asp"-->
<!--#Include File="Function.Asp"-->
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
dim rs
dim sql
dim count

set rs=server.createobject("adodb.recordset")
sql = "select * from [Table_ProSmallclass] order by SmallClassID asc"
rs.open sql,conn,1,1
%>
<script language = "JavaScript">
var onecount;
subcat = new Array();
        <%
        count = 0
        do while not rs.eof 
        %>
subcat[<%=count%>] = new Array("<%= trim(rs("SmallClassName"))%>","<%= trim(rs("BigClassName"))%>","<%= trim(rs("SmallClassName"))%>");
        <%
        count = count + 1
        rs.movenext
        loop
        rs.close
        %>
onecount=<%=count%>;

function changelocation(locationid)
    {
    document.myform.SmallClassName.length = 1; 
    var locationid=locationid;
    var i;
    for (i=0;i < onecount; i++)
        {
            if (subcat[i][1] == locationid)
            { 
                document.myform.SmallClassName.options[document.myform.SmallClassName.length] = new Option(subcat[i][0], subcat[i][2]);
            }        
        }
    }    

function CheckForm()
{
  if (editor.EditMode.checked==true)
	  document.myform.Content.value=editor.HtmlEdit.document.body.innerText;
  else
	  document.myform.Content.value=editor.HtmlEdit.document.body.innerHTML; 

  if (Eneditor.EditMode.checked==true)
	  document.myform.EnContent.value=Eneditor.HtmlEdit.document.body.innerText;
  else
	  document.myform.EnContent.value=Eneditor.HtmlEdit.document.body.innerHTML; 

  if (document.myform.Title.value=="")
  {
    alert("文章标题不能为空！");
	document.myform.Title.focus();
	return false;
  }
  if (document.myform.Product_Id.value=="")
  {
    alert("产品编号不能为空！");
	document.myform.Key.focus();
	return false;
  }
  if (document.myform.Key.value=="")
  {
    alert("关键字不能为空！");
	document.myform.Key.focus();
	return false;
  }
  if (document.myform.Content.value=="")
  {
    alert("文章内容不能为空！");
	editor.HtmlEdit.focus();
	return false;
  }
  return true;  
}
function loadForm()
{
  editor.HtmlEdit.document.body.innerHTML=document.myform.Content.value;
  Eneditor.HtmlEdit.document.body.innerHTML=document.myform.EnContent.value;
  return true
}
</script>
<!------------------------->

<!------------结束---------------->
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
						<h2><i class="icon-edit"></i> 产品添加</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						
                        <form name="form1" method="post" action="Pro_save.asp?action=Save" onSubmit="return checkform();" class="form-horizontal">
							<div class="control-group">
							  <label class="control-label" for="typeahead">标题 </label>
							  <div class="controls">
								<input class="input-xlarge focused" id="title" type="text" name="title" value=""><input name="yt" type="hidden" id="yt" value="<%=kinds%>">
							  </div>
                            </div>
                          <!-- <div class="control-group"><label class="control-label" for="typeahead">产品编号</label>
                           <div class="controls">
                           <input name="Product_Id" type="text" id="Product_Id2" value="<%=ranNum%>" size="15" maxlength="15">
      <font color="#FF0000">*产品编号不可以相同，如你不能确定会重复，请勿改动他！</font>
        </div>
                            </div>-->
                           <div class="control-group"><label class="control-label" for="typeahead">所属类别</label>
                             <div class="controls"><%
sql = "select * from [Table_ProBigClass]"
rs.open sql,conn,1,1
if rs.eof and rs.bof then
	response.write "请先添加栏目。"
else
%>
<select name="BigClassName" onChange="changelocation(document.myform.BigClassName.options[document.myform.BigClassName.selectedIndex].value)" size="1">
            <option selected value="<%=trim(rs("BigClassName"))%>"><%=trim(rs("BigClassName"))%></option>
<%
dim selclass
	selclass=rs("BigClassName")
		rs.movenext
	do while not rs.eof
%>
            <option value="<%=trim(rs("BigClassName"))%>"><%=trim(rs("BigClassName"))%></option>
            <%
			rs.movenext
		loop
end if
	rs.close
%>
        </select>
          <select name="SmallClassName">
            <option value="" selected>不指定小类</option>
            <%
sql="select * from [Table_ProSmallclass] where BigClassName='" & selclass & "'"
rs.open sql,conn,1,1
if not(rs.eof and rs.bof) then
%>
            <option value="<%=rs("SmallClassName")%>"><%=rs("SmallClassName")%></option>
            <%
rs.movenext
do while not rs.eof
%>
            <option value="<%=rs("SmallClassName")%>"><%=rs("SmallClassName")%></option>
            <%
rs.movenext
loop
end if
rs.close
Dim ranNum
ranNum = month(Now())&day(Now())&hour(Now())&minute(Now())&second(Now())
%>
      </select>      </div>
                            </div>
                           <div class="control-group">
							  <label class="control-label" for="typeahead"><%=kinds%>来源 </label>
							  <div class="controls">
								<input class="input-xlarge focused" id="newsfrom" type="text" name="newsfrom" value="本站整理">
							  </div>
                            </div>
                           <div class="control-group">
							  <label class="control-label" for="typeahead">图片 </label>
							  <div class="controls">
								<input class="input-xlarge focused" id="DefaultPicUrl" type="text" name="DefaultPicUrl" value=""> <a class="btn btn-success" href="#" onClick="window.open('Yr_UpFile.Asp?formname=form1&editname=DefaultPicUrl&uppath=images/guanggao&filelx=jpg','','status=no,scrollbaRs=no,top=20,left=110,width=420,height=165')">
										<i class="icon-zoom-in icon-white"></i>  
										上传图片                                            
									</a>
							  </div>
                            </div>
                           <div class="control-group">
							  <label class="control-label" for="typeahead">内容 </label>
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
	<script charset="gb2312" src="kindeditor-4.1.10/kindeditor.js"></script>
	<script charset="gb2312" src="kindeditor-4.1.10/lang/zh_CN.js"></script>
	<script charset="gb2312" src="kindeditor-4.1.10/plugins/code/prettify.js"></script>
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
                             <div class="control-group">
							  
                              <div class="controls">
                              <input name="Passed" type="checkbox" id="Passed2" value="yes" checked>已通过审核 
                              </div>
                            </div>
                             <div class="control-group">
                             
                              <div class="controls">     
                              <input name="Elite" type="checkbox" id="Elite" value="yes">推荐显示
      </div>
                            </div>
                            <div class="control-group">
							  <label class="control-label" for="typeahead">发布时间 </label>
							  <div class="controls">
								<input class="input-xlarge focused" id="UpdateTime" type="text" name="UpdateTime" value="<%=now()%>" onKeyup="if(this.value.length==17){document.all.cardid1.focus()}">
							  </div>
                            </div>
                            							<div class="form-actions">
<input type="submit" name="Submit" value="提交">
        <input type="reset" name="Submit2" value="重置">
        <input type="button" name="Submit3" value="返回" onClick="history.back();">
        <input name="act" type="hidden" id="act" value="add">
							</div>

</form>

                      <!--------------------->
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
