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
<body onLoad="setup('�Ϻ�','�Ϻ�','������')">

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
		response.Write"<script language='javascript'>alert('ԤԼ�ɹ������ǻᾡ�������ϵ������ȥ�������ǵĻ�԰��Ʒ��!');location.href('story.asp');</script>"		
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
            <label for="label" class="label">�������ͣ�</label>
            <div class="research fl">
              
              <input type="checkbox" name='Ser' id="liaojie_14"  value="��԰���" />
              <label for="liaojie_14">��԰���</label>
              <input type="checkbox" name='Ser' id="liaojie_15"  value="��԰���" />
              ��԰ʩ��
              <input type="checkbox" name='Ser' id="liaojie_16"  value="��԰����" />
              ��԰����
              <input type="checkbox" name='Ser' id="liaojie_17"  value="Ԥ�����" />
              <label for="liaojie_17">Ԥ�����</label>
              <input type="checkbox" name='Ser' id="liaojie_18"  value="��԰ȫ�й�" />
              <label for="liaojie_18">��԰ȫ�й�</label>
            </div>
          </div>-->
<div class="list">
  <label for="names" class="label"><em>*</em>������</label>
              <div class="fl">
                <input class="text" type="text" name="name" id="name"/>��<span class="colorC">����д��������</span>
              </div>
          </div>
            <div class="list">
              <label for="number" class="label"><em>*</em>�绰��</label>
              <div class="fl">
                <input class="text" type="text" name="tel" id="tel"/>
              </div>
            </div>
            <div class="list">
              <label for="" class="label"><em>*</em>��ַ��</label>
              <div class="fl">
             
              <select name="sheng" id="s1" class="sele">
 
                <option>ʡ��</option>
                
                </select>
                
                <select name="city" id="s2" class="sele">
                
                <option>�ؼ���</option>
                
                </select>
                
                <select name="area" id="s3" class="sele">
                
                <option>�С��ؼ��С���</option>
                
                </select>
            
              
              </div>
            </div>
            <div class="list">
            	<label for="" class="label"></label>
              <div class="fl">
                <input class="text textl" type="text" name="address" id="address" value="��������д��ϸ��ַ" onfocus="if(value=='��������д��ϸ��ַ') {value=''}" onblur="if (value=='') {value='��������д��ϸ��ַ'}"/>
              </div>
            </div>
            <div class="list">
              <label for="area" class="label">��԰�����</label>
              <div class="fl">
                <input class="text" type="text" name="mianji" id="mianji"/>
                <span>ƽ����</span>
              </div>
            </div>
            <div class="list">
            <label for="label" class="label">��԰���ͣ�</label>
            <div class="research fl">
              
              <input type="checkbox" name='zhaoyuan' id="liaojie_14"  value="ͥԺ" />
              <label for="liaojie_14">ͥԺ</label>
              <input type="checkbox" name='zhaoyuan' id="liaojie_15"  value="¶̨" />
              ¶̨
              <input type="checkbox" name='zhaoyuan' id="liaojie_16"  value="��̨" />
              ��̨
              <input type="checkbox" name='zhaoyuan' id="liaojie_17"  value="�ݶ�" />
              <label for="liaojie_17">�ݶ�</label>

            </div>
          </div>

            <div class="list">
            	<label for="" class="label">���Ļ��ͣ�</label>
              <div class="fl huxing">
                  <input type="radio" name="huxing" id="huxing_dudong" value="����" /> <label for="huxing_dudong">����</label> 
                  <input type="radio" name="huxing" id="huxing_lianp" value="����"/> <label for="huxing_lianp">����</label>
                  <input type="radio"  name="huxing" id="huxing_gongyu" value="��Ԣ" /> <label for="huxing_gongyu">��Ԣ</label>
                  <input type="radio"  name="huxing" id="huxing_shangwu" value="����¥" /> <label for="huxing_shangwu">����¥</label>
                  <input type="radio"  name="huxing" id="huxing_gongye" value="��ҵ԰" /> <label for="huxing_gongye">��ҵ԰</label>
                  <input type="radio"  name="huxing" id="huxing_jiuba" value="�ư�" /> <label for="huxing_jiuba">�ư�</label>
              </div>
            </div>
            <div class="list">
            	<label for="" class="label">��ע���ݣ�</label>
              <div class="fl">
              	<textarea class="area" rows="" cols="" id="remark"  name="content"></textarea>
              </div>
            </div>
            <h4 class="clearfix">�������ǵ���</h4>
            <div class="list">
           <!-- 	<label for="" class="label">���������֪���ǣ�</label>
                  <div class="research fl">
                  
                    <input type="checkbox" name='liaojie' id="liaojie_1"  value="�ٶ�" /> <label for="liaojie_1">�ٶ�</label>
                    <input type="checkbox" name='liaojie' id="liaojie_2"  value="�ȸ�" /> <label for="liaojie_2">�ȸ�</label>
                    <input type="checkbox" name='liaojie' id="liaojie_3"  value="�ѹ�" /> <label for="liaojie_3">�ѹ�</label>
                    <input type="checkbox" name='liaojie' id="liaojie_4"  value="��Ѷ" /> <label for="liaojie_4">��Ѷ</label>
                    <input type="checkbox" name='liaojie' id="liaojie_5"  value="���" /> <label for="liaojie_5">���</label>
                    <input type="checkbox" name='liaojie' id="liaojie_6"  value="�ѷ�" /> <label for="liaojie_6">�ѷ�</label>
                    <input type="checkbox" name='liaojie' id="liaojie_7"  value="�Ա�" /> <label for="liaojie_7">�Ա�</label>
                    <br />
                    <input type="checkbox" name='liaojie' id="liaojie_8"  value="΢��" /> <label for="liaojie_8">΢��</label>
                    <input type="checkbox" name='liaojie' id="liaojie_9"  value="�����" /> <label for="liaojie_9">�����</label>
                    <input type="checkbox" name='liaojie' id="liaojie_10"  value="�ϼ���" /> <label for="liaojie_10">�ϼ���</label>
                    <input type="checkbox" name='liaojie' id="liaojie_11"  value="58ͬ��" /> <label for="liaojie_11">58ͬ��</label>
                    <input type="checkbox" name='liaojie' id="liaojie_12"  value="����΢��" /> <label for="liaojie_12">����΢��</label>
                    <input type="checkbox" name='liaojie' id="liaojie_13"  value="����" /> <label for="liaojie_13">����</label>   
                </div>-->
				<p class="but clearfix mgt10"><input type="hidden" name="act" value="add" /><input class="submit" type="submit" name="dosubmit" id="dosubmit" value=" �ύ " /></p>
            </div>
            
          </div>
          
        </div>
      </div>
      		</form>
     <%end if%>	

        </div>
 
 
<!--#include virtual="footer.asp"-->
