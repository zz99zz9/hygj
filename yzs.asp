<%dim dh
dh=13%>
<!--#include virtual="head.asp"--> 
<div id="mainBg">
    	<div id="main">
    	<div id="header">
<img src="images/p.jpg" width="1200" height="231" />
</div>
<div id="content" class="clearfix">
	<p class="crumbs"><a href="http://www.huayuanguanjia.com">首页</a><em>&gt;</em><span>管家标准</span></p>
    <div class="contentList"> 
        <div class="bgList">
        <!--#include virtual="left2.asp"-->
            <div class="midCenter" style="width:770px; overflow:hidden;color:#333;line-height:180%;font-family:’sans serif’， tahoma， verdana， helvetica;">
                <h3>叶子说</h3><br />
                <%
if request("page")="" then
page=0 
else
page=request("page")
end if
pagesize=25	
set rs=server.CreateObject("adodb.recordset")
sql="select * from news where newskinds='叶子说' order by NEwsId desc"
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
<a href="<%=rs("newsfrom")%>" target="_blank"><%if rs("newspic")="" then%><p style="line-height:10px;"><%=rs("newstitle")%></p><%else%><img width="800" alt="<%=GotToPic(rs("newstitle"),50)%>" src="<%=rs("newspic")%>" style="margin-bottom:15px;"/><%end if%><br /></a>

<%
rs.movenext
count=count+1
loop
end if
%>
            </div>
        </div>
        <div class="right" style="display:none;">
            <div class="subpoena"><p>媒体传讯部<br /><em>Media@huayuanguanjia.com</em></p></div>
            <h4>非媒体人士咨询</h4>
            <p>非媒体人士咨询，请访问<a href="http://www.huayuanguanjia.com/index.php?m=content&amp;c=index&amp;a=lists&amp;catid=30">联系我们</a>页面。</p>
            <h4>公司地址</h4>
            <p>中国上海浦东新区川沙川图路300号</p>
        </div>
    </div>
</div>
<!--#include virtual="footer.asp"--> 