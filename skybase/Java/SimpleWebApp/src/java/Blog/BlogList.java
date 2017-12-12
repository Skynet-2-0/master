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
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author evakristine
 */
@WebServlet(urlPatterns = {"/BlogListView"})
public class BlogList extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public BlogList() {
        super();
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Connection conn = MyUtils.getStoredConnection(request);
        String errorString = null;
        List<BlogBlog> list = null;
        try {
            list = DBUtils.queryBlogList(conn);
        } catch (SQLException e) {
            e.printStackTrace();
            errorString = e.getMessage();
        }
        request.setAttribute("errorString", errorString);
        request.setAttribute("BlogList", list);
        RequestDispatcher dispatcher;
        dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/BlogListView.jsp");
        dispatcher.forward(request, response);

    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher dispatcher;
        dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/BlogListView.jsp");

        dispatcher.forward(request, response);
    }

}