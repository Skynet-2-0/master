/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Progress;

import Connection.DBUtils;
import Connection.MyUtils;
import Users.UserAccount;
import Feedback.Feedback;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Brage
 */
@WebServlet(urlPatterns = {"/progressMenu"})
public class ProgressMenu extends HttpServlet{
    
    private static final long serialVersionUID = 1L;
    
    public ProgressMenu(){
        super();
    }


  @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
           //sjekker om bruker er logget på
        HttpSession session = request.getSession();
        HttpSession session2 = request.getSession();
        
        Connection conn = MyUtils.getStoredConnection(request);
        UserAccount id = MyUtils.getLoginedUserID(session2);
      
         
        
        UserAccount loginedUser = MyUtils.getLoginedUser(session);
        UserAccount loginedUserID = MyUtils.getLoginedUserID(session2);
        //ikke logge inn
        if(loginedUser == null){
            //redirect
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
         //lagre info i request attributes
        request.setAttribute("user", loginedUser);
        request.setAttribute("id", loginedUserID);
    
       //String user_account_id = (String) request.getParameter("user_account_id");
      
        String errorString = null;
        List<Feedback> list = null;
        try{
            list = DBUtils.queryFeedback(conn, id);
        }
        catch(SQLException e){
            e.printStackTrace();
            errorString = e.getMessage();
        }
        
     
        request.setAttribute("errorString", errorString);
        request.setAttribute("feedbackList", list);
       
        
        
        
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/progressmenuview.jsp");
        
        dispatcher.forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        doGet(request, response);
    }
    
}
