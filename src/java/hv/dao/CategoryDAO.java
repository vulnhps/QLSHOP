/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hv.dao;

import hv.connect.ConnectDB;
import hv.model.Category;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HoaiVu
 */
public class CategoryDAO {
    private Connection conn;
    private int noOfRecords;
    public CategoryDAO() {}
    
    
    
    // get danh sách thể loại
    public ArrayList<Category> getListCategory() throws SQLException { 
        Connection connection = ConnectDB.getConnection();
        String sql = "SELECT * FROM category";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Category> list = new ArrayList<>();
        while (rs.next()) {
            Category category = new Category();
            category.setId(rs.getLong("categoryid"));
            category.setName(rs.getString("categoryname"));
            list.add(category);
        }
        return list;
    }
    
    // thêm mới dữ liệu
    public boolean insert(Category c) {
        Connection connection = ConnectDB.getConnection();
        String sql = "INSERT INTO category VALUES(?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, c.getId());
            ps.setString(2, c.getName());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // cập nhật dữ liệu
    public boolean update(Category c) {
        Connection connection = ConnectDB.getConnection();
        String sql = "UPDATE category SET categoryname = ? WHERE categoryid = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, c.getName());
            ps.setLong(2, c.getId());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // xóa dữ liệu
    public boolean delete(long category_id) {
        Connection connection = ConnectDB.getConnection();
        String sql = "DELETE FROM category WHERE categoryid = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, category_id);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
