<%-- 
    Document   : isert_sp
    Created on : Oct 12, 2017, 2:16:42 AM
    Author     : HoaiVu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm sản phẩm</title>
    </head>
    <body id="home">
        <div class="wrapper">
        <%@include file="/admin/header-admin.jsp" %> 
        <h3 class="title" style="color: red ; margin: 10px">Quản trị - Quản lý sản phẩm - Thêm sản phẩm</h3>
        <br><br><br><br>
        <div class="container_fullwidth" style="height: 520px">
            <div class="container shopping-cart">
                <div class="row">
                    <div class="col-md-12"><br><br>                       
                        <div class="clearfix">
                        </div>
                        <form action="ManagerProductServlet" method="post">
                            <br><br><br><br>
                            <table class="shop-table">                              
                                <tbody>

                                    <tr>
                                        <td>
                                            <h7 style="font-weight: bold"> Mã sản phẩm :</h7><input type="text"  name="idsp" style="margin-left: 100px" value="<%=request.getParameter("product_id")%>"> <br/> <br/>
                                            <h7 style="font-weight: bold"> Mã danh mục :</h7><input type="text"  name="iddm" style="margin-left: 100px" value="<%=request.getParameter("category_id")%>"> <br/> <br/>                                           
                                            <h7 style="font-weight: bold"> Tên sản phẩm :</h7><input type="text"  name="tensp" style="margin-left: 95px" value="<%=request.getParameter("product_name")%>"><br/> <br/>
                                            <h7 style="font-weight: bold"> Mô tả sản phẩm :</h7><input type="text"  name="motasp" style="margin-left: 88px" value="<%=request.getParameter("product_description")%>"><br/> <br/>
                                            <h7 style="font-weight: bold"> Giá sản phẩm :</h7><input type="text"  name="gia" style="margin-left: 100px" value="<%=request.getParameter("product_price")%>"><br/> <br/>
                                            <h7 style="margin-right: 310px ;font-weight: bold"> Hình ảnh :</h7>   <input type="file" style="margin-left: 555px" name="file" value="<%=request.getParameter("product_img")%>">
                                        </td>
                                         
                                    </tr>

                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="6">                          
                                            <button class=" pull-right">
                                                <input type="hidden" name="command" value="insert">
                                                Thêm sản phẩm
                                            </button>
                                            <button class=" pull-left">
                                                <a href="adminqlsp.jsp">Back </a>                                                  
                                            </button>
                                        </td>
                                    </tr>
                                </tfoot>

                            </table> 
                        </form>
                    </div>
                </div>
            </div>
        </div>	
        <%@include file="/admin/footer-admin.jsp" %>
        </div>
    </body>
</html>
