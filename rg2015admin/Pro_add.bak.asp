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
    alert("���±��ⲻ��Ϊ�գ�");
	document.myform.Title.focus();
	return false;
  }
  if (document.myform.Product_Id.value=="")
  {
    alert("��Ʒ��Ų���Ϊ�գ�");
	document.myform.Key.focus();
	return false;
  }
  if (document.myform.Key.value=="")
  {
    alert("�ؼ��ֲ���Ϊ�գ�");
	document.myform.Key.focus();
	return false;
  }
  if (document.myform.Content.value=="")
  {
    alert("�������ݲ���Ϊ�գ�");
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
						<h2><i class="icon-edit"></i> <%=type_wj%></h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<table width="600" border="0" align="center" cellpadding="0" cellspacing="2" class="table">
  <form method="POST" name="form1" onSubmit="return CheckForm();" action="Pro_Save.asp?action=Save" >
    <tr>
      <td height="30" colspan="2" align="center" class="xingmu"><strong>�� �� �� Ʒ</strong></td>
    </tr>
    <tr>
      <td width="100" height="22" align="right" class="back">�������</td>
      <td width="500" class="hback_1"><%
sql = "select * from [Table_ProBigClass]"
rs.open sql,conn,1,1
if rs.eof and rs.bof then
	response.write "���������Ŀ��"
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
            <option value="" selected>��ָ��С��</option>
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
      </select>      </td>
    </tr>
    <tr>
      <td height="22" align="right" class="back">��Ʒ��ţ�</td>
      <td class="hback_1"><input name="Product_Id" type="text" id="Product_Id2" value="<%=ranNum%>" size="15" maxlength="15">
      <font color="#FF0000">*��Ʒ��Ų�������ͬ�����㲻��ȷ�����ظ�������Ķ�����</font></td>
    </tr>
    <tr>
      <td height="22" align="right" class="back">��Ʒ���ƣ�</td>
      <td class="hback_1"><input name="Title" type="text" id="Title2" size="50" maxlength="80">
      <font color="#FF0000">*</font>���Ǻŵ�Ҫ����</td>
    </tr>	

	
    <tr>
      <td height="22" align="right" valign="middle" class="back">��Ʒ˵����</td>
      <td class="hback_1"><font color="#FF0000">*</font></td>
    </tr>

    <tr bgcolor="#E3E3E3">
      <td colspan="2" align="center" valign="middle" class="back">
       <%
Dim htmlData

htmlData = text

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
<textarea name="content" style="width:100%;height:450px;visibility:hidden;">33<% '=htmlspecialchars(htmlData)%></textarea>      </td>
    </tr>

    <tr>
      <td width="100" height="25" align="right" class="back">ͼƬ��
        <input name="IncludePic" type="hidden" id="IncludePic" value="yes"></td>
      <td width="500" height="25" class="hback_1">
        <input name="DefaultPicUrl" type="text" id="DefaultPicUrl" size="35">
              <a class="btn btn-success" href="#" onClick="window.open('Yr_UpFile.Asp?formname=form1&editname=DefaultPicUrl&uppath=images/guanggao&filelx=jpg','','status=no,scrollbaRs=no,top=20,left=110,width=420,height=165')">
										<i class="icon-zoom-in icon-white"></i>  
										�ϴ�ͼƬ                                            
									</a></td>
    </tr>
	<!--	
    <tr>
      <td height="22" align="right" class="back">��ͼƬ��</td>
      <td class="back">
        <input name="DefaultPicUrl2" type="text" id="DefaultPicUrl2" size="35">
        <input type="button" name="Submit12" value="�ϴ�ͼƬ" onClick="window.open('Yr_UpFile.Asp?formname=myform&editname=DefaultPicUrl2&uppath=images/guanggao&filelx=jpg','','status=no,scrollbaRs=no,top=20,left=110,width=420,height=165')">
</td>
    </tr>
	-->
    <tr>
      <td height="22" align="right" class="back">��ͨ����ˣ�</td>
      <td class="hback_1"><input name="Passed" type="checkbox" id="Passed2" value="yes" checked>
      ��<font color="#0000FF">�����ѡ�еĻ���ֱ�ӷ�����</font></td>
    </tr>
    <tr>
      <td height="22" align="right" class="back">�Ƽ���ʾ��</td>
      <td class="back"><input name="Elite" type="checkbox" id="Elite" value="yes">
      ��<font color="#0000FF">�����ѡ�еĻ������Ƽ���Ʒ��ʾ��</font></td>
    </tr>	
<!--	
    <tr>
      <td height="22" align="right" class="back">En��ҳ��ʾ��</td>
      <td class="back"><input name="EnElite" type="checkbox" id="EnElite" value="yes">
      ��<font color="#0000FF">�����ѡ�еĻ�����Ӣ����ҳ��Ϊ�²�Ʒ��ʾ��</font></td>
    </tr>
-->	
  <tr>
      <td height="22" align="right" class="back">�����ţ�</td>
      <td class="hback_1"><input name="Orderid" type="text" id="Orderid" value="9999" onKeyup="if(this.value.length==17){document.all.cardid1.focus()}" maxlength="50"></td>
    </tr>
    <tr>
      <td height="22" align="right" class="back">¼��ʱ�䣺</td>
      <td class="hback_1"><input name="UpdateTime" type="text" id="UpdateTime2" value="<%=now()%>" maxlength="50">
      ��ǰʱ��Ϊ��<%=now()%> ע�ⲻҪ�ı��ʽ��</td>
    </tr>
    <tr>
      <td height="22" colspan="2" align="center" class="back">
	  <input	name="Add" type="submit"  id="Add" value=" �� �� " >&nbsp; 
	  <input	name="Add2" type="reset"  id="Add2" value=" �� д " >&nbsp;
      <input	name="Add3" type="button"  id="Add3" value=" �� �� " onClick="Javascript:history.back();"></td>
    </tr>
  </form>
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
