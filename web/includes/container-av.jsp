<%-- 
    Document   : container
    Created on : Oct 8, 2017, 1:11:08 AM
    Author     : HoaiVu
--%>

<%@page import="java.util.*"%>
<%@page import="hv.dao.*"%>
<%@page import="hv.model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ProductDAO productDAO = new ProductDAO();
    CategoryDAO catDAO = new CategoryDAO();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>

        <%
            Product qq = new Product();
            String aa = "";
            if (request.getParameter("product_id") != null) {
                aa = request.getParameter("product_id");
                qq = productDAO.getProduct(Long.parseLong(aa));
            }
        %>

        <div class="container_fullwidth">
            <div class="container">
                <div class="hot-products">
                    <h3 class="title"><strong>Sản phẩm</strong> nổi bật </h3>
                    <div class="control"><a id="prev_hot" class="prev" href="#">&lt;</a><a id="next_hot" class="next" href="#">&gt;</a></div>
                    <ul id="hot">
                        <li> 
                            <form action="controllerCa">
                                <div class="row">
                                    <%
                                        Hashtable newproducts = productDAO.select44();
                                        Enumeration enumnewproducts = newproducts.elements();
                                        while (enumnewproducts.hasMoreElements()) {
                                            Product product = (Product) enumnewproducts.nextElement();
                                    %>
                                    <div class="col-md-3 col-sm-6">
                                        <div class="products">
                                            <div class="offer">Hot</div>
                                            <div class="thumbnail"><a href="single-av.jsp?product_id=<%=product.getProduct_id()%>"><img src="images/<%=product.getProduct_img()%>" alt="Product Name"></a></div>
                                            <div class="productname"><%=product.getProduct_name()%></div>
                                            <h4 class="price">$<%=product.getProduct_price()%></h4>
                                            <div class="button_group">
                                                <button class="button add-cart">
                                                    <a href="controllerCa?command=plus&product_id=<%=product.getProduct_id()%>">Thêm vào giỏ hàng</a>
                                                </button>                                                                                       
                                            </div>
                                        </div>                                         
                                    </div>
                                    <%}%> 
                                </div>
                            </form>
                        </li>
                        <li>
                            <form action="controllerCa">
                                <div class="row">
                                    <%
                                        Hashtable newprodu = productDAO.select05();
                                        Enumeration enumnewprodu = newprodu.elements();
                                        while (enumnewprodu.hasMoreElements()) {
                                            Product product = (Product) enumnewprodu.nextElement();
                                    %>
                                    <div class="col-md-3 col-sm-6">
                                        <div class="products">
                                            <div class="offer">Hot</div>
                                            <div class="thumbnail"><a href="single-av.jsp?product_id=<%=product.getProduct_id()%>"><img src="images/<%=product.getProduct_img()%>" alt="Product Name"></a></div>
                                            <div class="productname"><%=product.getProduct_name()%></div>
                                            <h4 class="price">$<%=product.getProduct_price()%></h4>
                                            <div class="button_group">
                                                <button class="button add-cart">
                                                    <a href="controllerCa?command=plus&product_id=<%=product.getProduct_id()%>">Thêm vào giỏ hàng</a>
                                                </button>                                                                                       
                                            </div>
                                        </div>
                                    </div>
                                    <%}%>
                                </div>
                            </form>
                        </li>
                    </ul>
                </div>
                <div class="clearfix"></div>
                <div class="featured-products">
                    <h3 class="title"><strong>Sản phẩm</strong> mới về</h3>
                    <div class="control"><a id="prev_featured" class="prev" href="#">&lt;</a><a id="next_featured" class="next" href="#">&gt;</a></div>
                    <ul id="featured">
                        <li>
                            <form action="controllerCa" >
                            <div class="row">
                                <%
                                    Hashtable newpro = productDAO.select15();
                                    Enumeration enumnewpro = newpro.elements();
                                    while (enumnewpro.hasMoreElements()) {
                                        Product product = (Product) enumnewpro.nextElement();
                                %>
                                <div class="col-md-3 col-sm-6">
                                    <div class="products">
                                        <div class="offer">New</div>
                                        <div class="thumbnail"><a href="single-av.jsp?product_id=<%=product.getProduct_id()%>"><img src="images/<%=product.getProduct_img()%>" alt="Product Name"></a></div>
                                        <div class="productname"><%=product.getProduct_name()%></div>
                                        <h4 class="price">$<%=product.getProduct_price()%></h4>
                                        <div class="button_group">
                                            <button class="button add-cart">
                                                <a href="controllerCa?command=plus&product_id=<%=product.getProduct_id()%>">Thêm vào giỏ hàng</a>
                                            </button>                                                                                       
                                        </div>
                                    </div>
                                </div> 
                                <%}%>
                            </div>
                            </form>
                        </li>                        
                    </ul>
                </div>
                <div class="clearfix"></div>
                <div class="our-brand">
                    <h3 class="title"><strong>Our </strong> Brands</h3>
                    <div class="control"><a id="prev_brand" class="prev" href="#">&lt;</a><a id="next_brand" class="next" href="#">&gt;</a></div>
                    <ul id="braldLogo">
                        <li>
                            <ul class="brand_item">
                                <li>
                                    <a href="#">
                                        <div class="brand-logo"><img src="images/envato.png" alt=""></div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="brand-logo"><img src="images/themeforest.png" alt=""></div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="brand-logo"><img src="images/photodune.png" alt=""></div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="brand-logo"><img src="images/activeden.png" alt=""></div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="brand-logo"><img src="images/envato.png" alt=""></div>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <ul class="brand_item">
                                <li>
                                    <a href="#">
                                        <div class="brand-logo"><img src="images/envato.png" alt=""></div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="brand-logo"><img src="images/themeforest.png" alt=""></div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="brand-logo"><img src="images/photodune.png" alt=""></div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="brand-logo"><img src="images/activeden.png" alt=""></div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="brand-logo"><img src="images/envato.png" alt=""></div>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>
