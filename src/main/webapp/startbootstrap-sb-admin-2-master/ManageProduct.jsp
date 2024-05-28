<%@page isELIgnored="false"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.ConnectToDatabase"%>
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
                            Danh sách sản phẩm
                        </h3>
                    </div>
                   <div class="product__add">
                        <button class="product__add-btn"><a style="color: white; text-decoration: none" href="addProduct.jsp"> Thêm sản phẩm</a></button>
                    </div>


					</div> 

					<table class="table table-hover" id="dev-table"> 
						<thead> 
							<tr>
								<th>STT</th>
								<th>Hình ảnh</th>
								<th>Tên sản phẩm</th>
								<th>Giá</th>
								<!-- <th>Số lượng nhập</th>  -->
								<th>Sale</th>
								<th>Xóa</th>
								<th>Sửa</th>
								
							</tr> 
						</thead> 
						<tbody>
						<c:set var="count" value="0"></c:set>
						<c:forEach items="${listSP}" var="sp">
						<tr>
						<c:set var="count" value="${count + 1 }"></c:set>

							<td>${count}</td>
							<td><img alt="hinhSP" style="width: 100px" src="../assets/img/product/${sp.listImage.get(0).nameI}"></td>
							<td style="max-width: 225px">${sp.nameP}</td>
							<td>${Math.round(sp.priceP-sp.priceP*(sp.sale/100))}</td>
<%--							<td>${sp.soLuongNhap}</td> --%>
							<td>${sp.sale}</td>
							
							<td><a href="<c:url value="/startbootstrap-sb-admin-2-master/ThemSuaXoaSanPham?maSP=${sp.idP}&chucNang=Xoa"></c:url>"><button class="btn btn-warning"><i class="fa fa-trash bg-danger"></i></button></a></td>
							<td><a href="<c:url value="/startbootstrap-sb-admin-2-master/forwardRepair?id=${sp.idP}"></c:url>"><button class="btn btn-primary"><i class="fas fa-pencil" ></i></button></a></td>
						</tr> 					
						</c:forEach>
					</tbody></table> 

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
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.11.3/datatables.min.css"/>
	<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.11.3/datatables.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#dev-table').DataTable({
				"language": {
					"lengthMenu": "Hiển thị _MENU_ kết quả trên trang",
					"zeroRecords": "Không tìm thấy kết quả nào",
					"info": "Hiển thị trang _PAGE_ của _PAGES_",
					"infoEmpty": "Không có kết quả nào để hiển thị",
					"infoFiltered": "(lọc từ _MAX_ kết quả)",
					"search": "Tìm kiếm:",
					"paginate": {
						"first":      "Đầu tiên",
						"last":       "Cuối cùng",
						"next":       "Tiếp",
						"previous":   "Trước"
					}
				}
			});
		});
	</script>
	<!-- Bootstrap core JavaScript-->

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



<%--    <script>--%>
<%--	const myElement = document.getElementById(`${index}`);--%>
<%--	myElement.style.backgroundColor = "#74e75d";--%>
<%--	myElement.style.color = "white";--%>
<%--    </script>--%>
<%--   --%>
    


</body>

</html>