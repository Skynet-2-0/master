<%-- 
    Document   : is100View
    Created on : 26.okt.2017, 10:02:14
    Author     : ellak
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Forum</title>
         <style>
            
            
            table {
                border: 1px solid black;
                border-collapse: collapse;
                
                width: 100% 
                
                
                
            }
            
            table, th, td {
                color: #000;
           
            }
            
            table a hover {
                color: #B40E1F;
                text-align: left;
                
            }   
            
            th{
                background-color: #B40E1F;
                color: #F0F0F0;
                padding: 5px;
              
            }
            
            .leftpart {
                width: 60%;
            }
            
            .rightpart {
                width: 40%;
            }
     
       
        </style>
    </head>
    <body>
        
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu2.jsp"></jsp:include>

    
        <h3>IS-100 forums</h3>
        
        <table border ="1">
            <th>QuestionID</th>
            <th>Name</th>
            </tr>
            <td> <a href="${pageContext.request.contextPath}/IS-100">IS-100-1</a> <p></p> Introduksjon til informasjonssystemer</td>
            <td>No topic</td>
            
            <tr>
                <td> <a href="${pageContext.request.contextPath}/IS-104">IS-104-1</a> <p></p> Brukergrensesnitt</td>
                <td>No topic</td>
            </tr>
            
            <tr>
                <td> <a href="${pageContext.request.contextPath}/IS-109">IS-109-1</a> <p></p> Objektorientert programmering 1 </td>
                <td>No topic</td>
            </tr>
            
            <tr>
                <td> <a href="${pageContext.request.contextPath}/IS-111">IS-111-1 </a> <p></p> Introduksjon til systemutviklingsprosjekter </td>
                <td>No topic</td>
            </tr>
        </table>
            
       
    </body>
</html>
