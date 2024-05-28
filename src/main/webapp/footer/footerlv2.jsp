<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
<meta charset="ISO-8859-1">
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="lg" value="${sessionScope.language}"></c:set>
<c:if test="${lg eq 'US' }">
	<fmt:setLocale value="en_US" />
</c:if>
<c:if test="${lg eq 'VN' || lg == null }">
	<fmt:setLocale value="vi_VN" />
</c:if>
<fmt:setBundle basename="app" var="language"></fmt:setBundle>
<title>Insert title here</title>
</head>
<body>
	        <div class="footer">
            <div class="grid wide footer__content-mobile">
                <div class="row1">
                    <div class="col l-2-4 m-4 c-6">
                        <h3 class="footer__heading"><fmt:message key= "footer.Customer" bundle="${language}"></fmt:message> </h3>
                        <ul class="footer__list">
                            <li class="footer__item">
                                <a href="" class="footer__item-link"><fmt:message key= "footer.Help" bundle="${language}"></fmt:message> </a>
                            </li>
                            <li class="footer__item">
                                <a href="" class="footer__item-link">Brother Meil</a>
                            </li>
                            <li class="footer__item">
                                <a href="" class="footer__item-link"><fmt:message key= "footer.Buying" bundle="${language}"></fmt:message> </a>
                            </li>
                            <li class="footer__item">
                                <a href="" class="footer__item-link"><fmt:message key= "footer.Sales" bundle="${language}"></fmt:message> </a>
                            </li>
                            <li class="footer__item">
                                <a href="" class="footer__item-link"><fmt:message key= "footer.Returns" bundle="${language}"></fmt:message> </a>
                            </li>
                            <li class="footer__item">
                                <a href="" class="footer__item-link"><fmt:message key= "footer.Care" bundle="${language}"></fmt:message> </a>
                            </li>
                        </ul>
                    </div>
                    <div class="col l-2-4 m-4 c-6">
                        <h3 class="footer__heading"><fmt:message key= "footer.Introduce" bundle="${language}"></fmt:message> </h3>
                        <ul class="footer__list">
                            <li class="footer__item">
                                <a href="About.jsp" class="footer__item-link"><fmt:message key= "footer.About" bundle="${language}"></fmt:message> </a>
                            </li>
                            <li class="footer__item">
                                <a href="" class="footer__item-link"><fmt:message key= "footer.Clause" bundle="${language}"></fmt:message> </a>
                            </li>
                            <li class="footer__item">
                                <a href="" class="footer__item-link"><fmt:message key= "footer.Recruit" bundle="${language}"></fmt:message> </a>
                            </li>
                            <li class="footer__item">
                                <a href="" class="footer__item-link"><fmt:message key= "footer.Privacy" bundle="${language}"></fmt:message> </a>
                            </li>
                        </ul>
                    </div>
                    <div class="col l-2-4 m-4 c-6">
                        <h3 class="footer__heading"><fmt:message key= "footer.Abate" bundle="${language}"></fmt:message> </h3>
                        <div>
                            <img src="../assets/img/Mastercard-logo.svg.png" alt="Download QR" class="footer__download-app-img">
                            <img src="../assets/img/Visa_Inc._logo.svg.png" alt="Download QR" class="footer__download-app-img">
                            <img src="../assets/img/jcb.jfif" alt="Download QR" class="footer__download-app-img">
                        </div>
                        <div>
                            <img src="../assets/img/free-installment.jpg" alt="Download QR" class="footer__download-app-img">
                            <img src="../assets/img/zalopay.jpg" alt="Download QR" class="footer__download-app-img">
                            <img src="../assets/img/Maestro_2016.svg.png" alt="Download QR" class="footer__download-app-img">
                            <img src="../assets/img/paypal.png" alt="Download QR" class="footer__download-app-img">
                        
                        </div>

                    </div>
                    <div class="col l-2-4 m-4 c-6">
                        <h3 class="footer__heading"><fmt:message key= "footer.Follow" bundle="${language}"></fmt:message> </h3>
                        <ul class="footer__list">
                            <li class="footer__item">
                                <a href="" class="footer__item-link">
                                    <i class="footer__item-icon fab fa-facebook"></i>Facebook
                                </a>
                            </li>
                            <li class="footer__item">
                                <a href="" class="footer__item-link">
                                    <i class="footer__item-icon fab fa-instagram-square"></i>Instagram
                                </a>
                            </li>
                            <li class="footer__item">
                                <a href="" class="footer__item-link">
                                    <i class="footer__item-icon fab fa-linkedin"></i>Linkedln
                                </a>
                            </li>
                        </ul>


                    </div>
                    <div class="col l-2-4 m-8 c-12">
                        <h3 class="footer__heading"><fmt:message key= "footer.Goappstore" bundle="${language}"></fmt:message> </h3>
                        <div class="footer__download">
                            <img src="../assets/img/qr.png" alt="Download QR" class="footer__download-qr">
                            <div class="footer__download-apps">
                                <a href="" class="footer__download-apps-link">
                                    <img src="../assets/img/downChplay.png" alt="Google Play"
                                        class="footer__download-app-img">
                                </a>
                                <a href="" class="footer__download-apps-link">
                                    <img src="../assets/img/downAppstore.png" alt="App store"
                                        class="footer__download-app-img">
                                </a>

                            </div>
                        </div>
                    </div>
                </div>



            </div>
            <div class="footer-bottom">
                <div class="grid wide">

                    <div class="row footer-end ">
                        <div class=" row footer__policy">
                            <a href="" class="col l-3 m-6 c-6 footer__policy-item"><fmt:message key= "footer.Policy" bundle="${language}"></fmt:message> </a>
                            <a href="" class="col l-3 m-6 c-6 footer__policy-item"><fmt:message key= "footer.Operating" bundle="${language}"></fmt:message> </a>
                            <a href="" class="col l-3 m-6 c-6 footer__policy-item"><fmt:message key= "footer.Shipping" bundle="${language}"></fmt:message> </a>
                            <a href="" class="col l-3 m-6 c-6 footer__policy-item"><fmt:message key= "footer.Refund" bundle="${language}"></fmt:message>  </a>
                        </div>
                        <img src="../assets/img/img.jpg"
                            alt="" class="footer__registration">
                        <p class="footer__text"><fmt:message key= "footer.Company" bundle="${language}"></fmt:message> </p>
                        <p class="footer__text"><fmt:message key= "footer.Address" bundle="${language}"></fmt:message> </p>
                        <p class="footer__text"><fmt:message key= "footer.Responsible" bundle="${language}"></fmt:message> </p>
                        <p class="footer__text"><fmt:message key= "footer.Limited" bundle="${language}"></fmt:message> </p>

                    </div>
                </div>
            </div>
        </div>
</body>
</html>