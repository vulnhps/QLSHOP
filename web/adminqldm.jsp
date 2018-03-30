<%-- 
    Document   : adminqlnd
    Created on : Oct 10, 2017, 2:56:14 AM
    Author     : HoaiVu
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="hv.dao.CategoryDAO"%>
<%@page import="hv.model.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý danh mục</title>
    </head>
    <body id="home">
        <%
            CategoryDAO categoryDAO = new CategoryDAO();
            ArrayList<Category> listCategory = categoryDAO.getListCategory();
        %>
        <div class="wrapper">
        <%@include file="/admin/header-admin.jsp" %> 
        <h3 class="title" style="color: red ; margin: 10px">Quản trị - Quản lý danh mục</h3>
        <br><br><br><br>
        <div class="container_fullwidth" >
            <div class="container shopping-cart">
                <div class="row">
                    <div class="col-md-12"><br><br>                        
                        <div class="clearfix">
                        </div>

                        <br><br>
                        <br><br>
                        <table class="shop-table">
                            <thead>
                                <tr>
                                    <th style="font-weight: bold">
                                        Thú tự
                                    </th>
                                    <th style="font-weight: bold">
                                        Mã danh mục
                                    </th>
                                    <th style="font-weight: bold">
                                        Tên danh mục
                                    </th>
                                    <th style="font-weight: bold">
                                        Tùy chọn
                                    </th>                   
                                </tr>                
                            </thead>

                            <tbody>
                                <%
                                    int count = 0;
                                    for (Category category : listCategory) {
                                        count++;
                                %>
                                <tr>
                                    <td>
                                        <%=count%>  
                                    </td>
                                    <td>
                                        <%=category.getId()%>
                                    </td>
                                    <td>
                                        <%=category.getName()%>
                                    </td>
                                    <td >                     
                                        <a href="update_dm.jsp?command=update&categoryid=<%=category.getId()%>&categoryname=<%=category.getName()%>"><img src="images/edit.png"></a>&nbsp;&nbsp; | &nbsp;&nbsp;
                                        <a href="ManagerCategoryServlet?command=delete&categoryid=<%=category.getId()%>"><img src="images/remove.png"></a>
                                    </td>
                                </tr>
                                <%}%>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="6">                          
                                        <button class=" pull-right" onclick="location.href = 'isert_dm.jsp'">
                                            Thêm danh mục
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
