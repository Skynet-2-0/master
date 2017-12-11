<<%-- 
    Document   : loginView
    Created on : 17.sep.2017, 20:31:44
    Author     : mathi
--%>
    
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Login</title>
        <link href="Forside.css" rel="stylesheet" type="text/css">   
    </head>   
    <body>
        <%--<jsp:include page="_header.jsp"></jsp:include>
         <jsp:include page="_menu.jsp"></jsp:include> --%>

<div class="login-page">
    <div class="form">
        <p style="color: red;">${errorString}</p>
        <h3 class="loginheader">SKYNET LOGIN</h3>
        <form method="POST" action="${pageContext.request.contextPath}/login">
        <table>
            <input type="text" name="userName" placeholder="username" value= "${user.userName}" /> 
            <input type="password" name="password" placeholder="password" value="${user.password}" size="20" />
            <tr>
                <th><button class="showPass" type="button" id="eye" onclick="if(password.type=='text')password.type='password';
                else password.type='text';"> Show Password
                </button></th>
                <th>&emsp;Remember me</th>
                <th><input type="checkbox" name="rememberMe" value= "Y" style="-webkit-appearance: none;" /></th>
            </tr>
        </table>
            <%--<label for="chechbox">Remember me</label>
<input style="position: relative; bottom: 20px" id="checkbox" type="checkbox" name="rememberMe" value= "Y">--%>
            
            <button type="submit" value= "Login" class="btn1 "/>Login</button>           
        </form>
    </div>
</div>
                 
    <center><p style="color:pink;">User Name: tom<br> password: tom001 <br> or mette/mette001</p></center>
            <%--
   <jsp:include page="_footer.jsp"></jsp:include>
            --%>     
    </body>
</html>
