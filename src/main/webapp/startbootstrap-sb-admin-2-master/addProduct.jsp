<%@page import="java.sql.ResultSet"%>
<%@page import="model.ConnectToDatabase"%>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Brother Admin - Dashboard</title>

<!-- Custom fonts for this template-->


</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<jsp:include page="../header/headerLeftAmin.jsp"></jsp:include>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<jsp:include page="../header/headerTopAmin.jsp"></jsp:include>
			<!-- Main Content -->
			<div id="content">
				<!-- Begin Page Content -->
				<div class="container-fluid">
					<div class="container " style="margin-top: var(- -header-height)">
						<!-- Topbar -->

						<!-- End of Topbar -->
						<div class="row">
							<div class="col-md-12">
								<h2>Thêm Sản Phẩm</h2>
								<form class="form-horizontal"

									action="<c:url value="/startbootstrap-sb-admin-2-master/ThemSuaXoaSanPham?chucNang=Them"></c:url>"
									method="post" enctype="multipart/form-data">
									<div class="form-group">
										<label class="control-label col-sm-2" >Mã sản phẩm*:</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="pwd"
												name="maSP" placeholder="Nhập mã sản phẩm">
										</div>
										<label class="control-label col-sm-4" style="color: red"
											for="email">${erorr.duplicateMa}${erorr.NoID}</label>

									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" >Tên
											sản phẩm*:</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="pwd"
												name="productName" placeholder="Nhập tên sản phẩm">
										</div>
										<label class="control-label col-sm-4" style="color: red"
											for="email">${erorr.NoName}</label>

									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="pwd">Giá
											gốc:</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="pwd"
												name="priceOld" placeholder="Nhập mật khẩu">
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-sm-3" for="pwd">Số
											lượng nhập:</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="pwd"
												name="numberImport" placeholder="Nhập họ và tên">
										</div>
										<label class="control-label col-sm-4" style="color: red"
											for="email">${erorr.NoNumberOf}</label>
									</div>



									<div class="form-group">
										<label class="control-label col-sm-2" for="pwd">Ảnh
											sản phẩm:</label>
										<div class="col-sm-10">
											<input type="file" class="form-control" id="pwd image"
												name="imageProduct" placeholder="Nhập tên ảnh">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="pwd">Giảm %:</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="pwd" name="sale"
												placeholder="VD: 30">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="pwd">Tên nhà cung cấp</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="pwd"
												name="nameSupplier">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="pwd">Mô tả:</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="pwd"
												name="description" placeholder="Nhập mô tả">
										</div>
									</div>
									<div class="form-group" style="display: flex;">
										<label class="control-label col-sm-2" for="pwd">Loại sản phẩm :</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="pwd"
												   name="description" placeholder="Nhập loại">
										</div>
									</div>
									<div class="form-group" style="display: flex;">
										<label class="control-label col-sm-2" for="pwd">Giới tính :</label>
										<div class="col-sm-10">
											<input type="radio" class="col-sm-1" name="sex" value="Nam" checked="checked">Nam
											<input type="radio"	class="col-sm-1" name="sex" value="Nữ">Nữ
											<input type="radio"	class="col-sm-1" name="sex" value="Nam và nữ">Nam và Nữ
						
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="pwd">Chất liệu:</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="pwd"
												name="material" placeholder="">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="pwd">Kiểu dáng:</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="pwd"
												name="design" placeholder="Nhập kiểu dáng">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="pwd">Xuất xứ:</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="pwd"
												name="origin" placeholder="">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="pwd">Phong cách:</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="pwd"
												name="style" placeholder="">
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10">
											<button type="submit" class="btn btn-default btn-primary">Thêm</button>
										</div>
									</div>
								</form>
							</div>
						</div>



					</div>
				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<!-- <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2021</span>
                    </div>
                </div>
            </footer> -->
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
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


</body>

</html>