<%dim dh
dh=6
fx="yes"%>
<!---------------------------top----------------------------->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<!--#include File="Conn.Asp"-->
<!--#include File="Inc/FuncTion.Asp"-->
<!--#Include File="Inc/config.Asp"-->
<!--#Include File="Inc/Inc.Asp"-->
<%
Dim Id
Id=Trim(Request.QueryString("id"))
safeRequest(id)
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [Table_Product] where articleId="&id,conn,1,3
if oRs.Eof then
call sHowPop("错误的Id信息","-1",2)
End if
oRs("Hits")=oRs("Hits")+1
oRs.Update
%>
<title><%=oRs("Title")%>-<%=siteTitle%></title>
<meta name="Keywords" content="<%=Sitekey%>" > 
<meta name="description" content="<%=SiteCont%>">
<link rel="stylesheet" type="text/css" href="css/reset.css"/>
<link rel="stylesheet" type="text/css" href="css/index.css"/>
<link rel="stylesheet" type="text/css" href="css/base.css"/>
 
</head>
 <style>
 .dh{padding-bottom:20px;font-size:16px;font-family:微软雅黑;text-decoration: none;}
  .dh2{padding-bottom:17px;font-size:16px;font-family:微软雅黑;border-bottom:3px #8BD028 solid;text-decoration: none;}
 .dh a{color:#5C5B56;text-decoration: none;}
 .dh2 a{color:#8BD028;text-decoration: none;}
 .pd{padding:0px 17px;}
 </style>
<body>
<div style="height:112px;width:100%;margin:0px auto;">
<table style="height:112px;width:1200px;margin:0px auto;"><tr><td>
<div style="width:237px;float:left;margin-right:15px;"><img src="images/logo.png" width="237" height="99" /></div>
<div style="width:750px;float:left;padding-left:20px;margin-top:30px;">
<table border="0" cellspacing="0" cellpadding="0">
  <tr>

    <td valign="top" class="pd"><a href="index.asp">
      <%if dh=1 then%><img src="images/dh/1b.gif" width="35" height="49" border="0" /><%else%><img src="images/dh/1a.gif" width="35" onmouseover="this.src='images/dh/1b.gif';" onmouseout="this.src='images/dh/1a.gif';" height="49" border="0" /><%end if%></a></td>
    <td valign="top" class="pd"><a href="story.asp">
      <%if dh=2 then%><img src="images/dh/2b.gif" width="70" height="49" border="0" /><%else%><img src="images/dh/2a.gif" onmouseover="this.src='images/dh/2b.gif';" onmouseout="this.src='images/dh/2a.gif';" width="70" height="49" border="0" /><%end if%></a></td>
      <td valign="top" class="pd"><a href="Gardeners.asp">
      <%if dh=8 then%><img src="images/dh/8b.gif"  border="0" /><%else%><img src="images/dh/8a.gif" onmouseover="this.src='images/dh/8b.gif';" onmouseout="this.src='images/dh/8a.gif';" border="0" /><%end if%></a></td>
       <!--<td valign="top" class="pd"><a href="htfb.asp">
      <%if dh=5 then%><img src="images/dh/5b.gif" width="70" height="49" border="0" /><%else%><img src="images/dh/5a.gif" onmouseover="this.src='images/dh/5b.gif';" onmouseout="this.src='images/dh/5a.gif';" width="70" height="49" border="0" /><%end if%></a></td>
   
    <td valign="top" class="pd"><a href="step.asp">
      <%if dh=4 then%><img src="images/dh/4b.gif" width="81" height="49" border="0" /><%else%><img src="images/dh/4a.gif" onmouseover="this.src='images/dh/4b.gif';" onmouseout="this.src='images/dh/4a.gif';" width="81" height="49" border="0" /><%end if%></a></td>-->
     <td valign="top" class="pd"><a href="shop.asp">
      <%if dh=3 then%><img src="images/dh/3b.gif" width="93" height="49" border="0" /><%else%><img src="images/dh/3a.gif" onmouseover="this.src='images/dh/3b.gif';" onmouseout="this.src='images/dh/3a.gif';" width="93" height="49" border="0" /><%end if%></a><br /></td>
    <td valign="top" class="pd"><a href="class.asp">
      <%if dh=6 then%><img src="images/dh/6b.gif" width="70" height="49" border="0" /><%else%><img src="images/dh/6a.gif" onmouseover="this.src='images/dh/6b.gif';" onmouseout="this.src='images/dh/6a.gif';" width="70" height="49" border="0" /><%end if%></a></td>
    <td valign="top" class="pd"><a href="http://wsq.qq.com/reflow/263639163" target="_blank"><img src="images/dh/7a.gif" onmouseover="this.src='images/dh/7b.gif';" onmouseout="this.src='images/dh/7a.gif';" width="89" height="49" border="0" /></a></td>
   

  </tr>
</table>

</div> <div style="float:right;width:80px;text-align:right;margin-top:15px;"><img src="images/2.jpg" width="67" height="67" /></div>
<div style="float:right;width:80px;text-align:right;margin-top:15px;"><a href="/feedback.asp"><img src="images/3.jpg" width="72" height="22" /></a><br />
      <br />
      <a href="http://www.weibo.com/2136956373"><img src="images/4.jpg" width="62" height="22" /></a></div>
     
</td></tr></table>
</div>

<!-----------------------------top------------------------->

<div id="mainBg">
    	<div id="main">
    	<div id="header">

</div>
 <div id="content" style="margin-bottom:-10px;" class="clearfix">
        <p class="crumbs"><a href="http://www.huayuanguanjia.com">首页</a><span> <em>&gt;</em> </span><a href="/class.asp">花粉课堂</a><em><span> </span><a href="http://www.huayuanguanjia.com/list-16-1.html"></a>&gt;</em>  <span>详情页</span></span></p>
            <div class="leftContent" style="margin:0px auto;">
              <div class="clearfix mgt10 detail" style="background:url(images/ktbg1.gif) no-repeat #F7F7F7 center top;">

                        <h3 style="margin:15px auto;"><%=oRs("Title")%><span> </span></h3>
                        <div class="content2" style="margin:0px auto;">
    <%=oRs("Content")%></div>

              </div>
              <div class="clearfix mgt10 detail" style="background:url(images/ktbg2.gif) no-repeat #F7F7F7 center top;height:420px;">
              </div>
          </div>
<%oRs.close
set oRs=nothing%>
 </div>

<!--#include virtual="footer.asp"-->
