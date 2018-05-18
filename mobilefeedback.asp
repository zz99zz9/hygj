<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<!--#include File="Conn.Asp"-->
<!--#include File="Inc/FuncTion.Asp"-->
<!--#Include File="Inc/config.Asp"-->
<!--#Include File="Inc/Inc.Asp"-->

<title><%=SiteName%>-<%=siteTitle%></title>
<meta name="Keywords" content="<%=Sitekey%>" > 
<meta name="description" content="<%=SiteCont%>">

<meta name="viewport" content="width=device-width, initial-scale=1" />

 
</head>
 <style>
 
 .dh{padding-bottom:20px;font-size:16px;font-family:微软雅黑;text-decoration: none;}
  .dh2{padding-bottom:17px;font-size:16px;font-family:微软雅黑;border-bottom:3px #8BD028 solid;text-decoration: none;}
 .dh a{color:#5C5B56;text-decoration: none;}
 .dh2 a{color:#8BD028;text-decoration: none;}
 .pd{padding:0px 17px;}
 /**************************/
 .text{-webkit-appearance: none; width: 100%; height: 40px; border: 1px solid #dadbda; border-radius: 2px; background-color: #f6f6f6; padding: 0 0px;}
 textarea.text{line-height: 30px; height: 162px; padding: 5px 10px;}
select.text{-webkit-appearance: button; -webkit-user-select: none; padding: 0 7px;}
.area{-webkit-appearance: none; width: 100%; height: 70px; border: 1px solid #dadbda; border-radius: 2px; background-color: #f6f6f6; padding: 0 0px;}
.btn{ -webkit-appearance: none; width: 100%; height: 43px; background-color: #209800; border: none; border-radius: 3px; font-size: 18px; color: #fff;}
a.btn{display: inline-block; text-align: center; line-height: 43px;}
.mt20{margin-top: 20px;}
 </style>
<body>
<%dim dh
dh=5
fb=request.QueryString("fb")
if fb="" then
fb=1
end if%>


<body onLoad="setup('上海','上海','黄浦区')">

	  <script type="text/javascript" src="js/ceshi2.js"></script>
<script language="javascript"> 
 
function yanzheng()
{
	name=document.getElementById("name").value;
	tel=document.getElementById("tel").value;	
	address=document.getElementById("address").value;
	
	var m = /[^\u4E00-\u9FA5]/g;
	var flag = m.test(name);
	if(flag){
	 alert("请输入正确姓名！");
		document.getElementById("name").focus(); 
		return false;
	}
	
	if(name=="")
	{
		alert("姓名不能为空！");
		document.getElementById("name").focus(); 
		return false;	
	}
	
	if(tel=="")
	{
		alert("电话不能为空！");
		document.getElementById("tel").focus(); 
		return false;	
	}
	
	if(tel.length>12)
	{
		alert("电话号码输入不正确");
		document.getElementById("tel").focus(); 
		return false;	
	}
	
	if(address=="在这里填写详细地址"){
		
		alert("请填写详细地址！");
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
		Rs("Ser")=RequestText(Request.Form("Ser"))
		Rs("lyname")=Request.Form("name")
		Rs("tel")=Request.Form("tel")
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
		response.Write"<meta http-equiv='refresh' content='2;URL=http://www.huayuanguanjia.com/story.asp'><center><p style='margin:20px;margin-top:50px;line-height:50px;font-size:25px;'>预约成功，我们会尽快和您联系！现在去看看我们的花园作品吧!</p><a href='http://www.huayuanguanjia.com/story.asp' style='font-weight:bold;font-size:25px;'>立即跳转</a></center>"		
else
%>
     
 
         <form method="post" action="" name="myform" id="myform" onsubmit="return yanzheng()">
  <table width="100%" border="0" cellpadding="0">
    <tr>
      <td><img src="/images/fb2.jpg" width="100%" /></td>
    </tr>
    <tr>
      <td height="40"><span class="label">姓名</span></td>
    </tr>
    <tr>
      <td>
        <input class="text" type="text" name="name" id="name"/>
      </td>
    </tr>
    <tr>
      <td height="40"><span class="label">电话</span></td>
    </tr>
    <tr>
      <td>
        <input class="text" type="text" name="tel" id="tel"/>
      </td>
    </tr>
    <tr>
      <td height="40"><span class="label">所在城市</span></td>
    </tr>
    <tr>
      <td><input class="text" type="text" name="sheng" id="sheng"/></td>
    </tr>
   <!-- <tr>
      <td><span class="fl">
        <input class="text " type="text" name="address" id="address" value="在这里填写详细地址" onfocus="if(value=='在这里填写详细地址') {value=''}" onblur="if (value=='') {value='在这里填写详细地址'}"/>
      </span></td>
    </tr>-->
    <tr>
      <td height="40"><span class="label">花园面积(平方米）</span></td>
    </tr>
    <tr>
      <td><span class="fl">
        <input class="text" type="text" name="mianji" id="mianji"/>
      </span></td>
    </tr>
    <tr>
      <td height="40"><span class="label">造园类型</span></td>
    </tr>
    <tr>
      <td><span class="research fl">
        <input type="checkbox" name='zhaoyuan' id="liaojie_14"  value="庭院" />
        <label for="liaojie_14">庭院</label>
        <input type="checkbox" name='zhaoyuan' id="liaojie_15"  value="露台" />
        <label for="liaojie_14">露台</label>
  <input type="checkbox" name='zhaoyuan' id="liaojie_16"  value="阳台" />
        <label for="liaojie_14">阳台</label>
  <input type="checkbox" name='zhaoyuan' id="liaojie_17"  value="屋顶" />
  <label for="liaojie_17">屋顶</label>
      </span></td>
    </tr>
    <tr>
      <td height="40"><span class="label">您的户型</span></td>
    </tr>
    <tr>
      <td><span class="fl huxing">
        <input type="radio" name="huxing" id="huxing_dudong" value="独栋" />
        <label for="huxing_dudong">独栋</label>
        <input type="radio" name="huxing" id="huxing_lianp" value="连排"/>
        <label for="huxing_lianp">连排</label>
        <input type="radio"  name="huxing" id="huxing_gongyu" value="公寓" />
        <label for="huxing_gongyu">公寓</label>
        <br />
        <input type="radio"  name="huxing" id="huxing_shangwu" value="商务楼" />
        <label for="huxing_shangwu">商务楼</label>
        <input type="radio"  name="huxing" id="huxing_gongye" value="工业园" />
        <label for="huxing_gongye">工业园</label>
        <input type="radio"  name="huxing" id="huxing_jiuba" value="酒吧" />
        <label for="huxing_jiuba">酒吧</label>
      </span></td>
    </tr>
    <tr>
      <td height="40"><span class="label">备注内容：</span></td>
    </tr>
    <tr>
      <td><span class="fl">
        <textarea class="area" rows="" cols="" id="remark"  name="content"></textarea>
      </span></td>
    </tr>
    <tr>
      <td align="center"><span class="but clearfix mgt10">
        <input type="hidden" name="act" value="add" />
        <input class="btn mt20" type="submit" name="dosubmit" id="dosubmit" value=" 提交预约 "/>
      </span></td>
    </tr>
  </table>      		
</form>
     <%end if%>	
  <p>&nbsp;</p>

