<%dim dh
dh=6%>
<!--#include virtual="head.asp"-->
<div id="mainBg">
    	<div id="main">
    	<div id="header">

</div>
 <%
BigclassId=Trim(Request.QueryString("BigclassId"))
smallclassId=Trim(Request.QueryString("smallclassId"))
if BigclassId="" then
BigclassID=39
end if
if BigclassId<>"" then
	safeRequest(BigclassId)
	sqll=sqll & " and BigclassId="&BigclassId&""
	
End if

if smallclassId<>"" then
	safeRequest(smallclassId)
	sqll=sqll & " and smallclassId="&smallclassId&""
End if
%>
 <script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/garden.js"></script>
<script type="text/javascript" src="js/jquery.masonry.js"></script>
<script type="text/javascript" src="js/jquery.infinitescroll.js"></script>
<script type="text/javascript"> 
	var isWidescreen=screen.width>=1280; 
	if(isWidescreen){document.write("<style type='text/css'>.demo{width:1194px;}</style>");}
</script> <div id="content" class="clearfix">
    <div class="contentList">
      <!--<p class="crumbs"><a href="#">首页</a><em>&gt;</em><span>花粉课堂</span></p>-->
      <div class="classTabs clearfix">

                           	                    
                    
<%=sHowKindssy(BigclassId)%>
                    	
                                            

      </div>
      <div class="caseList clearfix mgt10 case">
      	<div class="item_list infinite_scroll">

<%
sql="select articleId,Title,Content,orderid,BigclassId,Spec,SmallclassId,DefaultPicUrl,bigclassName,smallclassName,Product_Id,passed,Memo from [table_product] where passed=true  "&sqll&" order by orderid desc,articleId desc"
Set rs=Server.CreateObject("ADODB.Recordset")
rs.PageSize = 12 '这里设定每页显示的记录数
rs.CursorLocation = 3
rs.Open sql,conn,0,2,1 '这里执行你查询SQL并获得结果记录集
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
for i=1 to rs.PageSize/2
if rs.EOF or rs.BOF then exit for
%>

  <%
		  for j=1 to 4
		  if Not Rs.eof then%>
<!--item start-->
		                       <div class="item masonry_brick">
              <div class="item_t">
                <div class="img"><a href="ViewClass.asp?id=<%=rs("articleid")%>" target="_blank" ><img width="230" src="<%=Rs("DefaultPicUrl")%>" alt="<%=rs("title")%>"/></a></div>
                <div class="title">
                  <h3 style="line-height:180%;"><a href="ViewClass.asp?id=<%=rs("articleid")%>" target="_blank"><%=GotToPic(rs("title"),60)%></a></h3>
                  <p style="line-height:180%;"><%=GotToPic(RemoveHTML(Rs("Content")),40)%>……</p>
                </div>
              </div>
            </div>
            <!--item end-->
<%
		Rs.Movenext
		End if
		Next%>
        <%
NExt
%>
                       
 
          </div>
        </div>
                <!--<div class="page">
          <div class="page-list"> <a href="list-16-0.html" class="page-pre" title="上一篇">上一页</a> <span>1</span> <a href="list-16-2.html">2</a> <a href="list-16-3.html">3</a> <a href="list-16-4.html">4</a> <a href="list-16-5.html">5</a> <a href="list-16-2.html" class="page-next" title="下一篇">下一页</a></div>
        </div>-->
            </div>
  </div>
<!--#include virtual="footer.asp"-->

