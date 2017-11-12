/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Users.UserAccount;
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

/**
 *
 * @author mathi
 */

@WebServlet(urlPatterns = {"/editStudents"})
public class EditStudentServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
 
    public EditStudentServlet() {
        super();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        Connection conn = MyUtils.getStoredConnection(request);
        
        //String id = (String) request.getParameter("id");
        Integer user_account_id = (Integer) Integer.parseInt(request.getParameter("user_account_id"));
        
        UserAccount useraccount = null;
        
        String errorString = null;
        
        try{
            useraccount = DBUtils.findStudents(conn, user_account_id);
        }
        catch(SQLException e){
            e.printStackTrace();
            errorString = e.getMessage();
        }
        
        if(errorString != null && useraccount == null){
            response.sendRedirect(request.getServletPath() + "/studentList");
            return;
        }
        
        request.setAttribute("errorString", errorString);
        request.setAttribute("useraccount", useraccount);
        
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/views/editStudentView.jsp");
        dispatcher.forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Connection conn = MyUtils.getStoredConnection(request);
        
       Integer user_account_id = (Integer) Integer.parseInt(request.getParameter("user_account_id"));
       String username = (String) request.getParameter("username");
       String gender = (String) request.getParameter("gender");
       String name = (String) request.getParameter("name");
       String password = (String) request.getParameter("password");
       String email = (String) request.getParameter("email");
       String usertype = (String) request.getParameter("usertype");
        
        
        
        
        UserAccount useraccount = new UserAccount(user_account_id, username, gender, name, password, email, usertype);
        
        String errorString = null;
        
        try{
            DBUtils.updateStudents(conn, useraccount);
        }
        catch(SQLException e){
            e.printStackTrace();
            errorString = e.getMessage();
        }
        
        request.setAttribute("errorString", errorString);
        request.setAttribute("UserAccount", useraccount);
        
        if(errorString != null){
            RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/views/editStudentView.jsp");
            dispatcher.forward(request, response);
        }
        else{
            response.sendRedirect(request.getContextPath() + "/studentList");
        }

//doGet(request, response);
    }
    
}
