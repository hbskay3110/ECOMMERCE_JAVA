
<%@page isELIgnored="false"%>
<!doctype html>
<html class="no-js" lang="en">


<!-- Mirrored from template.hasthemes.com/ruiz/ruiz/checkout.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 06 Nov 2021 12:50:36 GMT -->


<!-- Mirrored from ruizzz.tk/checkout.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 02 Nov 2022 09:21:29 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<!-- /Added by HTTrack -->
<head>
	<meta charset="utf-8">
	<%@ page language="java" contentType="text/html; charset=UTF-8"
			 pageEncoding="UTF-8"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<title>Thanh toán</title>
	<meta name="robots" content="noindex, follow" />
	<meta name="description" content="">
	<meta name="viewport"
		  content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- Favicon -->
	<link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.ico">
	<link rel="stylesheet" href="<c:url value="assets/css/style.css"></c:url>">
	<!-- CSS============================================ -->
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
	<link rel="stylesheet"
		  href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
	<link rel="stylesheet" href="../assets/css/main.css">
	<link rel="stylesheet" href="../assets/css/base.css">
	<link rel="stylesheet" href="../assets/css/grid.css">
	<link rel="stylesheet" href="../assets/css/rebonsive.css">
	<link rel="stylesheet"
		  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
</head>
<body>
<div class="main-wrapper">
	<!--  Header Start -->
	<jsp:include page="../header/headerlv2.jsp"></jsp:include>
	<!-- breadcrumb-area start -->
	<div class="breadcrumb-area"  style="margin-top: var(--header-height)">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<!-- breadcrumb-list start -->
					<ul class="breadcrumb-list">
						<li class="breadcrumb-item"><a href=""><fmt:message key= "assets.Homepage" bundle="${language}"></fmt:message></a></li>
						<li class="breadcrumb-item active"><fmt:message key= "assets.Abat" bundle="${language}"></fmt:message></li>
					</ul>
					<!-- breadcrumb-list end -->
				</div>
			</div>
		</div>
	</div>
	<!-- breadcrumb-area end -->

	<form action="/WebBanHang/DonHang" method="get">
		<!-- main-content-wrap start -->
		<div class="main-content-wrap section-ptb checkout-page">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="coupon-area">
							<!-- coupon-accordion start -->
							<!-- coupon-accordion end -->
						</div>
					</div>
				</div>
				<!-- checkout-details-wrapper start -->
				<div class="checkout-details-wrapper">
					<div class="row">
						<div class="col-lg-6 col-md-6">
							<!-- billing-details-wrap start -->
							<div class="billing-details-wrap">

								<h3 class="shoping-checkboxt-title"><fmt:message key= "assets.Bill" bundle="${language}"></fmt:message></h3>
								<div class="row">
									<div class="col-lg-12">
										<p class="single-form-row">
											<label><fmt:message key= "assets.Name" bundle="${language}"></fmt:message> <span class="required">*</span></label> <input
												type="text" name="Firstname">
										</p>
									</div>
									<div class="col-lg-12">
										<p class="single-form-row">
											<label><fmt:message key= "assets.Province" bundle="${language}"></fmt:message> <span class="required">*</span></label>

										</p>
										<select id="address" name="address">
										</select>
										<select id="huyen" name="district">
										</select>
										<select id="xa" name="ward"></select>
										<%--											<script>--%>
										<%--												const selectAddress = document.getElementById('address');--%>
										<%--												console.log(selectAddress);--%>
										<%--												const selectAddresshuyen = document.getElementById('huyen');--%>
										<%--												const selectAddressxa = document.getElementById('xa');--%>
										<%--												var myMap = new Map();--%>
										<%--												myMap = ${loadAPI.getTinh()};--%>
										<%--												let arr3 = ${loadAPI.getHuyen(269)}--%>
										<%--														myMap.forEach((item) => {--%>
										<%--															const option = document.createElement('option');--%>
										<%--															option.value = item.key;--%>
										<%--															option.text = item.value;--%>
										<%--															console.log(option)--%>
										<%--															selectAddress.add(option);--%>
										<%--														});--%>
										<%--											</script>--%>
									</div>
									<jsp:include page="./assets/js/address.jsp"></jsp:include>
									<div class="col-lg-12">
										<p class="single-form-row">
											<label for="address-details">Địa chỉ chi tiết</label>
											<input type="text" id="address-details" name="address-details">
										</p>
									</div>

									<div class="col-lg-12">
										<p class="single-form-row">
											<label><fmt:message key= "assets.Phone" bundle="${language}"></fmt:message><span class="required">*</span></label>
											<input type="text" name="telephone">
										</p>
									</div>
									<input type="hidden" id="idOder" name="idOder" value="">
									<input type="hidden" name="dateDeliveryOder" id="dateDeliveryOder" value="">
									<input type="hidden" name="addressOder" id="addressOder" value="">

									<div class="col-lg-12">
										<p class="single-form-row ">
											<label><fmt:message key= "assets.Notes" bundle="${language}"></fmt:message><span class="required">*</span></label> <input
												type="text" name="note"
												placeholder="<fmt:message key= "assets.note" bundle="${language}"></fmt:message>"
												rows="2" cols="5">
										</p>
									</div>
								</div>
								<div class="dialog">
									<p class="dialong__title"><fmt:message key= "assets.Confirm" bundle="${language}"></fmt:message></p>
									<div class="dialog__main">
										<p class="dialog__text"><fmt:message key= "assets.SureWant" bundle="${language}"></fmt:message></p>
										<button class="dialog__btn " type="button"><fmt:message key= "assets.Escape" bundle="${language}"></fmt:message></button>
										<button class="dialog__btn dialog__btn-ok" type="submit"><fmt:message key= "assets.Agree" bundle="${language}"></fmt:message></button>
									</div>
								</div>
							</div>
							<!-- billing-details-wrap end -->
						</div>
						<div class="col-lg-6 col-md-6">
							<!-- your-order-wrapper start -->
							<div class="your-order-wrapper">
								<h3 class="shoping-checkboxt-title"><fmt:message key= "assets.Order" bundle="${language}"></fmt:message></h3>
								<!-- your-order-wrap start-->
								<div class="your-order-wrap">
									<!-- your-order-table start -->
									<div class="your-order-table table-responsive">
										<table>
											<thead>
											<tr>
												<th class="product-name"><fmt:message key= "assets.Produc" bundle="${language}"></fmt:message></th>
												<th class="product-total"><fmt:message key= "assets.Sum" bundle="${language}"></fmt:message></th>
											</tr>
											</thead>
											<tbody>
											<c:forEach items="${sessionScope.cart}" var="item">
												<tr class="cart_item">
													<td class="product-name">${item.value.nameP}<strong
															class="product-quantity"> x
															${item.value.quantity}</strong>
													</td>
													<td class="product-total"><span class="amount">${item.value.total}00
																₫</span></td>
												</tr>
											</c:forEach>
											</tbody>
											<tfoot>
											<tr class="cart-subtotal">
												<th><fmt:message key= "assets.Shoppingca" bundle="${language}"></fmt:message></th>
												<td><span class="amount" id="total">${sessionScope.total}</span>00
													₫</td>
											</tr>
											<tr class="cart-subtotal">
												<th><fmt:message key= "assets.Discount" bundle="${language}"></fmt:message></th>
												<td>
													<p class="checkout-coupon">
														<input type="text" placeholder="<fmt:message key= "assets.DiscountCo" bundle="${language}"></fmt:message>">
													</p>
												</td>
											</tr>
											<tr class="shipping">
												<th><fmt:message key= "assets.Delivery" bundle="${language}"></fmt:message></th>
												<td>
													<ul>
														<li><label><span class="amount" id="fee" name="fee"></span>
														</label></li>
													</ul>
												</td>
											</tr>
											<tr class="order-total">
												<th><fmt:message key= "assets.delivery" bundle="${language}"></fmt:message></th>
												<td><strong><span class="amount" id="delivery" name="delivery">
																</span></strong></td>
											</tr>

											<tr class="order-total">
												<th><fmt:message key= "assets.Totalin" bundle="${language}"></fmt:message></th>
												<td><strong><span class="amount" id="totalPrice">${sessionScope.fullPrice}</span>00
													₫</strong></td>
											</tr>

											</tfoot>
										</table>
									</div>

									<!-- your-order-table end -->

									<!-- your-order-wrap end -->
									<div class="payment-method">
										<div class="payment-accordion">
											<!-- ACCORDION START -->
											<h5><input type="radio" name="radio_button" value="button1">
												Thanh toán khi nhận hàng</h5>
											<div class="payment-content">
												<p>Bạn sẽ được kiểm tra sản phẩm khi nhận hàng.</p>
											</div>
											<!-- ACCORDION END -->
											<!-- ACCORDION START -->
											<h5><input type="radio" name="radio_button" value="button2">
												Thanh toán bằng tài khoản paypal</h5>
											<div class="payment-content">
												<p><fmt:message key= "assets.Paypal" bundle="${language}"></fmt:message></p>
											</div>
											<!-- ACCORDION END -->
										</div>
										<div class="order-button-payment ">
											<input class="btn-primary btn-checkOut" type="button" value="<fmt:message key= "assets.Place" bundle="${language}"></fmt:message>">
										</div>
									</div>
									<!-- your-order-wrapper start -->

								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- checkout-details-wrapper end -->
			</div>
		</div>
		<!-- main-content-wrap end -->
	</form>
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
<script>
	var dialog = document.querySelector(".dialog");
	var btnThanhToan = document.querySelector(".btn-checkOut")

	btnThanhToan.onclick = function () {
		dialog.style.display = 'block'

	}
</script>
// địa chỉ

</body>

<!-- Mirrored from template.hasthemes.com/ruiz/ruiz/checkout.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 06 Nov 2021 12:50:36 GMT -->


<!-- Mirrored from ruizzz.tk/checkout.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 02 Nov 2022 09:21:30 GMT -->
</html>