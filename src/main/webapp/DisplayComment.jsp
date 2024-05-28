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
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8"%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="robots" content="noindex, follow" />
    <meta name="description" content="">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
</head>
<body>
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
</body>
</html>
