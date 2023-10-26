<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Create New Post</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="bootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>

<body>
<div class="container">
	<!-- #include file="nav.asp" -->
	<div class="page-header">
		<h1>Create new post</h1>
	</div>
	<div class="row">
		<form class="form-horizontal" action="submit_post.asp" method="post">
			<div class="control-group">
				<label class="control-label" for="poster">Your name:</label>
				<div class="controls">
					<input type="text" id="poster" name="poster" placeholder="John Doe" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="title">Post title:</label>
				<div class="controls">
					<input type="text" id="title" name="title" placeholder="My Awesome Post!" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="content">Post content:</label>
				<div class="controls">
					<textarea rows="10" id="content" name="content"></textarea>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<button type="submit" class="btn btn-success">Post</button>
				</div>
			</div>
		</form>
	</div>
</div>
</body>
</html>
