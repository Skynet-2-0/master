<%-- 
    Document   : moduleViewDetails
    Created on : 12.des.2017, 11:42:52
    Author     : jonas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Module Details</title>
        <link href="Main.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <jsp:include page="_header.jsp"></jsp:include>
        <jsp:include page="_menu.jsp"></jsp:include>
        
        <h3>Module Oversikt</h3>
        <c:forEach items="${moduleList}" var="moduleList">
        <table style="border-collapse: collapse; margin: 25px 0px 0px 25px;" class="opprettStudent" border="0">
            <tr>
                <tr>
                    <th colspan="2">Module ${moduleList.module_id} - ${moduleList.module_name}</th>
                </tr>
                <tr>
                    <td>Delivery Date</td>
                    <td>${moduleList.delivery_date}</td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td>${moduleList.description}</td>
                </tr>
                <tr>
                    <td>Learning Goals</td>
                    <td>${moduleList.learningGoals}</td>
                </tr>
                <tr>
                    <td>Resources</td>
                    <td>${moduleList.resources}</td>
        </c:forEach>
        </table>
    </body>
</html>
