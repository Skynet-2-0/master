<%-- 
    Document   : createCatView
    Created on : 26.okt.2017, 10:22:33
    Author     : ellak
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset=UTF-8">
        <title>Create a category</title>
    </head>
    <body>
        
        <jsp:include page="_header.jsp"></jsp:include>
        <jsp:include page="_menu2.jsp"></jsp:include>
        
        
        <h3>Create a category</h3>
        
        <form name="myForm" action="display,jsp" method="POST">
            <table border="0">
                
                <tr>
                    <td> Category name: </td>
                    <td><input type="text" name="name" value="" size="50" /> </td>
                <p></p>
                
                <td>Category description: </td>
                <td><input type="text" name="name" value="" size="80" /> </td>
                    
                </tr>
            </table>
            <input type="submit" value="Add category" name="submit" />
        </form>
     
    </body>
</html>
