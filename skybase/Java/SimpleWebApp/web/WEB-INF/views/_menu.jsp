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
    .menu ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #171e21;
    box-shadow: 0px 3px 5px gray;
    }
    
    .menu li {
    float: left;
    }
    
    .menu li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
    }
    
    .menu li a:hover {
    background-color: #444444;
    }
    
    .logoutbutton {
        margin-left: 16.9cm;
        font-size: 18px;
        background-color: #355C7D
    }
    
</style>

<div class="menu">
    <ul>
        <li><a href="${pageContext.request.contextPath}/home">Home</a></li>  
        <li><a href="${pageContext.request.contextPath}/studentList">Student List</a></li>
        <li><a href="${pageContext.request.contextPath}/userInfo">My Account Info</a></li> 
        <%--<li class="menulogin"><a href="${pageContext.request.contextPath}/login">Login</a></li>--%>  
        <li><a href="${pageContext.request.contextPath}/moduleList">Modules</a></li>
        <li><a href="${pageContext.request.contextPath}/progressMenu">Progress</a></li>
        <li><a href="${pageContext.request.contextPath}/progressMenu">Blogg</a></li>
        <li><a href="${pageContext.request.contextPath}/progressMenu">Forum</a></li>
        <li><a href="${pageContext.request.contextPath}/progressMenu">Kalender</a></li>
        <li><a class="logoutbutton" href="logout.jsp"/>LOGOUT</a></li>

    </ul>
</div> 