/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hv.controller;

import hv.dao.UserDAO;
import hv.model.Users;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HoaiVu
 */
@WebServlet(name = "controllerLogin", urlPatterns = {"/controllerLogin"})
public class controllerLogin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
        
        String url = "/welcome.jsp";
        String username = request.getParameter("txtUser");
        String pword = request.getParameter("txtPass");
        String ghiNho = request.getParameter("chkGhiNho");
        Users user = new Users(username , pword);
        UserDAO cusDAO = new UserDAO();
        
        boolean tbloi = false;
        // kieem tra xem du lieu nhap tu text box co rong hay khong!!!
        if (username.trim().length() == 0) {
            request.setAttribute("userNameloi", "Vui lòng nhập tên đăng nhập");
            tbloi = true;
        } else {
            request.setAttribute("ten", username);
        }
        if (pword.trim().length() == 0) {
            request.setAttribute("userpasswordloi", "Vui lòng nhập mật khẩu");
            tbloi = true;
        } else {
            request.setAttribute("pass", pword);
        }
        if (tbloi) {
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        } 
        else {
            //        try {
            //            Users cus = cusDAO.checkLogin(user);
            //            if(cus!=null){
            //                synchronized(session){
            //
            //                    session.setAttribute("tendaydu", cus);
            //                }
            //                request.setAttribute("msg", "đang nhập thành công");
            //                if(cus.getRole().equals("1")){
            //                    url ="/admintempla.jsp";
            //                }
            //            }else{
            //                request.setAttribute("msg", "sai tài khoản hoặc mật khẩu");
            //                url="/login.jsp";
            //            }
            //        } catch (Exception e) {
            //        }
            //        RequestDispatcher dispatcher = request.getRequestDispatcher(url);
            //        if(dispatcher != null){
            //           dispatcher.forward(request, response);
            //        }
            //    Connection con = null;
            //    PreparedStatement stm = null;
            //    ResultSet rs = null;            
            //         Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            //         con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=SOF301ASM", "sa", "123");
            //         stm = con.prepareStatement("select fullname from users where username=? and password=?");
            //         stm.setString(1, username);
            //         stm.setString(2, pword);
            //         rs = stm.executeQuery();
            
            
            
            
            // tạo cookie sống 1 tháng trên client
            Cookie ckiUser = new Cookie("User", username);
            Cookie ckiPass = new Cookie("Pass", pword);
            ckiUser.setMaxAge(30*24*60*60); // 30 ngày
            ckiPass.setMaxAge(30*24*60*60);
            // nếu không check vào ghi nhớ thì xóa cookie đã nhớ trước đó
            
            try{
                Users cus = cusDAO.checkLogin(user);
            
            if (ghiNho == null)
            {
                ckiUser.setMaxAge(0); // xóa cookie
                ckiPass.setMaxAge(0);
            }
            // gửi cookie về client
            response.addCookie(ckiUser);
            response.addCookie(ckiPass);
            if (cus != null) {
                request.setAttribute("msg", "Đăng nhập thành công");
                //    tạo session để lưu lại tên dăng nhập , gắn tên nó bằng 1 giá trị
                //    khởi tạo session
                String fullname = cus.getLast();
                request.getSession(true).setAttribute("tendaydu", fullname);
                // sau khi khởi tạo thù chuyển sang trang chủ
                if(cus.getRole().equals("1")){
                    url ="/admintempla.jsp";
                }
            } else {
                request.setAttribute("msg", "<font color='red'>Đăng nhập thất bại. Mời bạn thực hiện lại</font>");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }// nếu nhập sai thì vẫn ở trang login.jsp
        }catch(Exception e){
            
        }
            RequestDispatcher dispatcher = request.getRequestDispatcher(url);
                if(dispatcher != null){
                  dispatcher.forward(request, response);
        }
    }
    }
        // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
        /**
         * Handles the HTTP <code>GET</code> method.
         *
         * @param request servlet request
         * @param response servlet response
         * @throws ServletException if a servlet-specific error occurs
         * @throws IOException if an I/O error occurs
         */
        @Override
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(controllerLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
        }

        /**
         * Handles the HTTP <code>POST</code> method.
         *
         * @param request servlet request
         * @param response servlet response
         * @throws ServletException if a servlet-specific error occurs
         * @throws IOException if an I/O error occurs
         */
        @Override
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(controllerLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
