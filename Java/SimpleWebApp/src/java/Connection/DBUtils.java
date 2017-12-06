package Connection;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Blog.BlogBlog;
import Users.Students;



import Users.UserAccount;
import Feedback.Feedback;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Mathias, Brage
 */
public class DBUtils {
    
    public static UserAccount findUser(Connection conn, String userName, String password)
            throws SQLException {
        String sql = "Select a.User_Name, a.Password, a.Gender from User_Account a"
                + " where a.User_Name = ? and a.password= ?";
        
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, userName);
        pstm.setString(2, password);
        ResultSet rs = pstm.executeQuery();
        
        if(rs.next()){
            String gender = rs.getString("Gender");
            UserAccount user = new UserAccount();
            user.setUserName(userName);
            user.setPassword(password);
            user.setGender(gender);
            return user;
        }
        return null;
    }
    public static int findUserID_byUsername(Connection conn, String userName) throws SQLException{
        String sql = "Select a.User_Account_ID "
                + " where a.User_Name = ?";
        
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, userName);
        
        ResultSet rs = pstm.executeQuery();
        
        if(rs.next()){
            return rs.getInt("User_Account_ID");
        }
        return -1;
    }
    public static UserAccount findUser(Connection conn, String userName)
            throws SQLException{
        String sql = "Select a.User_Name, a.Password, a.Gender from User_Account a"
                + " where a.User_Name = ?";
        
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, userName);
        
        ResultSet rs = pstm.executeQuery();
        
        if(rs.next()){
            String password = rs.getString("Password");
            String gender = rs.getString("Gender");
            UserAccount user = new UserAccount();
            user.setUserName(userName);
            user.setPassword(password);
            user.setGender(gender);
            return user;
        }
        return null;
    }
    

    
    public static List<UserAccount> queryUserAccount(Connection conn)

            throws SQLException{
        String sql = "Select a.User_Account_Id, a.User_Name, a.Gender, a.Name, a.Email, a.Usertype from User_Account a";
        
        PreparedStatement pstm = conn.prepareStatement(sql);
        
        ResultSet rs = pstm.executeQuery();
        List<UserAccount> list = new ArrayList<>();
        while(rs.next()){
            String user_account_id  = rs.getString("user_account_id");
            String username = rs.getString("user_name");
            String name = rs.getString("name");
            String gender = rs.getString("gender");
            String email = rs.getString("email");
            String usertype = rs.getString("usertype");
            
            
            UserAccount useraccount = new UserAccount();
            useraccount.setUser_account_id(user_account_id);
            useraccount.setUserName(username);
            useraccount.setName(name);
            useraccount.setGender(gender);
            useraccount.setEmail(email);
            useraccount.setUserType(usertype);
            list.add(useraccount);
        }
        return list;
    }
    
    public static UserAccount findStudents(Connection conn, String user_account_id)
            throws SQLException{
        
        String sql = "Select a.user_account_id, a.user_name, a.gender, a.name, a.password, a.email, a.usertype from User_Account a where a.user_account_Id=?";
        
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, user_account_id);
       
        
        ResultSet rs = pstm.executeQuery();
        
        while(rs.next()){
            String username = rs.getString("user_name");
            String gender = rs.getString("gender");
            String name = rs.getString("name");
            String password = rs.getString("password");
            String email = rs.getString("email");
            String usertype = rs.getString("UserType");          
            UserAccount useraccount = new UserAccount(user_account_id, username, gender, name, password, email, usertype);
            return useraccount;
        }
        return null;
    }
    
    public static void updateStudents(Connection conn, UserAccount useraccount)
            throws SQLException{
        
        String sql = "Update User_Account set User_Name=?, Gender=?, Name=?, Password=?, Email=?, Usertype=? where user_account_id=?";
        
        PreparedStatement pstm = conn.prepareStatement(sql);
        
        
        pstm.setString(1, useraccount.getUserName());
        pstm.setString(2, useraccount.getGender());
        pstm.setString(3, useraccount.getName());
        pstm.setString(4, useraccount.getPassword());
        pstm.setString(5, useraccount.getEmail());
        pstm.setString(6, useraccount.getUserType());
        pstm.setString(7, useraccount.getUser_account_id());
           
        pstm.executeUpdate();
    }
    
    public static void insertStudents(Connection conn, UserAccount useraccount)
            throws SQLException{
        String sql = "insert into user_account (user_name, gender,  name, password, email, usertype) values(?, ?, ?, ?, ?, ?)";
        
        PreparedStatement pstm = conn.prepareStatement(sql);

        //pstm.setString(1, useraccount.getUser_account_id());
        pstm.setString(1, useraccount.getUserName());
        pstm.setString(2, useraccount.getGender());
        pstm.setString(3, useraccount.getName());
        pstm.setString(4, useraccount.getPassword());
        pstm.setString(5, useraccount.getEmail());
        pstm.setString(6, useraccount.getUserType());
        
        pstm.executeUpdate();
    }
    
    public static void deleteStudents(Connection conn, int user_account_id)
            throws SQLException{
        String sql = "delete From User_Account where user_account_id=?";
        
        PreparedStatement pstm = conn.prepareStatement(sql);
        
        pstm.setInt(1, user_account_id);
        
        pstm.executeUpdate();
    }
    
   // static Students findStudents(Connection conn, int id) {
     //   throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    //}

    public static String findName(Connection conn, String name)
            throws SQLException {
        String sql = "Select a.Name from students a"
                + " where a.Name = ?";
        
     

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, name);
        
        ResultSet rs = pstm.executeQuery();
        
        try {
            while (rs.next()) {
                rs.getString("Name");
                System.out.println("Name :" + rs.getString("Name"));
                return rs.getString("Name");
               
                
            }
            
        } catch (SQLException e1) {
            
           System.out.println(e1.getMessage());
           
        }
           
   return null;
    }
    

    public static void insertBlogPost(Connection conn, int userid, String title, String content) {
        String sql = "Insert into Log (title, content, date, User_Account_ID) VALUES (?, ?, now(), ?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, content);
            ps.setInt(3, userid);
            
            ps.executeUpdate();
            conn.commit();
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
    }

    
    public static List<BlogBlog> queryBlogList(Connection conn)
            throws SQLException{
        String sql =  "Select, a.Log_ID, a.Title, a.Content a.Date, a.User_Account_ID from Log a";
        
        PreparedStatement pstm = conn.prepareStatement(sql);
        
        ResultSet rs = pstm.executeQuery();
        List<BlogBlog> list = new ArrayList<>();
        while(rs.next()){
            int Log_ID = rs.getInt("Log_ID");
            String Title = rs.getString("Title");
            String Content = rs.getString("Content");
            String Date = rs.getString("Date");
            int User_Account_ID = rs.getInt("User_Account_ID");
            BlogBlog blog = new BlogBlog();
            blog.setLog_ID(Log_ID);
            blog.setTitle(Title);
            blog.setContent(Content);
            blog.setDate(Date);
            list.add(blog);
        }
        return list;
    }
      

    public static BlogBlog findPost(Connection conn, int userid, String title, String content)
            throws SQLException {
        String sql = "Select, a.Log_ID, a.Title, a.Content a.Date, a.User_Account_Id from Log a"
                + " where a.Title = ? ";
        
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, title);
        ResultSet rs = pstm.executeQuery();
        List<BlogBlog> list = new ArrayList<>();
        
        if(rs.next()){
            int Log_ID = rs.getInt("Log_ID");
            String Title = rs.getString("Title");
            String Content = rs.getString("Content");
            String Date = rs.getString("Date");
            BlogBlog blog = new BlogBlog();
            blog.setLog_ID(Log_ID);
            blog.setTitle(Title);
            blog.setContent(Content);
            blog.setDate(Date);
            list.add(blog);
            return blog;
        }
        return null;
    }
        public static String findTitle(Connection conn, String title)
            throws SQLException {
        String sql = "Select a.Title from Log a"
                + " where a.Title = ?";
        
     

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, title);
        
        ResultSet rs = pstm.executeQuery();
        
        try {
            while (rs.next()) {
                rs.getString("Title");
                System.out.println("Title :" + rs.getString("Title"));
                return rs.getString("title");
               
                
            }
            
        } catch (SQLException e1) {
            
           System.out.println(e1.getMessage());
           
        }
           
   
      
   return null;
    }

    public static void insertOralFeedback (Connection conn, Feedback feedback)
            throws SQLException{
        
        String sql = "insert into feedback (status, comment_open, comment_hidden, score, module_id, user_account_id) values(?, ?, ?, ?, ?, ?)";
        
        PreparedStatement pstm = conn.prepareStatement(sql);

        //pstm.setString(1, useraccount.getUser_account_id());
        pstm.setString(1, feedback.getStatus());
        pstm.setString(2, feedback.getCommentOpen());
        pstm.setString(3, feedback.getCommentHidden());
        pstm.setString(4, feedback.getScore());
        pstm.setString(5, feedback.getModule_id());
        pstm.setString(6, feedback.getUser_account_id());
   
        

        
        pstm.executeUpdate();
        
    }
    
    public static Feedback findFeedback (Connection conn, String module_ID)
            throws SQLException{
        
         String sql = "Select status, comment_open, comment_hidden, score, module_id, user_account_id from Feedback"
                + "module_id = ?";
        
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, module_ID);
        
        ResultSet rs = pstm.executeQuery();
        
        if(rs.next()){
            String status = rs.getString("status");
            String comment_open = rs.getString("comment_open");
            String comment_hidden = rs.getString("comment_hidden");
            String score = rs.getString("score");
            String module_id = rs.getString("module_:id");
            String user_account_id = rs.getString("user_account_id");
            Feedback feedback = new Feedback();
            feedback.setStatus(status);
            feedback.setCommentOpen(comment_open);
            feedback.setCommentHidden(comment_hidden);
            feedback.setScore(score);
            feedback.setModule_id(module_id);
            feedback.setUser_account_id(user_account_id);
            return feedback;
        }
        return null;
    }
    
     public static List<Feedback> queryFeedback(Connection conn)
            throws SQLException{
        String sql = "select status, comment_open, score, module_id from Feedback where user_account_id=?";
               
        
        PreparedStatement pstm = conn.prepareStatement(sql);
       // pstm.setString(1, user_account_id);
        
        
        
        ResultSet rs = pstm.executeQuery();
        List<Feedback> list = new ArrayList<>();
        while(rs.next()){
            String status = rs.getString("status");
            String comment_open = rs.getString("comment_open");
            String score = rs.getString("score");
            String module_id = rs.getString("module_id");
           
            
            
            Feedback feedback = new Feedback();
            feedback.setStatus(status);
            feedback.setCommentOpen(comment_open);
            feedback.setScore(score);
            feedback.setModule_id(module_id);
            list.add(feedback);
        }
        return list;
    }
    
    
    
        

}
    


