<%-- 
    Document   : login
    Created on : Oct 8, 2017, 1:59:01 AM
    Author     : HoaiVu
--%>

<%@page import="hv.model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập</title>
    </head>
    <body id="home">
        <%@include file="includes/header.jsp" %>

        <div class="container_fullwidth">
            <div class="container">
                <div class="row">                   
                    <div class="col-md-9" style="width: 100%">
                        <div class="checkout-page">
                            <ol class="checkout-steps">
                                <li class="steps active">
                                    <a href="login.jsp" class="step-title">
                                        01. Đăng nhập
                                    </a>
                                    <div class="step-description">
                                        <div class="row">                                           
                                            <div class="col-md-6 col-sm-6">
                                                <div class="run-customer">
                                                    <h5>
                                                        Đăng nhập vào trang
                                                    </h5>
                                                    <form action="controllerLogin" method="post">
                                                        ${requestScope['msg']}
                                                        <div class="form-row">
                                                            <label class="lebel-abs">
                                                                Tài khoản 
                                                                <strong class="red">
                                                                    *
                                                                </strong>
                                                            </label>
                                                            <input type="text" class="input namefild" name="txtUser" value="${cookie['User'].value}">
                                                            <font color="red">${requestScope.userNameloi}</font>
                                                        </div>
                                                        <div class="form-row">
                                                            <label class="lebel-abs">
                                                                Mật khẩu 
                                                                <strong class="red">
                                                                    *
                                                                </strong>
                                                            </label>
                                                            <input type="text" class="input namefild" name="txtPass" value="${cookie['Pass'].value}">
                                                            <font color="red">${requestScope.userpasswordloi}</font>
                                                        </div>

                                                        <div class="form-row">
                                                            <input type="checkbox" name="chkGhiNho" ${empty cookie['User'] ? '': 'checked'} />
                                                            Nhớ tài khoản
                                                        </div> 
                                                        <button type="submit" value="Đăng nhập">
                                                            Đăng nhập
                                                        </button>
                                                        <button type="reset" value="Reset" name="Reset">
                                                            Reset
                                                        </button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="steps">
                                    <a href="register.jsp" class="step-title">
                                        02. Đăng ký thành viên
                                    </a>
                                </li>                              
                            </ol>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="our-brand">
                    <h3 class="title">
                        <strong>Nhãn hiệu</strong>                       
                    </h3>
                    <div class="control">
                        <a id="prev_brand" class="prev" href="#">
                            &lt;
                        </a>
                        <a id="next_brand" class="next" href="#">
                            &gt;
                        </a>
                    </div>
                    <ul id="braldLogo">
                        <li>
                            <ul class="brand_item">
                                <li>
                                    <a href="#">
                                        <div class="brand-logo">
                                            <img src="images/envato.png" alt="">
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="brand-logo">
                                            <img src="images/themeforest.png" alt="">
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="brand-logo">
                                            <img src="images/photodune.png" alt="">
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="brand-logo">
                                            <img src="images/activeden.png" alt="">
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="brand-logo">
                                            <img src="images/envato.png" alt="">
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <ul class="brand_item">
                                <li>
                                    <a href="#">
                                        <div class="brand-logo">
                                            <img src="images/envato.png" alt="">
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="brand-logo">
                                            <img src="images/themeforest.png" alt="">
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="brand-logo">
                                            <img src="images/photodune.png" alt="">
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="brand-logo">
                                            <img src="images/activeden.png" alt="">
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="brand-logo">
                                            <img src="images/envato.png" alt="">
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <%@include file="includes/footer.jsp" %>
    </body>
</html>
