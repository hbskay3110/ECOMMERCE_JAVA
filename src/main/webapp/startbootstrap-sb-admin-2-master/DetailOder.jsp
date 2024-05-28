<%@page import="java.sql.ResultSet"%>
<%@page import="model.ConnectToDatabase"%>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%ServletContext contextChucNang = getServletContext();
    	contextChucNang.setAttribute("chucNang", "Xoa");
   %>
 
     	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
      
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Brother Admin  - Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

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
              <jsp:include page="../header/headerTopAmin.jsp"></jsp:include>
                <!-- Begin Page Content -->
                <div class="container-fluid">
					<div class="container " style="margin-top: var(--header-height)"> 
	   			<!-- Topbar -->
    		
                <!-- End of Topbar -->
		<div class="row"> 
			<div class="col-md-12"> 
						
				<div class="panel panel-primary"> 
					<h3 class="panel-title">Chi tiết đơn hàng</h3> 
					<div class="panel-heading"> 
					<h4>Tên người nhận : ${donHang.nameRecipient} ,Số điện thoại : ${donHang.phone}</h4>
					 <h5>Ghi chú : ${donHang.note}</h5>
					
						
					</div> 
					<div class="panel-body"> <input class="form-control" id="dev-table-filter" data-action="filter" data-filters="#dev-table" placeholder="Từ khóa" type="text"> 
					</div> 
					<table class="table table-hover" id="dev-table"> 
						<thead> 
							<tr> 
								
								<th>STT</th> 
								<th>Hình ảnh</th> 
								<th>Tên sản phẩm</th> 
								<th>Đơn giá</th>
								<th>Số lượng</th>
								<th>Tổng tiền</th>
								
							</tr> 
						</thead> 
						<tbody>
						<c:set var="count" value="0"></c:set>
						<c:forEach items="${listBill}" var="dh">
						<tr> 
						<c:set var="count" value="${count + 1 }"></c:set>
							<td><c:out value="${count}"></c:out></td> 
							<td><img alt="hinhSP" style="width: 100px" src="../assets/img/product/${dh.nameImage}"></td> 
							<td style="width: 510px">${dh.nameP}</td> 
							<td>${dh.price}.000 đ</td>
							<td>${dh.quantity}</td> 
							<td>${dh.total}00 đ</td> 
						</tr> 
						</c:forEach>
		

				
					</tbody></table> 
					
					<a href="<c:url value="/startbootstrap-sb-admin-2-master/manage?loai=oder&index=${index}"></c:url>"><button class="btn  btn-primary">Quay lại</button></a>
				</div> 
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
                    <a class="btn btn-primary" href="<c:url value="Login.jsp"></c:url>">Logout</a>
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