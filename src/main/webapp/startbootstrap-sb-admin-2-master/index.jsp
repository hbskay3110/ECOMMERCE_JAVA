<%@ page import="dao.OrderDAO" %>
<%@ page import="dao.LogDAO" %>
<%@ page import="model.View" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.ViewDAO" %>
<%@ page import="model.DetailOrder" %>
<%@ page import="java.util.ArrayList" %>

<%@ page import="model.OrderProduct" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="dao.DetailOrderDAO" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

            <!-- Topbar -->
            <jsp:include page="../header/headerTopAmin.jsp"></jsp:include>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">Bảng điều khiển</h1>
                    <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                            class="fas fa-download fa-sm text-white-50"></i>Tạo báo cáo</a>
                </div>

                <!-- Content Row -->
                <div class="row">

                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-primary shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                            Thu nhập(Hàng tháng)</div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"><span id="totalMonth"></span>,000</div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-success shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                            Thu nhập(Hàng năm)</div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"><span id="totalYear"></span>,000đ</div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>




                    <!-- Pending Requests Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-warning shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                            YÊU CÂU ĐƠN HÀNG ĐANG ĐỢI GIẢI QUYÊT</div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800 "><span id="orderNum">18</span></div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-comments fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Content Row -->

                <div class="row">

                    <!-- Area Chart -->
                    <div class="col-xl-8 col-lg-7">
                        <div class="card shadow mb-4">
                            <!-- Card Header - Dropdown -->
                            <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">Tổng quan về thu nhập</h6>
                                <div class="dropdown no-arrow">
                                    <a class="dropdown-toggle" href="#" role="button"
                                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                         aria-labelledby="dropdownMenuLink">
                                        <div class="dropdown-header">Dropdown Header:</div>
                                        <a class="dropdown-item" href="#">Action</a>
                                        <a class="dropdown-item" href="#">Another action</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">Something else here</a>
                                    </div>
                                </div>
                            </div>
                            <!-- Card Body -->
                            <div class="card-body">
                                <div class="chart-area">
                                    <canvas id="myAreaChart"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Pie Chart -->
                    <div class="col-xl-4 col-lg-5">
                        <div class="card shadow mb-4">
                            <!-- Card Header - Dropdown -->
                            <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">Nguồn thu nhập</h6>
                                <div class="dropdown no-arrow">
                                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                         aria-labelledby="dropdownMenuLink">
                                        <div class="dropdown-header">Dropdown Header:</div>
                                        <a class="dropdown-item" href="#">Action</a>
                                        <a class="dropdown-item" href="#">Another action</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">Something else here</a>
                                    </div>
                                </div>
                            </div>
                            <!-- Card Body -->
                            <div class="card-body">
                                <div class="chart-pie pt-4 pb-2">
                                    <canvas id="myPieChart"></canvas>
                                </div>
                                <div class="mt-4 text-center small">
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-primary"></i> Trực tiếp
                                        </span>
                                    <span class="mr-2">
                                            <i class="fas fa-circle text-success"></i> Mạng xã hội
                                        </span>
                                    <span class="mr-2">
                                            <i class="fas fa-circle text-info"></i> Người giới thiệu
                                        </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-6 col-lg-6 chart-container" style="position: relative; height:400px; ">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">Doanh thu theo từng tháng</h6>
                                <div class="dropdown no-arrow">
                                    <a class="dropdown-toggle" href="#" role="button"
                                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="chart-pie pt-4 pb-2">
                                    <canvas id="myChart"></canvas>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="col-xl-6 col-lg-6 chart-container" style="position: relative; height:400px; ">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">Số lượt truy cập trang web hàng tháng</h6>
                                <div class="dropdown no-arrow">
                                    <a class="dropdown-toggle" href="#" role="button"
                                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="chart-pie pt-4 pb-2">
                                    <canvas id="myChartVisit"></canvas>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-6 col-lg-6 chart-container" style="position: relative; height:400px; ">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">Các sản phẩm bán chạy nhất</h6>
                                <div class="dropdown no-arrow">
                                    <a class="dropdown-toggle" href="#" role="button"
                                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="chart-pie pt-4 pb-2">
                                    <canvas id="Buy"></canvas>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="col-xl-6 col-lg-6 chart-container" style="position: relative; height:400px; ">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">Các sản phẩm được quan tâm nhất</h6>
                                <div class="dropdown no-arrow">
                                    <a class="dropdown-toggle" href="#" role="button"
                                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="chart-pie pt-4 pb-2">
                                    <canvas id="See"></canvas>
                                </div>
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
<script>
    <%int getOrderNotProcessed = new OrderDAO().getOrderNotProcessed();
        int totalPriceYear = new OrderDAO().getTotloPriceYear();
        int totalPriceMonth = new OrderDAO().getTotalMonthNow();
        String formattedTotalYear = String.format("%,d", totalPriceYear);
        String formattedTotalMonth = String.format("%,d", totalPriceMonth);%>

    var myNumber = <%=getOrderNotProcessed%>;
    var totalPriceYear  = '<%=formattedTotalYear%>';
    var totalPriceMonth  = '<%=formattedTotalMonth%>';

    var orderNum = document.getElementById("orderNum");
    var totalYear = document.getElementById("totalYear");
    var totalMonth = document.getElementById("totalMonth");

    console.log(orderNum)
    orderNum.innerHTML = myNumber;
    totalYear.innerHTML = totalPriceYear;
    totalMonth.innerHTML = totalPriceMonth;
    var moth = [];
    var dataRevenue = [];
    <%
        String revenueStats = new OrderDAO().getRevenueStats();
        String visit = new LogDAO().getVisitOfMonth();
    %>
    var revenueStatsList = JSON.parse('<%=revenueStats%>');
    let keys = Object.keys(revenueStatsList);
    let values = Object.values(revenueStatsList);
    for (var i = 0; i < keys.length; i++) {
        moth[i] = keys[i];
        dataRevenue[i] = values[i];
    }

    // Lấy canvas để vẽ biểu đồ
    var ctx = document.getElementById('myChart').getContext('2d');

    // Tạo biểu đồ
    var chart = new Chart(ctx, {
        // Loại biểu đồ
        type: 'line',

        // Dữ liệu biểu đồ
        data: {
            labels: moth,
            datasets: [{
                label: "",
                backgroundColor: 'rgba(0, 119, 204, 0.3)',
                borderColor: 'rgb(0, 119, 204)',
                data: dataRevenue,
            }]
        },

        // Cấu hình biểu đồ
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
    // visit
    // Lấy canvas để vẽ biểu đồ
    var month = [];
    var dataVisit = [];
    var visitList = JSON.parse('<%=visit%>');
    let vísitkeys = Object.keys(visitList);
    let visitvalues = Object.values(visitList);
    for (var i = 0; i < vísitkeys.length; i++) {
        month[i] = vísitkeys[i];
        dataVisit[i] = visitvalues[i];
    }

    var ctx = document.getElementById('myChartVisit').getContext('2d');

    // Tạo biểu đồ
    var chart = new Chart(ctx, {
        // Loại biểu đồ
        type: 'line',

        // Dữ liệu biểu đồ
        data: {
            labels: month,
            datasets: [{
                label: "",
                backgroundColor: 'rgba(121, 119, 204, 0.3)',
                borderColor: 'rgb(5, 214, 204)',
                data: dataVisit,
            }]
        },

        // Cấu hình biểu đồ
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
    <% List<View> views = new ViewDAO().loadView();%>
    // Lấy thẻ canvas
    var ctx = document.getElementById('See').getContext('2d');

    // Tạo biểu đồ cột
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: [<% for (View view : views) { %> "<%=view.getIdP()%>",<% } %>],
            datasets: [{
                label: 'lượt xem',
                data: [<% for (View view : views) { %> "<%=view.getView_count()%>",<% } %>],
                backgroundColor: 'rgba(121, 119, 204, 0.3)',
                borderColor: 'rgb(5, 214, 204)',
                borderWidth: 1,
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });

    <% List<DetailOrder> mapTemp = new DetailOrderDAO().mapDS_DonHang;%>
    <%--    <% Map<String, Integer> productAmounts = new HashMap<>();%>--%>

    <%--<% for (DetailOrder detailOrder : mapTemp) {--%>
    <%--    String idP = detailOrder.getIdP();--%>
    <%--    int amount = detailOrder.getAmount();--%>

    <%--    // Kiểm tra xem idP đã có trong Map hay chưa--%>
    <%--    if (productAmounts.containsKey(idP)) {--%>
    <%--        // Nếu đã có, cộng thêm amount vào tổng amount hiện tại--%>
    <%--        int totalAmount = productAmounts.get(idP) + amount;--%>
    <%--        productAmounts.put(idP, totalAmount);--%>
    <%--    } else {--%>
    <%--        // Nếu chưa có, thêm idP và amount vào Map--%>
    <%--        productAmounts.put(idP, amount);--%>
    <%--    }--%>
    <%--}%>--%>
    var dataMap = {};

    <% for (DetailOrder d: mapTemp){ %>
    var idP = "<%= d.getIdP() %>";
    var amount = <%= d.getAmount() %>;

    // Kiểm tra nếu idP đã tồn tại trong map thì cộng amount vào giá trị hiện tại
    if (dataMap.hasOwnProperty(idP)) {
        dataMap[idP] += amount;
    } else {
        dataMap[idP] = amount;
    }
    <% } %>

    var sortedData = Object.entries(dataMap).sort((a, b) => b[1] - a[1]);

    var topProducts = sortedData.slice(0, 10);
    var labels = topProducts.map(product => product[0]);
    var amounts = topProducts.map(product => product[1]);

    var ctx = document.getElementById('Buy').getContext('2d');

    // Tạo biểu đồ cột
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                label: 'số lượng mua',
                data: amounts,
                backgroundColor: 'rgba(54, 162, 235, 0.2)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });

</script>
</body>

</html>