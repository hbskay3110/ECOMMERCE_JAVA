
<!doctype html>
<html>
<head>

    <%@page isELIgnored="false"%>
    <!doctype html>
    <!-- Mirrored from template.hasthemes.com/ruiz/ruiz/checkout.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 06 Nov 2021 12:50:36 GMT -->


    <!-- Mirrored from ruizzz.tk/checkout.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 02 Nov 2022 09:21:29 GMT -->
    <!-- Added by HTTrack -->
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <!-- /Added by HTTrack -->

        <%@ page import="java.util.List" %>
        <%@ page import="com.google.gson.Gson" %>
        <%@ page import="model.District" %>

        <jsp:useBean id="loadAPI" class="apiLogistic.LoadDataApi" />
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
        <link rel="stylesheet" href="<c:url value="../css/style.css"></c:url>">
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        // Lấy đối tượng select từ HTML
        const selectAddress = document.getElementById('address');
        const selectAddresshuyen = document.getElementById('huyen');
        const selectAddressxa = document.getElementById('xa');
        <%
         String provinceJson = loadAPI.getProvince();
        %>
        var provinceList = JSON.parse('<%=provinceJson%>');
        let keys = Object.keys(provinceList);
        let values = Object.values(provinceList);
        const option = document.createElement('option');
        option.value = "";
        option.text ="";
        selectAddress.add(option);
        for (var i = 0; i < keys.length; i++) {
            option.value = keys[i];
            option.text = values[i];
            selectAddress.add(option);
        }
        // Xử lý sự kiện khi người dùng chọn tỉnh
        selectAddress.addEventListener('change', () => {
            var selectProvince = selectAddress.value;
            // Duyệt qua mảng và làm gì đó với các đối tượng trong mảng
            const url = "address?idProvince="+selectProvince;
            $(document).ready(function() {
                $.ajax({
                    url: url,
                    type: 'GET',
                    success: function(string) {
                        var districtList = JSON.parse(string);
                        while (selectAddresshuyen.firstChild) {
                            selectAddresshuyen.removeChild(selectAddresshuyen.firstChild);
                        }
                        const optionDistrict = document.createElement('option');
                        optionDistrict.value = "";
                        optionDistrict.text ="" ;
                        for (var i = 0; i < districtList.length; i++) {
                            var district = districtList[i];
                            optionDistrict.value = district.districtId;
                            optionDistrict.text = district.districtName;

                            selectAddresshuyen.add(optionDistrict);
                        }
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.error('Error:', textStatus, errorThrown);
                    }
                });
            });
        })
        // Khi người dùng chọn huyện
        selectAddresshuyen.addEventListener('change', () => {
            // Lấy mã tỉnh được chọn
            var selectProvince = selectAddresshuyen.value;
            const url = "address?id=" + selectProvince;
            $(document).ready(function () {
                $.ajax({
                    url: url,
                    type: 'GET',
                    success: function (string) {
                        var wardList = JSON.parse(string);
                        while (selectAddressxa.firstChild) {
                            selectAddressxa.removeChild(selectAddressxa.firstChild);
                        }
                        for (var i = 0; i < wardList.length; i++) {
                            var ward = wardList[i];
                            const option = document.createElement('option');
                            option.value = ward.wardCode;
                            option.text = ward.wardName;
                            selectAddressxa.add(option);
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.error('Error:', textStatus, errorThrown);
                    }
                });
            });
        });
        // Khi người dùng chọn xã
        selectAddressxa.addEventListener('change',()=>{
            var idWard = selectAddressxa.value;
            var idDistrict = selectAddresshuyen.value;
            // Lấy ra giỏ hàng từ session
            var cart = JSON.parse(sessionStorage.getItem("cart"));

            // Tính tổng số lượng sản phẩm trong giỏ hàng
            var totalQuantity = 0;
            if (cart != null) {
                for (var i = 0; i < cart.length; i++) {
                    totalQuantity += cart[i].quantity;
                }
            }
            console.log(totalQuantity)
            // const url = "address?idWard=" + idWard+"&idDistrict="+idDistrict;
            // $(document).ready(function () {
            //     $.ajax({
            //         url: url,
            //         type: 'GET',
            //         success: function (string) {
            //             var wardList = JSON.parse(string);
            //             while (selectAddressxa.firstChild) {
            //                 selectAddressxa.removeChild(selectAddressxa.firstChild);
            //             }
            //             for (var i = 0; i < wardList.length; i++) {
            //                 var ward = wardList[i];
            //                 const option = document.createElement('option');
            //                 option.value = ward.wardCode;
            //                 option.text = ward.wardName;
            //                 selectAddressxa.add(option);
            //             }
            //         },
            //         error: function (jqXHR, textStatus, errorThrown) {
            //             console.error('Error:', textStatus, errorThrown);
            //         }
            //     });
            // });

        })
    </script>
</head>
<body>

</body>
</html>

