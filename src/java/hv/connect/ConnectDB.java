/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hv.connect;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author HoaiVu
 */
public class ConnectDB {
    public static Connection getConnection(){
        Connection conn = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(
                    "jdbc:sqlserver://vulnhps05401.database.windows.net:1433;database=SOF301ASM",
                    "hoaivu@vulnhps05401",
                    "abc@1234");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
    
    public static void main(String[] args) {
        System.out.println(getConnection());
    }
}
