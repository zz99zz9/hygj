<%dim dh
dh=3%>
<!--#include virtual="head.asp"-->
<div id="mainBg">
    	<div id="main">
    	<div id="header">

</div>
  <div id="content" class="clearfix">
        	<p class="crumbs"><a href="#">首页</a><em>&gt;</em><span>管家商城</span></p>
            <div class="leftContent">
                <div class="clearfix mgt10 detail">
<%
if request("page")="" then
page=0 
else
page=request("page")
end if
pagesize=25	
set rs=server.CreateObject("adodb.recordset")
sql="select * from news where newskinds='小蜜蜂工厂' order by NEwsId desc"
rs.open sql,conn,3,3
if rs.eof then
else
rs.pagesize=pagesize
totalfilm=rs.recordcount
pgnum=rs.pagecount
if page="" or clng(page)<1 then page=1
if clng(page) > pgnum then page=pgnum
if pgnum>0 then rs.AbsolutePage=page
count=0
do while not rs.eof and count<rs.PageSize %>
<a href="<%=rs("newsfrom")%>" target="_blank"><img width="1200" alt="<%=GotToPic(rs("newstitle"),50)%>" src="<%=rs("newspic")%>" style="margin-bottom:15px;"/></a>

<%
rs.movenext
count=count+1
loop
end if
%>
</div>
            </div>

        </div>
 
<!--#include virtual="footer.asp"-->
