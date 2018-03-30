/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hv.dao;

import hv.connect.ConnectDB;
import hv.model.Product;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.StringTokenizer;

/**
 *
 * @author HoaiVu
 */
public class ProductDAO {

    private Connection conn;
    private int noOfRecords;

    public ProductDAO() {
    }

    public Hashtable select44() {// xuat 4 trong product voi categortid 4
        Hashtable products = new Hashtable();
        String query = "Select top 4 * from product where category_id=4";
        conn = new ConnectDB().getConnection();
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                Product product = new Product(rs.getLong(1), rs.getLong(2),
                        rs.getString(3), rs.getDouble(4), rs.getString(5), rs.getString(6));
                products.put(product.getProduct_id(), product);
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }

    public Hashtable select05() {// xuat all cua bang product voi categoryid 5
        Hashtable products = new Hashtable();
        String query = "Select * from product where category_id=5";
        conn = new ConnectDB().getConnection();
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                Product product = new Product(rs.getLong(1), rs.getLong(2),
                        rs.getString(3), rs.getDouble(4), rs.getString(5), rs.getString(6));
                products.put(product.getProduct_id(), product);
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }

    public Hashtable select15() {//có xài
        Hashtable products = new Hashtable();
        String query = "Select top 4 * from product where category_id=2";
        conn = new ConnectDB().getConnection();
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                Product product = new Product(rs.getLong(1), rs.getLong(2),
                        rs.getString(3), rs.getDouble(4), rs.getString(5), rs.getString(6));
                products.put(product.getProduct_id(), product);
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }
    
    public Hashtable selectall() {//có xài
        Hashtable products = new Hashtable();
        String query = "Select * from product ";
        conn = new ConnectDB().getConnection();
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                Product product = new Product(rs.getLong(1), rs.getLong(2),
                        rs.getString(3), rs.getDouble(4), rs.getString(5), rs.getString(6));
                products.put(product.getProduct_id(), product);
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }

    // get danh sách sản phẩm dựa vào mã danh mục
    public ArrayList<Product> getListProductByCategory(long category_id) throws SQLException {
        Connection connection = ConnectDB.getConnection();
        String sql = "SELECT * FROM product WHERE category_id = '" + category_id + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Product> list = new ArrayList<>();
        while (rs.next()) {
            Product product = new Product();
            product.setProduct_id(rs.getLong("product_id"));
            product.setProduct_name(rs.getString("product_name"));
            product.setProduct_price(rs.getDouble("product_price"));
            product.setProduct_img(rs.getString("product_img"));
            product.setProduct_des(rs.getString("product_description"));
            list.add(product);
        }
        return list;
    }

    // hiển thị chi tiết sản phẩm
    public Product getProduct(long product_id) throws SQLException {
        Connection connection = ConnectDB.getConnection();
        String sql = "SELECT * FROM product WHERE product_id= '" + product_id + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        Product qq = new Product();
        while (rs.next()) {
            qq.setProduct_id(rs.getLong("product_id"));
            qq.setProduct_name(rs.getString("product_name"));
            qq.setProduct_price(rs.getDouble("product_price"));
            qq.setProduct_img(rs.getString("product_img"));
            qq.setProduct_des(rs.getString("product_description"));
        }
        return qq;
    }

    // get danh sách thể loại
    public ArrayList<Product> getListPro() throws SQLException { 
        Connection connection = ConnectDB.getConnection();
        String sql = "SELECT * FROM product";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Product> list = new ArrayList<>();
        while (rs.next()) {
            Product product = new Product();
            product.setProduct_id(rs.getLong("product_id"));
            product.setCategory_id(rs.getLong("category_id"));
            product.setProduct_name(rs.getString("product_name"));
            product.setProduct_price(rs.getInt("product_price"));
            product.setProduct_img(rs.getString("product_img"));
            product.setProduct_des(rs.getString("product_description"));
            list.add(product);
        }
        return list;
    }
    
    
    public Hashtable selectAllCatID(String catID) {
        Hashtable products = new Hashtable();
        String query = "Select * From product WHERE product_name=?";
        conn = new ConnectDB().getConnection();
        try {
            CallableStatement cs = conn.prepareCall(query);
            cs.setString(1, catID);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                Product product = new Product(rs.getLong(1), rs.getLong(2),
                        rs.getString(3), rs.getDouble(4), rs.getString(5), rs.getString(6));
                products.put(product.getProduct_id(), product);
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }

    public ArrayList<Product> getRelatedProducts(String catName) {
        ArrayList<Product> list = new ArrayList<Product>();

        return list;
    }


    public Hashtable searchForName(StringTokenizer keys) { // chua xai toi
        Hashtable products = new Hashtable();
        String query = "Select * From product WHERE LOWER(describes) LIKE ?";
        for (int i = 1; i <= keys.countTokens(); i++) {
            query += " OR LOWER(describes) LIKE ?";
        }
        conn = new ConnectDB().getConnection();
        try {
            CallableStatement cs = conn.prepareCall(query);
            int i = 1;
            while (keys.hasMoreTokens()) {
                cs.setString(i, "%" + keys.nextToken().toLowerCase() + "%");
                i++;
            }
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                Product product = new Product(rs.getLong(1), rs.getLong(2),
                        rs.getString(3), rs.getDouble(4), rs.getString(5), rs.getString(6));
                products.put(product.getProduct_id(), product);
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }

    

    

    public Product selectByID(String productID) { // chua xai toi
        Product product = null;
        String query = "SELECT * FROM product WHERE productid=?";
        conn = new ConnectDB().getConnection();
        try {
            CallableStatement cs = conn.prepareCall(query);
            cs.setString(1, productID);
            ResultSet rs = cs.executeQuery();
            if (rs.next()) {
                product = new Product(rs.getLong(1), rs.getLong(2),
                        rs.getString(3), rs.getDouble(4), rs.getString(5), rs.getString(6));
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }

    public boolean add(Product product) { // them sp
        String query = "insert into product(product_id,category_id,product_name,product_price,product_img,product_description) VALUES(?,?,?,?,?,?)";
        conn = new ConnectDB().getConnection();
        try {
            CallableStatement cs = conn.prepareCall(query);
            cs.setLong(1, product.getProduct_id());
            cs.setLong(2, product.getCategory_id());
            cs.setString(3, product.getProduct_name());
            cs.setDouble(4 , product.getProduct_price());
            cs.setString(5, product.getProduct_img());
            cs.setString(6, product.getProduct_des());
            int result = cs.executeUpdate();
            conn.close();
            if (result == 1) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return false;
    }

    public boolean edit(Product product) { // sua sp
        String query = "UPDATE product SET category_id=?, product_name=?, product_price=?, product_img=?, product_description=? WHERE product_id=?";
        conn = new ConnectDB().getConnection();
        try {
            CallableStatement cs = conn.prepareCall(query);            
            cs.setLong(1, product.getCategory_id());
            cs.setString(2, product.getProduct_name());
            cs.setDouble(3, product.getProduct_price());
            cs.setString(4, product.getProduct_img());
            cs.setString(5, product.getProduct_des());
            cs.setLong(6, product.getProduct_id());
            int result = cs.executeUpdate();
            conn.close();
            if (result == 1) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return false;
    }

    public boolean delete(long product_id) { // dele sp
        String query = "DELETE FROM product WHERE product_id=?";
        conn = new ConnectDB().getConnection();
        try {
            CallableStatement cs = conn.prepareCall(query);
            cs.setLong(1, product_id);
            int result = cs.executeUpdate();
            conn.close();
            if (result == 1) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return false;
    }

    public int getNoOfRecords() {
        return noOfRecords;
    }

    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
        Hashtable<Product, String> products = new Hashtable<Product, String>();

        System.out.println(products.keySet());
    }
}
