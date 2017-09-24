/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author mathi
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
    
    public static List<Students> queryStudents(Connection conn)
            throws SQLException{
        String sql = "Select a.Id, a.Name, a.Email from Students a";
        
        PreparedStatement pstm = conn.prepareStatement(sql);
        
        ResultSet rs = pstm.executeQuery();
        List<Students> list = new ArrayList<>();
        while(rs.next()){
            int id = rs.getInt("Id");
            String name = rs.getString("Name");
            String email = rs.getString("Email");
            Students students = new Students();
            students.setId(id);
            students.setName(name);
            students.setEmail(email);
            list.add(students);
        }
        return list;
    }
    
    public static Students findStudents(Connection conn, String id)
            throws SQLException{
        String sql = "Select a.Id, a.Name, a.Email from Students a where a.Id=?";
        
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, id);
        
        ResultSet rs = pstm.executeQuery();
        
        while(rs.next()){
            String name = rs.getString("Name");
            String email = rs.getString("Email");
            Students students = new Students(Integer.parseInt(id), name, email);
            return students;
        }
        return null;
    }
    
    public static void updateStudents(Connection conn, Students students)
            throws SQLException{
        String sql = "Update Students set Name=?, Email=?, where Id=?";
        
        PreparedStatement pstm = conn.prepareStatement(sql);
        
        pstm.setString(1, students.getName());
        pstm.setString(2, students.getEmail());
        pstm.setInt(3, students.getId());
        pstm.executeUpdate();
    }
    
    public static void insertStudents(Connection conn, Students students)
            throws SQLException{
        String sql = "insert into students (Id, Name, Email) values(?, ?, ?)";
        
        PreparedStatement pstm = conn.prepareStatement(sql);
        
        pstm.setInt(1, students.getId());
        pstm.setString(2, students.getName());
        pstm.setString(3, students.getEmail());
        
        pstm.executeUpdate();
    }
    
    public static void deleteStudents(Connection conn, int id)
            throws SQLException{
        String sql = "Delete From Students where Id=?";
        
        PreparedStatement pstm = conn.prepareStatement(sql);
        
        pstm.setInt(1, id);
        
        pstm.executeUpdate();
    }

    static Students findStudents(Connection conn, int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
