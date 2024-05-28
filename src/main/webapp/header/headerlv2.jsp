<%@page import="model.Account"%>
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

<%@page isELIgnored="false"%>
<fmt:setBundle basename="app" var="language" />
<!DOCTYPE html>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<style>
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="header">
		<div class="grid wide">
			<nav class="header__navbar hide-on-mobile-tablet">
				<ul class="header__navbar-list">

					<a class="header__navbar-item header__navbar-item--separate "
						href="<c:url value="../startbootstrap-sb-admin-2-master/index.jsp"></c:url>"> 
						<fmt:message key="header.channels" bundle="${language}"></fmt:message>
					</a>
					<a class="header__navbar-item header__navbar-item--separate "
						href="<c:url value="../startbootstrap-sb-admin-2-master/register.jsp"></c:url>"> <fmt:message
							key="header.seller" bundle="${language}"></fmt:message>
					</a>
					<li
						class="header__navbar-item header__navbar-item--qr header__navbar-item--separate  ">
						<fmt:message key="header.down" bundle="${language}"></fmt:message>
						<div class="header__qr">
							<img src="./assets/img/qr.png" alt="QR code"
								class="header__qr-img">

							<div class="header__qr-apps">
								<a href="" class="header__qr-link"> <img
									src="./assets/img/downAppstore.png" alt=""
									class="header__qr-download-img">
								</a> <a href="" class="header__qr-link"> <img
									src="./assets/img/downChplay.png" alt=""
									class="header__qr-download-img">
								</a>
							</div>
						</div>
					</li>
					<li class="header__navbar-item "><span
						class="header__navbar-title--nopointer"> <fmt:message
								key="header.flow" bundle="${language}"></fmt:message>
					</span> <a href="" class="header__navbar-icon-link "> <i
							class="header__navbar-icon fab fa-facebook"></i>
					</a> <a href="" class="header__navbar-icon-link"> <i
							class="header__navbar-icon fab fa-instagram"></i>
					</a></li>

				</ul>
				<ul class="header__navbar-list">
					<li class="header__navbar-item header__navbar-item-notify"><a
						href="" class="header__navbar-item-link"><i
							class="header__navbar-icon far fa-bell"></i>
						<fmt:message key="header.noti" bundle="${language}"></fmt:message></a>
						<div class="header__notify">
							<header class="header__notify-header">
								<h3><fmt:message key="header.newNoti" bundle="${language}"></fmt:message></h3>
							</header>

							<ul class="header__notify-list">
								<li class="header__notify-item header__notify-item--viewed">
									<a href="" class="header__notify-link"> <img
										src="https://lavendermedia.vn/wp-content/uploads/2019/10/chup-hinh-my-pham-quang-quang-1.jpg"
										alt="" class="header__notify-img">
										<div class="hearder__notify-info">
											<span class="hearder__notify-name">Mỹ phẩm chính hảng</span>
											<span class="hearder__notify-decscriotion">Mô tả mĩ
												phẩm chính hãng</span> <span></span>
										</div>
								</a>
								</li>
								<li class="header__notify-item "><a href=""
									class="header__notify-link "> <img
										src="https://lavendermedia.vn/wp-content/uploads/2019/10/chup-hinh-my-pham-quang-quang-1.jpg"
										alt="" class="header__notify-img">
										<div class="hearder__notify-info">
											<span class="hearder__notify-name">Mỹ phẩm chính hảng</span>
											<span class="hearder__notify-decscriotion">Mô tả mĩ
												phẩm chính hãng</span> <span></span>
										</div>
								</a></li>
								<li class="header__notify-item"><a href=""
									class="header__notify-link"> <img
										src="https://lavendermedia.vn/wp-content/uploads/2019/10/chup-hinh-my-pham-quang-quang-1.jpg"
										alt="" class="header__notify-img">
										<div class="hearder__notify-info">
											<span class="hearder__notify-name">Xác thực chính hãng
												nguồn gốc của các sản phẩm chính hảng</span> <span
												class="hearder__notify-decscriotion">Mô tả mĩ phẩm
												chính hãng</span> <span></span>
										</div>
								</a></li>

							</ul>
							<footer class="header__notify-footer">
								<a href="" class="header__notify-footer-btn"><fmt:message key="header.viewAll" bundle="${language}"></fmt:message></a>
							</footer>
						</div></li>
					<li class="header__navbar-item"><a href=""
						class="header__navbar-item-link"><i
							class="header__navbar-icon far fa-question-circle"></i>
						<fmt:message key="header.help" bundle="${language}"></fmt:message></a>
					</li>
					<li class="header__navbar-item header__navbar-link-languge"><a
						href="" class="header__navbar-item-link "><i
							class="header__navbar-icon fas fa-globe"></i>
						<c:if test="${lg eq 'US' }">English</c:if> 
						<c:if test="${lg eq 'VN' || lg == null }"> Việt Nam</c:if></a>
						<ul class="header__navbar-languge">
							<a href="<c:url value="/Language?language=VN"></c:url>" class="header__navbar-languge-link"><li class="header__navber-languge-item">Tiếng Việt</li></a>
							<a	href="<c:url value="/Language?language=US"></c:url>" class="header__navbar-languge-link"><li class="header__navber-languge-item">English</li></a>
						</ul></li>

					<c:if test="${sessionScope.userLogin == null}">
						<a href="<c:url value="/register.jsp"></c:url>"
							style="text-decoration: none"><li
							class="header__navbar-item header__navbar-item--strong header__navbar-item--separate js-form-register">
								<fmt:message key="header.regis" bundle="${language}"></fmt:message>
						</li></a>
						<a href="<c:url value="/Login.jsp"></c:url>" style="text-decoration: none">
							<li
							class="header__navbar-item header__navbar-item--strong js-form-login"><fmt:message
									key="header.Login" bundle="${language}"></fmt:message></li>
						</a>
					</c:if>

					<c:if test="${sessionScope.userLogin != null}">
						<li class="header__navbar-item header__navbar-item-user"><img
							src="https://metricleo.com/wp-content/uploads/2021/03/word-image-23.jpeg"
							alt="" class="header__navbar-item header__navbar-user-img">
							<span class="header__navbar-user-name"><fmt:message key="header.hello" bundle="${language}"></fmt:message>
								${sessionScope.userLogin.userName}</span>
							<ul class="header__navbar-user-menu">
								<li class="header__navbar-user-item"><a
									href="<c:url value="/product/DetailUser"></c:url>"><fmt:message
											key="header.user" bundle="${language}"></fmt:message></a></li>
							
								<li class="header__navbar-user-item"><a href="<c:url value="/product/DetailUser"></c:url>"><fmt:message
											key="header.order" bundle="${language}"></fmt:message></a></li>
								<li
									class="header__navbar-user-item header__navbar-user-item--separate">
									<a href="<c:url value="/Login?action=Logout"></c:url>"><fmt:message
											key="header.out" bundle="${language}"></fmt:message></a>
								</li>

							</ul></li>
					</c:if>


				</ul>


			</nav>
			<!--Header with sreach-->
			<form action="<c:url value="/SearchSP?index=1"></c:url>" method="get">
				<div class="header-with-search ">
					<label for="nav-mobile-input" class="header-mobie-tab-bar">
						<i class="fas fa-bars header-mobie-tab-bar-icon"></i>
					</label> <label for="mobie_search-input" class="header-mobie-search">
						<i class=" fas fa-search header-mobie-search-icon"></i>
					</label>
					<div class="header-logo hide-on-tablet">
						<a href="<c:url value="/renderSP"></c:url>" class="header-logo-link"> <img
							class="header-logo-img" src="../assets/img/logo2.png" />
						</a>

					</div>
					<input type="checkbox" hidden class="header-search-checkbox"
						id="mobie_search-input">
					<div class="header__search ">
						<div class="header__search-input-wrap">
							<input type="text" class="header__search-input"
								placeholder="<fmt:message
											key="searchPlace" bundle="${language}"></fmt:message>" name="txtSearch">

						</div>

						<button class="header__search-btn" type="submit">
							<i class="header__search-btn-icon fas fa-search"></i>
						</button>
					</div>
			</form>
			<!-- cart layout  -->
			<a href="<c:url value="/product/cart.jsp"></c:url>">
				<div class="header__cart">
					<div class="header__cart-wrap ">
						<i class="header__cart-icon fas fa-shopping-cart"></i>
						<c:set var="size" value="${sizeCart}"></c:set>
						<c:if test="${size !=null }">
							<span class="header__cart-notice">${size}</span>
						</c:if>
						<c:if test="${size ==null }">
							<span class="header__cart-notice">0</span>
						</c:if>


					</div>
				</div>
			</a>
		</div>
	</div>
	<ul class="header__sort-bar">
		<li class="header__sort-item "><a href=""
			class="header__sort-link"><fmt:message key="header.outShop"
					bundle="${language}"></fmt:message></a></li>
		<li class="header__sort-item header__sort-item--active"><a
			href="" class="header__sort-link"><fmt:message
					key="header.outShop" bundle="${language}"></fmt:message></a></li>
		<li class="header__sort-item"><a href=""
			class="header__sort-link"><fmt:message key="header.Newest"
					bundle="${language}"></fmt:message></a></li>
		<li class="header__sort-item"><a href=""
			class="header__sort-link"><fmt:message key="header.outShop"
					bundle="${language}"></fmt:message></a></li>
	</ul>


	</div>
</body>
</html>