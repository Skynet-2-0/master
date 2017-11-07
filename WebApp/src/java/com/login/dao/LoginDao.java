/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.login.dao;

/**
 *
 * @author Mathias
 */
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.login.bean.LoginBean;
import com.login.util.DBConnection;

public class LoginDao {
    public String authenticateUser(LoginBean loginBean){
        String userName = loginBean.getUserName();
        String password = loginBean.getPassword();
        Connection conn = null;
        Statement statement = null;
        ResultSet resultSet = null;
        String userNameDB = "";
        String passwordDB = "";
        String roleDB = "";
            try{
                conn = DBConnection.createConnection();
                statement = conn.createStatement();
                resultSet = statement.executeQuery("select user_name, password, role from user_account");
                    while(resultSet.next()){
                        userNameDB = resultSet.getString("user_name");
                        passwordDB = resultSet.getString("password");
                        roleDB = resultSet.getString("role");
                        
                        if(userName.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("Admin"))
                            return "Admin_Role";
                        
                        else if(userName.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("User"))
                            return "User_Role";
                        }
                    }

            catch(SQLException e){

                e.printStackTrace();
            }
            return "Invalid user credentials";
    }
}
