<%-- 
    Document   : uploadToDB
    Created on : 09.des.2017, 01:03:20
    Author     : mathi
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<title>Upload files</title>
</head>
<body>
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu2.jsp"></jsp:include>
    <div style="padding:5px; color:red;font-style:italic;">
       ${errorMessage}
    </div>
    
    <h2>Upload Files</h2>
 
    <form method="post" action="${pageContext.request.contextPath}/uploadToDB"
        enctype="multipart/form-data">
        
        Select file to upload:
        <br />
        <input type="file" name="file"  />
        <br />
        <input type="file" name="file" />
        <br />
        Description:
        <br />
        <textarea rows="5" cols="50" name="description"></textarea>
        <br />
        <br />
        <input type="submit" value="Upload" />
        <a href="${pageContext.request.contextPath}/userInfo2">Tilbake</a>
    </form>
    
</body>
</html>