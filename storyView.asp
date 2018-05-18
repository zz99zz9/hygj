<%dim dh
dh=1%>
<!--#include virtual="head.asp"--> 
<div id="mainBg">
    	<div id="main">
    	<div id="header">

</div>
            <div class="leftContent">
                <div class="clearfix mgt10 detail">
<%dim Id
Id=Trim(Request.QueryString("Id"))
safeRequest(id)
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [news] where newsid="&id,conn,1,3
if oRs.eof then
call sHowPop("´íÎóµÄIDÐÅÏ¢","-1",2)
End if
oRs("NewsCounter")=oRs("NewsCounter")+1
oRs.UPdate
%>
                        <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr>
                            <th height="30" scope="row"><%=oRs("Newstitle")%></th>
                          </tr>
                          <tr>
                            <th scope="row"><hr align="center" width="98%" size="1"></th>
                          </tr>

                          <tr>
                            <td height="30" style="Line-height:200%;"><%=oRs("newstext")%></td>
                          </tr>
                          <tr>
                            <td ><hr align="center" width="98%" size="1"></td>
                          </tr>
                        </table>
                      <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr>
                            <td  scope="row"><%call sHowDxNewsPN(oRs("newsKinds"),oRs("Newsid"))%></td>
                          </tr>
                      </table>
                      <%oRs.close
set oRs=nothing%>
               </div>
            </div>
            
        </div>
<!--#include virtual="footer.asp"-->