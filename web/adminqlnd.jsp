<%-- 
    Document   : adminsqlhd
    Created on : Oct 10, 2017, 2:57:11 AM
    Author     : HoaiVu
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="hv.dao.UserDAO"%>
<%@page import="hv.model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý người dùng</title>
    </head>
    <body id="home">
        <%
            UserDAO userDAO = new UserDAO();
            ArrayList<Users> listUser = userDAO.getListUsers();
        %>
        
        <div class="wrapper">
        <%@include file="/admin/header-admin.jsp" %> 
        <h3 class="title" style="color: red ; margin: 10px">Quản trị - Quản lý người dùng</h3>
        <br><br><br><br>
        <div class="container_fullwidth">  
            <h2 style="color: chocolate ; font-size: 50px" align="center">Thông tin người dùng</h2>
            <div class="container shopping-cart">
                <div class="row">
                    <div class="col-md-12">                       
                        <div class="clearfix">
                        </div>
                        <br><br><br><br>
                        <table class="shop-table">
                            <thead>
                                <tr>
                                    <th style="width: 50px ; font-weight: bold">
                                        Thứ tự
                                    </th>
                                    <th style="width: 120px ; font-weight: bold">
                                        Tên tài khoản
                                    </th>
                                    <th style=" font-weight: bold">
                                        Mật khẩu
                                    </th>
                                    <th style="width:210px ; font-weight: bold">
                                        Họ và tên 
                                    </th>
                                    <th style="width: 20px ; font-weight: bold">
                                        Quyền                                       
                                    </th>
                                    <th style="width: 250px ; font-weight: bold">
                                        Email                
                                    </th>                                                                                            
                                    <th style="width: 70px ; font-weight: bold">                                        
                                        Địa chỉ
                                    </th>
                                    <th style="width: 170px ; font-weight: bold">                                        
                                        Số điện thoại
                                    </th>
                                    <th style="width: 90px ; font-weight: bold">
                                        Tùy chọn
                                    </th>
                                </tr>                
                            </thead>

                            <tbody>
                                <%
                                    int count = 0;
                                    for (Users ss : listUser) {
                                        count++;
                                %>
                                <tr>
                                    <td style=" width: 50px">
                                        <%=count%>
                                    </td>
                                    <td style=" width: 120px">
                                        <%=ss.getUser()%>
                                    </td>
                                    <td>
                                        <%=ss.getPass()%>
                                    </td>
                                    <td style="width:200px">
                                         <%=ss.getLast()%>
                                       
                                    </td> 
                                    <td style="width: 70px">  
                                        <%=ss.getRole()%>
                                    </td>
                                    <td style="width: 250px">                                        
                                        <%=ss.getEmail()%>    
                                    </td>                                                                                                                                           
                                    <td style="width: 100px">
                                        <%=ss.getAddres()%> 
                                    </td>
                                    <td style="width: 150px">
                                        <%=ss.getPhone()%> 
                                    </td>
                                    <td>
                                        <a href="update_nd.jsp?command=update&username=<%=ss.getUser()%>&<%=ss.getPass()%>&<%=ss.getLast()%>&<%=ss.getRole()%>&<%=ss.getEmail()%>&<%=ss.getAddres()%>&<%=ss.getPhone()%>"><img src="images/edit.png"></a>&nbsp;&nbsp; | &nbsp;&nbsp;
                                        <a href="ManagerUsersServlet?command=delete&username=<%=ss.getUser()%>">
                                            <img src="images/remove.png">
                                        </a>
                                    </td>
                                    <%}%>
                                </tr>

                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="6">
                                        <button class="pull-right" onclick="location.href = 'isert_nd.jsp'">
                                            Thêm người dùng
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
