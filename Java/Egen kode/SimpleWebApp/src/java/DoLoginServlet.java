/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author mathi
 */

@WebServlet(urlPatterns = {"/doLogin"})
public class DoLoginServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    
    public DoLoginServlet(){
        super();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String rememberMeStr = request.getParameter("rememberMe");
        boolean remember = "Y".equals(rememberMeStr);
        
        UserAccount user = null;
        boolean hasError = false;
        String errorString = null;
        
        if(userName == null || password == null || userName.length() == 0 || password.length() == 0){
            hasError = true;
            errorString = "Trenger brukernavn og passord";
            
        }
        else{
            Connection conn = MyUtils.getStoredConnection(request);
            try{
                user = DBUtils.findUser(conn, userName, password);
                
                if(user == null){
                    hasError = true;
                    errorString = "Brukernavn eller passord er ikke riktig";
                }
                
            }
            catch(SQLException e){
                hasError = true;
                errorString = e.getMessage();
            }
        }
        
        if(hasError){
            user = new UserAccount();
            user.setUserName(userName);
            user.setPassword(password);
            
            request.setAttribute("errorString", errorString);
            request.setAttribute("user", user);
            
            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/loginView.jsp");
            
            dispatcher.forward(request, response);
        }
        else{
            HttpSession session = request.getSession();
            MyUtils.storeLoginedUser(session, user);
            
            if(remember){
                MyUtils.storeUserCookie(response, user);
            }
            else{
                MyUtils.deleteUserCookie(response);
            }
            response.sendRedirect(request.getContextPath() + "/userInfo");
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        doGet(request, response);
    }
    
}