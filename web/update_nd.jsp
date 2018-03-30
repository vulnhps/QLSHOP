<%-- 
    Document   : update_nd
    Created on : Oct 13, 2017, 2:15:40 AM
    Author     : HoaiVu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body id="home">
        <div class="wrapper">
            <%@include file="/admin/header-admin.jsp" %> 
            <h3 class="title" style="color: red ; margin: 10px">Quản trị - Quản lý người dùng - Cập nhật</h3>
            <br><br><br><br>           
            <div class="container_fullwidth" style="height: 520px">
                <h2 style="color: purple ; font-size: 50px" align="center">Sửa đổi thông tin</h2>
                <div class="container shopping-cart">
                    <div class="row">
                        <div class="col-md-12"><br><br>                       
                            <div class="clearfix">
                            </div>
                            <form action="ManagerUsersServlet" method="post">
                                
                                <table class="shop-table">
                                    <thead></thead>                                    
                                    <tbody>

                                        <tr><td>                                   
                                    <h7 style="font-weight: bold"> Mật khẩu :</h7><input type="text"  name="password" style="margin-left: 75px" value="<%=request.getParameter("password")%>"> <br/> <br/>                                           
                                    <h7 style="font-weight: bold"> Họ và tên :</h7><input type="text"  name="fullname" style="margin-left: 70px" value="<%=request.getParameter("fillname")%>"><br/> <br/>
                                    <h7 style="font-weight: bold "> Quyền :</h7> <select name="role" style="margin-left:   80px ;margin-top: 5px ; width: 190px" value="<%=request.getParameter("role")%>">
                                                                <option selected>1
                                                                </option><option>0</option></select><br/> <br/>
                                    <h7 style="font-weight: bold"> Email :</h7><input type="text"  name="email" style="margin-left: 90px" value="<%=request.getParameter("email")%>"><br/> <br/>
                                    <h7 style="font-weight: bold"> Địa chỉ :</h7><input type="text"  name="address" style="margin-left: 90px" value="<%=request.getParameter("address")%>"><br/> <br/>
                                    <h7 style="font-weight: bold"> Số điện thoại:</h7><input type="text"  name="phone" style="margin-left: 60px" value="<%=request.getParameter("phone")%>"><br/> <br/>                                    
                                        </td></tr>

                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td colspan="6">                          
                                                <button class=" pull-right" type="hidden" name="command" value="update">
                                                    <input type="hidden" name="username" value="<%=request.getParameter("username")%>">
                                                    Cập nhật
                                                </button> 
                                                <button class=" pull-left">
                                                    <a href="adminqlnd.jsp">Back </a>                                                  
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
