package LoginLogout;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Jonas
 */

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import Users.UserAccount;
import Connection.ConnectionUtils;

public class LoginDao {
    public String authenticateUser(UserAccount user) throws ClassNotFoundException{
        String userName = user.getUserName();
        String password = user.getPassword();
        Connection conn = null;
        Statement statement = null;
        ResultSet resultSet = null;
        String userNameDB = "";
        String passwordDB = "";
        String roleDB = "";
            try{
                conn = ConnectionUtils.getConnection();
                statement = conn.createStatement();
                resultSet = statement.executeQuery("select User_Name, Password, Usertype from User_Account");
                    while(resultSet.next()){
                        userNameDB = resultSet.getString("User_Name");
                        passwordDB = resultSet.getString("Password");
                        roleDB = resultSet.getString("Usertype");
                        
                        if(userName.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("ADMIN"))
                            return "Admin_Role";
                        
                        else if(userName.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("USER"))
                            return "User_Role";
                        }
                    }

            catch(SQLException e){

                e.printStackTrace();
            }
            return "Invalid user credentials";
    }
}