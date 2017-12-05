package Blog;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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

    // public static void displayPosts() throws ClassNotFoundException, SQLException {
    //  String blogginnlegg = null;
    // Class.forName("com.mysql.jdbc.Driver");
    //Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/3306/Skybase"
    //         + "user=root&password=root");
    // PreparedStatement pstm = conn.prepareStatement("SELECT * FROM Log LIMIT 100;");
    //ResultSet rs = pstm.executeQuery();
    //if (rs.next()) {
    //     blogginnlegg = rs.getString("fName") + "" + rs.getString("lName");
    // }
    // System.out.println(blogginnlegg);
    // }
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 // PrintWriter out = response.getWriter();        
                //     String name=request.getParameter("uname");                          
                //    try{
                //          Class.forName("com.mysql.jdbc.Driver");
                //         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/3306/Skybase","root","root");               
                //         PreparedStatement pstm = conn.prepareStatement("SELECT * FROM Log LIMIT 100;");
                //        pstm.setString(1,name);                   
                //       out.print("<table width=25% border=1>");
                //       out.print("<center><h1>Result:</h1></center>");
                //      ResultSet rs = pstm.executeQuery();                
                //     /* Printing column names */
                //    ResultSetMetaData rsmd=rs.getMetaData();
                //    while(rs.next())
                //       {
                //    out.print("<tr>");
                //   out.print("<td>"+rsmd.getColumnName(1)+"</td>");
                //     out.print("<td>"+rs.getString(1)+"</td></tr>");
                //     out.print("<tr><td>"+rsmd.getColumnName(2)+"</td>");
                //    out.print("<td>"+rs.getString(2)+"</td></tr>");
                //   out.print("<tr><td>"+rsmd.getColumnName(3)+"</td>");
                //  out.print("<td>"+rs.getString(3)+"</td></tr>");
                //  out.print("<tr><td>"+rsmd.getColumnName(4)+"</td>");
                //  out.print("<td>"+rs.getString(4)+"</td></tr>");                  
                //  }
                //  out.print("</table>");
                // }catch (Exception e2)
                //   {
                //      e2.printStackTrace();
                //  }
                //  finally{out.close();
                //   }
   

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
/**
 * Handles the HTTP <code>POST</code> method.
 *
 * @param request servlet request
 * @param response servlet response
 * @throws ServletException if a servlet-specific error occurs
 * @throws IOException if an I/O error occurs
 */
@Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher dispatcher;
        dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/BlogListView.jsp");

        dispatcher.forward(request, response);
    }

}
