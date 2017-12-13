/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Blog;

import Connection.DBUtils;
import Connection.MyUtils;
import java.io.IOException;
import java.io.PrintWriter;
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
 * @author Ann Margrethe
 */
@WebServlet(name = "deleteBlog", urlPatterns = {"/deleteBlog"})
public class deleteBlog extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>delete blog post</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>delete post " + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Connection conn = MyUtils.getStoredConnection(request);
        
        String Log_ID = (String) request.getParameter("Log_ID");
        
        String errorString = null;
        
        try{
            DBUtils.deleteBlog(conn, Integer.parseInt(Log_ID));
        }
        catch(SQLException e){
            e.printStackTrace();
            errorString = e.getMessage();
        }
        
        if(errorString != null){
            request.setAttribute("errorString", errorString);
            
            RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/views/deleteBlog.jsp");
            dispatcher.forward(request, response);
        }
        else{
            response.sendRedirect(request.getContextPath() + "/BlogListView");
        }
    }
    
    }
