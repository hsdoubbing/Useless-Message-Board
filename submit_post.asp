<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Submitting Post</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="bootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>

<body>
<div class="container">
	<!-- #include file="nav.asp" -->
	<div class="page-header">
		<h1>Submitting post</h1>
	</div>
	<%
	Const adDate = 7
	Const adVarWChar = 202
	Const adLongVarWChar = 203
	Const adCmdText= 1
	Const adParamInput = 1
	
	Dim PostPoster, PostTitle, PostContent, IsInvalid
	PostPoster = Request.Form("poster")
	PostTitle = Request.Form("title")
	PostContent = Request.Form("content")
	IsInvalid = False
	
	' Validity checks
	If PostTitle = "" Then
		Response.Write("<div class='alert alert-error'><strong>Error:</strong> Post title is required.</div>")
		IsInvalid = True
	End If
	If PostContent = "" Then
		Response.Write("<div class='alert alert-error'><strong>Error:</strong> Post content is required.</div>")
		IsInvalid = True
	End If
	
	' Give user a back button if invalid
	If IsInvalid Then 
		Response.Write("<button onclick='history.back()' class='btn btn-danger'>Back</button>")
		Response.End()
	End If
	
	' Open Access DB
	Set conn = Server.CreateObject("ADODB.Connection")
	conn.Provider = "Microsoft.Jet.OLEDB.4.0"
	conn.Open Server.MapPath("db/db_messageboard.mdb")
	
	' Use a prepared statement to prevent injection
	Set cmd = Server.CreateObject("ADODB.Command")
	
	With cmd
		.ActiveConnection = conn
		.CommandType = adCmdText
		.CommandText = "INSERT INTO posts (PostDate, Poster, Title, Content) VALUES (@PostDate, @Poster, @Title, @Content)"
		'.CommandText = "INSERT INTO posts (Poster, Title, Content) VALUES (@Poster, @Title, @Content)"
		
		.Parameters.Append .CreateParameter("PostDate", adDate, adParamInput, , Now())
		.Parameters.Append .CreateParameter("Poster", adVarWChar, adParamInput, 255, PostPoster)
		.Parameters.Append .CreateParameter("Title", adVarWChar, adParamInput, 255, PostTitle)
		.Parameters.Append .CreateParameter("Content", adLongVarWChar, adParamInput, -1, PostContent)
		
		.Execute
	End With
	
	conn.Close
	Set conn = Nothing
	
	Response.Write("<div class='alert alert-success'>Post <strong>" & Title & "</strong> created successfully.</div>")
	Response.Write("<a class='btn btn-success' href='./'>Return home</a>")
	%>
</div>
</body>
</html>
