<%@page isELIgnored="false"%>
<%

%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Brother Admin - Dashboard</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link
          href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">
  <link href="css/main.css" rel="stylesheet">

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

  <!-- Sidebar -->
  <jsp:include page="../header/headerLeftAmin.jsp"></jsp:include>
  <!-- End of Sidebar -->

  <!-- Content Wrapper -->
  <div id="content-wrapper" class="d-flex flex-column">

    <!-- Main Content -->
    <div id="content">

      <!-- Topbar -->
      <jsp:include page="../header/headerTopAmin.jsp"></jsp:include>
      <!-- End of Topbar -->

      <!-- Begin Page Content -->
      <div class="container-fluib">
        <div class="heading">
          <h3 class="listProduct_heading">
            Danh sách mã giảm giá
          </h3>
        </div>
        <div class="product__add">
          <button class="product__add-btn"><a style="color: white; text-decoration: none" href="addDiscountCode.jsp"> Thêm mã giảm giá</a></button>
        </div>

        <form action="<c:url value="/startbootstrap-sb-admin-2-master/manage?loai=discountCode"></c:url>" method="post">
          <div class="panel-body"> <input class="form-control" id="dev-table-filter" value="${searchTxt}" name="searchTxt" data-action="filter" data-filters="#dev-table" placeholder="Từ khóa " type="text">
          </div>
        </form>

        <table class="table table-hover" id="dev-table">
          <thead>
          <tr>

            <th>STT</th>
            <th>Tên mã giảm giá</th>
            <th>Giá trị giảm</th>
            <th>Ngày bắt đầu</th>
            <th>Ngày kết thúc</th>
            <th>Số lượng</th>
            <th>Điều kiện áp dụng</th>
            <th>Sửa</th>

          </tr>
          </thead>
          <tbody>
          <c:set var="count" value="0"></c:set>
          <c:forEach items="${listDiscount}" var="dc">
            <tr>
                <c:set var="count" value="${count + 1 }"></c:set>
            <tr>
              <td>${count}</td>
              <td style="max-width: 225px">${dc.name}</td>
              <td>${dc.valueDiscount}00</td>
              <td>${dc.startDate}</td>
              <td>${dc.endDate}</td>
              <td>${dc.amount}</td>
              <td>đơn hàng từ ${dc.conditionDiscount}00 trở lên</td>
              <td><a href="<c:url value="/startbootstrap-sb-admin-2-master/RepairDiscount?id=${dc.id}"></c:url>"><button class="btn btn-primary">Sửa</button></a></td>
            </tr>
          </c:forEach>
          </tbody></table>
      </div>
      <!-- /.container-fluid -->

    </div>

  </div>
  <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
  <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
      <div class="modal-footer">
        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
        <a class="btn btn-primary" href="login.html">Logout</a>
      </div>
    </div>
  </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="js/demo/chart-area-demo.js"></script>
<script src="js/demo/chart-pie-demo.js"></script>

<script src="./randerSp.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
  const myElement = document.getElementById(`${index}`);
  myElement.style.backgroundColor = "#74e75d";
  myElement.style.color = "white";
</script>
</body>

</html>