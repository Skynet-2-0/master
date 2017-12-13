package Connection;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import Admin.UserAccount;
import Blog.BlogBlog;
import Feedback.Feedback;
import Kalender.CalendarCalendar;
import Modules.Module;
import Uploads.Files;
import java.sql.Blob;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.lang.String;

/**
 *
 * @author Mathias, Brage
 */
public class DBUtils {
    
    public static List<Files> queryFiles(Connection conn) throws SQLException{
        
        String sql = "SELECT a.id, a.file_name, a.file_data, a.description FROM attachment a";
        PreparedStatement pstm = conn.prepareStatement(sql);
        
        ResultSet rs = pstm.executeQuery();
        List<Files> list = new ArrayList<>();
        while(rs.next()){
            Integer id  = Integer.parseInt(rs.getString("id"));
            String fileName = rs.getString("file_name");
            Blob fileData = rs.getBlob("file_data");
            String description = rs.getString("description");
            
            int blobLength = (int) fileData.length();  
            byte[] blobAsBytes = fileData.getBytes(1, blobLength);

            //release the blob and free up memory.
            fileData.free();
            
            Files file = new Files();
            file.setId(id);
            file.setFileName(fileName);
            file.setFileData(fileData);
            file.setDescription(description);
            
            list.add(file);
        }
        return list; 
    }
    
    public static UserAccount findUser(Connection conn, String userName, String password)
            throws SQLException {
        String sql = "Select a.User_Name, a.Password, a.user_account_id, a.name, a.usertype from User_Account a"
                + " where a.User_Name = ? and a.password= ?";
        
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, userName);
        pstm.setString(2, password);
        ResultSet rs = pstm.executeQuery();
        
        if(rs.next()){
            String user_account_id = rs.getString("user_account_id");
            String name = rs.getString("name");
            String usertype = rs.getString("usertype");
            UserAccount user = new UserAccount();
            user.setUserName(userName);
            user.setPassword(password);
            user.setUser_account_id(user_account_id);
            user.setName(name);
            user.setUserType(usertype);
            return user;
        }
        return null;
    }
    
    public static UserAccount findUser(Connection conn, String userName)
            throws SQLException{
        String sql = "Select a.User_Name, a.Password, a.Gender, a.User_account_id from User_Account a"
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
    
    public static UserAccount findUserID(Connection conn, String username)
            throws SQLException{
        String sql = "Select a.User_account_id from User_Account a"
                + " where a.User_Name = ?";
        
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, username);
        
        ResultSet rs = pstm.executeQuery();
        
        if(rs.next()){
            UserAccount id = new UserAccount();
            id.setUser_account_id(rs.getString("User_account_id"));
            return id;
        }
        return null;
    }
    
     public static UserAccount findStudentName(Connection conn, String name)
            throws SQLException{
        String sql = "Select User_account_id from User_Account "
                + " where name = ?";
        
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, name);
        
        ResultSet rs = pstm.executeQuery();
        
        if(rs.next()){
            UserAccount id = new UserAccount();
            id.setUser_account_id(rs.getString("User_account_id"));
            return id;
           
            
           
        }
        return null;
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
    
    public static List<UserAccount> queryUserAccountSearch(Connection conn, String name)
            throws SQLException{
        
      
            
  //      String sql = "Select User_Account_Id, User_Name, Gender, Name, Email, Usertype from User_Account where name like '%"+name+"'%";
          String sql = "Select User_Account_Id, User_Name, Gender, Name, Email, Usertype from User_Account where name=?";

        
        
        PreparedStatement pstm = conn.prepareStatement(sql);
        
        pstm.setString(1, name);
        
        
        
        ResultSet rs = pstm.executeQuery();
        List<UserAccount> list = new ArrayList<>();
        while(rs.next()){
            String user_account_id  = rs.getString("user_account_id");
            String username = rs.getString("user_name");
            String gender = rs.getString("gender");
            rs.getString("name");
            String email = rs.getString("email");
            String usertype = rs.getString("usertype");
            
            
            UserAccount useraccount = new UserAccount();
            useraccount.setUser_account_id(user_account_id);
            useraccount.setUserName(username);
            useraccount.setGender(gender);
            useraccount.setName(name);
            useraccount.setEmail(email);
            useraccount.setUserType(usertype);
            list.add(useraccount);
        }
        return list;
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
    
    public static void deleteFiles(Connection conn, int id)
            throws SQLException{
        String sql = "delete From attachment where id=?";
        
        PreparedStatement pstm = conn.prepareStatement(sql);
        
        pstm.setInt(1, id);
        
        pstm.executeUpdate();
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
    
    public static void createFeedback (Connection conn, Feedback feedback, UserAccount user_account)
            throws SQLException{
        
        CallableStatement statement = conn.prepareCall("{call create_feedback(?, ?, ?, ?, ?, ?)}");
        
        statement.setString(1, feedback.getStatus());
        statement.setString(2, feedback.getCommentOpen());
        statement.setString(3, feedback.getCommentHidden());
        statement.setString(4, feedback.getScore());
        statement.setString(5, feedback.getModule_id());    
        statement.setString(6, user_account.getName());  
   
        statement.execute();  
      
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
            String module_id = rs.getString("module_id");
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
    
     public static List<Feedback> queryFeedback(Connection conn, UserAccount id)
            throws SQLException{
        String sql = "select status, comment_open, score, module_id from Feedback where user_account_id=?";
               
        
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, id.getUser_account_id());
        
        
        
        ResultSet rs = pstm.executeQuery("select * from feedback where user_account_id= "+id.getUser_account_id()+"");
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
    
     public static List<Feedback> queryStudentFeedback(Connection conn, String user_account_id)
            throws SQLException{
          List<Feedback> list = new ArrayList<>();
          String sql = "select a.user_account_id, a.status, a.comment_open, a.comment_hidden, a.score, a.module_id from feedback a where a.user_account_id=?";
               
          
          
          PreparedStatement pstm = conn.prepareStatement(sql);
          pstm.setString(1, user_account_id);
         
       
          ResultSet rs = pstm.executeQuery();
        
          
        while(rs.next()){
            
            String status = rs.getString("status");
            String commentOpen = rs.getString("comment_open");
            String commentHidden = rs.getString("comment_hidden");
            String score = rs.getString("Score");
            String module_id = rs.getString("module_id");
           
          
            
                    
            Feedback feedback = new Feedback(status, commentOpen, commentHidden, score, module_id, user_account_id);
            
            feedback.setStatus(status);
            feedback.setCommentOpen(commentOpen);
            feedback.setCommentHidden(commentHidden);
            feedback.setScore(score);
            feedback.setModule_id(module_id);
            list.add(feedback);
          
            
        
        }
    
        return list;   
    }
     
     public static List<CalendarCalendar> queryCalendar(Connection conn)
            throws SQLException{
        String sql = "Select a.Dato, a.Hendelse from Calendar a";
        
        PreparedStatement pstm = conn.prepareStatement(sql);
        
        ResultSet rs = pstm.executeQuery();
        List<CalendarCalendar> list = new ArrayList<>();
        while(rs.next()){
            String dato = rs.getString("Dato");
            String hendelse = rs.getString("Hendelse");
            CalendarCalendar calendar = new CalendarCalendar();
            calendar.setDato(dato);
            calendar.setHendelse(hendelse);
            list.add(calendar);
        }
        return list;
    }
      
  

    public static CalendarCalendar findDate(Connection conn, String Dato, String Hendelse)
            throws SQLException {
        String sql = "Select a.Calendar_ID, a.Dato, a.Hendelse from Calendar a"
                + " where a.Dato = ? ";
        
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, Dato);
        ResultSet rs = pstm.executeQuery();
        List<CalendarCalendar> list = new ArrayList<>();
        
        if(rs.next()){
            //String Dato;
            Dato = rs.getString("dato");
            CalendarCalendar calendar = new CalendarCalendar();
            calendar.setDato(Dato);
            calendar.setHendelse(Hendelse);
            list.add(calendar);
            return calendar;
        }
        return null;
    }
        public static String findDate(Connection conn, String Dato)
            throws SQLException {
        String sql = "Select a.Dato from Calendar a"
                + " where a.Dato = ?";
        
     

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, Dato);
        
        ResultSet rs = pstm.executeQuery();
        
        try {
            while (rs.next()) {
                rs.getString("Dato");
                System.out.println("Dato :" + rs.getString("Dato"));
                return rs.getString("dato");
               
                
            }
            
        } catch (SQLException e1) {
            
           System.out.println(e1.getMessage());
           
        }

   return null;
    }
     
        public static void createModules (Connection conn, Module module) throws SQLException{
        String sql = "insert into Module (Module_Name, Delivery_Date, Description, LearningGoals, Resources) values (?, ?, ?, ?, ?)";
        PreparedStatement pstm = conn.prepareStatement (sql);
        
        pstm.setString(1, module.getModule_name());
        pstm.setString(2, module.getDelivery_date());
        pstm.setString(3, module.getDescription());
        pstm.setString(4, module.getLearningGoals());
        pstm.setString(5, module.getResources());
        
        pstm.executeUpdate();
    }
   
    public static List<Module> listAllModules(Connection conn) throws SQLException {
        List<Module> list = new ArrayList<>();
         
        String sql = "SELECT * FROM Module";
        PreparedStatement pstm = conn.prepareStatement(sql);
        
        ResultSet rs = pstm.executeQuery();
         
        while (rs.next()) {
            String module_id = rs.getString("module_id");
            String module_name = rs.getString("module_name");
            String delivery_date = rs.getString("delivery_date");
            String description = rs.getString("description");
            String learningGoals = rs.getString("learningGoals");
            String resources = rs.getString("resources");
             
            Module module = new Module(module_id, module_name, delivery_date, description, learningGoals, resources);
            list.add(module);
        }

        return list;
    }
    
       
    public static List<Module> listModuleDetails(Connection conn, String module_id) throws SQLException {
        List<Module> list = new ArrayList<>();
         
        //String sql = "SELECT * FROM Module";
        String sql = "select a.module_id, a.module_name, a.delivery_date, a.description, a.learningGoals, a.resources from Module a where a.module_id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, module_id);
        ResultSet rs = pstm.executeQuery();
         
        while (rs.next()) {
            String module_name = rs.getString("module_name");
            String delivery_date = rs.getString("delivery_date");
            String description = rs.getString("description");
            String learningGoals = rs.getString("learningGoals");
            String resources = rs.getString("resources");
             
            Module module = new Module(module_id, module_name, delivery_date, description, learningGoals, resources);
            list.add(module);
        }

        return list;
    }
    
    
    
        public static Module findModule(Connection conn, String module_id)
            throws SQLException{
        
        String sql = "Select a.module_id, a.module_Name, a.delivery_date, a.description, a.learningGoals, a.resources from Module a where a.module_id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, module_id);
       
        ResultSet rs = pstm.executeQuery();
        
        while(rs.next()){
            String module_name = rs.getString("module_name");
            String delivery_date = rs.getString("delivery_date");
            String description = rs.getString("description");
            String learningGoals = rs.getString("learningGoals");
            String resources = rs.getString("resources");
            Module module = new Module(module_id, module_name, delivery_date, description, learningGoals, resources);
            return module;
        }
        return null;
    }
    
    
    public static void editModules(Connection conn, Module module)throws SQLException{
      
    String sql = "Update Module set Module_Name=?, Delivery_Date=?, Description=?, LearningGoals=?, Resources=? where Module_id=?";
    PreparedStatement pstm = conn.prepareStatement(sql);
    
    pstm.setString(1, module.getModule_name());
    pstm.setString(2, module.getDelivery_date());
    pstm.setString(3, module.getDescription());
    pstm.setString(4, module.getLearningGoals());
    pstm.setString(5, module.getResources());
    pstm.setString(6, module.getModule_id());
   
    pstm.executeUpdate();
    
}
    public static void deleteModule(Connection conn, int module_id)throws SQLException{
        try{
            String sql = "Delete from Module where Module_ID=?";
            PreparedStatement pstm = conn.prepareStatement(sql);      
            
            pstm.setInt(1,module_id);
            pstm.executeUpdate();            
        }
        catch (SQLException e) {
        e.printStackTrace();
        }
    }
    
        
}
      

    


