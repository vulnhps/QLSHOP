/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hv.controller;

import hv.dao.ProductDAO;
import hv.model.Product;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ManagerProductServlet", urlPatterns = {"/ManagerProductServlet"})
public class ManagerProductServlet extends HttpServlet {

   ProductDAO productDAO = new ProductDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String productid = request.getParameter("product_id");
        String url = "";
        try {
            switch (command) {
                case "delete":
                    productDAO.delete(Long.parseLong(productid));
                    url = "/adminqlsp.jsp";
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
        String id1 = request.getParameter("idsp");
        String id = request.getParameter("iddm");
        String anh = request.getParameter("file");
        String name = request.getParameter("tensp");
        String ta = request.getParameter("motasp");
        String gia = request.getParameter("gia");
        String url = "", error = "";        
        try {
            if (error.length() == 0) {
                switch (command) {
                    case "insert":
                        productDAO.add(new Product(Long.parseLong((id1)),Long.parseLong(id),name,Double.parseDouble(gia),anh,ta));
                        url = "/adminqlsp.jsp";
                        break;
                    case "update":
                        productDAO.edit(new Product(Long.parseLong(request.getParameter("product_id")),Long.parseLong(id),name,Double.parseDouble(gia),anh,ta));
                        url = "/adminqlsp.jsp";
                        break;
                }
            } else {
                url = "/isert_sp.jsp";
            }
        } catch (Exception e) {
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }

}
