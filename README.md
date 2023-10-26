# Useless-Message-Board  
A very simple insecure message board written in ASP and Bootstrap 2, using an Access 2000 database.  
Made with love(?) in Macromedia Dreamweaver 8 and tested on IIS 5.1.  
And yes, all done in 2023.  

## How do I host this?  
You'll need a version of Microsoft IIS running on Windows. Sorry, but that's the curse of ASP.  
Additionally, you'll need to be able to run 32-bit worker processes on that IIS server. On a 32-bit version of Windows, this will obviously work fine anyway, but on 64-bit Windows, you'll have to change a setting somewhere in the application pool.  
After that, clone the repository to a folder in your IIS server, make sure the database file (`db/db_messageboard.mdb`) is writable for the IIS guest user account, and you'll be off to the races.  

## What the heck even is this?  
It's exactly as the description says.  
I made it for "fun" over the course of a couple of days, teaching myself ASP/VBS on the fly to get it done. It serves absolutely zero purpose except my own amusement.  
Partially, I just wanted an excuse to make something with an old PC and old software, and partially, I wanted to try something new.  

## Why ASP?  
Because I hadn't used it before, and also because nobody else uses it anymore. I now understand why.  
Enjoy the most cursed block of code I've ever written to accomplish an exceedingly simple task:  
```vb
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
```
What do you even mean, `do while false`? Never again.  

## Why Access?
It was the easiest and simplest way to implement a database, especially from the old Windows XP PC I exclusively used while developing this.  

## Why Bootstrap *2*?  
Again, because of the old PC. It was too slow to run a modern web browser, so I needed something that at least semi-functioned in Internet Explorer 8.  

## What even are these PC specs bruh???  
Asus P4R800 motherboard  
2.8 GHz Northwood Pentium 4 (Socket 478)  
512 MB of DDR1-333  
Nvidia GeForce FX 5600 Ultra, 128 MB  
80 GB IDE hard drive  
Windows XP Professional, Service Pack 3. 32-bit, of course.
