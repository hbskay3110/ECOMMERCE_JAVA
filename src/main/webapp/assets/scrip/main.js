var $ = document.querySelector.bind(document);
var $$ = document.querySelectorAll.bind(document);
var numberItemCart = $(".header__cart-notice")
var intNumberItemCart =  Number.parseInt(numberItemCart.innerText)
var itemCarts = $$(".header__cart-item")
var totalItemcarts = itemCarts.length


console.log(numberItemCart.innerText)
//Modal đăng nhập đăng kí
//  document.querySelector('.header__navbar-login').onclick = function() {
//     document.querySelector(".modal").style.display = 'flex';
// };
const loginBtns = $$('.js-form-login');
const registerBtns = $$('.js-form-register');
const modal = $('.js-modal')
const btnCloses = $$('.js-auth-form__controls--back')
const modalContainer = $('.js-modal__body')
const formLogin = $('.auth-form-login')
const formRegister = $('.auth-form-login-register')
const navBarRegister  = $('.nav__mobile-link-register')
const navBarLogin  = $('.nav__mobile-link-login')


// Hàm hiển thị model(thêm class open vào modal)
function showModalLogin() {
    modal.classList.add('modal--open')
    formRegister.style.display = 'none';
    formLogin.style.display = 'block';
}
function showModalRegister() {
    modal.classList.add('modal--open')
    formLogin.style.display = 'none';
    formRegister.style.display = 'block';

}

// Hàm ẩn model(xóa class open ra modal)
function hideModal() {
    modal.classList.remove('modal--open')
}
// Lặp qua từng thẻ btn và lắng nghe sự kiện click
for (const loginBtn of loginBtns) {
    loginBtn.onclick = showModalLogin;
}
for (const registerBtn of registerBtns) {
    registerBtn.onclick = showModalRegister;
}
// Thêm sản phẩm vào giỏ hàng
const btnAddProduct = $$(".btn-add-product")

btnAddProduct.forEach(function (button, index) {
    button.onclick = function (event) {
        var numberItemCart = $(".header__cart-notice")

var itemCarts = $$(".header__cart-item")
var totalItemcarts = itemCarts.length


        var btnAddProductItem = event.target
        var productIem = btnAddProductItem.parentElement
        var productIemImg = productIem.querySelector(".home-produt-item-img").style.backgroundImage;
        productIemImg = productIemImg.replace('url(', '').replace(')', '').replace(/\"/gi, "");
        var productName = productIem.querySelector(".home-produt-item-name").innerText
        var productPrice = productIem.querySelector(".home-produt-item-price-current").innerText

        numberItemCart.innerHTML = ++totalItemcarts
        addCart(productIemImg, productName, productPrice)
            const noCart = $(".header__cart-list.header__cart-list--nocart");
             noCart.classList.remove("header__cart-list--nocart");
             const btnThanhtoan = $("header__cart-view-carts");
             btnThanhToan.style.display = 'inline-flex'

    }
})
function addCart(productIemImg, productName, productPrice) {
    var addLi = document.createElement("li")
    var numberItemCart = $(".header__cart-notice")


    addLi.classList.add('header__cart-item')
    var liContent = `
                        <img src="${productIemImg}" alt="" class="header__cart-img">
                        <div class="header__cart-item-info">
                            <div class="header__cart-item-head">
                                <h5 class="header__cart-item-name">${productName}</h5>
                                <div class="header__cart-price-wrap">
                                    <span class="header__cart-item-price">${productPrice}</span>
                                    <span class="header__cart-item-multiply">x</span>
                                    <span class="header__cart-item-qnt">1</span>
                                </div>
                            </div>
                            <div class="header__cart-item-body">
                                <span class="header__cart-item-description">Phân loại: Bạc</span>
                                <span class="header__cart-item-remove">Xóa</span>
                            </div>
                        </div>
                    `
    addLi.innerHTML = liContent
    var cartTable = document.querySelector(".header__cart-list-item")
    cartTable.append(addLi)
    var Itemcart = document.getElementsByClassName('header__cart-item').length;
    document.getElementsByClassName('header__cart-notice').innerHTML = Itemcart;
    toast({
        title: "Thành công!",
        message: "Bạn đã thêm vào giỏ hàng thành công",
        type: "success",
        duration: 2000
      });
    
    // Xóa món hàng ra khỏi giỏ hàng
    var removeItemButton = document.getElementsByClassName('header__cart-item-remove');
    for (var i = 0; i < removeItemButton.length; i++) {
        var button = removeItemButton[i];
        button.addEventListener('click', function (e) {
            var buttonclick = e.target;
            buttonclick.parentElement.parentElement.parentElement.remove()
            var Itemcart = document.getElementsByClassName('header__cart-item').length;
            numberItemCart.innerHTML = Itemcart;
         
        })
    }
    for (const btnDelete of removeItemButton) {
        btnDelete.onclick = function () {
            toast({
                title: "Thành công!",
                message: "Bạn đã xóa ra giỏ hàng thành công",
                type: "success",
                duration: 2000
              });
        }
        
    }


    
}


//lắng nghe sự kiện click ở nút btn Close
for (const btnClose of btnCloses) {

    btnClose.addEventListener('click', hideModal)
    modal.onclick = hideModal;

    modalContainer.addEventListener('click', function (event) {
        event.stopPropagation();
    })
}
// // Nhận giá trị cho inputkhi click vào lịch sử tìm kiếm
const historyItems = $$(".header__search-history-item");

var historyItemTexts = $$(".header__search-history-item a");


const searchText = $(".header__search-input")
historyItemTexts.forEach((historyItemText, index) => {
    // const historyText = historyItemTexts[index];

    historyItemText.onclick = function () {
    }
})


// Thêm active vào cotegory-item khi click


const cotegorys = $$(".category-item");
cotegorys.forEach((cotegory, index) => {
    cotegory.onclick = function () {
        const cotegoryActive = $(".category-item.category-item--active");
        cotegoryActive.classList.remove("category-item--active");
        this.classList.add("category-item--active");

    }
});
// Thêm panigation-item-active vào panigation-item khi click
const panigations = $$(".panigation-item");
const panigationLink = $(".fa-angle-left")

panigations.forEach((panigation, index) => {
    panigation.onclick = function () {
        if (panigation.innerText != "..." ) {
            const panigationActive = $(".panigation-item.panigation-item-active");
            panigationActive.classList.remove("panigation-item-active");
            this.classList.add("panigation-item-active");
        }

    }
});
// Tăng page khi nhấn vào mũi tên phải và giảm khi ấn trái

const numberPage = $(".home-filter__current")
const pageIconleft = $(".home-filter__page-btn-left")
const pageIconright = $(".home-filter__page-btn-right")
const pagePanigation = $(".panigation-item-active .panigation-item__link")

pageIconright.onclick = function () {
    const numberPageText = numberPage.innerText
    if (numberPageText < 14) {
        $(".home-filter__current").innerHTML = ++numberPage.innerText;
        $(".home-filter__page-btn-left").classList.remove("home-filter__page-btn-disabled")

    }
    if (numberPageText == 13) {
        $(".home-filter__page-btn-right").classList.add("home-filter__page-btn-disabled")
    }
}
pageIconleft.onclick = function () {
    const numberPageText = numberPage.innerText
    if (numberPageText > 1) {
        $(".home-filter__current").innerHTML = --numberPage.innerText;
        $(".home-filter__page-btn-right").classList.remove("home-filter__page-btn-disabled")
    }
    if (numberPageText == 2) {
        $(".home-filter__page-btn-left").classList.add("home-filter__page-btn-disabled")

    }
}
numberPage.innerHTML = pagePanigation.innerText;
// Thêm btn-primary khi click vào phần sắp xếp theo
const btnfilters = $$(".home-filter__btn")
for (btnfilter of btnfilters) {
    btnfilter.onclick = function () {
        const btnActive = $(".home-filter__btn.btn-primary");
        btnActive.classList.remove("btn-primary");
        this.classList.add("btn-primary");

    }
}
//Nhận dữ liêu ở select giá
const selectLaBel = $(".select-input__label")
const seclectUp = $(".select-input__link--up")
const seclectDown = $(".select-input__link--down")

seclectUp.onclick = function () {
    selectLaBel.innerHTML = seclectUp.innerText;

}
seclectDown.onclick = function () {
    selectLaBel.innerHTML = seclectDown.innerText;
}




// Hiện đỏ  tim khi click vào và xóa tim khi click lại
const nolikes = $$(".home-produt-item-like-icon-empty");
const likes = $$(".home-produt-item-like-icon-fill");
const itemlikes = $$(".home-produt-item-like")

nolikes.forEach((nolike, index) => {
    const itemlike = itemlikes[index];
    nolike.onclick = function () {
        itemlike.classList.add("home-produt-item-like--liked");
    }
})
likes.forEach((like, index) => {
    const itemlike = itemlikes[index];
    like.onclick = function () {
        itemlike.classList.remove("home-produt-item-like--liked");
    }
})
var navBarMobileAndTabIcon = $(".header-mobie-tab-bar")
var navBaroverlay = $(".header-mobie-tab-bar-overlay")
var navBarMobileAndTab = $(".nav__mobile")
var navBarMobileAndTabClose = $(".nav__mobile-close")
navBarMobileAndTabIcon.onclick = function(){
    navBaroverlay.style.display = "block";
    navBarMobileAndTab.style.transform = "translateX(0%)"
    navBarMobileAndTab.style.opacity = "1"

   
}
navBaroverlay.onclick = function(){
    navBaroverlay.style.display = "none";
    navBarMobileAndTab.style.transform = "translateX(-100%)"

}
navBarMobileAndTabClose.onclick = function(){
    navBaroverlay.style.display = "none";
    navBarMobileAndTab.style.transform = "translateX(-100%)"
}
navBarRegister.onclick = function(){
    navBaroverlay.style.display = "none";
    navBarMobileAndTab.style.transform = "translateX(-100%)"
    modal.classList.add('modal--open')
    formLogin.style.display = 'none';
    formRegister.style.display = 'block';
}
navBarLogin.onclick = function(){
    navBaroverlay.style.display = "none";
    navBarMobileAndTab.style.transform = "translateX(-100%)"
    modal.classList.add('modal--open')
    formRegister.style.display = 'none';
    formLogin.style.display = 'block';
   
}
// Toast function
function toast({ title = "", message = "", type = "info", duration = 2000 }) {
    const main = document.getElementById("toast");
    if (main) {
      const toast = document.createElement("div");
  
      // Auto remove toast
      const autoRemoveId = setTimeout(function () {
        main.removeChild(toast);
      }, duration + 1000);
  
      // Remove toast when clicked
      toast.onclick = function (e) {
        if (e.target.closest(".toast__close")) {
          main.removeChild(toast);
          clearTimeout(autoRemoveId);
        }
      };
  
      const icons = {
        success: "fas fa-check-circle",
      };
      const icon = icons[type];
      const delay = (duration / 1000).toFixed(2);
  
      toast.classList.add("toast", `toast--${type}`);
      toast.style.animation = `slideInLeft ease .3s, fadeOut linear 1s ${delay}s forwards`;
  
      toast.innerHTML = `
                      <div class="toast__icon">
                          <i class="${icon}"></i>
                      </div>
                      <div class="toast__body">
                          <h3 class="toast__title">${title}</h3>
                          <p class="toast__msg">${message}</p>
                      </div>
                      <div class="toast__close">
                          <i class="fas fa-times"></i>
                      </div>
                  `;
      main.appendChild(toast);
    }
  }
  


// modalContainer.addEventListener('click', function (event) {
//     event.stopPropagation();
// })

var btnDialog = $$(".dialog__btn");
var btnok = $(".dialog__btn-ok")
var dialog = $(".dialog")
var btnThanhToan = $(".header__cart-view-carts")

    btnThanhToan.onclick = function () {
        dialog.style.display = 'block'
    
    
    }




for (btn of btnDialog) {
    btn.onclick = function () {
      dialog.style.display = 'none'
    }
}
btnok.onclick = function () {
    dialog.style.display = 'none'
    alert("Bạn đã thanh toán thành công")


}
// Lấy đối tượng select từ HTML
const selectAddress = document.getElementById('address');
const selectAddresshuyen = document.getElementById('huyen');
const selectAddressxa = document.getElementById('xa');
// Đọc file JSON
fetch('./assets/json/local.json')
    .then(response => response.json())
    .then(data => {
        // Lấy danh sách tỉnh từ file JSON
        console.log(data)


        // Tạo option cho select với giá trị và tên của mỗi tỉnh
        data.forEach((item) => {
            const option = document.createElement('option');
            option.value = item.id;
            option.text = item.name;
            selectAddress.add(option);
        });

        // Xử lý sự kiện khi người dùng chọn tỉnh
        selectAddress.addEventListener('change', () => {
            // Lấy mã tỉnh được chọn
            const selectedTinh = selectAddress.value;
            data.forEach((item) => {
                if(item.id == selectedTinh){
                    selectAddresshuyen.remove(data);
                    item.districts.forEach((huyen) =>{
                        const option = document.createElement('option');
                        option.value = huyen.id;
                        option.text = huyen.name;

                        selectAddresshuyen.add(option);
                    })

                }
            });
            selectAddresshuyen.addEventListener('change', () => {
                // Lấy mã tỉnh được chọn
                const selectedHuyen = selectAddresshuyen.value;
                data.forEach((item) => {
                    if(item.id == selectedTinh){
                        selectAddressxa.remove(data);

                        item.districts.forEach((huyen)=>{

                            if(huyen.id == selectedHuyen){
                                huyen.wards.forEach((xa)=>{
                                    const option = document.createElement('option');
                                    option.value = xa.id;
                                    option.text = xa.name;

                                    selectAddressxa.add(option);
                                })


                            }
                        })


                    }
                });
            })
        });
    })
    .catch(error => console.error(error));

  

