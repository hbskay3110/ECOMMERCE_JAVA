


const shop = {
    products: [
        {
            backgroundImage: "https://vn-live-03.slatic.net/p/b7327258d377347fda69e67ca5084442.jpg",
            productName: "Áo hoodie nam nữ phong cách oversize nỉ siêu đẹp vải dày form rộng DELIG Unisex",
            dateUpdate: "1/1/2022",
            price: "105.000đ",
           

        },
        {
            backgroundImage: "/assets/img/Sản phẩm/dongho.jpg",
            productName: "Đồng Hồ Nam Điện Tử SKMEI Kiểu Dáng Thể Thao Hiện Đại",
            dateUpdate: "2/3/2022",
            price: "99.000đ",
          

        },
        {
            backgroundImage: "https://salt.tikicdn.com/cache/400x400/ts/product/87/ac/1d/0c934af4b273a2153ce4cf2c5fefa980.jpg",
            productName: "Son dưỡng môi không màu Hàn Quốc Lagivado dưỡng mềm mịn môi, giảm khô, giảm bong tróc môi Lip Essence dạng thỏi 3,2g",
            dateUpdate: "2/5/2021",
            price: "165.000đ",
         
        },
        {
            backgroundImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmhXHiyrTscO1y7vsn8ZGAUkyCDl6Qbq4mQA&usqp=CAU",
            productName: "Áo khoác gió nam 2 mặt lót bông, áo phao nam nữ siêu ấm chống nước chất gió thái mặc thoáng mát Ami menswear PN",
            dateUpdate: "20/2/2021",
            price: "199.000đ",
           

        },
        {
            backgroundImage: "https://vn-test-11.slatic.net/p/b687d9ad87d4a5f7b285f84a7abb5172.jpg",
            productName: "Máy Sấy Tóc _2 Chiều Nóng Lạnh Công Suất Lớn PANANic-3500W",
            dateUpdate: "20/2/2021",
            price: "265.000đ",
          

        },
        {
            backgroundImage: "/assets/img/Sản phẩm/jd.jpeg",
            productName: "Giày Nike Air Jordan ",
            dateUpdate: "20/2/2021",
            price: "5.900.0000đ",
           
        },
        {
            backgroundImage: "https://cf.shopee.vn/file/3f6ae1888156d3ea14956125a103d996",
            productName: "Ấm siêu tốc HAPPY TIME SUNHOUSE Inox 1.8L HTD1088",
            dateUpdate: "20/2/2021",
            price: "147.000đ",
          

        },
        {
            backgroundImage: "/assets/img/Sản phẩm/iphone13_pro max.jpg",
            productName: "Điện thoại iPhone 13 Pro 128GB Xanh Dương",
            dateUpdate: "20/2/2021",
            price: "41.999.000đ",
           
        },
        {
            backgroundImage: "https://cf.shopee.vn/file/f199795fd682dcb7d0695d45a60ed763",
            productName: "Nồi chiên không dầu SUNHOUSE dung tích 6L SHD4026",
            dateUpdate: "20/2/2021",
            price: "2.024.000đ",
          
        },
        {
            backgroundImage: "https://cf.shopee.vn/file/7276597eaee5d967a448a8863f6dc17c",
            productName: "Bộ Quần Áo Nỉ Nam 5S (5 màu), Chất Liệu Cotton USA Cao Cấp, Mềm Mịn, Bền Màu, Không Bai Xù, Co Giãn Thoải Mái (BNI21002)",
            dateUpdate: "20/2/2021",
            price: "359.000đ",
            

        },
        {
            backgroundImage: "https://cf.shopee.vn/file/0dd09930b570d4c6c1637c9f07ff1de5",
            productName: "Làn Da “SƯƠNG MAI MỌNG MƯỚT” với Combo 3 Chai 82X Placenta - 82X Sakura Collagen - 82X Placenta, 500ml/Chai Đến Từ Nhật",
            dateUpdate: "20/2/2021",
            price: "7.000.000đ",
          
        },
        {
            backgroundImage: "https://cf.shopee.vn/file/a2452a50cd5cdbf0d1e4d0e4b1892205",
            productName: "Vòng Cổ Nữ Bạc Dream Hành Tinh Rose Gold Mặt Dây Chuyền Thủy Triều Thích Hợp Ánh Sáng Sang Trọng Xương Đòn Lian Tặng Quà Tặng",
            dateUpdate: "20/2/2021",
            price: "500.000đ",
           

        },
        {
            backgroundImage: "https://cf.shopee.vn/file/5e82550e353e1d7668ccc87900def0bb",
            productName: "Áo Khoác Nỉ Nam Nữ 3 Sọc Tay Khoá Kéo Form Rộng dass/niker",
            dateUpdate: "20/2/2021",
            price: "95.000đ",
           
        },
        {
            backgroundImage: "https://vn-live-05.slatic.net/p/8605502d3a89deaf24ee58c3e2a024c1.jpg_720x720q80.jpg_.webp",
            productName: "Ghế Gaming Extreme Zero V1 Có Gác Chân Chính Hãng HA17 Ghế Game Thủ Nâng Hạ, Ngả Lưng, Bọc Da Cao Cấp - Nội Thất Hoài An",
            dateUpdate: "20/2/2021",
            price: "1.850.000đ",
           

        },
        {
            backgroundImage: "https://vn-test-11.slatic.net/p/1b8a5c164059cb0f040a211594beeceb.jpg_320x320.jpg",
            productName: " 82X The Pink Collagen 1000mg Collagen, 100ml/chai, Nước Uống Đẹp Da Tràn Năng Lượng Đến Từ Nhật Bản",
            dateUpdate:"20/2/2021",
            price: "174.000đ",

        },



    ],
    render: function () {
        
        const htmls = this.products.map((product) => {
            return `

        <ul class="product__info-list-detail">
        <li class="product__item-info"> <img src="${product.backgroundImage}" alt=""  class="product__item-info-img"></li>
        <li class="product__item-info">${product.productName}</li>
        <li class="product__item-info">${product.dateUpdate}</li>
        <li class="product__item-info">${product.price}</li>
        <li class="product__item-info product__item-info-utilities">Copy</li>
        <li class="product__item-info product__item-info-utilities">Sửa</li>
        <li class="product__item-info product__item-info-utilities product__item-info-delete">Xóa</li>

        
        </ul>
        `
        })

       
        document.querySelector('.product').innerHTML = htmls.join('')
       
    },
    start: function () {
        this.render()
    }
}
shop.start()
