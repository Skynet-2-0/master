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
        Integer id = (Integer) Integer.parseInt(request.getParameter("id"));
        
        Students students = null;
        
        String errorString = null;
        
        try{
            students = DBUtils.findStudents(conn, id);
        }
        catch(SQLException e){
            e.printStackTrace();
            errorString = e.getMessage();
        }
        
        if(errorString != null && students == null){
            response.sendRedirect(request.getServletPath() + "/studentList");
            return;
        }
        
        request.setAttribute("errorString", errorString);
        request.setAttribute("students", students);
        
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/views/editStudentView.jsp");
        dispatcher.forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Connection conn = MyUtils.getStoredConnection(request);
        
        Integer id = (Integer) Integer.parseInt(request.getParameter("id"));
        String name = (String) request.getParameter("name");
        String email = (String) request.getParameter("email");
        
        
        
        
        Students students = new Students(id, name, email);
        
        String errorString = null;
        
        try{
            DBUtils.updateStudents(conn, students);
        }
        catch(SQLException e){
            e.printStackTrace();
            errorString = e.getMessage();
        }
        
        request.setAttribute("errorString", errorString);
        request.setAttribute("students", students);
        
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
