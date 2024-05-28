<%@page import="java.sql.ResultSet"%>
<%@page import="model.ConnectToDatabase"%>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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
					<div class="panel-heading">
						<h3 class="panel-title">Danh sách Log</h3>

					</div>

					<table class="table table-hover" id="dev-table">
						<thead>
							<tr >

								<th>STT</th>
								<th>Tên Khách Hàng</th>
								<th style="max-width: 500px !important;">Src</th>
								<th>Địa chỉ Ip </th>
								<th>Trình duyệt</th>
								<th>Nội dung</th>
								<th>Ngày thực thi</th>
							</tr>
						</thead>
						<tbody>

						<c:set var="count" value="0"></c:set>
						<c:forEach items="${listLog}" var="l">
                            <c:if test="${l.level==1 || l.level ==0}">
                                <tr>
                                <c:set var="count" value="${count + 1 }"></c:set>
                                    <td>${count}</td>
                                    <td>${l.userId}</td>
                                    <td>${l.src}</td>
                                    <td>${l.ipAddress}</td>
                                    <td>${l.userAgent}</td>
                                    <td>${l.content}</td>
                                    <td>${l.creatAt}</td>
                                </tr>
                            </c:if>
                            <c:if test="${l.level==3}">
                                <tr style="background-color: red ; color: white">
                                    <c:set var="count" value="${count + 1 }"></c:set>
                                    <td>${count}</td>
                                    <td>${l.userId}</td>
                                    <td>${l.src}</td>
                                    <td>${l.ipAddress}</td>
                                    <td>${l.userAgent}</td>
                                    <td>${l.content}</td>
                                    <td>${l.creatAt}</td>
                                </tr>
                            </c:if>
                            <c:if test="${l.level==2}">
                                <tr style="background-color: #FFCE3E ; color: white">
                                    <c:set var="count" value="${count + 1 }"></c:set>
                                    <td>${count}</td>
                                    <td>${l.userId}</td>
                                    <td>${l.src}</td>
                                    <td>${l.ipAddress}</td>
                                    <td>${l.userAgent}</td>
                                    <td>${l.content}</td>
                                    <td>${l.creatAt}</td>
                                </tr>
                            </c:if>

						</c:forEach>

					</tbody></table>
					<a href="<c:url value="/startbootstrap-sb-admin-2-master/exel?name=Log"></c:url>"><button class="btn  btn-primary">Export Exel</button></a>
				</div>
			</div>
		</div>


	</div>
                </div>

            </div>


        </div>

    </div>
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
                    <a class="btn btn-primary" href="Login.jsp">Logout</a>
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
                responsive: true,
                scrollX: true,
                scrollCollapse: true,
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

</body>

</html>