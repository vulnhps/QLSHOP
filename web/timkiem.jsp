<%-- 
    Document   : timkiem
    Created on : Oct 16, 2017, 9:03:04 PM
    Author     : HoaiVu
--%>

<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page import="hv.model.Products"%>
<%@page import="hv.model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
    </head>
    <body>
        <%
            Products ss = new Products();
            String qq = "";
            if (request.getParameter("product") != null) {
                qq = request.getParameter("product");
            }
                
            %>
        
         <%@include file="includes/header.jsp" %>
        <div class="container_fullwidth">
            <div class="container">
                <div class="hot-products">
                    <h3 class="title"><strong>Sản phẩm</strong> tìm gần giống </h3>
                    <div class="control"><a id="prev_hot" class="prev" href="#">&lt;</a><a id="next_hot" class="next" href="#">&gt;</a></div>
                    <ul id="hot">
                        <li>    
                            <form action="controllersearch" >
                                <div class="row">
                                    <%                                
                                    for (Product p : ss.show(qq)) {
                                %>
                                    <div class="col-md-3 col-sm-6">
                                        <div class="products">
                                            
                                            <div class="thumbnail"><a href="single.jsp?product_id=<%=p.getProduct_id()%>"><img src="images/<%=p.getProduct_img()%>" alt="Product Name"></a></div>
                                            <div class="productname"><%=p.getProduct_name()%></div>
                                            <h4 class="price">$<%=p.getProduct_price()%></h4>         
                                            <div class="button_group">
                                                <button class="button add-cart">
                                                    <a href="controllerCart?command=plus&product_id=<%=p.getProduct_id()%>">Thêm vào giỏ hàng</a>
                                                </button>                                               
                                            </div>
                                        </div>

                                    </div> 
                                    <%
                                        }
                                    %>      
                                </div>
                            </form>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
                                
                                
         <%@include file="includes/footer.jsp" %>
    </body>
</html>
