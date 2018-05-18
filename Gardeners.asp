<%dim dh
dh=8%>
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
          <h2>造园师<strong>Gardeners</strong></h2>
          <div class="item_list infinite_scroll">
          
<%
if request("page")="" then
page=0 
else
page=request("page")
end if
pagesize=25	
set rs=server.CreateObject("adodb.recordset")
sql="select * from Prod order by orderid,Prod_id desc"
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
            <DIV class="box2"  onmouseover="this.className='box3';" onmouseout="this.className='box2';"><div class="b1"><a href="ViewGardeners.asp?id=<%=rs("Prod_id")%>"><img width="170" height="200" src="<%=rs("prod_pic")%>" alt="<%=rs("prod_name")%>"/></a></div><div class="b2"><a href="ViewGardeners.asp?id=<%=rs("Prod_id")%>" ><%=GotToPic(rs("prod_name"),50)%></a><br />[ <%=rs("kid_name")%> ]
                <br />
                <br />
      <p>感悟：<br />
        <%=left(rs("prod_gw"),36)%>……</p>
      <p><div class="b3" ><a href="/ViewGardeners.asp?id=<%=rs("Prod_id")%>">查看详情</a>
      </div>
            </div>
</DIV>
            <!--item end-->
<%
rs.movenext
count=count+1
loop
end if

%>
        
<div class="clear"></div>
          </div>
        </div>
              </div>
    </div>
<!--#include virtual="footer.asp"-->