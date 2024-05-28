<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.*"%>
<%@page import="model.BillProduct"%>

<%@page isELIgnored="false"%>
<!doctype html>
<html class="no-js" lang="en">


<!-- Mirrored from template.hasthemes.com/ruiz/ruiz/cart.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 06 Nov 2021 12:50:36 GMT -->


<!-- Mirrored from ruizzz.tk/cart.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 02 Nov 2022 09:21:23 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<!-- /Added by HTTrack -->
<head>

<meta charset="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--  <fmt:setLocale value="vi_VN"/> --%>
<c:set var="lg" value="${sessionScope.language}"></c:set>
<c:if test="${lg eq 'US' }">
	<fmt:setLocale value="en_US" />
</c:if>
<c:if test="${lg eq 'VN' || lg == null }">
	<fmt:setLocale value="vi_VN" />
</c:if>

<fmt:setBundle basename="app" var="language" />
<title><fmt:message key="assets.Shoppings" bundle="${language}"></fmt:message></title>
<meta name="robots" content="noindex, follow" />
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="assets/images/favicon.ico">
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
<link rel="stylesheet" href="assets/css/cart.css">
<!--<link rel="stylesheet" href="assets/css/style.min.css">-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
<link rel="stylesheet" href="../assets/css/main.css">
<link rel="stylesheet" href="../assets/css/base.css">
<link rel="stylesheet" href="../assets/css/grid.css">
<link rel="stylesheet" href="../assets/css/rebonsive.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
<style>
	@import url('https://fonts.googleapis.com/css?family=Open+Sans&display=swap');
	body{background-color: #eeeeee;font-family: 'Open Sans',serif}

	.card{position: relative;display: -webkit-box;display: -ms-flexbox;display: flex;-webkit-box-orient: vertical;-webkit-box-direction: normal;-ms-flex-direction: column;flex-direction: column;min-width: 0;word-wrap: break-word;background-color: #fff;background-clip: border-box;border: 1px solid rgba(0, 0, 0, 0.1);border-radius: 0.10rem}
	.card-header:first-child{border-radius: calc(0.37rem - 1px) calc(0.37rem - 1px) 0 0}.card-header{padding: 0.75rem 1.25rem;margin-bottom: 0;background-color: #fff;border-bottom: 1px solid rgba(0, 0, 0, 0.1)}.track{position: relative;background-color: #ddd;height: 7px;display: -webkit-box;display: -ms-flexbox;display: flex;margin-bottom: 60px;margin-top: 50px}.track .step{-webkit-box-flex: 1;-ms-flex-positive: 1;flex-grow: 1;width: 25%;margin-top: -18px;text-align: center;position: relative}.track .step.active:before{background: #FF5722}.track .step::before{height: 7px;position: absolute;content: "";width: 100%;left: 0;top: 18px}.track .step.active .icon{background: #ee5435;color: #fff}.track .icon{display: inline-block;width: 40px;height: 40px;line-height: 40px;position: relative;border-radius: 100%;background: #ddd}.track .step.active .text{font-weight: 400;color: #000}.track .text{display: block;margin-top: 7px}.itemside{position: relative;display: -webkit-box;display: -ms-flexbox;display: flex;width: 100%}.itemside .aside{position: relative;-ms-flex-negative: 0;flex-shrink: 0}.img-sm{width: 80px;height: 80px;padding: 7px}ul.row, ul.row-sm{list-style: none;padding: 0}.itemside .info{padding-left: 15px;padding-right: 7px}.itemside .title{display: block;margin-bottom: 5px;color: #212529}p{margin-top: 0;margin-bottom: 1rem}.btn-warning{color: #ffffff;background-color: #ee5435;border-color: #ee5435;border-radius: 1px}.btn-warning:hover{color: #ffffff;background-color: #ff2b00;border-color: #ff2b00;border-radius: 1px}
</style>
</head>

<body>

	<div class="main-wrapper">

		<!--  Header Start -->
		<jsp:include page="../header/headerlv2.jsp"></jsp:include>

<%--		<!-- breadcrumb-area start -->--%>
		<div class="breadcrumb-area" style="margin-top: var(--header-height)">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<!-- breadcrumb-list start -->
						<ul class="breadcrumb-list">
							<li class="breadcrumb-item"><fmt:message
									key="assets.Homepag" bundle="${language}"></fmt:message></li>
							<li class="breadcrumb-item active"><fmt:message
									key="assets.Orderde" bundle="${language}"></fmt:message></li>
						</ul>
						<!-- breadcrumb-list end -->
					</div>
				</div>
			</div>
		</div>
		<!-- breadcrumb-area end -->

		<!-- main-content-wrap start -->
		<div class="">
			<div class="container">
				<div class="content-body">
					<div class="container">
						<article class="card">
							<header class="card-header">Đơn hàng của tôi</header>
							<div class="card-body">
								<h6>Order ID: ${orderProduct.idOrder}</h6>
								<article class="card">
									<div class="card-body row">
										<div class="col"> <strong>Thời gian dự kiến nhận hàng:</strong> <br/>${orderProduct.dateDelivery}</div>
										<div class="col"> <strong>Tên người nhận :</strong> <br/>${orderProduct.nameAcc}, <br/> <i class="fa fa-phone"></i> +${orderProduct.phone} </div>
										<div class="col"> <strong>Địa chỉ :</strong> <br/> ${orderProduct.address} </div>
										<div class="col"> <strong>Tổng tiền : </strong> <br/> ${orderProduct.totalMoney}00 đ</div>
									</div>
								</article>
								<div class="track">
									<div class="step ${orderProduct.status >= 0 ? 'active' : ''}">
										  <span class="icon">
											<i class="fa fa-check"></i>
										  </span>
										<span class="text">Order confirmed</span>
									</div>
									<div class="step ${orderProduct.status >= 1 ? 'active' : ''}">
										  <span class="icon">
											<i class="fa fa-user"></i>
										  </span>
										<span class="text">Picked by courier</span>
									</div>
									<div class="step ${orderProduct.status >= 2 ? 'active' : ''}">
									  <span class="icon">
										<i class="fa fa-truck"></i>
									  </span>
										<span class="text">On the way</span>
									</div>
									<div class="step ${orderProduct.status >= 3 ? 'active' : ''}">
										  <span class="icon">
											<i class="fa fa-box"></i>
										  </span>
										<span class="text">Ready for pickup</span>
									</div>

								</div>
								<hr/>
								<ul class="row">
                                    <c:forEach var="sp" items="${listBill}">

									<li class="col-md-4">
										<figure class="itemside mb-3">
											<div class="aside"><img src="../assets/img/product/${sp.nameImage}" class="img-sm border"/></div>
											<figcaption class="info align-self-center">
												<p class="title">${sp.nameP} x ${sp.quantity} </p><span class="text-muted">${sp.total}.00 đ</span>
											</figcaption>
										</figure>
                                        </c:forEach>
									</li>




								</ul>
								<hr/>
								<a href="<c:url value="/product/DetailUser"></c:url>" class="btn btn-warning" data-abc="true"> <i class="fa fa-chevron-left"></i> Trở lại</a>
							</div>

						</article>
					</div>
				</div>
			</div>
		</div>
		<!-- main-content-wrap end -->
		<!-- footer Start -->
		<jsp:include page="../footer/footerlv2.jsp"></jsp:include>
		<!-- footer End -->


	</div>

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


<!-- Mirrored from template.hasthemes.com/ruiz/ruiz/cart.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 06 Nov 2021 12:50:36 GMT -->


<!-- Mirrored from ruizzz.tk/cart.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 02 Nov 2022 09:21:24 GMT -->
</html>