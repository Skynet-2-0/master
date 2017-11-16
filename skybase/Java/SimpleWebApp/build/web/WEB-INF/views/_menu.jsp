<%-- 
    Document   : _menu
    Created on : 17.sep.2017, 01:43:36
    Author     : mathi
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
    
<style>  
    @font-face {
    font-family: "brandon";
    src: url(font/Brandon.otf);
    }
    
    .menu{
        font-family: brandon;
    }

    ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #171e21;
    }
    
    li {
    float: left;
    }
    
    li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
    }
    
    li a:hover {
    background-color: #111;
    }
    
    .logoutbutton {
        margin-left: 22.3cm;
        font-size: 18px;
        background-color: #355C7D
    }
    
    .logoutbutton:hover {
        background-color: #2C4D68; 
    }
</style>

<div class="menu">
    <ul class="nav">
        <li><a href="${pageContext.request.contextPath}/">Home</a></li>  
        <li><a href="${pageContext.request.contextPath}/studentList">Student List</a></li>
        <li><a href="${pageContext.request.contextPath}/userInfo">My Account Info</a></li> 
        <%--<li class="menulogin"><a href="${pageContext.request.contextPath}/login">Login</a></li>--%>  
        <li><a href="${pageContext.request.contextPath}/modules">Modules</a></li>
        <li><a class="logoutbutton" href="logout.jsp"/>LOGOUT</a></li>
    </ul>
</div>  
