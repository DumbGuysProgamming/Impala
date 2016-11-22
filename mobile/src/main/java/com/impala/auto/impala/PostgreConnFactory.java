package com.impala.auto.impala;

import java.sql.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Properties;


/**
 * Created by Kyle on 11/21/2016.
 */

public class PostgreConnFactory {
    public static void makeConnection(){
        Connection c = null;
//        Statement stmt = null;
        String url = "jdbc:postgresql://localhost/impala_dm";
        Properties props = new Properties();
        props.setProperty("user", "postgres");
        props.setProperty("password", "d3!O0pple");
        props.setProperty("ssl", "true");
        try {
            Class.forName("org.postgresql.Driver");
            c = DriverManager.getConnection(url, props);
//            System.out.println("Opened database successfully");
//            stmt = c.createStatement();
//            String sql = "CREATE TABLE COMPANY \" +\n" +
//                    "(ID INT PRIMARY KEY     NOT NULL," +
//                    "NAME            TEXT    NOT NULL," +
//                    "AGE             INT     NOT NULL," +
//                    "ADDRESS         CHAR(50)," +
//                    "SALARY          REAL)";
//            stmt.executeUpdate(sql);
//            stmt.close();
            c.close();
        } catch (Exception e){
            e.printStackTrace();
            System.err.println(e.getClass().getName()+": "+e.getMessage());
            System.exit(0);
        }
        System.out.println("Opened database successfully");
    }
}
