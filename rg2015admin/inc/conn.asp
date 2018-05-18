<%
set conn=server.createobject("adodb.connection")
conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&server.mappath("date/file.mdb")

Function writeuser(id)
     sql_wr="select * from [User] where id="&id
    set rs_wr=Server.CreateObject("Adodb.RecordSet")
	rs_wr.open sql_wr,conn,1,1
	response.write rs_wr("username")
	rs_wr.close
end Function 

Function writecompany(id)
     sql_wr="select * from [company] where id="&id
    set rs_wr=Server.CreateObject("Adodb.RecordSet")
	rs_wr.open sql_wr,conn,1,1
	response.write rs_wr("company")
	rs_wr.close
end Function 

Function companyqx(id)
     sql_wr="select * from [company] where id="&id
    set rs_wr=Server.CreateObject("Adodb.RecordSet")
	rs_wr.open sql_wr,conn,1,1
	response.write rs_wr("userid")
	rs_wr.close
end Function 

function durlck(url) 
domext="com|net|org|cn|co.kr|com.cn|net.cn|cc|asia|com.us|co.uk" 
durlck="" : url=lcase(url) 
if url="" or len(url)=0 then exit function 
url=replace(replace(url,"http://",""),"https://","") 
s1=instr(url,":")-1 '过滤掉端口 
if s1 < 0 then s1=instr(url,"/")-1 '过滤掉/后面的字符  
if s1 > 0 then url=left(url,s1) 
Set re = new RegExp 
re.IgnoreCase = True : re.global = True 
re.Pattern = "([a-z0-9-]){1,63}\.(" & domext & ")(\:\d+)?$" 
Set Matches = re.Execute(url)  
durlck = Matches(0) 
set re=nothing 
end function

Function htmlspecialchars(str)
	str = Replace(str, "&", "&amp;")
	str = Replace(str, "<", "&lt;")
	str = Replace(str, ">", "&gt;")
	str = Replace(str, """", "&quot;")
	htmlspecialchars = str
End Function
'****************************** 
'函数：checkexp(patrn,strng) 
'参数：patrn 表达式；strng 验证字符串 
'作者：阿里西西 
'日期：2007/7/13 
'描述：验证输入网址是否合法的URL 
'示例：<%=checkexp(patrn,strng) 
'****************************** 
function checkexp(patrn,strng) 
dim regex,match 
set regex = new regexp ' 建立表达式。 
regex.pattern = patrn ' 设置模式。 
regex.ignorecase = true ' 设置是否区分字符大小写。 
regex.global = true ' 设置全局可用性。 
matches = regex.test(strng) 
checkexp = matches 
end function 

%>