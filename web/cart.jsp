<%-- 
    Document   : cart
    Created on : Oct 8, 2017, 12:55:47 PM
    Author     : HoaiVu
--%>
<%@page import="hv.model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Giỏ hàng</title>
    </head>
    <body>
        <%
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }
            
        %>
        <%@include file="includes/header.jsp" %>
        <div class="container_fullwidth">
            <div class="container shopping-cart">
                <div class="row">
                    <div class="col-md-12">
                        <h3 class="title" style="color: red">
                            Giỏ hàng của tôi
                        </h3>
                        <div class="clearfix">
                        </div> 


                        <table class="shop-table">
                            <thead>
                                <tr>
                                    <th>
                                        Hình ảnh
                                    </th>                    
                                    <th>
                                        Chi tiết
                                    </th>
                                    <th>
                                        Số lượng
                                    </th>
                                    <th>
                                        Giá
                                    </th>
                                    <th>
                                        Tùy chọn
                                    </th>
                                </tr>                
                            </thead>

                            <tbody>

                                <%for (Map.Entry<Long, Item> list : cart.getCartItems().entrySet()) {%>
                                <tr>
                                    <td>
                                        <img src="images/<%=list.getValue().getProduct().getProduct_img()%>" alt=""  >
                                    </td>
                                    <td >
                                        <div class="shop-details">
                                            <div class="productname">
                                                <%=list.getValue().getProduct().getProduct_name()%>
                                            </div>
                                            <p>
                                                <img alt="" src="images/star.png">
                                                <a class="review_num" href="#">
                                                    02 Review(s)
                                                </a>
                                            </p>
                                            <div class="color-choser">
                                                <span class="text">
                                                    Màu sản phẩm &nbsp;&nbsp;: 
                                                </span>
                                                <p> auto</p>
                                            </div>
                                            <p>
                                                Mã code sản phẩm : 
                                                <strong class="pcode">
                                                    <%=list.getValue().getProduct().getProduct_id()%>
                                                </strong>
                                            </p>
                                        </div>
                                    </td >

                                    <td >
                                        <a href="Giohang?command=plus&product_id=<%=list.getValue().getProduct().getProduct_id()%>&cartID=System.currentTimeMillis()"><img src="images/them.gif" alt=""></a>
                                        <input type="text" style="width: 50px" value="<%=list.getValue().getQuantity()%>">
                                        <a href="Giohang?command=trusp&product_id=<%=list.getValue().getProduct().getProduct_id()%>&cartID=System.currentTimeMillis()"><img src="images/tru.gif" alt=""></a>
                                    </td>
                                    <td>
                                        <h5>
                                            <strong class="red">
                                                $<%=list.getValue().getProduct().getProduct_price()%>
                                            </strong>
                                        </h5>
                                    </td>
                                    <td>                     
                                        <a href="controllerCart?command=remove&product_id=<%=list.getValue().getProduct().getProduct_id()%>">
                                            <img src="images/remove.png" alt="">
                                        </a>
                                    </td>

                                </tr>
                               <%}%>
                            </tbody>
                            <tfoot>

                                <tr>
                                    <td colspan="6">
                                        <button class="pull-left" onclick="location.href = 'index.jsp'">
                                            Tiếp tục mua hàng
                                        </button>
                                        <button class="pull-right" onclick="location.href = 'cart.jsp'" >
                                                Cập nhật lại giỏ hàng
                                        </button>
                                                 
                                    </td>
                                </tr>

                            </tfoot>

                        </table>



                        <div class="clearfix">
                        </div>
                        <div class="row">
                            <div class="col-md-4 col-sm-6">
                                <div class="shippingbox">
                                    <h5>
                                        Ước tính phí vận chuyển
                                    </h5>
                                    <form>
                                        <label>
                                            Từ *
                                        </label>
                                        <select class="">
                                            <option selected="" value="A">
                                                ---Select---
                                            </option>
                                            <option value="AL">
                                                Hà Tỉnh
                                            </option>
                                            <option value="AK">
                                                Cần Thơ
                                            </option>
                                            <option value="AZ">
                                                Long AN
                                            </option>
                                            <option value="AR">
                                                Bà Rịa
                                            </option>
                                            <option value="CA">
                                                Châu Đốc
                                            </option>
                                            <option value="CO">
                                                Hà Nội
                                            </option>
                                            <option value="CT">
                                                TP. Hồ Chí Minh
                                            </option>
                                            <option value="DE">
                                                An Giang
                                            </option>
                                            <option value="DC">
                                                Kiên Giang
                                            </option>
                                            <option value="FL">
                                                Tiền giang
                                            </option>
                                            <option value="GA">
                                                Lào Cai
                                            </option>
                                            <option value="HI">
                                                Bến Tre
                                            </option>
                                            <option value="ID">
                                                Huế
                                            </option>
                                            <option value="IL">
                                                Quảng Ngãi
                                            </option>
                                            <option value="IN">
                                                Quảng Nam
                                            </option>
                                            <option value="IA">
                                                Quảng Bình
                                            </option>
                                            <option value="KS">
                                                Bình Thuận
                                            </option>
                                            <option value="KY">
                                                Phú Yên
                                            </option>  
                                        </select>

                                        <label>
                                            Đến *
                                        </label>
                                        <select class="">
                                            <option selected="" value="A">
                                                ---Select---
                                            </option>
                                            <option value="AL">
                                                Hà Tỉnh
                                            </option>
                                            <option value="AK">
                                                Cần Thơ
                                            </option>
                                            <option value="AZ">
                                                Long AN
                                            </option>
                                            <option value="AR">
                                                Bà Rịa
                                            </option>
                                            <option value="CA">
                                                Châu Đốc
                                            </option>
                                            <option value="CO">
                                                Hà Nội
                                            </option>
                                            <option value="CT">
                                                TP. Hồ Chí Minh
                                            </option>
                                            <option value="DE">
                                                An Giang
                                            </option>
                                            <option value="DC">
                                                Kiên Giang
                                            </option>
                                            <option value="FL">
                                                Tiền giang
                                            </option>
                                            <option value="GA">
                                                Lào Cai
                                            </option>
                                            <option value="HI">
                                                Bến Tre
                                            </option>
                                            <option value="ID">
                                                Huế
                                            </option>
                                            <option value="IL">
                                                Quảng Ngãi
                                            </option>
                                            <option value="IN">
                                                Quảng Nam
                                            </option>
                                            <option value="IA">
                                                Quảng Bình
                                            </option>
                                            <option value="KS">
                                                Bình Thuận
                                            </option>
                                            <option value="KY">
                                                Phú Yên
                                            </option>

                                        </select>
                                        <div class="clearfix"></div>
                                        <button>
                                            Dự tính
                                        </button>

                                    </form>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-6">
                                <div class="shippingbox">
                                    <h5>
                                        Nhập code 
                                    </h5>
                                    <form>
                                        <label>
                                            Nhập mã code để được giảm giá nếu bạn có
                                        </label>
                                        <input type="text" name="">
                                        <div class="clearfix">
                                        </div>
                                        <button>
                                            Xác nhận
                                        </button>
                                        <button>
                                            Hủy bỏ
                                        </button>
                                    </form>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-6">
                                <div class="shippingbox">
                                    <div class="subtotal">
                                        <h5>
                                            Phụ thu
                                        </h5>
                                        <span>
                                            $0
                                        </span>
                                    </div>
                                    <div class="grandtotal">
                                        <h5>
                                            Tổng cộng 
                                        </h5>
                                        <span>
                                            $<%=cart.totalCart()%>
                                        </span>
                                    </div>
                                    <button>
                                        Thanh toán
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix">
                </div>
                <div class="our-brand">
                    <h3 class="title">
                        <strong>
                            Our 
                        </strong>
                        Brands
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
    </c:if>
</body>
</html>
