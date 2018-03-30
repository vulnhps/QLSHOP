<%-- 
    Document   : single
    Created on : Oct 8, 2017, 10:14:21 PM
    Author     : HoaiVu
--%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page import="hv.model.Product"%>
<%@page import="hv.dao.ProductDAO"%>
<%
    ProductDAO productDAO = new ProductDAO();
    Product qq = new Product();
    String aa = "";
    if (request.getParameter("product_id") != null) {
        aa = request.getParameter("product_id");
        qq = productDAO.getProduct(Long.parseLong(aa));
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chi tiết sản phẩm</title>
    </head>
    <body>
        <%@include  file="includes/header.jsp" %>

        <div class="container_fullwidth">
            <div class="container">
                <div class="row">
                    <div class="col-md-9">
                        <div class="products-details">
                            <div class="preview_image">
                                <div class="preview-small" style="margin-left: 80px">
                                    <img id="zoom_03" src="images/<%= qq.getProduct_img()%>" />
                                </div>

                            </div>
                            <div class="products-description">
                                <h5 class="name">
                                    <%= qq.getProduct_name()%>
                                </h5>
                                <p>
                                    <img alt="" src="images/star.png">
                                    <a class="review_num" href="#">
                                        02 Review(s)
                                    </a>
                                </p>
                                <p>
                                    Màu sản phẩm : 
                                    <span class=" light-red">
                                        auto
                                    </span>
                                </p>
                                <p>
                                    Size sản phẩm : 
                                    <span class=" light-red">
                                        hên xui
                                    </span>
                                </p>
                                <hr class="border">
                                <div class="price">
                                    Giá sản phẩm &nbsp;&nbsp;: 
                                    <span class="new_price">
                                        <%= qq.getProduct_price()%>
                                        <sup>
                                            $
                                        </sup>
                                    </span>                    
                                </div>
                                <hr class="border">
                                <div class="wided">                    
                                    <div class="qty">                               
                                        Số lượng &nbsp;&nbsp;: &nbsp;&nbsp;                                        
                                        <select >
                                            <option value="1">1</option>                                           
                                        </select>                              
                                    </div>
                                    <div class="button_group">
                                        <button class="button" >
                                            <a href="controllerCart?command=plus&product_id=<%=qq.getProduct_id()%>">
                                                Thêm vào giỏ hàng</a>
                                        </button>                     
                                        <button class="button favorite">
                                            <i class="fa fa-envelope-o">
                                            </i>
                                        </button>
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>
                                <hr class="border">
                                <img src="images/share.png" alt="" class="pull-right">
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>
                        <div class="tab-box">
                            <div id="tabnav">
                                <ul>
                                    <li>
                                        <a href="#">
                                            Mô tả sản phẩm
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#Review">
                                            Review
                                        </a>
                                    </li>                    
                                </ul>
                            </div>
                            <div class="tab-content-wrap">
                                <div class="tab-content" id="Descraption">
                                    <p>                     
                                        <%= qq.getProduct_des()%>
                                    </p>
                                </div>                  
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>
                        <div id="productsDetails" class="hot-products">
                            <h3 class="title">
                                <strong>
                                    Sản phẩm 
                                </strong>
                                được quan tâm nhiều nhất
                            </h3>
                            <div class="control"></div>
                            <ul id="hot">
                                <li>
                                    <div class="row">
                                        <%
                                            Hashtable newproducts = productDAO.select05();
                                            Enumeration enumnewproducts = newproducts.elements();
                                            while (enumnewproducts.hasMoreElements()) {
                                                Product product = (Product) enumnewproducts.nextElement();
                                        %>
                                        <div class="col-md-4 col-sm-4">
                                            <div class="products">                          
                                                <div class="thumbnail">
                                                    <a href="single.jsp?product_id=<%=product.getProduct_id()%>">
                                                        <img src="images/<%=product.getProduct_img()%>" alt="Product Name">
                                                    </a>
                                                </div>
                                                <div class="productname">
                                                    <%=product.getProduct_name()%>
                                                </div>
                                                <h4 class="price">
                                                    $<%=product.getProduct_price()%>
                                                </h4>
                                                <div class="button_group">
                                                    <button class="button add-cart" type="button">
                                                        <a href="controllerCart?command=plus&product_id=<%=product.getProduct_id()%>">
                                                            Thêm vào giỏ hàng</a>
                                                    </button>

                                                </div>
                                            </div>                      
                                        </div>
                                        <%}%> 
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="col-md-3">

                        <div class="clearfix">
                        </div>
                        <div class="product-tag leftbar">
                            <h3 class="title">
                                Products 
                                <strong>
                                    Tags
                                </strong>
                            </h3>
                            <ul>
                                <li>
                                    <a href="#">
                                        Loli
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        BB
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        Yuri
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        Ecchi
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        Mecha
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        JP
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        Hentai
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        Shounen
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="clearfix">
                        </div>
                        <div class="get-newsletter leftbar">
                            <h3 class="title">
                                Get 
                                <strong>
                                    newsletter
                                </strong>
                            </h3>
                            <p>
                                Casio G Shock Digital Dial Black.
                            </p>
                            <form>
                                <input class="email" type="text" name="" placeholder="Your Email...">
                                <input class="submit" type="submit" value="Submit">
                            </form>
                        </div>
                        <div class="clearfix"></div>          
                    </div>
                </div>
                <div class="clearfix">
                </div>
                <div class="our-brand">
                    <h3 class="title">
                        <strong>
                            Our 
                        </strong>
                        Brands
                    </h3>
                    <div class="control">
                        <a id="prev_brand" class="prev" href="#">
                            &lt;
                        </a>
                        <a id="next_brand" class="next" href="#">
                            &gt;
                        </a>
                    </div>
                    <ul id="braldLogo">
                        <li>
                            <ul class="brand_item">
                                <li>
                                    <a href="#">
                                        <div class="brand-logo">
                                            <img src="images/envato.png" alt="">
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="brand-logo">
                                            <img src="images/themeforest.png" alt="">
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="brand-logo">
                                            <img src="images/photodune.png" alt="">
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="brand-logo">
                                            <img src="images/activeden.png" alt="">
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="brand-logo">
                                            <img src="images/envato.png" alt="">
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <ul class="brand_item">
                                <li>
                                    <a href="#">
                                        <div class="brand-logo">
                                            <img src="images/envato.png" alt="">
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="brand-logo">
                                            <img src="images/themeforest.png" alt="">
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="brand-logo">
                                            <img src="images/photodune.png" alt="">
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="brand-logo">
                                            <img src="images/activeden.png" alt="">
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="brand-logo">
                                            <img src="images/envato.png" alt="">
                                        </div>
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
