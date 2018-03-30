<%-- 
    Document   : header-admin
    Created on : Oct 8, 2017, 2:35:41 AM
    Author     : HoaiVu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>

        <div class="header">
            <div class="container">
                <div class="row">
                    <div class="col-md-2 col-sm-2">
                        <div class="logo"><a href="index.jsp"><img src="images/logo.png" alt="FlatShop"></a></div>
                    </div>
                    <div class="col-md-10 col-sm-10">
                        <div class="header_top">
                            <div class="row">
                                <div class="col-md-3">
                                    <ul class="option_nav"></ul>
                                </div>
                                <div class="col-md-6">
                                    <ul class="topmenu"></ul>
                                </div>
                                <div class="col-md-3">
                                    <ul class="usermenu">
                                        <c:if test="${sessionScope['tendaydu']!=null}">
                                            <b style="color: white">Xin chào :</b> <font color="yellow">${sessionScope['tendaydu']}</font>
                                        </c:if>
                                        <c:if test="${sessionScope['tendaydu']!=null}">
                                            <a href="index.jsp">Logout</a>
                                        </c:if>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="header_bottom">
                            <ul class="option">
                                
                            </ul>
                            <div class="navbar-header"><button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button></div>
                            <div class="navbar-collapse collapse">
                                <ul class="nav navbar-nav">
                                    <li><a href="welcome.jsp">Trang chủ</a></li>
                                    <li><a href="adminqldm.jsp">Quản lý danh mục</a></li>
                                    <li><a href="adminqlsp.jsp">Quản lý sản phẩm</a></li>                                   
                                    <li><a href="adminqlnd.jsp">Quản lý người dùng</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
