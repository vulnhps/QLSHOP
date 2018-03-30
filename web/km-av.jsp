<%-- 
    Document   : km-av
    Created on : Oct 10, 2017, 2:49:04 AM
    Author     : HoaiVu
--%>

<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page import="hv.model.Product"%>
<%@page import="hv.dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Khuyến mãi</title>
    </head>
    <body>
        <%
            ProductDAO productDAO = new ProductDAO();
            Product qq = new Product();
            String aa = "";
            if (request.getParameter("product_id") != null) {
                aa = request.getParameter("product_id");
                qq = productDAO.getProduct(Long.parseLong(aa));
            }
        %>
        <%@include file="includes/header-av.jsp" %>        
        
        <div class="container_fullwidth">
            <div class="container">
                <div class="hot-products">
                    <h3 class="title"><strong>Sản phẩm</strong> đang khuyến mãi </h3>
                    <br><br><br><br><br><br>
                    <div class="control"><a id="prev_hot" class="prev" href="#">&lt;</a><a id="next_hot" class="next" href="#">&gt;</a></div>
                    <ul id="hot">
                        <li>                           
                            <div class="row">
                                <%
                                    Hashtable newproducts = productDAO.selectall();
                                    Enumeration enumnewproducts = newproducts.elements();
                                    while (enumnewproducts.hasMoreElements()) {
                                        Product product = (Product) enumnewproducts.nextElement();
                                %>
                                <div class="col-md-3 col-sm-6">
                                    <div class="products">
                                        <div class="offer">-5%</div>
                                        <div class="thumbnail"><a href="single.jsp?product_id=<%=product.getProduct_id()%>"><img src="images/<%=product.getProduct_img()%>" alt="Product Name"></a></div>
                                        <div class="productname"><%=product.getProduct_name()%></div>
                                        <h4 class="price">$<%=product.getProduct_price()%></h4>         
                                        <div class="button_group">
                                            <form action="controllerCa" >
                                                <button class="button add-cart" type="submit" value ="" name ="action">
                                                    <a href="controllerCa?command=plus&product_id=<%=product.getProduct_id()%>">Thêm vào giỏ hàng</a>
                                                </button>                                                
                                            </form>
                                        </div>
                                    </div>

                                </div> 
                                <%
                                    }
                                %>      
                            </div>
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
        
        <%@include file="includes/footer.jsp" %>
    </body>
</html>
