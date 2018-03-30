<%-- 
    Document   : isert_dm
    Created on : Oct 10, 2017, 4:36:44 AM
    Author     : HoaiVu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm danh mục</title>
    </head>
    <body id="home">
        <%
            String error = "";
            if(request.getParameter("error")!=null){
                error = (String) request.getParameter("error");
            }
        %>
                <div class="wrapper">

        <%@include file="/admin/header-admin.jsp" %> 
        <h3 class="title" style="color: red ; margin: 10px">Quản trị - Quản lý danh mục - Thêm danh mục</h3>
        <br><br><br><br>
        <div class="container_fullwidth" style="height:  500px">
            <div class="container shopping-cart">
                <div class="row">
                    <div class="col-md-12">                       
                        <div class="clearfix">
                        </div>

                        <form action="ManagerCategoryServlet" method="post">
                        <table class="shop-table">
                            <br><br><br><br><br><br><br><br><br><br><br><br>
                            <thead>
                                <tr>
                                    <th style="font-weight: bold">
                                        Mã danh mục
                                    </th>
                                    <th style="font-weight: bold">
                                        Tên danh mục
                                    </th>
                                                      
                                </tr>                
                            </thead>

                            <tbody>
                                
                                <tr>
                                    <td>
                                        <input type="text"  name="iddm" value="<%=request.getParameter("categoryid")%>"> 
                                        
                                    </td>
                                    
                                    <td>
                                        <input type="text"  name="tendm" value="<%=request.getParameter("categoryname")%>"> 
                                        
                                    </td>                                   
                                </tr>
                                
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="6">  
        
                                        <button class=" pull-right">
                                            <input type="hidden" name="command" value="insert">
                                             Thêm
                                        </button >
                                        
                                      
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
