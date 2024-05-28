<%@page import="java.sql.ResultSet"%>
<%@page import="model.ConnectToDatabase"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
<link rel="stylesheet" href="./assets/css/main.css">
<link rel="stylesheet" href="./assets/css/base.css">
<link rel="stylesheet" href="./assets/css/grid.css">
<link rel="stylesheet" href="./assets/css/rebonsive.css">

<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans&family=Roboto:wght@300;400;500;700;900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"
	integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w=="
	crossorigin="anonymous" />
<link rel="icon"
	href="https://searchlogovector.com/wp-content/uploads/2019/06/bio-shop-logo-vector.png"
	type="image/x-icon" />


<title>Shop Brother</title>
</head>

<body>
	<div class="app">
		<jsp:include page="header/headerlv1.jsp"></jsp:include>
		<div class="app_container">
			<div class="grid wide">
				<div class="row sm-gutter app_content">
					<div class="col l-2 m-0 c-0 ">
						<nav class="category">
							<h3 class="category__heading">
								<i class="category__heading-icon fas fa-list"></i>Danh Mục
							</h3>
							<ul class="category-list">
								<li class="category-item " id="fullLoai"><a href="<c:url value="/renderSP"></c:url>"  
									class="category-item__link">Tất Cả</a></li>
									<c:forEach items="${listLoai}" var="i">	
										<li class="category-item" id="${i}"><a href="<c:url value="/SearchSP?attribute=LoaiSP&proviso=ASC&loaiSP=${i}"></c:url>"
										class="category-item__link">${i}</a></li>
									</c:forEach>
							</ul>
						</nav>
					</div>
					<div class="col l-10 m-12 c-12">
						<div class="home-filter hide-on-mobile-tablet">
							<span class="home-filter__label">Sắp xếp theo</span>						
							<button class="home-filter__btn btn-deafault btn btn-primary" id="YeuThich"><a class="btn-fiter" href="<c:url value="/SearchSP?attribute=YeuThich&proviso=DESC&loaiSP=${loaiSP}&txtSearch=${txtSearch}"></c:url>">Phổ biến</a></button>
							<button class="home-filter__btn btn" id="SPMoi"><a class="btn-fiter" href="<c:url value="/SearchSP?attribute=SPMoi&proviso=DESC&loaiSP=${loaiSP}&txtSearch=${txtSearch}"></c:url>">Mới nhất</a></button>
							<button class="home-filter__btn btn" id="SoLuongBan"><a class="btn-fiter" href="<c:url value="/SearchSP?attribute=SoLuongBan&proviso=DESC&loaiSP=${loaiSP}&txtSearch=${txtSearch}"></c:url>">Bán chạy</a></button>
							<div class="select-input">
								<c:set var="proviso" value="${proviso}" ></c:set>
								<c:set var="attribute" value="${attribute}" ></c:set>
								<c:if test="${attribute != 'priceP' }">
									<span class="select-input__label">Giá </span> 
								</c:if>
							
								<c:if test="${proviso == 'ASC' && attribute eq 'priceP'}">
									<span class="select-input__label">Giá: Thấp đến cao </span> 
								</c:if>
								<c:if test="${proviso == 'DESC'&& attribute eq 'priceP'}">
									<span class="select-input__label">Giá: Cao đến thấp </span> 
								</c:if>
								
									<i class="select-input__icon fas fa-chevron-down"></i>
								<ul class="select-input__list">			
									<li class="select-input__item"><a href='<c:url value="/SearchSP?attribute=priceP&proviso=ASC&loaiSP=${loaiSP}&txtSearch=${txtSearch}"></c:url>'
										class="select-input__link select-input__link--up" >Giá:
											Thấp đến cao</a></li>
									<li class="select-input__item"> 
										<a href="<c:url value="/SearchSP?attribute=priceP&proviso=DESC&loaiSP=${loaiSP}&txtSearch=${txtSearch}"></c:url>"
										class="select-input__link select-input__link--down">Giá:
											Cao đến thấp</a>
									</li>
								</ul>
							</div>
							<div class="home-filter__page">
								<span class="home-filter__num"><span
									class="home-filter__current">${index}</span>/${endPage}</span>
								<div class="home-filter__page-control">
									<c:if test="${index gt 1}">
									<a href="SearchSP?index=${index-1}&txtSearch=${txtSearch}&attribute=${attribute}&proviso=${proviso}&loaiSP=${loaiSP}"
										class="home-filter__page-btn home-filter__page-btn-left home-filter__page-btn-disabled">
										<i class="home-filter__page-icon fas fa-chevron-left"></i>
									</a>
								</c:if>
								<c:if test="${index == 1}">
									<a href="#"
										class="home-filter__page-btn home-filter__page-btn-left home-filter__page-btn-disabled">
										<i class="home-filter__page-icon fas fa-chevron-left"></i>
									</a>
								</c:if>
								<c:if test="${index lt endPage}">
									<a href="SearchSP?index=${index+1}&txtSearch=${txtSearch}&attribute=${attribute}&proviso=${proviso}&loaiSP=${loaiSP}"
										class="home-filter__page-btn home-filter__page-btn-left home-filter__page-btn-disabled">
										<i class="home-filter__page-icon fas fa-chevron-right"></i>
									</a>
								</c:if>
								<c:if test="${index == endPage}">
									 <a href="#"
										class="home-filter__page-btn home-filter__page-btn-right">
										<i class="home-filter__page-icon fas fa-chevron-right"></i>
									</a>
								</c:if>

								</div>
							</div>
						</div>
						<nav class="mobile-category">
							<ul class="mobile-category__list">
								<c:forEach items="${listLoai}" var="i">
									<li class="category-item"><a href="/SearchSP?attribute=LoaiSP&proviso=ASC&loaiSP=${i}"
									class="category-item__link">${i}</a></li>
								</c:forEach>

							</ul>
						</nav>
						<div class="home-product">
							<div class="row sm-gutter product__total">
												<c:forEach items="${list}" var="i">
									<div class="col l-2-4 m-4 c-6">
										<div class="home-product-wrap">
											<a class="home-produt-item"
											
												href="<c:url value="/product/productDetail?maSP=${i.idP}"></c:url>">
												<div class="home-produt-item-img"
													style="background-image: url('./assets/img/product/${i.listImage.get(0).nameI}');">
												</div>
												<h4 class="home-produt-item-name">${i.nameP}</h4>
												<div class="home-produt-item-price">
													<span class="home-produt-item-price-old">${i.priceP}00đ</span>
												
													<span class="home-produt-item-price-current">${Math.round(i.priceP-i.priceP*(i.sale/100))}.000đ</span>
												</div>
											</a>
											<div class="home-produt-item-action">
												<span class="home-produt-item-like "> <i
													class="home-produt-item-like-icon-empty far fa-heart"></i>
													<i class="home-produt-item-like-icon-fill fas fa-heart"></i>
												</span> <span class="home-produt-item-rating"> <i
													class="home-produt-item__start-gold fas fa-star"></i> <i
													class="home-produt-item__start-gold fas fa-star"></i> <i
													class="home-produt-item__start-gold fas fa-star"></i> <i
													class="home-produt-item__start-gold fas fa-star"></i> <i
													class="fas fa-star"></i>
												<%-- </span> <span class="home-produt-item__sold">${i.soLuongBan}
													đã bán</span> --%>
											</div>
											<div class="home-produt-item__origin">
												<span class="home-produt-item__brand"></span> <span
													class="home-produt-item__origin-name"></span>
											</div>
											<c:set var="yt" value="0"></c:set>
											<c:if test="${yt == 1}">
											<div class="home-produt-item__favourite">
												<i class="fas fa-check"></i><span>Yêu thích</span>
											</div>
											</c:if>
											<div class="home-produt-item__sale-off">
												<span class="home-produt-item__sale-off-percent">${i.sale}
													%</span> <span class="home-produt-item__sale-off-label">Giảm</span>
											</div>
											<button class="btn btn-primary btn-add-product">Thêm
												vào giỏ hàng</button>
										</div>
									</div>
								</c:forEach>

							</div>
						</div>
						<ul class="panigation home-product-panigation">
						<li class="panigation-item">
							<c:if test="${index gt 1}">
							<a href="SearchSP?index=${index-1}&txtSearch=${txtSearch}&attribute=${attribute}&proviso=${proviso}&loaiSP=${loaiSP}"
								class="panigation-item__link"> 
								<i class="panigation-item__icon fas fa-angle-left"></i>
							</a>
							</c:if>
							<c:if test="${index == 1}">
							<a href="#"
								class="panigation-item__link"> 
								<i class="panigation-item__icon fas fa-angle-left"></i>
							</a>
							</c:if>
							</li>
							<c:forEach begin="1" end="${endPage}" var="o">

								<li class="panigation-item" ">
								<a  href="SearchSP?index=${o}&txtSearch=${txtSearch}&attribute=${attribute}&proviso=${proviso}&loaiSP=${loaiSP}" class="panigation-item__link" id="${o}">${o}</a>
								</li>
							</c:forEach>
							<li class="panigation-item">
							<c:if test="${index lt endPage}">
							<a href="SearchSP?index=${index+1}&txtSearch=${txtSearch}&attribute=${attribute}&proviso=${proviso}&loaiSP=${loaiSP}"
								class="panigation-item__link"> 								
							<i class="panigation-item__icon fas fa-angle-right"></i>
							</a>
							</c:if>
							<c:if test="${index == endPage}">
							<a href="#"
								class="panigation-item__link"> 								
							<i class="panigation-item__icon fas fa-angle-right"></i>
							</a>
							</c:if>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="footer/footerlv1.jsp"></jsp:include>

	</div>
	<!-- header mobie tab bar orerlay -->
	<div class="header-mobie-tab-bar-overlay"></div>
	<div class="nav__mobile">
		<div class="nav__mobile-header">
			<h2 class="nav__mobile-text">Brother SHOP</h2>
			<div class="nav__mobile-close">
				<i class="fas fa-times"></i>
			</div>
		</div>
		<ul class="nav-mobile-list">
			<li class="nav__mobile-link nav__mobile-link-register"><a
				style="text-decoration: none" href="">Đăng kí </a></li>
			<li class="nav__mobile-link nav__mobile-link-login"><a
				href="../Login.jsp" style="text-decoration: none">Đăng nhập</a></li>
			<li class="nav__mobile-link "><a href="">Hỗ Trợ</a></li>

			<!-- <li class="nav__mobile-link"><a href="">Tài khoản của tôi</a></li>
        <li class="nav__mobile-link"><a href="">Địa chỉ của tôi</a></li>
        <li class="nav__mobile-link"><a href="">Đơn mua</a></li>
        <li class="nav__mobile-link header__navbar-mobile-user-item--separate"><a href="">Đăng
                xuất</a></li> -->
		</ul>
	</div>
	<div id="toast"></div>
	<!-- modal layout -->
	<div class="modal js-modal">
		<div class="modal__overlay"></div>
		<div class="modal__body js-modal__body">
			<!--Register from-->
			<div class="auth-form auth-form-login-register">
				<div class="auth-form__container">
					<form action="" class="form" id="form-1">
						<div class="auth-form__header">
							<h3 class="auth-form__heading">Đăng ký</h3>
							<span class="auth-form__switch-btn js-form-login">Đăng
								nhập</span>
						</div>

						<div class="auth-form__form">
							<div class="auth-form__group ">
								<input type="text" name="emailorPhone" class="auth-form__input"
									id="email" placeholder="Nhập email hoặc số điện thoại">
								<span class="auth-form__error-msg"></span>
							</div>
							<div class="auth-form__group">
								<input type="password" name="pass" class="auth-form__input"
									id="pass" placeholder="Nhập mật khẩu"> <span
									class="auth-form__error-msg"></span>
							</div>
							<div class="auth-form__group">
								<input type="password" name="checkpass" class="auth-form__input"
									id="checkpass" placeholder="Nhập lại mật khẩu"> <span
									class="auth-form__error-msg"></span>
							</div>
						</div>
						<div class="auth-form__aside">
							<p class="auth-form__policy-text">
								Bằng việc đăng kí bạn đã đồng ý với chúng tôi về <a
									class="auth-form__text-link">Điều khoản dịch vụ</a> & <a
									class="auth-form__text-link">Chính sách bảo mật</a>
							</p>
						</div>
						<div class="auth-form__controls">
							<div
								class="btn btn--normal auth-form__controls--back js-auth-form__controls--back">TRỞ
								LẠI</div>
							<button class="btn btn-primary">ĐĂNG KÝ</button>


						</div>
					</form>
				</div>
				<div class="auth-form__socials">
					<a
						href="https://www.facebook.com/?stype=lo&jlou=Aff9vdnyDCruPq8hUrvesIOZ3krl2oO57sdFXCI2-jxvLyxDr9TwxdnlMqC-xu_BMf_xCxfYtjOj4oudmqnZcVleGrlH67f4bfgE66vNgpKHtg&smuh=13617&lh=Ac8LmChl5c0TrY0qlbM"
						class="auth-form__socials-facebook btn btn-size-s btn--withicon"><i
						class="auth-form__socials-icon fab fa-facebook-square"></i> <span
						class="auth-form__socials-title">Kết nối với FaceBook</span> </a> <a
						href=""
						class="auth-form__socials-google btn btn-size-s btn--withicon"><i
						class="auth-form__socials-icon fab fa-google"></i> <span
						class="auth-form__socials-title">Kết nối với Google</span> </a>

				</div>


			</div>
			-->

		</div>


	</div>



</body>
<script src="./assets/scrip/main.js"></script>
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
<script>
	const myElement = document.getElementById(`${index}`);
	myElement.style.backgroundColor = `var(--primary-color)`;
	myElement.style.color = "white";
	
	const loaiSP = document.getElementById(`${loaiSP}`);
	const fullLoai = document.getElementById("fullLoai");
	
	if(loaiSP != null){
		loaiSP.classList.add("category-item--active")
		fullLoai.classList.remove("category-item--active")
	}else{
		fullLoai.classList.add("category-item--active")
	}
	const sort = document.getElementById(`${attribute}`);
	console.log(sort)
	const btnDeafault =document.querySelector(".btn-deafault");
	console.log(btnDeafault)
	if(sort != null && sort !=btnDeafault ){
		sort.classList.add("btn-primary");
		btnDeafault.classList.remove("btn-primary"); 
	}
</script>


</html>