<%-- 
    Document   : BlogPost
    Created on : 24.okt.2017, 12:21:34
    Author     : evakristine
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blog post</title>
        <style>
            input#box {
                width: 740px;
                height: 300px;
                padding:10px;
                
            }
        </style>
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>

    </head>
    <body>
        <h1>Blog post:</h1>
        
        <form 
            
            action = "BlogPost" method= "post" 
            <input type="hidden" id="box" name="box"/>
        </form>      
    <summary>hey</summary>
    
    </body>
</html>
