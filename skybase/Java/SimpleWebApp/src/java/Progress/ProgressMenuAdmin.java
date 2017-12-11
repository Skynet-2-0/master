/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.

package Progress;

import Connection.DBUtils;
import Connection.MyUtils;
import Users.UserAccount;
import Feedback.Feedback;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


 * @author Brage
 
@WebServlet(urlPatterns = {"/progressMenuAdmin"})
public class ProgressMenuAdmin extends HttpServlet{
    
    private static final long serialVersionUID = 1L;
    
    public ProgressMenuAdmin(){
        super();
    }


  @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
           //sjekker om bruker er logget på
        HttpSession session = request.getSession();
        
        Connection conn = MyUtils.getStoredConnection(request);
        
         UserAccount loginedUser = MyUtils.getLoginedUser(session);
        
        
      
        String errorString = null;
        List<Feedback> list = null;
        UserAccount user_account= null;
        Map<UserAccount,List<Feedback>> map = null;
        
        
        
    
        
           try{
            map = DBUtils.queryAllFeedback(conn);
        }
           
             catch(SQLException e){
            e.printStackTrace();
            errorString = e.getMessage();
        }
        
        if(loginedUser == null){
            //redirect
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
         //lagre info i request attributes
        request.setAttribute("user", loginedUser);
        request.setAttribute("errorString", errorString);
        request.setAttribute("list", list);
        request.setAttribute("user_account", user_account);
        request.setAttribute("map", map);
        
        
        
     
       // System.out.println(loginedUserID.getUser_account_id() + "heeeeeeey");
       //String user_account_id = (String) request.getParameter("user_account_id");
      
    
  
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/progressmenuadminview.jsp");
        
        dispatcher.forward(request, response);
    }
    
    

        
        
      
      

    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        doGet(request, response);
    }
    
}

*/