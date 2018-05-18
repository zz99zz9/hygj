<%dim dh
dh=1%>
<!--#include virtual="head.asp"-->
<div style="background:#EEF7E2;height:395px;width:100%;min-width:1200px;">
<!-- 代码 开始 -->
<link rel="stylesheet" type="text/css" href="css/jquery.jslides.css" media="screen" />
<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="js/jquery.jslides.js"></script>
<div id="full-screen-slider">
	<ul id="slides">
		<li style="background:url('images/0.jpg') no-repeat center top"><a href="https://shop129528718.taobao.com/?spm=a230r.7195193.1997079397.2.U5itrD" target="_blank"></a></li>
		<li style="background:url('images/1.jpg') no-repeat center top"><a href="http://www.huayuanguanjia.com/class.asp" target="_blank"></a></li>
	</ul>
</div>
<!-- 代码 结束 -->
</div>

<div id="mainBg">
  <div id="main">
    	<div id="header">

</div>
<div style="margin:10px auto;width:1200px;background:#EFEEEC;height:154px;">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="39%" align="left" valign="bottom"><img src="images/in1.gif" width="466" height="116" style="margin-top:38px;"/></td>
      <td width="19%" align="center"><a href="feedback.asp"><img src="images/in2.gif" width="136" height="62" style="margin-bottom:40px;" class="tt" onmouseover="this.className='tt2';" onmouseout="this.className='tt';"/></a></td>
      <td width="3%" align="left"><img src="images/in3.jpg" width="2" height="110" style="margin-bottom:20px;"/></td>
      <td width="24%" valign="top" ><img src="images/in9.jpg" width="242" height="115" usemap="#Map" style="margin-bottom:20px;" border="0"/>
        　　　　<!---->
</td>
      <td width="15%" align="center"><img src="images/in5.jpg" width="91" height="109" style="margin-bottom:20px;"/></td>
    </tr>
    </table>
</div>

 <div id="content" class="clearfix">

      <div class="leftContent2">
      <div class="caseList clearfix">
      <style>
	  .tt2 {-webkit-filter:hue-rotate(-45deg);transition:all 0.3s;}
	   .tt {transition:all 0.3s;}
	  </style>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left"><a href="feedback.asp"><img src="images/lii1.jpg"  class="tt" onmouseover="this.className='tt2';" onmouseout="this.className='tt';"/></a></td>
    <td align="center"><a href="study.asp"><img src="images/lii2.jpg"  class="tt" onmouseover="this.className='tt2';" onmouseout="this.className='tt';"/></a></td>
    <td align="right"><a href="https://gardencenter.taobao.com/?spm=a1z10.3-c.0.0.JP4wDw" target="_blank"><img src="images/lii3.jpg" class="tt" onmouseover="this.className='tt2';" onmouseout="this.className='tt';"/></a></td>
  </tr>
</table>

       </div>
       	<div class="caseList clearfix">
                	<h2><a href="story.asp"><img src="images/hygs.gif" width="242" height="25" /></a><span class="more"><a href="story.asp"><img src="images/more.gif" width="101" height="21" /></a></span></h2><br />

                    <%set rs=server.CreateObject("adodb.recordset")
sql="select top 3 * from news where newskinds='花园故事' order by orderid,NEwsId desc"
rs.open sql,conn,3,3%>
<%do while not rs.eof%>
               
                      <table width="1200" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left" width=400><div style="width:386px;line-height:180%;"><a href="ViewStory.asp?id=<%=rs("newsid")%>&Action=<%=Rs("NewsKinds")%>"><h1><img width="386" alt="<%=rs("newstitle")%>" src="<%=rs("newspic")%>" /></h1></a><h3><%=GotToPic(rs("newstitle"),50)%></h3><p align="left"><%=GotToPic(RemoveHTML(rs("newstext")),100)%>……</p></a></div></td><%rs.movenext%>
    <td align="center" width=400><div style="width:386px;line-height:180%;"><a href="ViewStory.asp?id=<%=rs("newsid")%>&Action=<%=Rs("NewsKinds")%>"><h1><img width="386" alt="<%=rs("newstitle")%>" src="<%=rs("newspic")%>" /></h1></a><h3 align="left"><%=GotToPic(rs("newstitle"),50)%></h3><p align="left"><%=GotToPic(RemoveHTML(rs("newstext")),100)%>……</p></a></div></td><%rs.movenext%>
    <td align="right" width=400><div style="width:386px;line-height:180%;"><a href="ViewStory.asp?id=<%=rs("newsid")%>&Action=<%=Rs("NewsKinds")%>"><h1><img width="386" alt="<%=rs("newstitle")%>" src="<%=rs("newspic")%>" /></h1></a><h3 align="left"><%=GotToPic(rs("newstitle"),50)%></h3><p align="left"><%=GotToPic(RemoveHTML(rs("newstext")),100)%>……</p></a></div></td>
  </tr>
</table>      
          <%
rs.movenext
count=count+1
loop

Rs.close
set Rs=Nothing

%>
                        
        </div><div style="height:15px;"></div>
                  <div class="class clearfix">
                	<!--<h2><a href="feedback.asp"></a><span class="more"><a href="feedback.asp"><img src="images/more.gif" width="101" height="21" /></a></span></h2>-->
                	<table width="1200" border="0" cellspacing="0" cellpadding="0">
                	  <tr>
                	    <td width="33%"><a href="feedback.asp"><img src="images/yydz.gif" width="211" height="24" /></a></td>
                	    <td align="left"><a href="Gardeners.asp"><img src="images/zys.gif" width="170" height="24" /></a></td>
              	    </tr>
              	  </table>
                    <div class="sl"></div>
                	<div>
                         <table width="1200" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
 <div class="list_lh">
	<!-- 代码开始 -->
		<div id='demo' style='overflow:hidden;height:207px;margin-top:5px;'><div id='demo1'>
			<ul>

				<%
if request("page")="" then
page=0 
else
page=request("page")
end if
pagesize=7	
set rs=server.CreateObject("adodb.recordset")
sql="select * from lyb where lyreply<>'' order by lyid desc"
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
				<li>
					<p><%if rs("adderss")="" then%>上海市<%else%><%=rs("adderss")%><%end if%>　<%if rs("lyname")="" then%>李<%else%><%=left(rs("lyname"),1)%><%end if%>**　<%=rs("mianji")%>平<%=rs("zhaoyuan")%>　<%if rs("Ser")="" then%>花园建设<%else%><%=rs("Ser")%><%end if%></p><!---->
				</li>
<!--------------------->

            <!--item end-->
<%
rs.movenext
count=count+1
loop
end if

%>
			</ul>
            </div>
<div id='demo2'></div>
</div>

             <script>
   var speed=50
   demo2.innerHTML=demo1.innerHTML
   function Marquee(){
   if(demo2.offsetTop-demo.scrollTop<=0)
   demo.scrollTop-=demo1.offsetHeight
   else{
   demo.scrollTop++
   }
   }
   var MyMar=setInterval(Marquee,speed)
   demo.onmouseover=function() {clearInterval(MyMar)}
   demo.onmouseout=function() {MyMar=setInterval(Marquee,speed)}
   </script>

		</div>
		<!-- 代码结束 -->

    <div class="list_right">
    <link href="zyscss/css.css" rel="stylesheet" type="text/css">

<SCRIPT src="zysjs/ScrollPic.js" type=text/javascript></SCRIPT><!--滚动图片 start-->

<DIV class=rollphotos>

<DIV class=blk_29>
<DIV class=LeftBotton id=LeftArr></DIV>
<DIV class=Cont id=ISL_Cont_1><!-- 图片列表 begin -->


<!------------------------------------------------->
<%
if request("page")="" then
page=0 
else
page=request("page")
end if
pagesize=6	
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

<!--------------------->
<DIV class=box>  <DIV class="box2"  onmouseover="this.className='box3';" onmouseout="this.className='box2';"><div class="b1"><a href="ViewGardeners.asp?id=<%=rs("Prod_id")%>"><img width="170" height="200" src="<%=rs("prod_pic")%>" alt="<%=rs("prod_name")%>"/></a></div><div class="b2"><a href="ViewGardeners.asp?id=<%=rs("Prod_id")%>" ><%=GotToPic(rs("prod_name"),50)%></a><br />[ <%=rs("kid_name")%> ]
                <br />
                <br />
      感悟：<br />
        <%=left(rs("prod_gw"),36)%>……
      <div class="b3" ><a href="/ViewGardeners.asp?id=<%=rs("Prod_id")%>">查看详情</a>
      </div>
            </div>
</DIV>
</DIV>
            <!--item end-->
<%
rs.movenext
count=count+1
loop
end if

%>
<!------------------------------------------------------->
<!-- 图片列表 end --></DIV>

<DIV class=RightBotton id=RightArr></DIV></DIV>


<SCRIPT language=javascript type=text/javascript>
		<!--//--><![CDATA[//><!--
		var scrollPic_02 = new ScrollPic();
		scrollPic_02.scrollContId   = "ISL_Cont_1"; //内容容器ID
		scrollPic_02.arrLeftId      = "LeftArr";//左箭头ID
		scrollPic_02.arrRightId     = "RightArr"; //右箭头ID

		scrollPic_02.frameWidth     = 908;//显示框宽度
		scrollPic_02.pageWidth      = 400; //翻页宽度

		scrollPic_02.speed          = 10; //移动速度(单位毫秒，越小越快)
		scrollPic_02.space          = 10; //每次移动像素(单位px，越大越快)
		scrollPic_02.autoPlay       = false; //自动播放
		scrollPic_02.autoPlayTime   = 3; //自动播放间隔时间(秒)

		scrollPic_02.initialize(); //初始化
							
		//--><!]]>
</SCRIPT>
</DIV>
<!--滚动图片 end--></div></td>
    </tr>
</table>


                    </div>
                    <div >
                    <br />
                    <img src="images/400.gif" width="1198" height="70" /> </div>
        </div>
  <div class="class clearfix">
       	  <h2><a href="/class.asp"><img src="images/hfkt.gif" width="177" height="25" /></a><span class="more"><a href="class.asp"><img src="images/more.gif" width="101" height="21" /></a></span></h2>
                	<div class="classInfor">
<%sql="select top 1 * from [table_product] where passed=true  order by orderid,articleId desc"
Set rs=Server.CreateObject("ADODB.Recordset")
rs.Open sql,conn,0,2,1 %>            		
                    	<a href="ViewClass.asp?id=<%=rs("articleid")%>" target="_blank" ><img width="478" height="330" src="<%=Rs("DefaultPicUrl")%>" alt="<%=rs("title")%>"/></a> 
 
                      <h3><a href="ViewClass.asp?id=<%=rs("articleid")%>" target="_blank"><%=GotToPic(rs("title"),60)%></a></h3>
                    	<p class="record"><%=GotToPic(RemoveHTML(Rs("Content")),360)%>……<a href="ViewClass.asp?id=<%=rs("articleid")%>" target="_blank">[详细内容]</a></p>
                        <%rs.close
						set rs=nothing%>
 
                                                                         <ul>
<%sql="select top 7 * from [table_product] where passed=true order by orderid,articleId desc"
Set rs=Server.CreateObject("ADODB.Recordset")
rs.Open sql,conn,0,2,1 
rs.movenext%> 
<%do while not rs.eof%>
                        	<li><a href="ViewClass.asp?id=<%=rs("articleid")%>" target="_blank"><em>[<%=rs("BigClassName")%>]</em><%=GotToPic(rs("title"),60)%><span><%=formatdatetime(rs("UpdateTime"),2)%></span></a></li>
<%
rs.movenext
count=count+1
loop

Rs.close
set Rs=Nothing

%>                          
                       <!--  <li class="more"><a href="http://www.huayuanguanjia.com/index.php?m=content&c=index&a=lists&catid=16">MORE+</a></li>-->
                        </ul>
                       
          </div>
        </div>
  
  
      </div>
 </div>

<!--# include virtual="footer.asp"-->

  </div>
    </div>
<div id="footer2">
<div id="footer">
<div id="copyright">
<table width="1200" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td width="33%" align="left"><img src="images/b1.gif" width="279" height="167" style="margin-left:10px;"/></td>
    <td width="33%" align="left"><img src="images/b2.gif" width="289" height="167" /></td>
    <td width="33%" align="left"><img src="images/b3.gif" width="345" height="167" /></td>
  </tr>
</table>


    </div>
            <div style="width:500px;margin:auto;">
			<ul class="footContent">
                              	                    
            	<li><a href="about.asp">关于我们</a></li>
								<li>|</li> 
				         
                                                                                            
            	<li><a href="shop.asp">小蜜蜂工厂</a></li>
								<li>|</li> 
				         
                                                       
            	<li><a href="news.asp">媒体中心</a></li>
								<li>|</li> 
				         
                                                       
            	<li><a href="job.asp">招贤纳士</a></li>
								<li>|</li> 
				         
                                                       
            	<li><a href="contect.asp">联系我们</a></li>
				<!--				<li>|</li> 
				         
                                                       
            	<li><a href="http://www.huayuanguanjia.com/list-32-1.html">法律声明</a></li>
								<li>|</li> 
				         
                                                       
            	<li><a href="http://www.huayuanguanjia.com/list-34-1.html">网站地图</a></li>-->
				                         
                                                                   
            </ul>
			<!--<script type="text/javascript">var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fa737130b7aa16408e8f449a295694309' type='text/javascript'%3E%3C/script%3E"));</script>--><script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_5307168'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s11.cnzz.com/stat.php%3Fid%3D5307168%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
		</div>
			
        </div>
        </div>
		

	<!-- Baidu Button BEGIN -->
<a class="bshareDiv" href="http://www.bshare.cn/share">分享按钮</a><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#uuid=&amp;style=3&amp;fs=4&amp;textcolor=#fff&amp;bgcolor=#9C3&amp;text=分享到"></script>
<!-- Baidu Button END -->

<map name="Map" id="Map">
  <area shape="rect" coords="-27,64,49,115" href="tencent://message/?uin=303577912&Site=www.huayuanguanjia.com&Menu=yes" target="_blank"/>
  <area shape="rect" coords="69,63,119,114" href="http://weibo.com/u/5236431158/home?wvr=5&c=spr_web_mthz_sogoumz_weibo_t001" target="_blank"/>
  <area shape="rect" coords="142,63,193,118" href="http://bang.liba.com/decorate/store/35000191/home" target="_blank" />
</map>
</body>
 
</html>
