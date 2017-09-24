/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author mathi
 */
public class MySQLConnUtils {
    
    public static Connection getMySQLConnection()
            throws ClassNotFoundException, SQLException {
        //Må være etter parameterne til din SQL database
        String hostName = "localhost:";
        String dbName = "simplewebapp";
        String userName = "root";
        String password = "root";
        return getMySQLConnection(hostName, dbName, userName, password);
    }
    
    public static Connection getMySQLConnection(String hostName, String dbName, String userName, String password)
            throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        
        // URL Connection for MySQL:
        // jdbc:mysql://localhost:3306/javaogsql
        String connectionURL = "jdbc:mysql://" + hostName + "3306/" + dbName;
        
        Connection conn = DriverManager.getConnection(connectionURL, userName, password);
        return conn;
    }
    
}
