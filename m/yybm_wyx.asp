<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include File="Conn.Asp"-->
<title>我要学-花园管家</title>
<link rel="stylesheet" type="text/css" href="css/m.css"/>
<style type="text/css">
body {
	background:#F0F0E1;
	padding:0px;
	margin:0px;
}
#top{height:55px;margin-bottom:15px;background:#FFF;}
.b1{float:left;width:127px;margin:8px;}
.b2{float:right;min-width:100px;margin:15px;line-height:180%;}
.b2 img{margin:10px 0px;}
#ma{background:#FFF;text-align:center;width:90%;margin:0px auto 10px auto;}
#ma img{width:100%;margin:0px auto 10px auto;}
#mab{height:25px;}
#ma .bu img{height:47px;width:219px;margin:auto;}
</style>
<!--菜单-->
<link href="m.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
</head>

<body>
<div id="top"><div class="b1"><img src="images/logo.jpg" /></div><div class="b2"><img src="images/tel.jpg" /></div></div>
<!---内容------------->
<%

set rs=server.CreateObject("adodb.recordset")
sql="select * from news where newskinds='我要学' order by orderid,NEwsId desc"
rs.open sql,conn,3,3
if rs.eof then
else

do while not rs.eof%>
<div id="ma"><img src="../<%=rs("newspic")%>" /><br />
  <table width="100%" border="0" cellspacing="10" cellpadding="0">
    <tr>
      <td colspan="2" align="center" style="color:#6C871F;"><%=rs("newstitle")%></td>
    </tr>
    <tr>
      <td width="70" align="left" valign="top" style="color:#6C871F;">课程时间 </td>
      <td align="left" valign="top"><%=rs("sksj")%></td>
    </tr>
    <tr>
      <td align="left" valign="top" style="color:#6C871F;">讲　　师</td>
      <td align="left" valign="top"><%=rs("newsfrom")%></td>
    </tr>
    <tr>
      <td align="left" valign="top" style="color:#6C871F;">上课地点</td>
      <td align="left" valign="top"><%=rs("skdd")%></td>
    </tr>
    <tr>
      <td align="left" valign="top" style="color:#6C871F;">价　　格</td>
      <td align="left" valign="top"><%=rs("jg")%></td>
    </tr>
    <tr>
      <td align="left" valign="top" style="color:#6C871F;">报名热线</td>
      <td align="left" valign="top"><%=rs("bmrx")%></td>
    </tr>
    <tr>
      <td align="left" valign="top" style="color:#6C871F;">课程介绍</td>
      <td align="left" valign="top"><%=rs("newstitle")%></td>
    </tr>
    <tr>
      <td colspan="2" align="center" class="bu"><a href="yybm_wyx_bm.asp?id=<%=rs("newsid")%>"><img src="images/bm.gif" width="219" height="47" /></a></td>
    </tr>
</table><br /></div>


            <!--item end-->
<%
rs.movenext
count=count+1
loop
end if

%>


<div id="mab"></div>
<!-------------菜单------------------>
<div id="menu" style="position:fixed;bottom:0px;width:100%;height:44px;line-height:44px;z-index:999;background:url(images/menubg.png) repeat-x;">

	<ul style="margin:0 auto;list-style-type:none;width:100%;max-width:500px;height:100%;">

		

		<li><img class="img_front" src="images/front.png"><div class="menu_li"><img src="images/coin.png" width=10>&nbsp;看花园</div><img class="line" src="images/line.png" width=1>

		

		<span style="background-size:100%;">

			<img src="images/navbg3.png" width=100%>

			<div style="position:absolute;top:0px;left:0px;">

		

			<a href="gygj_hygs.asp">花园案例</a>

		

			<a href="gygj_zys.asp">造园师之家</a>

		

			<a href="http://wap.koudaitong.com/v2/showcase/mpnews?alias=19b396qw3&sf=wx_menu">花园攻略</a>


		

			</div>

		</span>

		

		</li>

		

		<li><img class="img_front" src="images/front.png"><div class="menu_li"><img src="images/coin.png" width=10>&nbsp;造花园</div><img class="line" src="images/line.png" width=1>

		

		<span style="background-size:100%;">

			<img src="images/navbg3.png" width=100%>

			<div style="position:absolute;top:0px;left:0px;">

		<a href="yybm_bwz.asp">帮我造</a>

			<a href="yybm_wyx.asp">我要学</a>

		

			

<a href="http://wap.koudaitong.com/v2/showcase/homepage?kdt_id=709787&reft=1447038703326&spm=t75966504&sf=wx_menu">帮我选</a>

		

			</div>

		</span>

		

		</li>

		

		<a href="http://buluo.qq.com/p/barindex.html?from=share&bid=112998"><li><img class="img_front" src="images/front.png"><div class="menu_li"><img src="images/coin.png" width=10>&nbsp;说花园</div>

		

		<!--<span style="background-size:100%;">

			<img src="images/navbg5.png" width=100%>

			<div style="position:absolute;top:0px;left:0px;">

		

			<a href="http://wap.koudaitong.com/v2/tag/1aneldtn0?reft=1444989391945_1444989436668&spm=g161533762_h707972&sf=wx_menu">花园石材</a>

		

			<a href="http://wap.koudaitong.com/v2/tag/9crl78q4?spm=g161533762_h707972&reft=1444989391945_1444989456912&sf=wx_menu">莱姆石</a>

		

			<a href="http://wap.koudaitong.com/v2/tag/4y8lpmk4?reft=1444989391945_1444989396554&spm=g161533762_h707972&sf=wx_menu">花园工具</a>

		

			<a href="http://wap.koudaitong.com/v2/showcase/tag?alias=emrmo2tq&sf=wx_menu">花园水景</a>

		

			<a href="http://wap.koudaitong.com/v2/showcase/homepage?kdt_id=709787&reft=1447038703326&spm=t75966504&sf=wx_menu">商城主页</a>

		

			</div>

		</span>-->

		

		</li></a>

		

	</ul>

</div>

<div class="footer_front" style="position:fixed;width:100%;height:100%;top:0px;left:0px;z-index:888;display:none;"><img src="images/front.png" width="100%" height="100%"></div>

<style>

#menu ul li{float:left;width:33.3%;height:100%;text-align:center;position:relative;font-size:14px;}

#menu ul li .line{position:absolute;top:0px;right:0px;z-index:30;}

#menu ul li .menu_li{position:absolute;top:0px;left:0px;z-index:20;width:100%;height:100%;color:#454545;background:url(images/menubg.png) repeat-x;}

#menu ul li .img_front{position:absolute;top:0px;left:0px;z-index:30;width:100%;height:100%;}

#menu ul li .img_front img{width:100%;height:100%;}

#menu ul li span{position:absolute;bottom:-300px;left:50%;width:104px;margin-left:-52px;height:auto;text-align:center;z-index:10;}

#menu ul li span a{float:left;width:100%;height:43px;line-height:43px;color:#454545;text-decoration:none;}

</style>

<script>

function beginTalk() {

	var t = window.location.toString();

	var newT = t.replace(new RegExp("&", "gm"), "<and>"); 

	window.open("../italk/index_m.jsp@fs_AccessAddress=" + newT, "talk");

}

window.onload = function(){

	$('#menu ul li').each(function(j){

		$('#menu ul li').eq(j).removeClass("on");

		$('#menu ul li span').eq(j).animate({bottom:-$('#menu ul li span').eq(j).height()},100);

	});

}

$('#menu ul li').each(function(i){

	$(this).click(function(){

		if($(this).attr("class")!="on"){

			$('#menu ul .on span').animate({bottom:-$('#menu ul .on span').height()},200);

			$('#menu ul .on').removeClass("on");

			$(this).addClass("on");

			$('#menu ul li span').eq(i).animate({bottom:35},200);

			$('.footer_front').show();

		}else{

			$('#menu ul li span').eq(i).animate({bottom:-$('#menu ul li span').eq(i).height()},200);

			$(this).removeClass("on");

			$('.footer_front').hide();

		}

	});

});

$('.footer_front').click(function(){

	$('#menu ul .on span').animate({bottom:-$('#menu ul .on span').height()},200);

	$('#menu ul .on').removeClass("on");

	$(this).hide();

});

</script>

</div>
</body>
</html>
