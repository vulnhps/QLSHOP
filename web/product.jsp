<%-- 
    Document   : product
    Created on : Oct 9, 2017, 3:25:40 AM
    Author     : HoaiVu
--%>

<%@page import="hv.dao.ProductDAO"%>
<%@page import="hv.model.Product"%>
<%@page import="hv.model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sản phẩm</title>
    </head>
    <body>     
        <%
            ProductDAO ss = new ProductDAO();
            String qq = "";
            if (request.getParameter("category") != null) {
                qq = request.getParameter("category");
            }

        %>

        <%@include file="includes/header.jsp" %>

        <div class="container_fullwidth">
            <div class="container">
                <div class="hot-products">                    
                    <h3 class="title"><strong>Sản phẩm</strong> quan tâm</h3>     
                    <br><br><br><br><br><br>
                    <div class="control"><a id="prev_hot" class="prev" href="#">&lt;</a><a id="next_hot" class="next" href="#">&gt;</a></div>
                    <ul id="hot">
                        <form action="controllerCart" >
                            <div class="row"> 
                                <%                                
                                    for (Product p : ss.getListProductByCategory(Long.parseLong(qq))) {
                                %>                                       
                                <div class="col-md-3 col-sm-6">
                                    <div class="products">
                                        <div class="offer">Hot</div>
                                        <div class="thumbnail"><a href="single.jsp?product_id=<%=p.getProduct_id()%>">
                                                <img src="images/<%=p.getProduct_img()%>" alt="<%=p.getProduct_name()%>">
                                            </a></div>
                                        <div class="productname"><%=p.getProduct_name()%></div>
                                        <h4 class="price">$<%=p.getProduct_price()%></h4>
                                        <div class="button_group">
                                            <button class="button add-cart">
                                                <a href="controllerCart?command=plus&product_id=<%=p.getProduct_id()%>">Thêm vào giỏ hàng</a>
                                            </button>
                                        </div>                                                                         
                                    </div>              
                                </div>
                                <%}%>                                            
                            </div>
                        </form>
                    </ul>                         
                </div>
            </div>
        </div>

        <%@include file="includes/footer.jsp" %>

    </body>
</html>
