<%@ page import="model.Image" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Account" %>
<%@page isELIgnored="false"%>
<!doctype html>
<html class="no-js" lang="en">



<!-- Mirrored from template.hasthemes.com/ruiz/ruiz/product-details.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 06 Nov 2021 12:52:40 GMT -->


<!-- Mirrored from ruizzz.tk/product-details.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 02 Nov 2022 09:21:24 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<!-- /Added by HTTrack -->
<head>
	<meta charset="utf-8">
	<%@ page language="java" contentType="text/html; charset=UTF-8"
			 pageEncoding="UTF-8"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<meta name="robots" content="noindex, follow" />
	<meta name="description" content="">
	<meta name="viewport"
		  content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%--  <fmt:setLocale value="vi_VN"/> --%>
	<c:set var="lg" value="${sessionScope.language}"></c:set>
	<c:if test="${lg eq 'US' }">
		<fmt:setLocale value="en_US" />
	</c:if>
	<c:if test="${lg eq 'VN' || lg == null }">
		<fmt:setLocale value="vi_VN" />
	</c:if>


	<fmt:setBundle basename="app" var="language"></fmt:setBundle>
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
	<!--<link rel="stylesheet" href="assets/css/style.min.css">-->
	<link rel="stylesheet"
		  href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
	<link rel="stylesheet" href="../assets/css/main.css">
	<link rel="stylesheet" href="../assets/css/base.css">
	<link rel="stylesheet" href="../assets/css/grid.css">
	<link rel="stylesheet" href="../assets/css/rebonsive.css">
	<link rel="stylesheet"
		  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" rel="stylesheet"
		  type='text/css'>
    <style>
		.arrow{
			font-size: 30px;
			position: relative;
			top: 273px;
		}
		.add-to-wishlist .active {
            color: red;
        }
		.rating {
			display: flex;
			align-items: center;
			margin-bottom: 10px;
			justify-content: flex-end; /* Chỉnh lại hướng justify-content */
			direction: rtl;
		}

		.rating input[type="radio"] {
			display: none;
		}

		.rating label {
			color: #ddd;
			font-size: 25px;
			cursor: pointer;
			transform: scaleX(-1); /* Lật ngược hướng của sao */
			order: 1; /* Đảo ngược thứ tự của các sao */
		}

		.rating label:before {
			content: '\2605';
		}
		.rating input[type="radio"]:checked ~ label {
			color: #ffbf00;
		}
		.star-yellow {
			color: yellow !important;
		}
		.evaluate{
			display: flex;
			margin-bottom: 5px;
		}
	</style>
</head>

<body>

<div class="main-wrapper">

	<!--  Header Start -->
	<jsp:include page="../header/headerlv2.jsp"></jsp:include>


	<!-- breadcrumb-area start -->
	<div class="breadcrumb-area" style="margin-top: var(--header-height)">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<!-- breadcrumb-list start -->
					<ul class="breadcrumb-list">
						<li class="breadcrumb-item"><fmt:message key="account.Hom"
																 bundle="${language}"></fmt:message></li>
						<li class="breadcrumb-item active"><fmt:message
								key="product.Details" bundle="${language}"></fmt:message></li>
					</ul>
					<!-- breadcrumb-list end -->
				</div>
			</div>
		</div>
	</div>
	<!-- breadcrumb-area end -->

	<!-- main-content-wrap start -->
	<div class="main-content-wrap shop-page section-ptb">

		<div class="container">
			<div class="slideshow-container" style="display: flex;">
				<%--				<img id="product-img" src="../assets/img/product/${sp.listImage.get(0).getNameI}" alt="Product 1">--%>
				<%--				<div class="controls">--%>
				<%--					<button id="prev-btn" onclick="prevImage()">Previous</button>--%>
				<%--					<button id="next-btn" onclick="nextImage()">Next</button>--%>
				<%--				</div>--%>
				<a class="prev arrow" onclick="plusSlides(-1)">&#10094;</a>
				<c:forEach items="${images}" var="image">
					<div class="mySlides" style="display: flex">
						<img src="../assets/img/product/${image.nameI}" class="" alt="Áo" style="width: 536px">
					</div>
				</c:forEach>
				<a class="next arrow" onclick="plusSlides(1)">&#10095;</a>
				<br>
				<div style="text-align:center">
					<c:forEach var="image" items="${images}" varStatus="status">
						<span class="dot" onclick="currentSlide(${status.index+1})"></span>
					</c:forEach>
				</div>
				<script>
					var slideIndex = 1;
					showSlides(slideIndex);

					function plusSlides(n) {
						showSlides(slideIndex += n);
					}

					function currentSlide(n) {
						showSlides(slideIndex = n);
					}

					function showSlides(n) {
						var i;
						var slides = document.getElementsByClassName("mySlides");
						var dots = document.getElementsByClassName("dot");
						if (n > slides.length) {slideIndex = 1}
						if (n < 1) {slideIndex = slides.length}
						for (i = 0; i < slides.length; i++) {
							slides[i].style.display = "none";
						}
						for (i = 0; i < dots.length; i++) {
							dots[i].className = dots[i].className.replace(" active", "");
						}
						slides[slideIndex-1].style.display = "block";
						dots[slideIndex-1].className += " active";
					}
				</script>
					<div class="col-lg-7 col-md-6">
						<div class="product-details-view-content">
							<div class="product-info">
								<h3>${sp.nameP}</h3>
								<div class="product-rating d-flex">
									<ul class="d-flex">
										<li><a href="#"><i class="icon-star"></i></a></li>
										<li><a href="#"><i class="icon-star"></i></a></li>
										<li><a href="#"><i class="icon-star"></i></a></li>
										<li><a href="#"><i class="icon-star"></i></a></li>
										<li><a href="#"><i class="icon-star"></i></a></li>
									</ul>
									<a href="#reviews">(<span class="count">1</span> <fmt:message
											key="product.evaluate" bundle="${language}"></fmt:message>)
									</a>
								</div>
								<div class="price-box">
									<span class="old-price">${sp.priceP}00₫</span> <span
										class="new-price">${sp.priceSale}00₫</span>
								</div>
								<p>${CT_SP.desciption}</p>

								<div class="single-add-to-cart" style="max-width: 350px;">
									<form
											action="CartServlet?maSP=${sp.idP}&action=Them"
											method="post" class="cart-quantity d-flex">
										<div class="quantity">
											<div class="cart-plus-minus">
												<input type="number" class="input-text" name="quantity"
													   value="1" title="Qty">
											</div>
										</div>
										<button style="margin-right: 1px;" class="add-to-cart "
												type="submit">
											<fmt:message key="product.BuyNow" bundle="${language}"></fmt:message>
										</button>
										<button class="add-to-cart" type="submit">
											<fmt:message key="product.Addtocart" bundle="${language}"></fmt:message>
										</button>
									</form>
								</div>
								<ul class="single-add-actions">
									<li class="add-to-wishlist">
										<% String idP = request.getParameter("idP"); %>
										<% Account a = (Account) session.getAttribute("userLogin");
											;%>

										<%-- Kiểm tra xem sản phẩm đã được yêu thích hay chưa --%>

										<span id="favourite-icon" class="<c:if test="${isFavourite}">active</c:if>"
											  onclick="toggleFavourite('${sp.idP}', '<%=a.getNameAcc()%>')">&#10084;</span>
										<fmt:message key="product.wishlist" bundle="${language}"></fmt:message>
									</li>

								</ul>

								<ul class="stock-cont">
									<li class="product-sku"><fmt:message key="product.Code"
																		 bundle="${language}"></fmt:message>: <span>${CT_SP.idP}</span></li>
									<li class="product-stock-status"><fmt:message
											key="product.Categories" bundle="${language}"></fmt:message>:
										<a href="#">${CT_SP.style}</a></li>
									<li class="product-stock-status"><fmt:message
											key="product.Tag" bundle="${language}"></fmt:message>: <a
											href="#">${CT_SP.typeP}</a></li>
								</ul>
								<div>
									<h5 style="color: var(- -primary-color);">
										<fmt:message key="product.promo" bundle="${language}"></fmt:message>
									</h5>
									<div
											style="border: 1px solid var(- -primary-color); border-radius: 10px; padding: 10px;">
										<p>
											<b style="color: var(- -primary-color);"> ></b>
											<fmt:message key="product.Diminish" bundle="${language}"></fmt:message>
											${sp.sale}%
											<fmt:message key="product.allbrand" bundle="${language}"></fmt:message>
											<br> <b style="color: var(- -primary-color);"> ></b>
											<fmt:message key="product.with" bundle="${language}"></fmt:message>
											<br> <b style="color: var(- -primary-color);"> ></b>
											<fmt:message key="product.prodis" bundle="${language}"></fmt:message>
											<br> <b style="color: var(- -primary-color);"> ></b>
											<fmt:message key="product.freede" bundle="${language}"></fmt:message>

										</p>
									</div>

								</div>
								<div class="share-product-socail-area">
									<p>
										<fmt:message key="product.sharepro" bundle="${language}"></fmt:message>
										:
									</p>
									<ul class="single-product-share">
										<li><a href="#"><i class="fa fa-facebook"></i></a></li>
										<li><a href="#"><i class="fa fa-twitter"></i></a></li>
										<li><a href="#"><i class="fa fa-pinterest"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
			</div>
			<div class="product-description-area section-pt">
				<div class="row">
					<div class="col-lg-12">
						<div class="product-details-tab">
							<ul role="tablist" class="nav">
								<li class="active" role="presentation"><a
										data-bs-toggle="tab" role="tab" href="#description"
										class="active"><fmt:message key="product.Details"
																	bundle="${language}"></fmt:message></a></li>
								<li role="presentation">- <a data-bs-toggle="tab"
															 role="tab" href="#warranty"><fmt:message
										key="product.Warranty" bundle="${language}"></fmt:message></a>
								</li>
								<li role="presentation"><a data-bs-toggle="tab" role="tab"
														   href="#userManual"><fmt:message key="product.insuse"
																						   bundle="${language}"></fmt:message></a></li>
								<li role="presentation"><a data-bs-toggle="tab" role="tab"
														   href="#reviews"><fmt:message key="product.revie"
																						bundle="${language}"></fmt:message></a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-12">
						<div class="product_details_tab_content tab-content">
							<!-- Start Single Content -->
							<div class="product_tab_content tab-pane active"
								 id="description" role="tabpanel">
								<div class="product_description_wrap  mt-30">
									<div class="product_desc mb-30">
										<h5>
											<b><fmt:message key="product.protion"
															bundle="${language}"></fmt:message></b>
										</h5>
										<table>
											<tbody>
											<tr>
												<td><b><fmt:message key="account.gend"
																	bundle="${language}"></fmt:message>:</b></td>
												<td>${CT_SP.sex}</td>
												<td><b><fmt:message key="product.Styles"
																	bundle="${language}"></fmt:message>:</b></td>
												<td>${CT_SP.designs}</td>
											</tr>
											<tr>
												<td><b><fmt:message key="product.Material"
																	bundle="${language}"></fmt:message>: </b></td>
												<td>${CT_SP.material}</td>
												<td><b><fmt:message key="product.Style"
																	bundle="${language}"></fmt:message>: </b></td>
												<td>${CT_SP.style}</td>
											</tr>
											<tr>
												<td><b><fmt:message key="product.genuine"
																	bundle="${language}"></fmt:message>: </b></td>
												<td>${CT_SP.warrantyPeriod}<fmt:message
														key="product.interna" bundle="${language}"></fmt:message></td>
											</tr>
											<tr>
												<td><b><fmt:message key="product.Exodus"
																	bundle="${language}"></fmt:message>:</b></td>
												<td>${CT_SP.origin}44</td>
												<td><b><fmt:message key="product.instore"
																	bundle="${language}"></fmt:message>: </b></td>
												<td><fmt:message key="product.monthInter"
																 bundle="${language}"></fmt:message></td>
											</tr>
											<tr>

											</tr>
											</tbody>
										</table>

									</div>

								</div>
							</div>
							<div class="product_tab_content tab-pane" id="warranty"
								 role="tabpanel">
								<div class="product_description_wrap  mt-30">
									<div class="product_desc mb-30">
										<p>
											<fmt:message key="product.according" bundle="${language}"></fmt:message>
										</p>
										<h5>
											<b>I.<fmt:message key="product.policyInter"
															  bundle="${language}"></fmt:message></b>
										</h5>
										<p>
											-
											<fmt:message key="product.paper" bundle="${language}"></fmt:message>
											<br> -
											<fmt:message key="product.the" bundle="${language}"></fmt:message>
											: <br> &ensp;+
											<fmt:message key="product.year" bundle="${language}"></fmt:message>
											<br> &ensp;+
											<fmt:message key="product.brands" bundle="${language}"></fmt:message>
											<br>

										</p>
										<h5>
											<b>II. <fmt:message key="product.pri"
																bundle="${language}"></fmt:message>
											</b>
										</h5>

										<h5>
											<b><fmt:message key="product.nocase"
															bundle="${language}"></fmt:message>: </b>
										</h5>
										<p>
											-
											<fmt:message key="product.nomanu" bundle="${language}"></fmt:message>
											<br>
										</p>
									</div>

								</div>
							</div>
							<div class="product_tab_content tab-pane" id="userManual"
								 role="tabpanel">
								<div class="product_description_wrap  mt-30">
									<div class="product_desc mb-30"></div>

								</div>
							</div>
							<!-- End Single Content -->
							<!-- Start Single Content -->
							<div class="product_tab_content tab-pane" id="reviews"
								 role="tabpanel">
								<div class="review_address_inner mt-30">
									<!-- Start Single Review -->
									<div id="mycomment">
										<c:set var="totalStars" value="0" /> <!-- Khởi tạo biến tổng số sao -->
										<c:forEach var="numComments" items="${listCommentFull}"> <!-- Duyệt qua danh sách số lượng comment -->
											<c:set var="totalStars" value="${totalStars + numComments.status}" /> <!-- Tính tổng số sao -->
										</c:forEach>
										<c:set var="averageStars" value="${listCommentFull.size() > 0 ? totalStars / listCommentFull.size() : 5}" />
										<c:set var="roundedStars" value="${Math.round(averageStars * 10.0) / 10.0}" />
										<h3 class="evaluate">Đánh giá trung bình: <span style="color:var(--primary-color);"> ${roundedStars}</span>/5 <span><li style="list-style: none; margin-left: 13px"><span class="icon-star"></span></li></span> </h3>
										<c:forEach items="${listComment}" var="comment">
											<div class="pro_review">
												<div class="review_thumb">
													<img alt="review images"
														 src="assets/images/other/reviewer-60x60.jpg">
												</div>
												<div class="review_details">
													<div class="review_info mb-10">
														<ul class="product-rating d-flex mb-10">
															<c:forEach var="i" begin="1" end="${comment.status}">
																<li><span class="icon-star"></span></li>
															</c:forEach>

														</ul>
														<h5>
																${comment.nameAcc} - <span> ${comment.date} </span>
														</h5>

													</div>
													<p>${comment.content}.</p>
													<div style="display: flex">
														<c:forEach items="${comment.imgAndVideo}" var="i">
															<img style="width: 88px; margin-left:10px " src="../assets/img/dataComment/${i}" alt="Comment Image">
														</c:forEach>
													</div>
												</div>
											</div>

										</c:forEach>
										<c:if test="${listCommentFull.size() > 5}">
											<a style="color: black; font-size: 18px" id="load_comment" onclick="loadComment()">Xem thêm các bình luận trước...</a>
										</c:if>
									</div>


									<!-- End Single Review -->
								</div>
								<!-- Start RAting Area -->
								<div class="rating_wrap mt-50">
									<h5 class="rating-title-1">
										<fmt:message key="product.morere" bundle="${language}"></fmt:message>
									</h5>
									<p>
										<fmt:message key="product.youremail" bundle="${language}"></fmt:message>
									</p>
									<h6 class="rating-title-2">
										<fmt:message key="product.yourre" bundle="${language}"></fmt:message>
									</h6>
								</div>
								<!-- End RAting Area -->
								<div class="comments-area comments-reply-area">
									<div class="row">
										<div class="col-lg-12">
											<form method="post"   action="<c:url value="/product/CommentController"></c:url>" name="myform" enctype="multipart/form-data" class="comment-form-area">
												<div class="comment-form-comment mt-15">
													<label><fmt:message key="product.Comment"
																		bundle="${language}"></fmt:message></label>
													<div class="rating">
														<input type="radio" id="star1" name="rating" value="5" onChange="handleRating('5')"/>
														<label for="star1"></label>
														<input type="radio" id="star2" name="rating" value="4" onChange="handleRating('4')"/>
														<label for="star2"></label>
														<input type="radio" id="star3" name="rating" value="3" onChange="handleRating('3')"/>
														<label for="star3"></label>
														<input type="radio" id="star4" name="rating" value="2" onChange="handleRating('2')"/>
														<label for="star4"></label>
														<input type="radio" id="star5" name="rating" value="1" onChange="handleRating('1')"/>
														<label for="star5"></label>
													</div>
													<p style="color:red;" id="errorRating"></p>
													<textarea class="comment-notes" required="required" name="content"></textarea>
												</div>
												<div class="form-group">
													<label for="image">Attach file:</label>
													<input type="file" class="form-control-file" id="image" name="image" >
													<input type="file" name="video" id="video" >
												</div>
												<div class="comment-form-submit mt-15">
													<input type="button" value="Gửi" class="comment-submit" onclick="Comment()">
												</div>
											</form>

										</div>
										</form>
									</div>
								</div>
							</div>
						</div>
						<!-- End Single Content -->
					</div>
				</div>
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
<!-- Thêm thư viện jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.3.0/jquery.form.min.js"></script>
<!-- Thêm plugin jQuery File Upload -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/blueimp-file-upload/9.28.0/css/jquery.fileupload.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/blueimp-file-upload/9.28.0/js/jquery.fileupload.min.js"></script>

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
<script type="text/javascript">
	var rating = 0;
	function handleRating(value) {
		// Xử lý khi rating thay đổi, có thể hiển thị thông tin rating hoặc thực hiện các xử lý khác
		console.log("Rating: " + value);
		rating = value;
	}
	function loadComment(){
		var limit=${listComment.size()};
		console.log(limit);
		var xhttp;
		var url ="CommentController?limit="+limit+"&idP=${CT_SP.idP}";
		if(window.XMLHttpRequest){
			xhttp= new XMLHttpRequest();

		} else{
			xhttp= new ActiveXObject("Microsoft.XMLHTTP");
		}
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4) {

				var data = xhttp.responseText;
				document.getElementById("mycomment").innerHTML = data;
			}
		}
		xhttp.open("POST", url, true);
		xhttp.send();
	}
	function Comment(){
		const error = document.getElementById("errorRating");
		const rating = parseInt($('input[name="rating"]:checked').val());
		if (rating === 0) {
			error[0].innerHTML = "Vui lòng chọn số sao";
			return;
		}
		var xhttp;


		const imageFile = document.getElementById("image").files;
		const videoFile = document.getElementById("video").files;
		var content = document.myform.content.value;
		// dữ liệu truyền qua servlet
		var formData = new FormData();
		formData.append('idP', '${CT_SP.idP}');
		formData.append('content', content);
		formData.append('rating', rating);
		if (imageFile.length > 0) {
			// Thêm các file ảnh vào FormData
			for (var i = 0; i < imageFile.length; i++) {
				formData.append("imageFiles", imageFile[i]);
			}
		}
		if (videoFile.length > 0) {
			// Thêm các file video vào FormData
			for (var i = 0; i < videoFile.length; i++) {
				formData.append("videoFiles", videoFile[i]);
			}
		}
		$.ajax({
			url: 'CommentController',
			type: 'POST',
			data: formData,
			processData: false,
			contentType: false,
			success: function(data) {
				// Xử lý phản hồi từ máy chủ
				document.getElementById("mycomment").innerHTML = data;
			},
			error: function(jqXHR, textStatus, errorThrown) {
				// Xử lý lỗi
				console.log(jqXHR, textStatus, errorThrown)
			}
		});
		var url ="CommentController?content="+content+"&idP=${CT_SP.idP}";
		if(window.XMLHttpRequest){
			xhttp= new XMLHttpRequest();

		} else{
			xhttp= new ActiveXObject("Microsoft.XMLHTTP");
		}
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4) {

				var data = xhttp.responseText;
				document.getElementById("mycomment").innerHTML = data;
			}
		}
		xhttp.open("POST", url, true);
		xhttp.send();
	}
</script>
<script>
	function toggleFavourite(idP, nameAcc) {
		var favouriteIcon = document.getElementById("favourite-icon");
		var isFavourite = favouriteIcon.classList.contains("active");
			// Cập nhật trạng thái yêu thích dựa trên phản hồi từ servlet
			if (isFavourite) {
				favouriteIcon.classList.remove("active");
			} else {
				favouriteIcon.classList.add("active");
			}
		console.log(1)
		// Gửi yêu cầu đến servlet để thêm hoặc xóa sản phẩm yêu thích
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {

		};
		xhttp.open("POST", "/WebBanHang/FavouritesServlet?idP=" + idP + "&nameAcc=" + nameAcc, true);
		xhttp.send();
	}

</script>


</body>


<!-- Mirrored from template.hasthemes.com/ruiz/ruiz/product-details.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 06 Nov 2021 12:52:40 GMT -->


<!-- Mirrored from ruizzz.tk/product-details.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 02 Nov 2022 09:21:29 GMT -->
</html>