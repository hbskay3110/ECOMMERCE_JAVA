<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">--%>
<link rel="stylesheet" href="./assets/css/base.css">
<link rel="stylesheet" href="./assets/css/grid.css">
<link rel="stylesheet" href="./assets/css/rebonsive.css">
<link rel="stylesheet" href="./assets/css/main.css">

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
<title>Insert title here</title>
</head>
<style>
.login_container {
	width: 500px;
	height: 100%;
	margin: auto;
	background-color: white;
	border-radius: 17px;
}

.auth-form__error-msg {
	display: block;
	font-size: 1.2rem;
	color: #f33a58;
	line-height: 1.6rem;
	padding: 6px 0 0;
}

.auth-form__form {
	padding: 0 12px;
}

.main {
	height: 640px;
	background-color: #53e736;
}

.auth-form__form-register {
	display: flex;
}
.value_form .auth-form__input-register{
		width: 150%
}
.text_Form {
	margin: 0;
	font-size: 20px;
	margin-top: 28px;
	padding-right: 5px
}
.text_Form-ten {
	padding-left: 85px
}
table{
    margin: 0 15px;
    font-size: 20px;
}
.value_form{
}
.form-footer{
    display: flex;
    justify-content: center;
    margin: 50px;
}
.check{
display: flex;

}
.input_check{
    margin-top: 29px;
    margin-left: 50px;
    margin-right: 10px;
}
</style>
<body>

	<div class="main">
		<div class="login_container">
			<!--Login from-->
			
			<form action="<c:url value="/Login?action=Res"></c:url>" class="form" id="form-2"
				method="post">
				<div class="auth-form__header">
					<h3 class="auth-form__heading">Đăng Ký</h3>
					<div class="header-logo hide-on-tablet">
					
					<a href="<c:url value="/index.jsp"></c:url>" class="header-logo-link"> <img
						class="header-logo-img" src="./assets/img/logo2.png" />
					</a>

				</div>
					<a href="<c:url value="/Login"></c:url>" style="text-decoration: none;"><span class="auth-form__switch-btn js-form-register" > ĐăngNhập</span></a>
				</div>
				<div class="auth-form__form">
					<div class="auth-form__group auth-form__form-register">
						<p class="text_Form" >*Họ:</p>
						<input type="text" placeholder="Vd: Nguyễn" name = "lastName"
							class="auth-form__input auth-form__input-register ">
						<p class="text_Form text_Form-ten">*Tên:</p>
						<input type="text" placeholder="Vd: Văn A" name= "firstName"
							class="auth-form__input auth-form__input-register">
					</div>
				</div>
				<table>
					<tr class="value_form">
						<td>*Tên tài khoản :</td>
						<td><input type="text" name ="userName" class="auth-form__input auth-form__input-register" placeholder="Nhập tên tài khoản"></td>
						
					</tr>
					<tr class="value_form">
						<td></td>
						<td><span class="auth-form__error-msg">${erorr.erorrTK}</span></td>					
					</tr>
					<tr class="value_form">
						<td>*Mật khẩu :</td>
						<td><input type="password" name = "pass" class="auth-form__input auth-form__input-register" placeholder="Ít nhất 6 kí tự"></td>
					</tr>
					<tr class="value_form">
						<td>*Nhập lại mật khẩu :</td>
						<td><input type="password" name = "repass"class="auth-form__input auth-form__input-register" placeholder="Nhập lại mật khẩu"></td>
					</tr>
					<tr class="value_form">
						<td></td>
						<td><span class="auth-form__error-msg">${erorr.erorrRepass}</span></td>
						
					</tr>
					<tr class="value_form">
						<td>Giới tính :</td>
						<td><input type="radio" name = "sex"value="Nam"> Nam <input type="radio"  name = "sex" value="Nữ"> Nữ  </td>
					</tr>
					<tr class="value_form">
						<td>Ngày sinh :</td>
					<td><input type="date" name= "dob" class="auth-form__input auth-form__input-register"> </td>
					</tr >
					<tr class="value_form">
						<td>Số điện thoại :</td>
					<td><input type="text" name= "telephone" class="auth-form__input auth-form__input-register"> </td>
					</tr>
					
				</table>
				<div class="check">
					<input type="checkbox" name = "check" value="ok" class="input_check"> <p class="text_Form">Bạn đã đồng ý với các điểu khoản của shop</p>
				</div>
				<div class="form-footer">
				<div
					class="btn btn--normal auth-form__controls--back js-auth-form__controls--back">TRỞ LẠI</div>
				<button type="submit" class="btn btn-primary">ĐĂNG KÝ	</button>
				</div>
				</form>
		</div>
		

		
	</div>
	</div>

</body>
</html>