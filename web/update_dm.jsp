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
        <title>Cập nhật danh mục</title>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
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
        <h3 class="title" style="color: red ; margin: 10px">Quản trị - Quản lý danh mục - Cập nhật</h3>
        <br><br><br><br>
        <div class="container_fullwidth" style="height: 520px">
            <div class="container shopping-cart">
                <div class="row">
                    <div class="col-md-12"><br><br>                       
                        <div class="clearfix">
                        </div>
                        <form action="ManagerCategoryServlet" method="post">
                            <br><br><br><br><br><br><br><br>
                        <table class="shop-table">
                            <thead>
                                <tr>
                                    <th style="font-weight: bold">
                                        Tên danh mục
                                    </th>
                                                      
                                </tr>                
                            </thead>

                            <tbody>
                                
                                <tr>
                                    <td>
                                        <input type="text"  name="tendm">                        
                                    </td>                                     
                                </tr>
                                
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="6">                          
                                        <button class=" pull-right" type="hidden" name="command" value="update">
                                            <input type="hidden" name="categoryid" value="<%=request.getParameter("categoryid")%>">
                                            Cập nhật
                                        </button> 
                                            <button class=" pull-left">
                                                <a href="adminqldm.jsp">Back </a>                                                  
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
