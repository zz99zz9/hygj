<%dim dh
dh=7%>
<!--#include virtual="head.asp"--> 
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
          <h2>管家商城<strong>Shop</strong></h2>
          <div class="item_list infinite_scroll">
          
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
                       <div class="item masonry_brick">
              <div class="item_t">
                <div class="img"><a href="<%=rs("newsfrom")%>" target="_blank"><img width="230" alt="<%=GotToPic(rs("newstitle"),50)%>" src="<%=rs("newspic")%>" /></a></div>
                <div class="title">
                  <h3><a href="<%=rs("newsfrom")%>" target="_blank"><%=GotToPic(rs("newstitle"),50)%></a></h3>

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