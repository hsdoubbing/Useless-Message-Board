<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Useless Message Board</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="bootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<!-- #include file="common.asp" -->
</head>

<body>
<div class="container">
	<!-- #include file="nav.asp" -->
	<div class="page-header">
		<h1>Useless message board <small>in classic ASP</small></h1>
	</div>
	<div class="row">
		<p>Please choose an option below:</p>
		<a class="btn btn-primary" href="create_post.asp">Create a post</a>
		<a class="btn" href="view_posts.asp">View all posts</a>
	</div>
	<div class="row">
		<h3>Most recent post:</h3>
		<% RenderPosts 1, -1 %>
	</div>
</div>
</body>
</html>
