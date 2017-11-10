<%-- 
    Document   : uploader
    Created on : Nov 1, 2017, 8:20:32 PM
    Author     : Mr.Schibbye
--%>

<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.DataInputStream"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>File Uploading using Java</title>
</head>
<body>
    </h1>Uploading Files</h1>
        <form name="UploadForm" action="uploader.jsp" method="POST" enctype="multipart/form-data">
        
        <input type="file" name="file" value="" width="100"/>
        <input type="submit" value="Submit" name="submit" />
</form>
</body>
</html>
