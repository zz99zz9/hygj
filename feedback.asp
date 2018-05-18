<%dim dh
dh=5
fb=request.QueryString("fb")
if fb="" then
fb=1
end if%>
<!--#include virtual="head.asp"--> 
<div id="mainBg">
    	<div id="main">
    	<div id="header">

</div>
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
  <div id="content" class="clearfix">
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
		response.Write"<script language='javascript'>alert('预约成功，我们会尽快和您联系！现在去看看我们的花园作品吧!');location.href('story.asp');</script>"		
else
%>
           <form method="post" action="" name="myform" id="myform" onsubmit="return yanzheng()">
 
          <div class="leftContent">
        <div class="clearfix mgt10 detail">
        <div style="text-align:center"><%select case fb
		case 1 %>
		<img src="/statics/images/newimg/2v.gif" width="1200" height="142" alt="weibo" />
		<%
		case 2 %>
		<img src="/images/fb2.jpg" width="1200" alt="weibo" />
		<%
		case 3 %>
		<img src="/images/fb3.gif" width="1200" alt="weibo" />
		<%
		case else %>
		<img src="/statics/images/newimg/2v.gif" width="1200" height="142" alt="weibo" />
		<%
		end select%></div>
          <div class="formList">
          <!--<div class="list">
            <label for="label" class="label">服务类型：</label>
            <div class="research fl">
              
              <input type="checkbox" name='Ser' id="liaojie_14"  value="花园设计" />
              <label for="liaojie_14">花园设计</label>
              <input type="checkbox" name='Ser' id="liaojie_15"  value="花园设计" />
              花园施工
              <input type="checkbox" name='Ser' id="liaojie_16"  value="花园养护" />
              花园养护
              <input type="checkbox" name='Ser' id="liaojie_17"  value="预算核算" />
              <label for="liaojie_17">预算核算</label>
              <input type="checkbox" name='Ser' id="liaojie_18"  value="花园全托管" />
              <label for="liaojie_18">花园全托管</label>
            </div>
          </div>-->
<div class="list">
  <label for="names" class="label"><em>*</em>姓名：</label>
              <div class="fl">
                <input class="text" type="text" name="name" id="name"/>　<span class="colorC">请填写中文姓名</span>
              </div>
          </div>
            <div class="list">
              <label for="number" class="label"><em>*</em>电话：</label>
              <div class="fl">
                <input class="text" type="text" name="tel" id="tel"/>
              </div>
            </div>
            <div class="list">
              <label for="" class="label"><em>*</em>地址：</label>
              <div class="fl">
             
              <select name="sheng" id="s1" class="sele">
 
                <option>省份</option>
                
                </select>
                
                <select name="city" id="s2" class="sele">
                
                <option>地级市</option>
                
                </select>
                
                <select name="area" id="s3" class="sele">
                
                <option>市、县级市、县</option>
                
                </select>
            
              
              </div>
            </div>
            <div class="list">
            	<label for="" class="label"></label>
              <div class="fl">
                <input class="text textl" type="text" name="address" id="address" value="在这里填写详细地址" onfocus="if(value=='在这里填写详细地址') {value=''}" onblur="if (value=='') {value='在这里填写详细地址'}"/>
              </div>
            </div>
            <div class="list">
              <label for="area" class="label">花园面积：</label>
              <div class="fl">
                <input class="text" type="text" name="mianji" id="mianji"/>
                <span>平方米</span>
              </div>
            </div>
            <div class="list">
            <label for="label" class="label">造园类型：</label>
            <div class="research fl">
              
              <input type="checkbox" name='zhaoyuan' id="liaojie_14"  value="庭院" />
              <label for="liaojie_14">庭院</label>
              <input type="checkbox" name='zhaoyuan' id="liaojie_15"  value="露台" />
              露台
              <input type="checkbox" name='zhaoyuan' id="liaojie_16"  value="阳台" />
              阳台
              <input type="checkbox" name='zhaoyuan' id="liaojie_17"  value="屋顶" />
              <label for="liaojie_17">屋顶</label>

            </div>
          </div>

            <div class="list">
            	<label for="" class="label">您的户型：</label>
              <div class="fl huxing">
                  <input type="radio" name="huxing" id="huxing_dudong" value="独栋" /> <label for="huxing_dudong">独栋</label> 
                  <input type="radio" name="huxing" id="huxing_lianp" value="连排"/> <label for="huxing_lianp">连排</label>
                  <input type="radio"  name="huxing" id="huxing_gongyu" value="公寓" /> <label for="huxing_gongyu">公寓</label>
                  <input type="radio"  name="huxing" id="huxing_shangwu" value="商务楼" /> <label for="huxing_shangwu">商务楼</label>
                  <input type="radio"  name="huxing" id="huxing_gongye" value="工业园" /> <label for="huxing_gongye">工业园</label>
                  <input type="radio"  name="huxing" id="huxing_jiuba" value="酒吧" /> <label for="huxing_jiuba">酒吧</label>
              </div>
            </div>
            <div class="list">
            	<label for="" class="label">备注内容：</label>
              <div class="fl">
              	<textarea class="area" rows="" cols="" id="remark"  name="content"></textarea>
              </div>
            </div>
            <h4 class="clearfix">帮助我们调研</h4>
            <div class="list">
           <!-- 	<label for="" class="label">您从哪里得知我们：</label>
                  <div class="research fl">
                  
                    <input type="checkbox" name='liaojie' id="liaojie_1"  value="百度" /> <label for="liaojie_1">百度</label>
                    <input type="checkbox" name='liaojie' id="liaojie_2"  value="谷歌" /> <label for="liaojie_2">谷歌</label>
                    <input type="checkbox" name='liaojie' id="liaojie_3"  value="搜狗" /> <label for="liaojie_3">搜狗</label>
                    <input type="checkbox" name='liaojie' id="liaojie_4"  value="腾讯" /> <label for="liaojie_4">腾讯</label>
                    <input type="checkbox" name='liaojie' id="liaojie_5"  value="篱笆" /> <label for="liaojie_5">篱笆</label>
                    <input type="checkbox" name='liaojie' id="liaojie_6"  value="搜房" /> <label for="liaojie_6">搜房</label>
                    <input type="checkbox" name='liaojie' id="liaojie_7"  value="淘宝" /> <label for="liaojie_7">淘宝</label>
                    <br />
                    <input type="checkbox" name='liaojie' id="liaojie_8"  value="微信" /> <label for="liaojie_8">微信</label>
                    <input type="checkbox" name='liaojie' id="liaojie_9"  value="齐家网" /> <label for="liaojie_9">齐家网</label>
                    <input type="checkbox" name='liaojie' id="liaojie_10"  value="赶集网" /> <label for="liaojie_10">赶集网</label>
                    <input type="checkbox" name='liaojie' id="liaojie_11"  value="58同城" /> <label for="liaojie_11">58同城</label>
                    <input type="checkbox" name='liaojie' id="liaojie_12"  value="新浪微博" /> <label for="liaojie_12">新浪微博</label>
                    <input type="checkbox" name='liaojie' id="liaojie_13"  value="其他" /> <label for="liaojie_13">其他</label>   
                </div>-->
				<p class="but clearfix mgt10"><input type="hidden" name="act" value="add" /><input class="submit" type="submit" name="dosubmit" id="dosubmit" value=" 提交 " /></p>
            </div>
            
          </div>
          
        </div>
      </div>
      		</form>
     <%end if%>	

        </div>
 
 
<!--#include virtual="footer.asp"-->
