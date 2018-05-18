<%dim dh
dh=2%>
<!--#include virtual="head.asp"-->
<div style="background:#EEF7E2;height:395px;min-width:1200px;">
<!-- 代码 开始 -->
<link rel="stylesheet" type="text/css" href="css/jquery.jslides.css" media="screen" />
<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="js/jquery.jslides.js"></script>
<div id="full-screen-slider">
	<ul id="slides">
		<li style="background:url('images/0.jpg') no-repeat center top"><a href="http://gardencenter.taobao.com/" target="_blank"></a></li>
		<li style="background:url('images/1.jpg') no-repeat center top"><a href="http://www.huayuanguanjia.com/class.asp" target="_blank"></a></li>
	</ul>
</div>
<!-- 代码 结束 -->
</div>
<div id="mainBg">
    	<div id="main">
    	<div id="header">

</div> 
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/garden.js"></script>
<script type="text/javascript" src="js/jquery.masonry.js"></script>
<script type="text/javascript" src="js/jquery.infinitescroll.js"></script>
<script type="text/javascript"> 
	var isWidescreen=screen.width>=1280; 
	if(isWidescreen){document.write("<style type='text/css'>.demo{width:1194px;}</style>");}
</script>
<div id="content" class="clearfix">
      <div class="contentList"> 
        <div class="caseList clearfix mgt10 case">
          <h2>花园故事<strong>Garden story</strong></h2>
          <div class="item_list infinite_scroll">
          
<%
if request("page")="" then
page=0 
else
page=request("page")
end if
pagesize=25	
set rs=server.CreateObject("adodb.recordset")
sql="select * from news where newskinds='花园故事' order by orderid,NEwsId desc"
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
                       <div class="item masonry_brick" style="border:1px #EFEEEC solid;margin-bottom:10px;padding-right:7px;padding-top:-10px;">
              <div class="item_t">
                <div class="img"><a href="ViewStory.asp?id=<%=rs("newsid")%>&Action=<%=Rs("NewsKinds")%>"><img width="230" alt="<%=GotToPic(rs("newstitle"),60)%>" src="<%=rs("newspic")%>" alt="<%=rs("newstitle")%>"/></a></div>
                <div class="title">
                  <h3 style="line-height:180%;"><a href="ViewStory.asp?id=<%=rs("newsid")%>&Action=<%=Rs("NewsKinds")%>"><%=GotToPic(rs("newstitle"),50)%></a></h3>
                  <p style="line-height:180%;"><%=GotToPic(RemoveHTML(rs("newstext")),100)%>……</p>
                </div>
              </div>
            </div>
            <!--item end-->
<%
rs.movenext
count=count+1
loop
end if

%>
          
 
          </div>
        </div>
              </div>
    </div>
<!--#include virtual="footer.asp"-->