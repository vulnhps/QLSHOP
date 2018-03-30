/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hv.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HoaiVu
 */
public class Products {
    public Products(){
        
    }
    public List<Product> show(String tensp){
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=SOF301ASM";
            Connection conn = DriverManager.getConnection(url,"sa","123");
            String sql = "select * from product";
            if(tensp.length() >0){
                sql +="where product_name like '%"+tensp+"%'";
            }
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            List<Product> list = new ArrayList<>();
            while(rs.next()){
                Long id = rs.getLong("product_id");
                Long id2 = rs.getLong("category_id");
                String name = rs.getString("product_name");
                float price = rs.getFloat("product_price");
                String img = rs.getString("product_img");
                String des = rs.getString("product_description");
                Product sp = new Product(id,id2, name , price, img , des);
                list.add(sp);
            }return list;
        } catch (Exception e) {
        }return null;
    }
}
