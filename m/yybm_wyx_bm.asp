<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>������-��԰�ܼ�</title>
<!--#include File="Conn.Asp"-->

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
#mab{height:55px;}
.clear{clear: both;}
</style>
 <style>

 /**************************/
 .text{-webkit-appearance: none; width: 100%; height: 40px; border: 1px solid #dadbda; border-radius: 2px; background-color: #f6f6f6; padding: 0 0px;}
 textarea.text{line-height: 30px; height: 162px; padding: 5px 10px;}
select.text{-webkit-appearance: button; -webkit-user-select: none; padding: 0 7px;}
.area{-webkit-appearance: none; width: 100%; height: 70px; border: 1px solid #dadbda; border-radius: 2px; background-color: #f6f6f6; padding: 0 0px;}
.btn{ -webkit-appearance: none; width: 100%; height: 43px; background-color: #209800; border: none; border-radius: 3px; font-size: 18px; color: #fff;}
a.btn{display: inline-block; text-align: center; line-height: 43px;}
.mt20{margin-top: 20px;}
 </style>
<!--�˵�-->
<link href="m.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
</head>

<body onLoad="setup('�Ϻ�','�Ϻ�','������')">
<div id="top"><div class="b1"><img src="images/logo.jpg" /></div><div class="b2"><img src="images/tel.jpg" /></div></div>
<!---����------------->
<script type="text/javascript" src="../js/ceshi2.js"></script>
<script language="javascript"> 
 
function yanzheng()
{
	name=document.getElementById("name").value;
	tel=document.getElementById("tel").value;	
	address=document.getElementById("address").value;
	
	var m = /[^\u4E00-\u9FA5]/g;
	var flag = m.test(name);
	if(flag){
	 alert("��������ȷ������");
		document.getElementById("name").focus(); 
		return false;
	}
	
	if(name=="")
	{
		alert("��������Ϊ�գ�");
		document.getElementById("name").focus(); 
		return false;	
	}
	
	if(tel=="")
	{
		alert("�绰����Ϊ�գ�");
		document.getElementById("tel").focus(); 
		return false;	
	}
	
	if(tel.length>12)
	{
		alert("�绰�������벻��ȷ");
		document.getElementById("tel").focus(); 
		return false;	
	}
	
	if(address=="��������д��ϸ��ַ"){
		
		alert("����д��ϸ��ַ��");
		address = ""; 
		document.getElementById("address").focus(); 
		return false;
	}
}
</script>

  <%
act=request.Form("act")
if act="add" then

set rs=server.CreateObject("adodb.recordset")
	    sql="select * from lyb "
		rs.open sql,conn,3,3
		rs.addnew
		Rs("Ser")=Request.Form("Ser")
		Rs("lyname")=Request.Form("name")
		Rs("tel")=Request.Form("tel")
		Rs("ly")=2
		Rs("adderss")=Request.Form("sheng")&Request.Form("city")&Request.Form("area")
		Rs("mianji")=Request.Form("mianji")
		Rs("zhaoyuan")=Request.Form("zhaoyuan")
		rs("huxing")=request("huxing")
		rs("content")=request("content")
		rs("liaojie")=request("liaojie")
		Rs("LyIp")=Request.ServerVariables("REMOTE_ADDR")
		'Rs("LyPic")=lypic
		Rs("Lydate")=Now() 
		rs.update		
		rs.close
		set rs=nothing		
		response.Write"<meta http-equiv='refresh' content='2;URL=http://www.huayuanguanjia.com/m/gygj_hygs.asp'><center><p style='margin:20px;margin-top:50px;line-height:50px;font-size:25px;'>�γ̱����ɹ������ǻᾡ�������ϵ������ȥ�������ǵĻ�԰��Ʒ��!</p><a href='gygj_hygs.asp' style='font-weight:bold;font-size:25px;'>������ת</a></center>"		
else
%>
     
 
         <form method="post" action="" name="myform" id="myform" onsubmit="return yanzheng()">
  <table width="90%" border="0" cellpadding="0" cellspacing="10" style="background:#FFF;margin:auto;">
    <tr>
      <td><img src="../images/fb2.jpg" width="100%" /></td>
    </tr>
    <tr>
      <td height="40"><span class="label">����<font color="#ff0000">*</font></span></td>
    </tr>
    <tr>
      <td>
        <input class="text" type="text" name="name" id="name"/>
      </td>
    </tr>
    <tr>
      <td height="40"><span class="label">�绰<font color="#ff0000">*</font></span></td>
    </tr>
    <tr>
      <td>
        <input class="text" type="text" name="tel" id="tel"/>
      </td>
    </tr>
    <tr>
      <td height="40"><span class="label">���ڳ���</span></td>
    </tr>
    <tr>
      <td><input class="text" type="text" name="sheng" id="sheng"/></td>
    </tr>
   <!-- <tr>
      <td><span class="fl">
        <input class="text " type="text" name="address" id="address" value="��������д��ϸ��ַ" onfocus="if(value=='��������д��ϸ��ַ') {value=''}" onblur="if (value=='') {value='��������д��ϸ��ַ'}"/>
      </span></td>
    </tr>-->
    <!--<tr>
      <td height="40"><span class="label">��԰���(ƽ���ף�</span></td>
    </tr>
    <tr>
      <td><span class="fl">
        <input class="text" type="text" name="mianji" id="mianji"/>
      </span></td>
    </tr>
    <tr>
      <td height="40"><span class="label">��԰����</span></td>
    </tr>
    <tr>
      <td><span class="research fl">
        <input type="checkbox" name='zhaoyuan' id="liaojie_14"  value="ͥԺ" />
        <label for="liaojie_14">ͥԺ</label>
        <input type="checkbox" name='zhaoyuan' id="liaojie_15"  value="¶̨" />
        <label for="liaojie_14">¶̨</label>
  <input type="checkbox" name='zhaoyuan' id="liaojie_16"  value="��̨" />
        <label for="liaojie_14">��̨</label>
  <input type="checkbox" name='zhaoyuan' id="liaojie_17"  value="�ݶ�" />
  <label for="liaojie_17">�ݶ�</label>
      </span></td>
    </tr>
    <tr>
      <td height="40"><span class="label">���Ļ���</span></td>
    </tr>
    <tr>
      <td><span class="fl huxing">
        <input type="radio" name="huxing" id="huxing_dudong" value="����" />
        <label for="huxing_dudong">����</label>
        <input type="radio" name="huxing" id="huxing_lianp" value="����"/>
        <label for="huxing_lianp">����</label>
        <input type="radio"  name="huxing" id="huxing_gongyu" value="��Ԣ" />
        <label for="huxing_gongyu">��Ԣ</label>
        <br />
        <input type="radio"  name="huxing" id="huxing_shangwu" value="����¥" />
        <label for="huxing_shangwu">����¥</label>
        <input type="radio"  name="huxing" id="huxing_gongye" value="��ҵ԰" />
        <label for="huxing_gongye">��ҵ԰</label>
        <input type="radio"  name="huxing" id="huxing_jiuba" value="�ư�" />
        <label for="huxing_jiuba">�ư�</label>
      </span></td>
    </tr>-->
    <tr>
      <td height="40"><span class="label">��ע���ݣ�</span></td>
    </tr>
    <tr>
      <td><span class="fl">
        <textarea class="area" rows="" cols="" id="remark"  name="content"></textarea>
      </span></td>
    </tr>
    <tr>
      <td align="center"><span class="but clearfix mgt10">
        <input type="hidden" name="act" value="add" />
        <input class="btn mt20" type="submit" name="dosubmit" id="dosubmit" value=" �ύԤԼ "/>
      </span></td>
    </tr>
  </table>      		
</form>
     <%end if%>	

<div id="mab" class="clear"></div>
<!-------------�˵�------------------>
<div id="menu" style="position:fixed;bottom:0px;width:100%;height:44px;line-height:44px;z-index:999;background:url(images/menubg.png) repeat-x;">

	<ul style="margin:0 auto;list-style-type:none;width:100%;max-width:500px;height:100%;">

		

		<li><img class="img_front" src="images/front.png"><div class="menu_li"><img src="images/coin.png" width=10>&nbsp;����԰</div><img class="line" src="images/line.png" width=1>

		

		<span style="background-size:100%;">

			<img src="images/navbg3.png" width=100%>

			<div style="position:absolute;top:0px;left:0px;">

		

			<a href="gygj_hygs.asp">��԰����</a>

		

			<a href="gygj_zys.asp">��԰ʦ֮��</a>

		

			<a href="http://wap.koudaitong.com/v2/showcase/mpnews?alias=19b396qw3&sf=wx_menu">��԰����</a>


		

			</div>

		</span>

		

		</li>

		

		<li><img class="img_front" src="images/front.png"><div class="menu_li"><img src="images/coin.png" width=10>&nbsp;�컨԰</div><img class="line" src="images/line.png" width=1>

		

		<span style="background-size:100%;">

			<img src="images/navbg3.png" width=100%>

			<div style="position:absolute;top:0px;left:0px;">

		<a href="yybm_bwz.asp">������</a>

			<a href="yybm_wyx.asp">��Ҫѧ</a>

		

			

<a href="http://wap.koudaitong.com/v2/showcase/homepage?kdt_id=709787&reft=1447038703326&spm=t75966504&sf=wx_menu">����ѡ</a>

		

			</div>

		</span>

		

		</li>

		

		<a href="http://buluo.qq.com/p/barindex.html?from=share&bid=112998"><li><img class="img_front" src="images/front.png"><div class="menu_li"><img src="images/coin.png" width=10>&nbsp;˵��԰</div>

		

		<!--<span style="background-size:100%;">

			<img src="images/navbg5.png" width=100%>

			<div style="position:absolute;top:0px;left:0px;">

		

			<a href="http://wap.koudaitong.com/v2/tag/1aneldtn0?reft=1444989391945_1444989436668&spm=g161533762_h707972&sf=wx_menu">��԰ʯ��</a>

		

			<a href="http://wap.koudaitong.com/v2/tag/9crl78q4?spm=g161533762_h707972&reft=1444989391945_1444989456912&sf=wx_menu">��ķʯ</a>

		

			<a href="http://wap.koudaitong.com/v2/tag/4y8lpmk4?reft=1444989391945_1444989396554&spm=g161533762_h707972&sf=wx_menu">��԰����</a>

		

			<a href="http://wap.koudaitong.com/v2/showcase/tag?alias=emrmo2tq&sf=wx_menu">��԰ˮ��</a>

		

			<a href="http://wap.koudaitong.com/v2/showcase/homepage?kdt_id=709787&reft=1447038703326&spm=t75966504&sf=wx_menu">�̳���ҳ</a>

		

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
