/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hv.controller;

import hv.dao.UserDAO;
import hv.model.Users;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HoaiVu
 */
@WebServlet(name = "controllerRegister", urlPatterns = {"/controllerRegister"})
public class controllerRegister extends HttpServlet {

    UserDAO userDAO = new UserDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String user = request.getParameter("username");
        String url = "";
        try {
            switch (command) {
                case "delete":
                    userDAO.delete(user);
                    url = "";
                    break;
            }
        } catch (Exception e) {
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        String last = request.getParameter("fullname");
        String role = request.getParameter("role");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String url = "", error = "";        
        try {
            if (error.length() == 0) {
                switch (command) {
                    case "insert":
                        userDAO.insertUser(new Users(user,pass,last,role,email,address,phone));
                        url = "/login.jsp";
                        break;
                    case "update":
                        userDAO.update(new Users((request.getParameter("username")),pass,last,role,email,address,phone));
                        url = "";
                        break;
                }
            } else {
                url = "/register.jsp";
            }
        } catch (Exception e) {
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }
}
