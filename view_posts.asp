<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Viewing Posts</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="bootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<!-- #include file="common.asp" -->
</head>

<body>
<div class="container">
	<!-- #include file="nav.asp" -->
	<div class="page-header">
		<h1>Viewing posts</h1>
	</div>
	
	<%
	Dim PostCount, CurrentPage, TotalPosts
	PostCount = Request.QueryString("n")
	CurrentPage = Request.QueryString("p")
	
	If PostCount = "" Then
		PostCount = 10
	End If
	If CurrentPage = "" Then
		CurrentPage = 1
	End If
	
	TotalPosts = RenderPosts(PostCount, CurrentPage * PostCount - 1)
	%>
	
	<div class="pagination pagination-centered">
		<ul>
			<%
			Dim TotalPages
			TotalPages = Ceil(TotalPosts / PostCount)
			'TotalPages = 10 ' Uncomment for testing with few data
			
			Dim PageHTML
			PageHTML = ""
			
			' Draw left arrow
			If CurrentPage = 1 Then
				PageHTML = PageHTML & "<li class='disabled'><a>&laquo;</a></li>"
			Else
				PageHTML = PageHTML & "<li><a href='?p=" & CurrentPage - 1 & "&n=" & PostCount & "'>&laquo;</a></li>"
			End If
			
			' Draw numbers
			For i = CurrentPage - 2 To CurrentPage + 2: Do
				If i < 1 Or i > TotalPages Then
					Exit Do ' Continue Next
				ElseIf i = Int(CurrentPage) Then
					PageHTML = PageHTML & "<li class='active'><a>" & i & "</a></li>"
				Else
					PageHTML = PageHTML & "<li><a href='?p=" & i & "&n=" & PostCount & "'>" & i & "</a></li>"
				End If
			Loop While False: Next
			
			' Draw right arrow
			If Int(CurrentPage) = Int(TotalPages) Then
				PageHTML = PageHTML & "<li class='disabled'><a>&raquo;</a></li>"
			Else
				PageHTML = PageHTML & "<li><a href='?p=" & CurrentPage + 1 & "&n=" & PostCount & "'>&raquo;</a></li>"
			End If
			
			Response.Write PageHTML
			%>
		</ul>
	</div>
	<div class="row text-center">
		<form class="form-inline">
			<input type="hidden" id="current-page" name="p" value="<%=CurrentPage%>" />
			<label for="post-count">Posts to show:</label>
			<div class="input-append">
				<select class="input-mini" id="post-count" name="n">
					<option>10</option>
					<option>25</option>
					<option>50</option>
				</select>
				<button type="submit" class="btn">Apply</button>
			</div>
		</form>
	</div>
</div>
</body>
</html>
