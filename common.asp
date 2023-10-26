<%
' Ceil() returns the ceiling because Michaelsoft couldn't be bothered to do it themselves
Function Ceil(n)
	Ceil = -Int(-n)
End Function

' Floor() is just an alias for Int()
Function Floor(n)
	Floor = Int(n)
End Function

' RenderPosts() renders posts in reverse-chronological order, based on a quantity
' and a starting position passed to it.
' Function returns the total number of posts that exist in the database,
' because I'm too lazy to write another database call for that specifically.
Function RenderPosts(PostCount, StartPost)
	Const adUseClient = 3
	Const adOpenStatic = 3
	Dim DataArray, TotalPosts

	' Open Access DB
	Set Conn = Server.CreateObject("ADODB.Connection")
	Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
	Conn.Open Server.MapPath("db/db_messageboard.mdb")
	
	' Open the table
	Set Rs = CreateObject("ADODB.Recordset")
	
	With Rs
		.CursorLocation = adUseClient
		.CursorType = adOpenStatic
		.Open "posts", Conn

		If .RecordCount = 0 Then
			Response.Write "No posts yet!"
			Response.End
		End If
		
		.MoveLast
		If StartPost < 0 Then ' Technically this isn't necessary, as zero will already do this, but this makes it explicit
			.MoveLast
		ElseIf .AbsolutePosition - StartPost < 1 Then
			.MoveFirst
		Else
			.AbsolutePosition = .AbsolutePosition - StartPost ' Backtrack to starting position
		End If
		
		If StartPost > .RecordCount Then
			DataArray = .GetRows(.RecordCount Mod PostCount)
		Else
			DataArray = .GetRows(PostCount)
		End If
		RenderPosts = .RecordCount ' Return value
	End With
	
	For i = UBound(DataArray, 2) To LBound(DataArray, 2) Step -1
		Dim PostID, PostDate, PostPoster, PostTitle, PostContent
		PostID = DataArray(0,i)
		PostDate = DataArray(1,i)
		PostPoster = Server.HTMLEncode(DataArray(2,i))
		PostTitle = Server.HTMLEncode(DataArray(3,i))
		PostContent = Server.HTMLEncode(DataArray(4,i))
		
		' Poster name is optional, so make sure to put something there
		If PostPoster = "" Then
			PostPoster = "Anonymous"
		End If
		
		Dim PostHTML
		PostHTML = "<div class='row'>"
		PostHTML = PostHTML & "<h2>" & PostTitle & "</h2>"
		PostHTML = PostHTML & "<p><small>Post ID " & PostID & " posted by " & PostPoster & ", " & PostDate & "</small></p>"
		PostHTML = PostHTML & "<p>" & PostContent & "</p>"
		PostHTML = PostHTML & "</div>"
		
		Response.Write PostHTML
	Next
	
	Conn.Close
	Set Conn = Nothing
End Function
%>