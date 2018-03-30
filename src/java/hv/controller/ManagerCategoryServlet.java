/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hv.controller;

import hv.dao.CategoryDAO;
import hv.model.Category;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HoaiVu
 */
@WebServlet(name = "ManagerCategoryServlet", urlPatterns = {"/ManagerCategoryServlet"})
public class ManagerCategoryServlet extends HttpServlet {

    CategoryDAO categoryDAO = new CategoryDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String categoryid = request.getParameter("categoryid");
        String url = "";
        try {
            switch (command) {
                case "delete":
                    categoryDAO.delete(Long.parseLong(categoryid));
                    url = "/adminqldm.jsp";
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
        String id = request.getParameter("iddm");
        String name = request.getParameter("tendm");
        String url = "", error = "";        
        try {
            if (error.length() == 0) {
                switch (command) {
                    case "insert":
                        categoryDAO.insert(new Category(Long.parseLong((id)),name));
                        url = "/adminqldm.jsp";
                        break;
                    case "update":
                        categoryDAO.update(new Category(Long.parseLong(request.getParameter("categoryid")),name));
                        url = "/adminqldm.jsp";
                        break;
                }
            } else {
                url = "/isert_dm.jsp";
            }
        } catch (Exception e) {
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }
}

   

