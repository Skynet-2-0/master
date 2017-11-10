<%-- 
    Document   : fileView
    Created on : Oct 31, 2017, 7:19:56 PM
    Author     : Mr.Schibbye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.io.*" %>"
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action="upload" method="post" enctype= "multipart/form-data">
        <input type="file" name="Upload" value="" width="200" />
        <input type="submit" value="Submit" name="submit" />
        </form>
    </body>
</html>
