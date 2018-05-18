<%dim userexit
	userexit=request.QueryString("userexit")

'	if request.cookies("IsAdmin")<>true then response.redirect "index.asp"
	'if request.cookies("IsAdmin")="" then response.redirect "index.asp"
	if request.cookies("adminname")="" then response.redirect "login.asp"
	

if userexit="ok" then

     response.cookies("IsAdmin")="" 
	 response.cookies("adminname")=""
	response.cookies("UserID")=""
		response.cookies("Grade")=""
		response.cookies("qx1")=""
		response.cookies("qx2")=""
response.cookies("qx3")=""
response.cookies("qx4")=""
response.cookies("qx5")=""
response.cookies("qx6")=""
	 response.redirect("login.asp")
end if
	%>
