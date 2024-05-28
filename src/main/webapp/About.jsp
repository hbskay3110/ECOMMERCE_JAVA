<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
       	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="./assets/css/main.css">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/grid.css">
    <link rel="stylesheet" href="./assets/css/rebonsive.css">

    <link href="https://fonts.googleapis.com/css2?family=Open+Sans&family=Roboto:wght@300;400;500;700;900&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"
        integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w=="
        crossorigin="anonymous" />
    <link rel="icon" href="./assets/img/logo3.png"
        type="image/x-icon" />


    <title>Shop Brother</title>
</head>

<body>
    <div class="app">
  		  <jsp:include page="header/headerlv1.jsp"></jsp:include>
        <div class="introduction">
            <div class="grid wide">

                <h2 class="row introduction__header">Giới thiệu</h2>
                <h3 class="row introduction__text">Brother là nền tảng thương mại điện tử </h3>
                <p class="introduction__main-text-header"> Nền tảng thương mại Brother được xây dựng nhằm cung cấp cho người dùng những trải nghiệm dễ dàng, an
                    toàn và nhanh chóng khi mua sắm trực tuyến thông qua hệ thống hỗ trợ thanh toán và vận hành vững
                    mạnh.</p>
                <p class="introduction__main-text-header">Chúng tôi có niềm tin mạnh mẽ rằng trải nghiệm mua sắm trực tuyến phải đơn giản, dễ dàng và mang đến
                    cảm xúc vui thích. Niềm tin này truyền cảm hứng và thúc đẩy chúng tôi mỗi ngày tại Brother.</p>
                <button class="introduction__btn">Tìm hiểu Brother</button>
                <div class="row introduction__main">
                    <div class="col l-4 m-6 c-6 introduction__info">
                        <h3 class="introduction__main-header">Mục tiêu của chúng tôi</h3>
                        <p class="introduction__main-text">Chúng tôi tin tưởng và
                            mong muốn góp phần làm cho thế giới trở nên tốt đẹp hơn bằng việc kết nối cộng đồng người
                            mua và người bán thông qua việc cung cấp một nền tảng thương mại điện tử.</p>


                        <img class="introduction__main-mimage" src="./assets/img/gangui.jpg"></img>
                        <h3 class="introduction__main-header">Gần Gũi</h3>
                        <p class="introduction__main-text">Chúng tôi có niềm tin vào tính gần gũi mà thanh liêm, nền
                            tảng vững chắc cho một cuộc sống trung thực, bình dân và thành thật với bản thân.</p>
                    </div>
                    <div class="col l-4 m-6 c-6 introduction__info">
                        <h3 class="introduction__main-header">Định vị của chúng tôi</h3>
                        <p class="introduction__main-text">Đối với người dùng trên toàn khu vực, Brother mang đến trải
                            nghiệm mua sắm trực tuyến tích hợp với vô số sản phẩm đa dạng chủng loại, cộng đồng người
                            dùng năng động và chuỗi dịch vụ liền mạch.</p>
                        <img class="introduction__main-mimage" src="./assets/img/vui.jpg"></img>
                        <h3 class="introduction__main-header">Vui vẻ</h3>
                        <p class="introduction__main-text">Chúng tôi dễ gần, đáng yêu và tràn đầy năng lượng, luôn mang
                            đến niềm vui cho những người xung quanh.</p>
                    </div>
                    <div class="col l-4 m-6 c-6 introduction__info">
                        <h3 class="introduction__main-header">Đặc điểm về con người của chúng tôi</h3>
                        <p class="introduction__main-text">Để định nghĩa chúng tôi là ai thông qua lời nói hay cách
                            ứng xử , chúng tôi Gần gũi, Vui vẻ và Đồng
                            lòng. Đây là những đặc tính chính và nổi bật trong từng bước đường phát triển của Brother.
                        </p>
                        <img class="introduction__main-mimage" src="./assets/img/donglong.jpg"></img>
                        <h3 class="introduction__main-header">Đồng Lòng</h3>
                        <p class="introduction__main-text">Chúng tôi thích tận hưởng thời gian bên nhau giống như tận
                            hưởng việc mua sắm trực tuyến với người thân và bạn bè - làm những việc yêu thích cùng nhau
                            như một đại gia đình lớn.
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="app_container">
            


        </div>
        		<jsp:include page="footer/footerlv1.jsp"></jsp:include>
    </div>
    <!-- header mobie tab bar orerlay -->
    <div class="header-mobie-tab-bar-overlay"></div>
    <div class="nav__mobile">
        <div class="nav__mobile-header">
            <h2 class="nav__mobile-text">Brother SHOP</h2>
            <div class="nav__mobile-close">
                <i class="fas fa-times"></i>
            </div>
        </div>
        <ul class="nav-mobile-list">
            <li class="nav__mobile-link nav__mobile-link-register"><a href="#">Đăng kí </a></li>
            <li class="nav__mobile-link nav__mobile-link-login"><a href="#">Đăng nhập</a></li>
            <li class="nav__mobile-link "><a href="">Hỗ Trợ</a></li>

            <!-- <li class="nav__mobile-link"><a href="">Tài khoản của tôi</a></li>
        <li class="nav__mobile-link"><a href="">Địa chỉ của tôi</a></li>
        <li class="nav__mobile-link"><a href="">Đơn mua</a></li>
        <li class="nav__mobile-link header__navbar-mobile-user-item--separate"><a href="">Đăng
                xuất</a></li> -->
        </ul>
    </div>
    <div id="toast"></div>
    <!-- modal layout -->



</body>
<script src="./assets/scrip/renderSpPage2.js"></script>
<script src="./assets/scrip/vadilator.js"></script>


<script>
    // Mong muốn 
    Vadilator({
        modal: '.js-modal',
        form: '#form-1',
        formAlertRegister: '#form-1',
        formGroupSelector: '.auth-form__group',
        errorSelector: '.auth-form__error-msg',

        rules: [
            Vadilator.isRequired('#email'),
            Vadilator.isEmail('#email', 'Vui lòng nhập email hoặc số điện thoại hợp lệ'),
            Vadilator.ischekExist('#email', 'Email hoặc số điện thoại đã tồn tại'),
            Vadilator.isRequired('#pass'),
            Vadilator.minLength('#pass', 6),
            Vadilator.isRequired('#checkpass'),
            Vadilator.isCheckpass('#checkpass', function () {
                return document.querySelector('#form-1 #pass').value;
            }, 'Mật khẩu nhập lại không chính xác')

        ],
        onSubmit: function (data) {
            //Call API
            console.log(data)
        }
    });
    Vadilator({
        modal: '.js-modal',
        form: '#form-2',
        formAlertLogin: '#form-2',
        formGroupSelector: '.auth-form__group',
        errorSelector: '.auth-form__error-msg',
        register: '.js-form-register',
        login: '.js-form-login',
        rules: [
            Vadilator.isRequired('#email'),
            Vadilator.isEmail('#email', 'Email hoặc số điện thoại không hợp lệ'),
            Vadilator.isCheckEmail('#email', 'Email hoặc số điện thoại không tồn tại'),
            Vadilator.isRequired('#pass'),
            Vadilator.minLength('#pass', 6),
            Vadilator.isCheckTK('#pass', 'Sai mật khấu'),
        ],
        // onSubmit: function(data){
        //     //Call API
        //     console.log(data)
        // }
    });






</script>
<script src="./assets/scrip/main.js"></script>


</html>