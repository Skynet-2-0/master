/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.login.util;

/**
 *
 * @author Mathias
 */
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection createConnection()
{

    Connection conn = null;
    String url = "jdbc:mysql://localhost:3306/simpleapp";
    String username = "root";
    String password = "root";

    try{

        try{
            Class.forName("com.mysql.jdbc.Driver");
        }

        catch (ClassNotFoundException e){
            e.printStackTrace();
        }

        conn = DriverManager.getConnection(url, username, password);
        System.out.println("Post establishing a DB connection - "+conn);
    }
        catch (Exception e){
            e.printStackTrace();
        }
        return conn;
    }
}
