package LoginLogout;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Users.UserAccount;
import LoginLogout.LoginDao;
import Connection.MyUtils;
import Connection.DBUtils;
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

@WebServlet(urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet{
    
    private static final long serialVersionUID = 1L;
    
    public LoginServlet(){
        super();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/loginView.jsp");
        
        dispatcher.forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");  
        UserAccount userA = new UserAccount();
        userA.setUserName(userName);
        userA.setPassword(password);
        LoginDao loginDao = new LoginDao();
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
                e.printStackTrace();
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
            
            try{
            String userValidate = loginDao.authenticateUser(userA);
                if(userValidate.equals("Admin_Role")){
                    System.out.println("Admin's Home");
                    session = request.getSession(); //Creating a session
                    session.setAttribute("user", userName); //setting session attribute
                    request.setAttribute("userName", userName);
                    request.getRequestDispatcher("/WEB-INF/views/userInfoView.jsp").forward(request, response);
                }
                else if(userValidate.equals("User_Role")){
                    System.out.println("User's Home");
                    session = request.getSession();
                    session.setMaxInactiveInterval(10*60);
                    session.setAttribute("user", userName);
                    request.setAttribute("userName", userName);
                    request.getRequestDispatcher("/WEB-INF/studentViews/newjsp.jsp").forward(request, response);
                    }
            }
            catch (IOException e1){
                    e1.printStackTrace();
            }
            catch (Exception e2){
                e2.printStackTrace();
            }
            response.sendRedirect(request.getContextPath() + "/userInfo");
        }
    }
        
        //doGet(request, response);
}