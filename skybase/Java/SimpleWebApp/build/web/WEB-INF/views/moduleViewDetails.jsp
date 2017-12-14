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
        
        <h3 style="margin-left: 25px; font-family: Helvetica; text-decoration: underline;">Module Oversikt</h3>
        <c:forEach items="${moduleList}" var="moduleList">
        <table style="border-collapse: collapse; margin: 25px 0px 0px 25px;" class="opprettStudent" border="0">
            <tr>
                <tr>
                    <th colspan="2">Module ${moduleList.module_id} - ${moduleList.module_name}</th>
                </tr>
                <tr>
                    <td style="vertical-align: top; text-align: left;">Delivery Date</td>
                    <td style="vertical-align: top; text-align: left; width: 450px; height: 140px;">${moduleList.delivery_date}</td>
                </tr>
                <tr>
                    <td style="vertical-align: top; text-align: left;">Description</td>
                    <td><textarea readonly style="width: 450px; height: 140px;" type="text" name="description">${moduleList.description}</textarea></td>
                </tr>
                <tr>
                    <td style="vertical-align: top; text-align: left;">Learning Goals</td>
                    <td><textarea readonly="" style="width: 450px; height: 140px;" type="text" name="learningGoals">${moduleList.learningGoals}</textarea></td>
                </tr>
                <tr>
                    <td style="vertical-align: top; text-align: left;">Resources</td>
                    <td><textarea readonly style="width: 450px; height: 140px;" type="text" name="resources">${moduleList.resources}</textarea></td>
        </c:forEach>
        </table>
        <p></p>
        
                            <p style="color: red;">${errorString}</p>
    
    <form method="POST" action="${pageContext.request.contextPath}/modul1">
       <table border="0">
                
               <table style="border-collapse: collapse; margin: 25px 0px 0px 25px;" class="opprettStudent" border="0">
                 <tr>
                    <th colspan="2">Skriftlig Tilbakemelding</th>
                 </tr>
                     <tr>
                       <td>Hvem vurderer du?</td>                      
                     <td><input type="text" name="user_account_id" value="${feedback.user_account_id}" /></td>
                   </tr>
                                      <tr>

                       <td>Er modulen godkjent?</td>                      
                     <td><input type="text" name="status" value="${feedback.status}" /></td>
                   </tr>
               
                   <tr>
                       <td>Hvor mange poeng vil du gi</td>                      
                    <td><input type="text" name="score" value="${feedback.score}" /></td>
                   </tr>
                   
                   <tr>
                       <td>Åpen kommentar</td>
                       <td><input type="text" name="commentOpen" value="${feedback.commentOpen}" /></td>
                     
                   </tr>
                   
                     <tr>
                       <td>Skjult kommentar</td>
                       <td><input type="text" name="commentHidden" value="${feedback.commentHidden}" /></td>
                     
                   </tr>
                   
                        <tr>
                       <td>Module no.</td>
                       <td><input type="text" name="module_id" value="${feedback.module_id}" /></td>
                     
                   </tr>
                          <td colspan="2">                  
                 <input type="submit" value="submit" />
                 <button style="margin-left: 25px;"><a href="moduleList">Cancel</a></button>     
        </table>         
    </body>
</html>
