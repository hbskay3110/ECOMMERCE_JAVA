<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html class="no-js" lang="en">


<!-- Mirrored from template.hasthemes.com/ruiz/ruiz/my-account.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 06 Nov 2021 12:50:35 GMT -->


<!-- Mirrored from ruizzz.tk/my-account.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 02 Nov 2022 09:21:32 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>
    <meta charset="utf-8">
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%--  <fmt:setLocale value="vi_VN"/> --%>
    <c:set var="lg" value="${sessionScope.language}"></c:set>
    <c:if test="${lg eq 'US' }">
        <fmt:setLocale value="en_US"/>
    </c:if>
    <c:if test="${lg eq 'VN' || lg == null }">
        <fmt:setLocale value="vi_VN"/>
    </c:if>
    <fmt:setBundle basename="app" var="language"/>
    <title>Thông tin cá nhân</title>
    <meta name="robots" content="noindex, follow" />
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.ico">

    <!-- CSS
	============================================ -->

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css/vendor/bootstrap.min.css">
    <!-- Icon Font CSS -->
    <link rel="stylesheet" href="assets/css/vendor/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/vendor/simple-line-icons.css">

    <!-- Plugins CSS -->
    <link rel="stylesheet" href="assets/css/plugins/animation.css">
    <link rel="stylesheet" href="assets/css/plugins/slick.css">
    <link rel="stylesheet" href="assets/css/plugins/animation.css">
    <link rel="stylesheet" href="assets/css/plugins/nice-select.css">
    <link rel="stylesheet" href="assets/css/plugins/fancy-box.css">
    <link rel="stylesheet" href="assets/css/plugins/jqueryui.min.css">

    <!-- Vendor & Plugins CSS (Please remove the comment from below vendor.min.css & plugins.min.css for better website load performance and remove css files from avobe) -->
    <!--
    <script src="assets/js/vendor/vendor.min.js"></script>
    <script src="assets/js/plugins/plugins.min.js"></script>
    -->

    <!-- Main Style CSS (Please use minify version for better website load performance) -->
    <link rel="stylesheet" href="assets/css/style.css">
    <!--<link rel="stylesheet" href="assets/css/style.min.css">-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="../assets/css/main.css">
    <link rel="stylesheet" href="../assets/css/base.css">
    <link rel="stylesheet" href="../assets/css/grid.css">
    <link rel="stylesheet" href="../assets/css/rebonsive.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">

</head>

<body>

<div class="main-wrapper">
    <jsp:include page="../header/headerlv2.jsp"></jsp:include>
    <!-- breadcrumb-area start -->
    <div class="breadcrumb-area" style="margin-top: var(--header-height)">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- breadcrumb-list start -->
                    <ul class="breadcrumb-list">
                        <li class="breadcrumb-item"><fmt:message key= "account.Hom" bundle="${language}"></fmt:message></li>
                        <li class="breadcrumb-item active"><fmt:message key= "account.Acc" bundle="${language}"></fmt:message></li>
                    </ul>
                    <!-- breadcrumb-list end -->
                </div>
            </div>
        </div>
    </div>
    <!-- breadcrumb-area end -->


    <!-- main-content-wrap start -->
    <div class="main-content-wrap section-ptb my-account-page" style="padding: 30px 0;">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="account-dashboard">
                        <div class="dashboard-upper-info">
                            <div class="row align-items-center no-gutters">
                                <div class="col-lg-3 col-md-12">
                                    <div class="d-single-info" style="height: 60px;padding: 20px 0 20px;">
                                        <p class="user-name"><fmt:message key= "account.Hell" bundle="${language}"></fmt:message><span> ${sessionScope.userLogin.userName}</span></p>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-lg-2">
                                <!-- Nav tabs -->
                                <ul role="tablist" class="nav flex-column dashboard-list">
                                    <li><a href="#dashboard" data-bs-toggle="tab" class="nav-link active"><fmt:message key= "account.Manage" bundle="${language}"></fmt:message></a></li>
                                    <li><a href="#account-details" data-bs-toggle="tab" class="nav-link"><fmt:message key= "account.InforPer" bundle="${language}"></fmt:message></a></li>
                                    <li> <a href="#orders" data-bs-toggle="tab" class="nav-link"><fmt:message key= "account.Ords" bundle="${language}"></fmt:message></a>
                                    </li>
                                    <li><a href="#favourites" data-bs-toggle="tab" class="nav-link">Sản phẩm yêu thích</a></li>
                                    <li><a href="/WebBanHang/changePass.jsp" class="nav-link"><fmt:message key= "account.ChangePas" bundle="${language}"></fmt:message></a></li>

                                    <li><a href="../Login.jsp" class="nav-link"><fmt:message key= "account.Lo" bundle="${language}"></fmt:message></a></li>
                                </ul>
                            </div>
                            <div class="col-md-12 col-lg-10">
                                <!-- Tab panes -->
                                <div class="tab-content dashboard-content">
                                    <!-- quản lí tài khoản -->
                                    <div class="tab-pane active" id="dashboard">
                                        <h3><fmt:message key= "account.Manage" bundle="${language}"></fmt:message> </h3>
                                        <div class="row">

                                            <div class="d111 col-md-4">
                                                <h6><fmt:message key= "account.InforPer" bundle="${language}"></fmt:message> <span class="sp111"></span></h6>
                                                <p>${sessionScope.userLogin.userName}</p>
                                                <p>${sessionScope.userLogin.email}</p>
                                                <p>${sessionScope.userLogin.dayOfBirth}</p>
                                                <p>${sessionScope.userLogin.sex}</p>
                                            </div>
                                            <div class="d111 col-md-8 "
                                                 style="border-left: rgb(255, 255, 255) 10px solid ;">
                                                <h6><fmt:message key= "account.Addbook" bundle="${language}"></fmt:message> <span class="sp111"></span></h6>
                                                <p>${sessionScope.userLogin.userName}</p>
                                                <p>(+84) ${sessionScope.userLogin.phoneNum}</p>
                                                <p>${sessionScope.userLogin.address}</p>
                                            </div>
                                        </div>
                                        <div class="table-responsive d222">
                                            <h5><fmt:message key= "account.Recentord" bundle="${language}"></fmt:message></h5>
                                            <table class="table">
                                                <thead>
                                                <tr>
                                                    <th><fmt:message key= "account.No" bundle="${language}"></fmt:message></th>
                                                    <th><fmt:message key= "account.Reci" bundle="${language}"></fmt:message></th>
                                                    <th><fmt:message key= "account.Ordate" bundle="${language}"></fmt:message></th>
                                                    <th><fmt:message key= "account.Con" bundle="${language}"></fmt:message></th>
                                                    <th><fmt:message key= "account.Tal" bundle="${language}"></fmt:message></th>
                                                    <th><fmt:message key= "account.Tail" bundle="${language}"></fmt:message></th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="dh" items="${donHang}">
                                                    <tr>
                                                        <td>${dh.idOrder}</td>
                                                        <td>${dh.nameRecipient}
                                                        </td>
                                                        <td>${dh.dateOrder}</td>
                                                        <c:set var="duyet" value="${dh.status}"></c:set>
                                                        <c:if test="${duyet == '1' }">
                                                            <td><fmt:message key= "account.Brow" bundle="${language}"></fmt:message></td>
                                                            <td>${dh.totalMoney}00 đ</td>
                                                            <td><a href="/WebBanHang/product/DetailOder?maDH=${dh.idOrder}" class="view">
                                                                <fmt:message key= "account.See" bundle="${language}"></fmt:message></a></td>
                                                            <td><a href="/WebBanHang/product/DetailOder?maDH=${dh.idOrder}" class="view">
                                                                <fmt:message key= "account.confirm" bundle="${language}"></fmt:message></a></td>
                                                        </c:if>
                                                        <c:if test="${duyet == '0' }">
                                                            <td><fmt:message key= "account.Notyet" bundle="${language}"></fmt:message></td>
                                                            <td>${dh.totalMoney}00 đ</td>
                                                            <td><a href="/WebBanHang/product/DetailOder?maDH=${dh.idOrder}" class="view">
                                                                <fmt:message key= "account.See" bundle="${language}"></fmt:message></a></td>
                                                            <td><a href="/WebBanHang/product/DetailOder?maDH=${dh.idOrder}" style="background-color: red" class="view">
                                                                Hủy</a></td>
                                                        </c:if>

                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>

                                    </div>
                                    <!-- thông tin cá nhân -->
                                    <div class="tab-pane fade" id="account-details">
                                        <div class="login" id="edit_111" style="display: none;">
                                            <div class="login-form-container">
                                                <div class="account-login-form">
                                                    <form action="#">
                                                        <!-- <label>Social title</label>
                                                        <div class="input-radio">
                                                            <span class="custom-radio"><input type="radio"
                                                                    value="1" name="id_gender"> Mr.</span>
                                                            <span class="custom-radio"><input type="radio"
                                                                    value="1" name="id_gender"> Mrs.</span>
                                                        </div> -->
                                                        <div class="account-input-box">
                                                            <label><fmt:message key= "account.Fullname" bundle="${language}"></fmt:message></label>
                                                            <input type="text" name="first-name"
                                                                   value="${sessionScope.userLogin.userName}">
                                                            <label>Email</label>
                                                            <input type="text" name="email-name"
                                                                   value="${sessionScope.userLogin.email}">
                                                            <label><fmt:message key= "account.num" bundle="${language}"></fmt:message></label>
                                                            <input type="text" name="user-number"
                                                                   value="${sessionScope.userLogin.phoneNum}">
                                                            <label><fmt:message key= "account.gend" bundle="${language}"></fmt:message></label>
                                                            <div>
                                                                <c:set var = "GT" value="${sessionScope.userLogin.sex}"/>

                                                                <c:if test="${GT eq 'Nam'} ">
                                                                    <label style="display: inline;"><fmt:message key= "account.Male" bundle="${language}"></fmt:message></label>
                                                                    <input type="radio" value="Nam" name="id_gender"
                                                                           style="width: 5%;" checked>
                                                                    <label style="display: inline;"><fmt:message key= "account.Female" bundle="${language}"></fmt:message></label>
                                                                    <input type="radio" value="Nữ" name="id_gender"
                                                                           style="width: 5%;">
                                                                </c:if>
                                                                <c:if test="${GT eq 'Nữ'}">
                                                                    <label style="display: inline;"><fmt:message key= "account.Male" bundle="${language}"></fmt:message></label>
                                                                    <input type="radio" value="Nam" name="id_gender"
                                                                           style="width: 5%;" >
                                                                    <label style="display: inline;"><fmt:message key="account.Female" bundle="${language}"></fmt:message></label>
                                                                    <input type="radio" value="Nữ" name="id_gender"
                                                                           style="width: 5%;" checked>
                                                                </c:if>
                                                            </div>
                                                            <label><fmt:message key= "account.Birthday" bundle="${language}"></fmt:message></label>
                                                            <input type="date" placeholder="MM/DD/YYYY"
                                                                   value="${sessionScope.userLogin.dayOfBirth}" name="birthday">
                                                            <label><fmt:message key= "account.Detailadd" bundle="${language}"></fmt:message></label>
                                                            <input type="text"
                                                                   value="${sessionScope.userLogin.address}" name="address">
                                                        </div>
                                                        <div class="example">
                                                            (Vd: 31/05/1970)
                                                        </div>
                                                        <div class="button-box">
                                                            <button class="btn default-btn" type="submit"
                                                                    id="submit_111"><fmt:message key= "account.SaveInf" bundle="${language}"></fmt:message></button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="save_111">
                                            <div class="row">
                                                <div class="col-3">
                                                    <p class="p441"><fmt:message key= "account.Fullname" bundle="${language}"></fmt:message></p>
                                                    <p>${sessionScope.userLogin.userName}</p>
                                                </div>
                                                <div class="col-3">
                                                    <p class="p441">Email</p>
                                                    <p>${sessionScope.userLogin.email}</p>
                                                </div>
                                                <div class="col">
                                                    <p class="p441"><fmt:message key= "account.num" bundle="${language}"></fmt:message></p>
                                                    <p>(+84) ${sessionScope.userLogin.phoneNum}</p>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-2">
                                                    <p class="p441"><fmt:message key= "account.gend" bundle="${language}"></fmt:message></p>
                                                    <p>${sessionScope.userLogin.sex}</p>
                                                </div>
                                                <div class="col-2">
                                                    <p class="p441"><fmt:message key= "account.Birthday" bundle="${language}"></fmt:message></p>
                                                    <p>${sessionScope.userLogin.dayOfBirth}</p>
                                                </div>
                                            </div>
                                            <div class="button-box" style="padding-top: 20px;">
                                                <button class="btn default-btn" id="btn_edit_111"><fmt:message key= "account.Edit" bundle="${language}"></fmt:message></button>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- đơn hàng -->
                                    <div class="tab-pane fade" id="orders">
                                        <h3><fmt:message key= "account.Ords" bundle="${language}"></fmt:message></h3>
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                <tr>
                                                    <th><fmt:message key= "account.No" bundle="${language}"></fmt:message></th>
                                                    <th><fmt:message key= "account.Reci" bundle="${language}"></fmt:message></th>
                                                    <th><fmt:message key= "account.Ordate" bundle="${language}"></fmt:message></th>
                                                    <th><fmt:message key= "account.Con" bundle="${language}"></fmt:message></th>
                                                    <th><fmt:message key= "account.Tal" bundle="${language}"></fmt:message></th>
                                                    <th><fmt:message key= "account.Tail" bundle="${language}"></fmt:message></th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="dh" items="${donHang}">
                                                    <tr>
                                                        <td>${dh.idOrder}</td>
                                                        <td>${dh.nameRecipient}
                                                        </td>
                                                        <td>${dh.dateOrder}</td>
                                                        <c:set var="duyet" value="${dh.status}"></c:set>
                                                        <c:if test="${duyet == '1' }">
                                                            <td><fmt:message key= "account.Brow" bundle="${language}"></fmt:message></td>
                                                        </c:if>
                                                        <c:if test="${duyet == '0' }">
                                                            <td><fmt:message key= "account.Notyet" bundle="${language}"></fmt:message></td>
                                                        </c:if>
                                                        <td>${dh.totalMoney}00 đ</td>

                                                        <td><a href="<c:url value="/product/DetailOder?maDH=${dh.idOrder}"></c:url>" class="view">
                                                            <fmt:message key= "account.See" bundle="${language}"></fmt:message></a></td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="favourites">
                                        <h3>Sản phẩm yêu thích</h3>
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                <tr>
                                                    <th>Mã sản phẩm</th>
                                                    <th>Hình ảnh</th>
                                                    <th>Tên sản phẩm</th>
                                                    <th>Giá</th>
                                                    <th>Xóa</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="fav" items="${favourite}">
                                                    <tr>
                                                        <td>${fav.idP}</td>
                                                        <td><a href="<c:url value="/product/productDetail?maSP=${fav.idP}"></c:url>">
                                                            <img alt="hinhSP" style="width: 100px" src="../assets/img/product/${fav.listImg.get(0).nameI}">
                                                        </a> </td>
                                                        <td><a href="<c:url value="/product/productDetail?maSP=${fav.idP}"></c:url>">${fav.nameP}</a></td>
                                                        <td>${fav.priceP}00</td>
                                                        <td>
                                                            <form action="<c:url value="/FavouritesServlet"></c:url>" method="POST">
                                                                <input type="hidden" name="idP" value="${fav.idP}" />
                                                                <input type="hidden" name="nameAcc" value="${fav.nameAcc}" />
                                                                <button type="submit" class="btn btn-warning">Xóa</button>
                                                            </form>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <!-- địa chỉ -->
                                    <div class="tab-pane" id="address">
                                        <h3><fmt:message key= "account.ChangePas" bundle="${language}"></fmt:message></h3>


                                        <form action="">
                                            <table>
                                                <tr>
                                                    <td><label><fmt:message key= "account.Oldpass" bundle="${language}"></fmt:message></label></td>
                                                    <td><input type="text" name="email-name" value=""></td>
                                                </tr>
                                                <tr>
                                                    <td><label><fmt:message key= "account.Newpass" bundle="${language}"></fmt:message></label></td>
                                                    <td> <input type="text" name="email-name" value=""></td>
                                                </tr>
                                                <tr>
                                                    <td><label><fmt:message key= "account.Re" bundle="${language}"></fmt:message></label></td>
                                                    <td> <input type="text" name="email-name"  value=""></td>
                                                </tr>

                                            </table>
                                            <button class="btn default-btn" id="btn_edit_111" type="submit"><fmt:message key= "account.Chan" bundle="${language}"></fmt:message></button>
                                        </form>



                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- main-content-wrap end -->

    <jsp:include page="../footer/footerlv2.jsp"></jsp:include>


    <!-- JS
============================================ -->

    <!-- Modernizer JS -->
    <script src="assets/js/vendor/modernizr-3.6.0.min.js"></script>
    <!-- jquery -->

    <!-- jquery -->
    <script src="assets/js/vendor/jquery-3.5.1.min.js"></script>
    <script src="assets/js/vendor/jquery-migrate-3.3.0.min.js"></script>


    <!-- Bootstrap JS -->
    <script src="assets/js/vendor/popper.min.js"></script>
    <script src="assets/js/vendor/bootstrap.min.js"></script>

    <!-- Plugins JS -->
    <script src="assets/js/plugins/slick.min.js"></script>

    <script src="assets/js/plugins/jquery.nice-select.min.js"></script>
    <script src="assets/js/plugins/countdown.min.js"></script>
    <script src="assets/js/plugins/image-zoom.min.js"></script>
    <script src="assets/js/plugins/fancybox.js"></script>
    <script src="assets/js/plugins/scrollup.min.js"></script>
    <script src="assets/js/plugins/jqueryui.min.js"></script>
    <script src="assets/js/plugins/ajax-contact.js"></script>

    <!-- Vendor & Plugins JS (Please remove the comment from below vendor.min.js & plugins.min.js for better website load performance and remove js files from avobe) -->
    <!--
<script src="assets/js/vendor/vendor.min.js"></script>
<script src="assets/js/plugins/plugins.min.js"></script>
-->

    <!-- Main JS -->
    <script src="assets/js/main.js"></script>

</body>


<!-- Mirrored from template.hasthemes.com/ruiz/ruiz/my-account.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 06 Nov 2021 12:50:35 GMT -->


<!-- Mirrored from ruizzz.tk/my-account.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 02 Nov 2022 09:21:32 GMT -->
</html>