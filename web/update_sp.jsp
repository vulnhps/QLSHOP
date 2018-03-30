<%-- 
    Document   : update_sp
    Created on : Oct 11, 2017, 11:54:44 PM
    Author     : HoaiVu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cập nhật sản phẩm</title>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
    </head>
    <body>
        
        <%@include file="/admin/header-admin.jsp" %> 
        <div class="container_fullwidth" style="height: 520px">
            <div class="container shopping-cart">
                <div class="row">
                   <p align="center" style="color: red; font-size: 30px ; margin-top: 100px">Chức năng đang tạm khóa để nâng cấp<br>
                   <p align="center" style="color: blue; font-size: 30px ; margin-top: 50px">Nhấn vào <a href="adminqlsp.jsp" style="color: red">đây</a> để quay lại<br> 
                    
                 </div>
             </div>
       </div>	
         <%@include file="/admin/footer-admin.jsp" %>
     </body>
 </html>
