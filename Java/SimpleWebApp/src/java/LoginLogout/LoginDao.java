/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LoginLogout;

/**
 *
 * @author Mathias
 */
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import Users.UserAccount;
import Connection.MySQLConnUtils;

public class LoginDao {
    public String authenticateUser(UserAccount userAccount){
        String userName = userAccount.getUserName();
        String password = userAccount.getPassword();
        Connection conn = null;
        Statement statement = null;
        ResultSet resultSet = null;
        String userNameDB = "";
        String passwordDB = "";
        String roleDB = "";
            try{
                conn = MySQLConnUtils.createConnection();
                statement = conn.createStatement();
                resultSet = statement.executeQuery("select username, password, role from user");
                    while(resultSet.next()){
                        userNameDB = resultSet.getString("username");
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
