/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hv.dao;

import hv.connect.ConnectDB;
import hv.model.Users;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HoaiVu
 */
public class UserDAO {
    private Connection conn;
    
    // phương thức thêm tài khoản
    public boolean insertUser(Users u) {
        Connection connection = ConnectDB.getConnection();

        String sql = "INSERT INTO users VALUES(?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, u.getUser());
            ps.setString(2, u.getPass());
            ps.setString(3, u.getLast());
            ps.setString(4, u.getRole());
            ps.setString(5, u.getEmail());
            ps.setString(6, u.getAddres());
            ps.setString(7, u.getPhone());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    
    // get danh sách user
    public ArrayList<Users> getListUsers() throws SQLException { 
        Connection connection = ConnectDB.getConnection();
        String sql = "SELECT * FROM users";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Users> list = new ArrayList<>();
        while (rs.next()) {
            Users ss = new Users();
            ss.setUser(rs.getString("username"));
            ss.setPass(rs.getString("password"));
            ss.setLast(rs.getString("fullname"));
            ss.setRole(rs.getString("role"));
            ss.setEmail(rs.getString("email"));
            ss.setAddres(rs.getString("address"));
            ss.setPhone(rs.getString("phone"));
            list.add(ss);
        }
        return list;
    }
    
    public Users checkLogin(Users user){
        Users cus = null;
        String query = "select * from users where username=? and password=?";
        conn = new ConnectDB().getConnection();
        try{
            CallableStatement cs = conn.prepareCall(query);
            cs.setString(1, user.getUser());
            cs.setString(2, user.getPass());
            
            ResultSet rs = cs.executeQuery();
            if(rs.next()){
                
                cus = new Users(rs.getString(1), rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
            }
        }catch(Exception e){
            e.printStackTrace();
            return cus;
        }
        return cus;
    }
    
    
    // thêm mới dữ liệu
    public boolean insert(Users c) {
        Connection connection = ConnectDB.getConnection();
        String sql = "INSERT INTO user VALUES(?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, c.getUser());
            ps.setString(2, c.getPass());
            ps.setString(3, c.getLast());
            ps.setString(4, c.getRole());
            ps.setString(5, c.getEmail());
            ps.setString(6, c.getAddres());
            ps.setString(7, c.getPhone());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // cập nhật dữ liệu
    public boolean update(Users c) {
        Connection connection = ConnectDB.getConnection();
        String sql = "UPDATE users SET password=? , fullname=? , role=? , email=?, address=? , phone=? WHERE username = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, c.getPass());
            ps.setString(2, c.getLast());
            ps.setString(3, c.getRole());
            ps.setString(4, c.getEmail());
            ps.setString(5, c.getAddres());
            ps.setString(6, c.getPhone());
            ps.setString(7, c.getUser());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // xóa dữ liệu
    public boolean delete(String username) {
        Connection connection = ConnectDB.getConnection();
        String sql = "DELETE FROM users WHERE username = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, username);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
    
    

