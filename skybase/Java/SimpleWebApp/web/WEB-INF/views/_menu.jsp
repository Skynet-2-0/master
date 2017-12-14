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
        overflow: hidden;
        background-color: #333;
    }

    .menu a {
        float: left;
        display: block;
        color: white;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
    }
    
    .menu a:hover {
        background-color: darkgray;
        color: black;
        text-decoration: underline;
        -ms-transform: rotate(360deg);
        -webkit-transform: rotate(360deg);
    }
    
    .logoutbutton {
        background-color: #355C7D;
    }
    

</style>

<div class="menu">
    
    <a href="${pageContext.request.contextPath}/home">Home</a>
    <a href="${pageContext.request.contextPath}/studentList">Student List</a>
    <a href="${pageContext.request.contextPath}/userInfo">My Account Info</a> 
    <a href="${pageContext.request.contextPath}/moduleList">Modules</a>
    <a href="${pageContext.request.contextPath}/progressMenu">Progress</a>
    <a href="${pageContext.request.contextPath}/progressMenu">Blogg</a>
    <a href="${pageContext.request.contextPath}/progressMenu">Forum</a>
    <a href="${pageContext.request.contextPath}/progressMenu">Kalender</a>
    <a style="float:right" class="logoutbutton" href="logout.jsp"/>LOGOUT</a>

</div>
