<%@ page import="model.OrderProduct" %>
<%@ page import="model.Account" %>
<%@ page import="dao.OrderDAO" %>
<!doctype html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Paypal</title>
    <%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8"%>
    <script src="https://www.paypal.com/sdk/js?client-id=Ac0NkTNee9O4QPkh5aJ-cF6sCL6jZZIoUl_ra-PgXHKQVNwjEYNhFbjfOgegNZYr0Bj_faWiFyQ9Bvqa"></script>
</head>
<body>
<div id="paypal-button-container">

    <h1><b>Thanh toán qua Paypal</b></h1>
<%--     <div> <h4>Tổng tiền: <input type="text" name="total" value="${sessionScope.fullPrice}00"/></h4></div>--%>

</div>
<script>
    var total = '<%= request.getAttribute("total") %>';
    console.log(total)


    paypal.Buttons({
        createOrder: function(data, actions) {
            return actions.order.create({
                purchase_units: [
                    {
                        amount: {
                            currency_code: 'USD',
                            value: total
                        }
                    }
                ]
            });
        },
        onApprove: function(data, actions) {
            return actions.order.capture().then(function(details) {
                console.log('Payment completed successfully!');
                <%String id = request.getParameter("idOder");
              String dateDeliveryOder = request.getParameter("dateDeliveryOder");
              String date = String.valueOf(java.time.LocalDate.now());
              String fName= request.getParameter("Firstname");
              String telephone = request.getParameter("telephone");
              String note = request.getParameter("note");
              String addressOder = request.getParameter("addressOder");
              String addressDetail = request.getParameter("address-details");
              addressOder = addressDetail + ","+ addressOder;
              Account tk = (Account) session.getAttribute("userLogin");
              double tong = (double) session.getAttribute("fullPrice");
             String fee = (String) session.getAttribute("fee");
			int feeInt;
			try{
				feeInt  = Integer.parseInt(fee)/1000;
				tong = tong +feeInt;
			} catch (Exception e){
				feeInt = 0;
				e.printStackTrace();
			}
              String tongS = String.valueOf(tong);
              OrderProduct dh = new OrderProduct(id, tk.getNameAcc(), date,dateDeliveryOder, tongS, telephone, fName, addressOder, note,"1", "0");
              new OrderDAO().add(dh);%>
                window.location.href = 'renderSP';
                // Xử lý khi thanh toán thành công, ví dụ: chuyển hướng đến trang xác nhận đơn hàng.
            });
        },
        onError: function(err) {
            console.log('Payment failed:', err);
            // Xử lý khi thanh toán thất bại, ví dụ: hiển thị thông báo lỗi.
        }
    }).render('#paypal-button-container');

</script>
</body>
</html>