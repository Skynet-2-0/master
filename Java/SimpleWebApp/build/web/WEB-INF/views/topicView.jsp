<%-- 
    Document   : topicViews
    Created on : 13.nov.2017, 16:42:37
    Author     : ellak
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Student-forum</title>
     
    </head>
    
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu2.jsp"></jsp:include>
    <body>
        
        <h1>New topic</h1>
        
    
     <form id="new_topic" name="new_topic" method="post" action="">
        <table width="500" border="0" align="center" cellpadding="0" cellspacing="1"
               bgcolor="#000000">
            <tr>
                <td>
                    <table width="100%" border="0" cellpadding="3" cellspacing="1"
                        bgcolor="#FFFFFF">
                        <tr>
                            <td colspan="3" bgcolor="000000"><b style="color: #FFFFFF;">Skriv innlegg</b> </td>
                        </tr>
                        
                        <tr>
                            <td style="text-align: right;"><strong>Navn</strong></td>
                            <td><input name="name" type="text" id="name" size="50" /></td>
                        </tr>
                        
                        <tr>
                            <td valign="top" style="text-align: right;"><strong>Details</strong></td>
                            <td><textarea name="detail" cols="50" rows="5" id="detail"></textarea></td>
                        </tr>
                        <tr>
                            <td style="text-align: right;"><strong>E-mail</strong></td>
                            <td><input name="email" type="text" id="email" size="50" /></td>
                            
                        </tr>
                        
                        <tr>
                            <td>&nbsp;</td>
                            <td><input type="submit" name="Sumit" value="Lagre innlegg" />
                                <input type="reset" name="Submit" value="Slett innlegg" /></td>
                        </tr>
                        
                    </table>
                    </form>
            </body>
</html>
