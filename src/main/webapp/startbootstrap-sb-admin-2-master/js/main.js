var $ = document.querySelector.bind(document);
var $$ = document.querySelectorAll.bind(document);

var removeItemButton = document.getElementsByClassName('product__item-info-delete');
for (var i = 0; i < removeItemButton.length; i++) {
    var button = removeItemButton[i];
    button.addEventListener('click', function (e) {
        var buttonclick = e.target;
        buttonclick.parentElement.remove()


    })
}
var btnAddProduct = $(".addProduct-btn")
    btnAddProduct.onclick = function (event) {
        var btnAddProductItem = event.target
        var productIem = btnAddProductItem.parentElement
        var productName = productIem.querySelector(".product__Name").value;
        var productPrice = productIem.querySelector(".product__price").value
        var product__dateUpdate = productIem.querySelector(".product__dateUpdate").value
        var productImg = productIem.querySelector(".product__Img").value
        addCart(productImg, productName, productPrice,product__dateUpdate)
      
        
    }
// thêm sản phẩm
function addCart(productIemImg, productName, productPrice,productDate) {
    var addLi = document.createElement("ul")


    addLi.classList.add('product__info-list-detail')
    var liContent = `
    <li class="product__item-info "> <img src="${productIemImg}" alt=""
    class="product__item-info-img"></li>
    <li class="product__item-info">${productName}</li>
    <li class="product__item-info">${productDate}</li>
    <li class="product__item-info">${productPrice}</li>
    <li class="product__item-info product__item-info-utilities">Copy</li>
    <li class="product__item-info product__item-info-utilities">Sửa</li>
    <li class="product__item-info product__item-info-utilities product__item-info-delete">Xóa</li>
                        `
    addLi.innerHTML = liContent
    var cartTable = document.querySelector(".container-fluib")
    cartTable.append(addLi);

    var removeItemButton = document.getElementsByClassName('product__item-info-delete');
    for (var i = 0; i < removeItemButton.length; i++) {
        var button = removeItemButton[i];
        button.addEventListener('click', function (e) {
            var buttonclick = e.target;
            buttonclick.parentElement.remove()
        })
    }
   
}

