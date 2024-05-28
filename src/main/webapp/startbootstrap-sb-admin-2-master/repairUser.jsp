<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.ConnectToDatabase"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%  ServletContext contextID = pageContext.getServletContext();
    	contextID.setAttribute("id", request.getParameter("id"));
    %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
								<h2>Sửa thông tin</h2>
								<%
								try{
									String id = request.getParameter("id");
									
							
							  		String query = "select * from Accounts where nameAcc='"+id+"'";
									Connection connect = new ConnectToDatabase().getConnection();
									PreparedStatement ppstm = connect.prepareStatement(query);
									ResultSet rs = null;
									rs =ppstm.executeQuery();
							  		while(rs.next()){
							    %>
								<form class="form-horizontal" action="	<c:url value="/startbootstrap-sb-admin-2-master/ThemSuaXoaServerlet?chucNang=Sua"></c:url>"
									method="post">
									<div class="form-group">
										<label class="control-label col-sm-2" for="email">Tên tài khoản*:</label>
										<div class="col-sm-10">
											<lable  class="form-control" id="pwd" name="userName"><%=rs.getString(1)%></lable>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="pwd">Mật khẩu*:</label>
										<div class="col-sm-10">
											<input type="password" class="form-control" id="pwd" name="passWord"
												placeholder="Nhập mật khẩu" value="<%=rs.getString(2)%>" >
										</div>
								
									</div>
									<div class="form-group">
										<label class="control-label col-sm-3" for="pwd">Nhập lại mật khẩu*:</label>
										<div class="col-sm-10">
											<input type="password" class="form-control" id="pwd" name="rePassWord"
												placeholder="Nhập lại mật khẩu">
										</div>
							
									</div>
									<div class="form-group">
										<label class="control-label col-sm-3" for="pwd">Họ và tên khách hàng:</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="pwd" name="NameKH" value="<%=rs.getString(3)%>"
							 				placeholder="Nhập họ và tên">
										</div>
									</div>
									<div class="form-group" style="display: flex;">
										<label class="control-label col-sm-2" for="pwd">Giới tính:</label>
										<div class="col-sm-10">
											<c:set var = "GT" value="<%=rs.getString(4)%>"/>
											<c:if test="${GT eq 'Nam'}">
											<input type="radio" class="col-sm-1" name="sex" value = "Nam" checked="checked">Nam
											<input type="radio" class="col-sm-1"  name="sex" value= "Nữ">Nữ
											</c:if>
											<c:if test="${GT eq 'Nữ'}">
											<input type="radio" class="col-sm-1" name="sex" value = "Nam" >Nam
											<input type="radio" class="col-sm-1"  name="sex" value= "Nữ" checked="checked">Nữ
											</c:if>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="pwd">Số điện thoại:</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="pwd" name="telephone" value="<%=rs.getString(5)%>"
												placeholder="Nhập số điện thoại">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="pwd">Email:</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="pwd" name="email" value="<%=rs.getString(6)%>"
												placeholder="Nhập email">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="pwd">Ngày sinh:</label>
										<div class="col-sm-10">
											<input type="date" class="form-control" id="pwd" name="dayOfBith" value="<%=rs.getString(7)%>">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="pwd">Địa chỉ:</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="pwd" name="address" value="<%=rs.getString(8)%>"
												placeholder="Nhập địa chỉ">
										</div>
										<div class="form-group">
										<label class="control-label col-sm-2" for="pwd">Quyền:</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="pwd" name="rights" value="<%=rs.getString(10)%>"
												placeholder="Nhập địa chỉ">
										</div>
									</div>
									</div>
									    <%}
							  		} catch (Exception e) {
										// TODO Auto-generated catch block
										e.printStackTrace();
										System.out.println(e.getMessage());
									  }
							  		%>
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10">
											<button type="submit" class="btn btn-default btn-primary">Sửa</button>
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