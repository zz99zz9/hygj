<!--#include file="inc/conn.asp"-->
<%
username=Request.form("username")
userexit=Request.QueryString("userexit")
password = Request("password")
'VerifyCode = Replace(Trim(Request("VerifyCode")),"'","")
if userexit=ok then
response.cookies("username")=""
response.cookies("IsAdmin")=""
end if
if UserName = "" or  PassWord = "" then
	Response.Write("<script>alert(""错误：\n请填写完整用户名和密码"");location.href=""login.asp"";</script>")
	Response.End
end if
dim ip
ip=Request.ServerVariables("REMOTE_ADDR")
set rs = server.createobject("adodb.recordset")
sql="select * from [user] where username='"&username&"'and password='"&password&"'"
rs.open sql,conn,1,3
if not rs.EOF then
	rs.Update

	response.cookies("username")=rs("username")

    response.cookies("UserID")=rs("id")
	response.cookies("Grade")=rs("grade")

	if rs("lastdatetime")<>"" then
	response.cookies("lastdatetime")=rs("lastdatetime")
	else
	response.cookies("lastdatetime")=now()
	end if

	response.cookies("IsAdmin")=true


	conn.execute("update [user] set lastDateTime =now(),ip='"&ip&"' where id="&rs("id"))
	conn.execute("INSERT INTO userlog(userid,uptime,ip)VALUES('"&request.cookies("UserID")&"','"&now()&"','"&request.cookies("ip")&"') ")

	response.cookies("ip")=rs("ip")

	response.cookies("qx1")=rs("qx1")

	response.cookies("qx2")=rs("qx2")

	response.cookies("qx3")=rs("qx3")

	response.cookies("qx4")=rs("qx4")

	response.cookies("qx5")=rs("qx5")

	response.cookies("qx6")=rs("qx6")

	Response.Redirect ("index.asp")
else
	Response.Write("<script>alert(""错误：\n您的用户名和密码错误，请重新输入"");location.href=""login.asp"";</script>")
	Response.End 
end if
rs.close
set rs=nothing
conn.close
set conn=nothing
%>
