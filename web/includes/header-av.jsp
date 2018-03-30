<%-- 
    Document   : header-av
    Created on : Oct 8, 2017, 12:37:51 PM
    Author     : HoaiVu
--%>

<%@page import="java.util.Map"%>
<%@page import="hv.model.Item"%>
<%@page import="hv.model.Cart"%>
<%@page import="hv.model.Category"%>
<%@page import="hv.dao.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
            CategoryDAO categoryDAO = new CategoryDAO();
        %>
        
        <div class="header">
            <div class="container">
                <div class="row">
                    <div class="col-md-2 col-sm-2">
                        <div class="logo"><a href="welcome.jsp"><img src="images/logo.png" alt="FlatShop"></a></div>
                    </div>
                    <div class="col-md-10 col-sm-10">
                        <div class="header_top">
                            <div class="row">
                                <div class="col-md-3">
                                    <ul class="option_nav"></ul>
                                </div>
                                <div class="col-md-6">
                                    <ul class="topmenu"></ul>
                                </div>
                                <div class="col-md-3">
                                    <ul class="usermenu">
                                        <c:if test="${sessionScope['tendaydu']!=null}">
                                            <b style="color: white">Xin chào :</b><font color="yellow">${sessionScope['tendaydu']}</font>
                                        </c:if>
                                        <c:if test="${sessionScope['tendaydu']!=null}">
                                            <a href="index.jsp">Logout</a>
                                        </c:if>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="header_bottom">
                            <ul class="option">
                                <li id="search" class="search">
                                    <form>
                                        <input class="search-submit" type="submit" value="" name="action">
                                        <input class="search-input" placeholder="Enter your search term..." type="text" value="" name="txtTenSP"></form>
                                </li>
                                <li class="option-cart">
                                    <%  
                                        Cart car = (Cart) session.getAttribute("cart");
                                        if (car == null) {
                                            car = new Cart();
                                            session.setAttribute("cart", car);
                                        }
                                    %>
                                    <a href="#" class="cart-icon"></a><span class="cart_no"><%=car.countItem()%></span>
                                    
                                    <ul class="option-cart-item">
                                        <li>        
                                            <div class="cart-item">
                                                 <%for (Map.Entry<Long, Item> list : car.getCartItems().entrySet()) {%>                                              
                                                <div class="item-description">
                                                    <p class="name">
                                                        <%=list.getValue().getProduct().getProduct_name()%>
                                                    </p>
                                                    <p>                                                       
                                                        Số lượng : 
                                                        <span class="light-red">
                                                            <%=list.getValue().getQuantity()%>
                                                        </span>
                                                    </p>
                                                </div>
                                                <div class="image">
                                                    <img src="images/<%=list.getValue().getProduct().getProduct_img()%>" alt="">
                                                </div>        
                                                <div class="right">
                                                    <p class="price">
                                                        $<%=list.getValue().getProduct().getProduct_price()%>
                                                    </p>
                                                    <a href="controllerCa?command=remove&product_id=<%=list.getValue().getProduct().getProduct_id()%>" class="remove">
                                                        <img src="images/remove.png" alt="remove">
                                                    </a>
                                                </div>
                                                        <%}%>
                                            </div>
                                            
                                        </li>
                                        
                                        <li>
                                            <span class="total">
                                                Tổng :  
                                                <strong>
                                                    $<%=car.totalCart() %>
                                                </strong>
                                            </span>
                                            <button class="checkout" onClick="location.href = 'cart-av.jsp'">
                                                Kiểm tra
                                            </button>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                            <div class="navbar-header"><button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button></div>
                            <div class="navbar-collapse collapse">
                                <ul class="nav navbar-nav">
                                    <li><a href="index.jsp">Trang chủ</a></li>

                                    <li class="dropdown">
                                        <a href="#">Danh mục</a>
                                        <div class="dropdown-menu mega-menu">

                                            <ul class="mega-menu-links">
 
                                                <%
                                                        for (Category c : categoryDAO.getListCategory()) {
                                                    %>
                                                    <li><a href="product-av.jsp?category=<%=c.getId()%>"><%=c.getName()%></a></li>
                                                        <%
                                                            }
                                                        %>
                                            </ul>
                                        </div>
                                    </li>
                                    <li><a href="km-av.jsp">Khuyến mãi</a></li>                                   
                                    <li><a href="gioithieu.jsp">Giới thiệu</a></li>
                                    <li><a href="lienhe.jsp">Liên hệ</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
