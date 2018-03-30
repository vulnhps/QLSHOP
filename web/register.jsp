<%-- 
    Document   : login
    Created on : Oct 8, 2017, 1:59:01 AM
    Author     : HoaiVu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng ký thành viên</title>
    </head>
    <body id="home">
        <%@include file="includes/header.jsp" %>

        <div class="container_fullwidth">
            <div class="container">
                <div class="row">                   
                    <div class="col-md-9" style="width: 100%">
                        <div class="checkout-page">
                            <ol class="checkout-steps">
                                <li class="steps">
                                    <a href="login.jsp" class="step-title">
                                        01. Đăng nhập
                                    </a>
                                </li>
                                <li class="steps active">
                                    <a href="register.jsp" class="step-title">
                                        02. Đăng ký thành viên
                                    </a>                               
                                    <div class="step-description">
                                        <form action="controllerRegister" method="post">
                                            ${requestScope['msg']}
                                            <div class="row">
                                                <div class="col-md-6 col-sm-6">
                                                    <div class="your-details">
                                                        <h5>
                                                            Đăng ký thành viên chính thức
                                                        </h5>
                                                        <div class="form-row">
                                                            <label class="lebel-abs">
                                                                Tên tài khoản 
                                                                <strong class="red">
                                                                    *
                                                                </strong>
                                                            </label>
                                                            <input type="text" class="input namefild" name="username">
                                                            <font color="red">${requestScope.userNameloi}</font>
                                                        </div>
                                                        <div class="form-row">
                                                            <label class="lebel-abs">
                                                                Mật khẩu 
                                                                <strong class="red">
                                                                    *
                                                                </strong>
                                                            </label>
                                                            <input type="text" class="input namefild" name="password">
                                                            <font color="red">${requestScope.userpasswordloi}</font>
                                                        </div>
                                                        <div class="form-row">
                                                            <label class="lebel-abs">
                                                                Họ và tên 
                                                                <strong class="red">
                                                                    *
                                                                </strong>
                                                            </label>
                                                            <input type="text" class="input namefild" name="fullname">
                                                        </div>
                                                        <div class="form-row">
                                                            <label class="lebel-abs">
                                                                Chức vụ 
                                                                <strong class="red">
                                                                    *
                                                                </strong>                                                   
                                                            </label>
                                                            <select name="role" style="margin-left:  110px ;margin-top: 5px">
                                                                <option selected>
                                                                        0
                                                                    </option>                                                                                                                                 
                                                                </select>
                                                                          
                                                        </div>
                                                        <div class="form-row">
                                                            <label class="lebel-abs">
                                                                Email 
                                                                <strong class="red">
                                                                    *
                                                                </strong>
                                                            </label>
                                                            <input type="text" class="input namefild" name="email">
                                                        </div>
                                                        <div class="form-row">
                                                            <label class="lebel-abs">
                                                                Địa chỉ                                                                 
                                                            </label>
                                                            <input type="text" class="input namefild" name="address">
                                                        </div>
                                                        <div class="form-row">
                                                            <label class="lebel-abs">
                                                                Số diện thoại                                                                 
                                                            </label>
                                                            <input type="text" class="input namefild" name="phone">
                                                        </div> 
                                                    </div>                                                                                              
                                                    <p class="privacy">
                                                        <span class="input-radio">
                                                            <input type="radio" name="user">
                                                        </span>
                                                        <span class="text">
                                                            Tôi đòng ý với  
                                                            <a href="#" class="red">
                                                                chính sách
                                                            </a>
                                                            này
                                                        </span>
                                                    </p>
                                                    <button type="submit" value="insert" name="command">
                                                        Đăng ký
                                                    </button>
                                                    <button type="reset" value="Reset" name="Reset">
                                                        Reset
                                                    </button>

                                                </div>
                                            </div> 
                                        </form>
                                    </div>
                                    </div> 

                                    </div>
                                    </div>
                                    </div>
                                    </div>

                                    <%@include file="includes/footer.jsp" %>
                                    </body>
                                    </html>
