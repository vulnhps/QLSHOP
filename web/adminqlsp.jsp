<%-- 
    Document   : adminqlsp
    Created on : Oct 10, 2017, 2:55:55 AM
    Author     : HoaiVu
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="hv.model.Product"%>
<%@page import="hv.dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý sản phẩm</title>
    </head>
    <body id="home">  
        <div class="wrapper">
        <%
            ProductDAO proDAO = new ProductDAO();
            ArrayList<Product> listPro = proDAO.getListPro();
        %>
            
        <%@include file="/admin/header-admin.jsp" %> 
            <h3 class="title" style="color: red ; margin: 10px">Quản trị - Quản lý sản phẩm</h3>
        <br><br><br><br>
        <div class="container_fullwidth">
            <div class="container shopping-cart">
                <div class="row">
                    <div class="col-md-12">                      
                        <div class="clearfix">
                        </div>

                        <table class="shop-table">
                            <br><br>
                            <thead>
                                <tr>
                                    <th style="width: 80px ;font-weight: bold" >
                                        Thứ tự
                                    </th>
                                    <th style="width: 120px ; font-weight: bold">
                                        Mã sản phẩm
                                    </th>
                                    <th style="font-weight: bold">
                                        Mã danh mục
                                    </th>
                                    <th style="width:150px ; font-weight: bold">
                                        Hình ảnh
                                    </th>
                                    <th style="width: 180px ; font-weight: bold">
                                        Tên sản phẩm                                        
                                    </th>
                                    <th style="width: 250px ; font-weight: bold">
                                        Mô tả sản phẩm                  
                                    </th>                                                                                            
                                    <th style="width: 100px ;font-weight: bold">                                        
                                        Giá
                                    </th>
                                    <th style="font-weight: bold">
                                        Tùy chọn
                                    </th>
                                </tr>                
                            </thead>

                            <tbody>
                                <%
                                    int count = 0;
                                    for (Product ss : listPro) {
                                        count++;
                                %>
                                <tr>
                                    <td style=" width: 80px">
                                        <%=count%>
                                    </td>
                                    <td style=" width: 120px">
                                        <%=ss.getProduct_id()%>                                       
                                    </td>
                                    <td>
                                        <%=ss.getCategory_id()%>
                                    </td>
                                    <td style="width:150px">
                                        <img src="images/<%=ss.getProduct_img()%>">                                        
                                    </td> 
                                    <td style="width: 180px">                     
                                        <%=ss.getProduct_name()%>
                                    </td>
                                    <td style="width: 250px">                                        
                                         <%=ss.getProduct_des()%>   
                                    </td>                                                                                                                                           
                                    <td >
                                        <%=ss.getProduct_price()%> $
                                    </td>
                                    <td>
                                        <a href="update_sp.jsp?command=update&product_id=<%=ss.getProduct_id()%>
                                           &category_id=<%=ss.getCategory_id()%>
                                           &product_img=<%=ss.getProduct_img()%>
                                           &product_name=<%=ss.getProduct_name()%>
                                           &product_description=<%=ss.getProduct_des()%>
                                           &product_price=<%=ss.getProduct_price()%>"><img src="images/edit.png"></a>&nbsp;&nbsp; | &nbsp;&nbsp;
                                        <a href="ManagerProductServlet?command=delete&product_id=<%=ss.getProduct_id() %>">
                                            <img src="images/remove.png">
                                        </a>
                                    </td>
                                    <%}%>
                                </tr>

                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="6">
                                        <button class="pull-right" onclick="location.href = 'isert_sp.jsp'">
                                            Thêm sản phẩm
                                        </button>
                                        
                                    </td>
                                </tr>

                            </tfoot>

                        </table>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/admin/footer-admin.jsp" %> 
</div>        
    </body>
</html>
