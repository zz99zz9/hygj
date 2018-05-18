
<!--#Include File="Conn.Asp"-->


<%
if  request.cookies("adminname")="" then
response.write "<script language='javascript'>alert('出错啦！\n\n您尚未登录或身份已过期！\n\n可能是您长时间没有操作造成的！\n\n请您重新登录！');javascript:ToUrl('Login.asp');</script>"
Response.End
end if
%>

<%
sub CloseConn()
	conn.close
	set conn=nothing
end sub

Sub closeoRs()
oRs.close
set oRs=Nothing
End sub
%>