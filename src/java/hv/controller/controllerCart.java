/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hv.controller;

import hv.dao.ProductDAO;
import hv.model.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 *
 * @author HoaiVu
 */
@WebServlet(name = "controllerCart", urlPatterns = {"/controllerCart"})
public class controllerCart extends HttpServlet {

    private final ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String command = request.getParameter("command");
        String productID = request.getParameter("product_id");
        Cart cart = (Cart) session.getAttribute("cart");
        try {
            Long proid = Long.parseLong(productID);
            Product pro = productDAO.getProduct(proid);
            switch (command) {
                case "plus":
                    if (cart.getCartItems().containsKey(proid)) {
                        cart.addSanPham(proid,
                                new Item(pro, cart.getCartItems().get(proid).getQuantity()));

                    } else {
                        cart.addSanPham(proid, new Item(pro, 1));
                    }
                    break;
                case "update":
                    
                        cart.subSP(proid,
                                new Item(pro, cart.getCartItems().get(proid).getQuantity()));

                   
                    break;
                    
                case "remove":
                    cart.removeSanPham(proid);                    
                    break;

            }
            
            

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/SOF301_ASM_vulnhps05401/index.jsp");
        }
        session.setAttribute("cart", cart);
        response.sendRedirect("/SOF301_ASM_vulnhps05401/index.jsp");
    }

}
