CREATE DATABASE WebBanHang;

use WebBanHang;


CREATE TABLE Products(idP char(5) PRIMARY KEY,
					 nameP nvarchar(500),
					 priceP float,
					 VendorsId char(5) REFERENCES Vendors(VendorsId),
					 status int
					 );
Create table SizePs(idP char(5) REFERENCES Products(idP),
					type varchar(4)
                    );

create table Images(idI int not null primary key auto_increment ,
					nameI nvarchar(1000),
                    idP char(5) REFERENCES Products(idP),
                    status int
			     	);
create table ImportP(idP char(5) REFERENCES Products(idP),                
                     quantityImport int,
					 VendorsId char(5)
                     );
create table Favourites(idP char(5),
						status int
					   );
create table Vendors(VendorsId char(5) PRIMARY KEY,
						VendorsName nvarchar(100),
						addressV nvarchar (100),
						phoneV char(12)
                       );
create table Sale (idP char(5) references Products(idP),
				   percent int 
                  );
create table Comments(idComment int not null primary key auto_increment ,
					idP char(5) references Products(idP),
					nameAcc nvarchar(50),
                    content text
					);
create table ImageComments(idComment int REFERENCES Comments(idComment) ,
						  nameI nvarchar(1000)
                          );
create table VideoComments(idComment int ,
						  video nvarchar(1000)
						  );
create table DetailProducts(idP char(5) REFERENCES Products(idP),
							VendorsId  char(5) REFERENCES Vendors(VendorsId),
							desciption nvarchar(500),
							typeP nvarchar(50),
							sex nvarchar(50),
							material nvarchar(50),   /*chất liệu*/
							designs nvarchar(50),   /*kiểu dáng*/
							origin nvarchar(50),   /*xuất xứ*/
							style nvarchar(50),    /*phong cách*/
							warrantyPeriod int,   /*thời gian bảo hành*/
							PRIMARY KEY(idP, VendorsId)
							);
			
create table Accounts(
					   nameAcc nvarchar(50),
					   password varchar(100),
					   userName nvarchar(50),
					   sex nvarchar(3),
					   phoneNum char(12),
					   Email varchar(50),
					   dayOfBirth date,
					   address nvarchar(100),
                       typeAccount int,
					   role varchar(10),      /*quyền*/
					  constraint PK_TK primary key ( nameAcc)
					 );

create table OrderProductss( idOrder varchar(5) primary key ,
					  nameAcc nvarchar(50) ,
					  dateOrder nvarchar(50),
					  totalMoney float,
					  phone varchar(10),
					  nameRecipient nvarchar(50),    /*tên người nhận*/
					  address nvarchar(100),
					  note nvarchar(500),
					  status int
					  );

create table DetailOrders(idOrder varchar(5) references OrderProducts(idOrder),
				        idP char(5) REFERENCES Products(idP),
						amount int,
						price float,
						constraint PK_DS PRIMARY KEY(idOrder, idP)
						);
                        
create table Logs(id int not null primary key auto_increment,
				  level int,
                  nameAcc nvarchar(50),
				  src text,
                  content text,
                  createAt date,
                  status int                  
);


-- TAI_KHOAN;

-- Accounts;

insert into Accounts values ('anphan219', 'xMwitbBdqQ8me2wtAGmBnyJDSns=', N'Phan Thị An', N'Nữ', '0356940356','phanthyan123@gmail.com','2002-09-21','BR-VT' , 0,'admin');
insert into Accounts values ('kienn31','kienabc31', N'Nguyễn Trung Kiên', N'Nữ', '0345678903','ntkien@gmail.com','2002-10-31','NHA TRANG', 0 , 'user');
select* from Accounts;
-- 30-Products;
insert into Products VALUES('AT001', N'TEE BASIC V-1 ÁO THUN TAY NGẮN NAM NỮ TARBO ÁO THUN TAY NGẮN NAM NỮ Lisa store ( V419)',159,'NCC01', 1);
insert into Products VALUES('AT002', N'Áo thun có cổ , áo polo form rộng tay lỡ - CRHSUR',75, 'NCC01', 1);
insert into Products VALUES('AT003', N'Bộ Đồ Nam Nữ Unisex Mùa Hè Cổ Tròn Tay Lỡ ',160,'NCC01',0);
insert into Products VALUES('AT004', N'Áo khoác cadirgan nỉ hoodie mũ 2 lớp form rộng có khóa cao cấp Unisex',180,'NCC01',0);
insert into Products VALUES('AT005', N'Áo polo nike basic Cá Sấu Cao Cấp',150,'NCC01',1);
insert into Products VALUES('AT006', N'Áo len cổ thấp co dãn ôm sát UNDERCOOL len tăm cổ 3cm',260,'NCC02',0);
insert into Products VALUES('AT007', N'Áo bóng rổ nam nữ form rộng số 26',100,'NCC02',1);
insert into Products VALUES('AT008', N'Áo sơ mi nữ kiểu babydoll ren tơ phối nơ cổ form rộng dáng xòe ',135, 'NCC02',1);
insert into Products VALUES('AT009', N'Áo trễ vai, áo hở vai nữ đẹp bèo TAY PHỒNG RỘNG',54, 'NCC02',1);
insert into Products VALUES('AT010', N'Áo Sơ Mi Nữ Công Sở Cổ Vest NK Fashion Tay Lỡ Giao Cúc Phối Tơ Ánh',420, 'NCC02',0);
insert into Products VALUES('AT011', N'Áo CROPTOP POLO NỮ',120, 'NCC03',0);
insert into Products VALUES('AT012', N'Áo thun Polo Nam Nữ cổ bẻ phối Thêu logo Tay ',199,'NCC03',1);
insert into Products VALUES('AT013', N'Áo Khoác Cardigan Nữ Kẻ Thoi Form Rộng Chất Nỉ',110, 'NCC03',1);
-- váy
insert into Products VALUES('VN001', N'Váy Nữ Buộc Cổ Khóa Lưng Dáng Ngắn Ngang Đùi ',99, 'NCC04',1);
insert into Products VALUES('VN002', N'Váy đầm nữ cúp ngực hai dây quàng cổ phối nơ sau lưng sang trọng quyến rũ',350, 'NCC04',1);
insert into Products VALUES('VN003', N'Đầm tiểu thơ xinh xắn HOT TREND Váy trắng đính nơ Váy dáng dài,
cổ vuông siêu xinh cho nàng [Kèm ảnh thật 100%]',199,'NCC04',1);
insert into Products VALUES('VN004', N'Váy babydoll 2 dây buộc nơ vai dáng suông che khuyết điểm/ Đầm nữ 2 màu xanh, trắng mặc đi chơi, dự tiệc',122, 'NCC04',1);
insert into Products VALUES('VN005', N'Váy yếm nữ kèm áo tay bồng tiểu thư cổ nhọn đi tiệc phong cách Hàn Quốc SV008 ',305,'NCC05',1);
insert into Products VALUES('VN006', N'Váy nữ đi tết Mosy Dress',315,'NCC05',1);
insert into Products VALUES('VN007', N'Đầm maxi hoa màu xanh tay phồng, váy xẻ tà dáng dài, đầm hoa nhí trễ vai, Váy maxi',149, 'NCC05',1);
insert into Products VALUES('VN008', N'Sét Váy Hai Dây Hoa Nhí Kèm Áo Khoác Cardigan- Đầm maxi 2 dây dáng dài kèm áo coptop khoác ngoài ',280, 'NCC05',1);
insert into Products VALUES('VN009', N'Váy Trễ Vai Xốp Phồng Quảng Châu 2 Màu Đen Trắng, Đầm Dự Tiệc Tiểu Thư Xinh Xắn',160, 'NCC06',1);
insert into Products VALUES('VN010', N'Chân váy TENNIS cạp cao chân váy xoè xếp ly nữ dáng ngắn đủ màu có quần trong ',55, 'NCC06',1);
-- quần
insert into Products VALUES('QN001', N'Quần ống rộng Lylyshop Unisex, quần dài cạp chun có dây rút điều chỉnh eo vải co dãn dày dặn',250,'NCC06',1);
insert into Products VALUES('QN002', N'Quần Jean nữ ống rộng lưng cao HOT TREND phong cách Retro Jean xanh, xanh nhạt, xám khói [Có Bigsize]- Jean Baggy J01',200,'NCC06',1);
insert into Products VALUES('QN003', N'Quần Ống Rộng Có Nơ Thắt Chéo, Mặc Đi Chơi Đi Làm',149,'NCC07',1);
insert into Products VALUES('QN004', N'Quần bom chun gấu Chất da cá',159, 'NCC07',1);
insert into Products VALUES('QN005', N'Quần Legging Dài Co Dãn',40,'NCC07',0);
insert into Products VALUES('QN006', N'Quần jean nữ ống rộng lưng cao màu xám khói thiết kế túi hộp phong cách',219, 'NCC07',1);
insert into Products VALUES('QN007', N'Quần jean nam nữ ống suông rộng,Quần bò nam nữ dáng đứng vải jeans bò cao cấp',238, 'NCC08',1);
insert into Products VALUES('QN008', N'Quần baggy nam nữ unisex vải kaki TRƠN ống suông tây đen công sở đi học lưng cao ulzzang hàn quốc dây rút đẹp',
178, 'NCC08',1);
insert into Products VALUES('QN009', N'Quần dài KAKI BASIC PANTS màu TAN Ulzzang UNISEX',200,'NCC08',1);
insert into Products VALUES('QN010', N'Quần short thun nam nữ Hm1986, Quần Đùi Unisex QT100',90,'NCC08',1);
insert into Products VALUES('QN011', N'Quần short nữ ôm lưng siêu cao Q009',100,'NCC09',1);
insert into Products VALUES('QN012', N'Quần short nữ, quần đùi nữ mặc ở nhà chất liệu đũi siêu thoáng mát nhiều màu sắc(40-68kg) QS09',100,'NCC09',1);
insert into Products VALUES('QN013', N'Quần short nữ cạp liền siêu cao quần đùi nữ khóa đồng chất tuyết mưa đẹp thời trang ',110,'NCC09',1);
insert into Products VALUES('QN014', N'Quần short thun nam ống rộng WIIS unisex dọc quần đùi lửng thời trang nam nữ ulzzang',190,'NCC09',1);
insert into Products VALUES('QN015', N'Quần đùi kaki tua rua, quần shorts kaki nữ tua rua',66,'NCC10',0);
insert into Products VALUES('QN016', N'Quần sooc nam nữ mặc nhà, quần đùi unisex ống rộng màu đen, trắng Yinxx QS56',100,'NCC10',0);
-- áo
insert into Products VALUES('AT014', N'Áo Sơ Mi Nữ Cúc Ngọc Chất Xốp In Hoa Tiểu Thư Sang Chảnh Đen Trắng (sơ mi cúc ngọc)',110,'NCC10',1);
-- áo khoác
insert into Products VALUES('AK001', N'Áo khoác cadigan nam nữ chất nỉ bông cao cấp',180, 'NCC11',1);
insert into Products VALUES('AK002', N'Áo Khoác Bomber NEW YORK - phong cách nam nữ WILL SHOP chất nỉ bông cotton',200, 'NCC11',1);
insert into Products VALUES('AK003', N'Áo lót lông Pmax, dành cho cả nam và nữ, chống gió, chống nước, chống lạnh',400, 'NCC12',1);
insert into Products VALUES('AK004', N'Áo khoác có mũ kiểu dáng gấu stick chất nỉ màu xanh form rộng, áo hoodie zip unisex hot trend', 170, 'NCC13',1);
insert into Products VALUES('AK005', N'[Mã BMINC50 giảm 50k đơn 99k] Áo khoác phao béo đại hàn DELIZ, áo phao unisex siêu ấm hàng loại 1', 360,'NCC13',1);

select* from Products;
-- Sale
insert into Sale VALUES('AT001', 20);
insert into Sale VALUES('AT002', 2);
insert into Sale VALUES('AT003', 3);
insert into Sale VALUES('AT004', 10);
insert into Sale VALUES('AT005', 9);
insert into Sale VALUES('AT006', 7);
insert into Sale VALUES('AT007', 15);
insert into Sale VALUES('AT008', 0);
insert into Sale VALUES('AT009', 4);
insert into Sale VALUES('AT010', 25);
insert into Sale VALUES('AT011', 18);
insert into Sale VALUES('AT012', 13);
insert into Sale VALUES('AT013', 22);

insert into Sale VALUES('VN001', 23);
insert into Sale VALUES('VN002', 10);
insert into Sale VALUES('VN003', 12);
insert into Sale VALUES('VN004', 8);
insert into Sale VALUES('VN005', 6);
insert into Sale VALUES('VN006', 20);
insert into Sale VALUES('VN007', 15);
insert into Sale VALUES('VN008', 30);
insert into Sale VALUES('VN009', 0);
insert into Sale VALUES('VN010', 0);

insert into Sale VALUES('QN001', 0);
insert into Sale VALUES('QN002', 0);
insert into Sale VALUES('QN003', 0);
insert into Sale VALUES('QN004', 0);
insert into Sale VALUES('QN005', 0);
insert into Sale VALUES('QN006', 0);
insert into Sale VALUES('QN007', 0);
insert into Sale VALUES('QN008', 0);
insert into Sale VALUES('QN009', 0);
insert into Sale VALUES('QN010', 0);
insert into Sale VALUES('QN011', 0);
insert into Sale VALUES('QN012', 0);
insert into Sale VALUES('QN013', 0);
insert into Sale VALUES('QN014', 0);
insert into Sale VALUES('QN015', 0);
insert into Sale VALUES('QN016', 0);

insert into Sale VALUES('AT014', 0);

insert into Sale VALUES('AK001', 0);
insert into Sale VALUES('AK002', 0);
insert into Sale VALUES('AK003', 0);
insert into Sale VALUES('AK004', 0);
insert into Sale VALUES('AK005', 0);

insert into Sale VALUES('AK005', 0);

-- NHACUNGCAP
insert into Vendors values('NCC01',N'lisa_offical',N'số nhà 23 ngách 16 ngõ 97, Khương trung, Thanh xuân, Hà nội','0888859688');
insert into Vendors values('NCC02',N'bonbonstore2',N' Yên định , Thanh Hoá','0969136623');
insert into Vendors values('NCC03',N'zenkonu',N'Quận Hoàng Mai, Hà Nội','0939146613');
insert into Vendors values('NCC04',N'satagami.store',N'Quận Tây Hồ, Hà Nội','0975488942');
insert into Vendors values('NCC05',N'ginshopquanao',N'Hậu Giang','0975488944');
insert into Vendors values('NCC06',N'under.cool',N'Quận Hà Đông, Hà Nội','0955468924');
insert into Vendors values('NCC07',N'huyentrang_fashion',N'Hà Nội','0935478921');
insert into Vendors values('NCC08',N'thienyettttttttt',N'TP. Hồ Chí Minh','0335489231');
insert into Vendors values('NCC09',N'tong_kho_mexi',N'Hà nội','0356489221');
insert into Vendors values('NCC10',N'thoitrangquangchau.almira',N'Hà nội','0336946451');
insert into Vendors values('NCC11',N'lazycat_shop',N'Quận 10, TP. Hồ Chí Minh','0336987654');
insert into Vendors values('NCC12',N'lylyshop_unisex',N'Thái Nguyên','0356945678');
insert into Vendors values('NCC13',N'yatuan99',N'TP. Hồ Chí Minh','0356960367');



-- CHITIET_SP
insert into DetailProducts values('AT001', 'NCC01',N'Chất liệu thun cotton thoáng mát mặc thoải mái không bị nóng,
không xù lông khi sử dụng lâu', N'Áo thun',N'Nam', N'Cotton',N'Áo thun', N'Việt Nam', N'Cổ điển',3);
insert into DetailProducts values('AT002', 'NCC02',N'Diện team, mặc đôi ưng xỉu,Freesize: Phom 38-65kg mặc đẹp',
N'Áo thun',N'Nam, Nữ', N'Cotton',N'Áo thun cổ tròn', N'Việt Nam', N'Tự do',2);
insert into DetailProducts values('AT003', 'NCC03',N'Kiểu dáng gọn nhẹ, năng động, Chất vải thun mềm mại, dễ thấm hút mồ hôi',
N'Bộ đồ',N'Nam, Nữ', N'Cotton',N'Cổ Tròn Tay Lỡ Phối Dây In Chữ OFF WHITE', N'Việt Nam', N'Cổ điển',2);
insert into DetailProducts values('AT004', 'NCC04',N'Áo khoác cadirgan nỉ hoodie mũ 2 lớp form rộng có khóa cao cấp Unisex',
N'Áo khoác',N'Nam,Nữ', N'Nỉ bông',N'Áo khoác nỉ form rộng', N'Việt Nam', N'Thể thao',3);
insert into DetailProducts values('AT005', 'NCC05',N'Áo Cao Cấp Co dãn, Thoáng mát form rộng dành cho nam và nữ',
N'Áo thun',N'Nam, Nữ', N'Cotton',N'Slim', N'Việt Nam', N'Cổ điển',3);
insert into DetailProducts values('AT006', 'NCC06',N'Áo len UNDERCOOL len tăm cổ 3cm thiết kế trẻ trung nhiều màu sắc',
N'Áo khoác',N'Nữ', N'Len',N'Ôm bó', N'Việt Nam', N'Tự do',4);
insert into DetailProducts values('AT007', 'NCC01',N'Áo Thun Bóng Rổ Ngắn Tay Phối Lớp Ngoài Thời Trang Unisex Cá Tính',
N'Áo thun',N'Nam,Nữ', N'Cotton',N'Aó thể thao', N'Việt Nam', N'Thể thao',2);
insert into DetailProducts values('AT008', 'NCC07',N'Áo sơ mi nữ kiểu babydoll ren tơ phối nơ cổ form rộng dáng xòe mặc thoải mái',
N'Áo sơ mi',N'Nữ', N'Cotton',N'Aó sơ mi kiểu babydoll', N'Việt Nam', N'vintage nhẹ nhàng',2);
insert into DetailProducts values('AT009', 'NCC08',N'Áo trễ vai, áo hở vai nữ đẹp bèo TAY PHỒNG RỘNG dễ thương, mặc đi chơi',
N'Đầm',N'Nữ', N'Cotton',N'Aó trễ vai trơn, tay ngắn', N'Việt Nam', N'Cơ bản, Hàn Quốc, sexy, Đường phố',3);
insert into DetailProducts values('AT010', 'NCC07',N'Áo Sơ Mi Tay Lỡ Giao Cúc Phối Tơ Ánh,Chất Liệu Nhập Hàn Mềm Mịn NKSM2112016',
N'Áo sơ mi',N'Nữ', N'Vải nhập Hàn phối tơ',N'Aó sơ mi kiểu Hàn', N'Việt Nam', N'Hàn Quốc',3);
insert into DetailProducts values('AT011', 'NCC01',N'Áo thun tay ngắn chất tici trơn không cúc đang polo croptop ',
N'Áo thun',N'Nữ', N'Cotton',N'Aó croptop', N'Việt Nam', N'Tự do',2);
insert into DetailProducts values('AT012', 'NCC09',N'Áo Thun Nam Polo Tay Ngắn Phối Màu  ',
N'Áo thun',N'Nam', N'Cotton',N'Aó cổ trụ', N'Việt Nam', N'Cổ điển',2);
insert into DetailProducts values('AT013', 'NCC04',N'Áo Khoác Cardigan Kẻ Thoi Form Rộng Đen/ Hồng Chất Nỉ New',
N'Áo khoác',N'Nữ', N'Nỉ bông',N'Áo khoác nỉ form rộng', N'Việt Nam', N'Thể thao',3);
-- Váy
insert into DetailProducts values('VN001', 'NCC10',N'Váy buộc cổ khóa lưng tay ngắn',
N'Váy dài',N'Nữ', N'Thô 1 lớp',N'Váy chữ A', N'Việt Nam', N'Hàn Quốc',3);
insert into DetailProducts values('VN002', 'NCC10',N'Váy đầm nữ sườn xám cách tân màu đỏ đính hạt không tay ',
N'Váy dài',N'Nữ', N'Nhung',N'Váy xòe', N'Việt Nam', N'Sexy, đường phố',3);
insert into DetailProducts values('VN003', 'NCC10',N'Đầm tiểu thơ xinh xắn HOT TREND Váy dáng dài, cổ vuông siêu xinh, tay ngắn',
N'Váy dài',N'Nữ', N'Nhung',N'Váy xòe', N'Trung Quốc', N'Hàn Quốc',3);
insert into DetailProducts values('VN004', 'NCC10',N'Váy babydoll 2 dây buộc nơ vai dáng suông che khuyết điểm/
Đầm nữ 2 màu xanh, trắng mặc đi chơi, dự tiệc',N'Váy dài',N'Nữ', N'chất voan lụa mềm mát',N'Váy xòe', N'Việt Nam', N'Cơ bản, Hàn Quốc',3);
insert into DetailProducts values('VN005', 'NCC10',N'Chất vải yếm umi rất đẹp, đầm tay, không nhăn nhàu, mềm mát. Áo sơ mi thô lụa, tay bồng, cổ chéo trẻ trung',
N'Váy dài',N'Nữ', N'Vải yếm umi , sơ mi cotton mịn ',N'Váy chữ A', N'Việt Nam', N'Hàn Quốc',3);
insert into DetailProducts values('VN006', 'NCC11',N'Chất liệu dày dặn & đứng form, Tùng xoè cổ tàu cắt xẻ ngực,tay phồng che khuyết điểm cực đẹp ',
N'Váy dài',N'Nữ', N'nhung',N'Váy xòe', N'Việt Nam', N'Công chúa',3);
insert into DetailProducts values('VN007', 'NCC11',N'Hot & On Trend Fashion, Mặc thoải mái đi đâu cũng hợp, 3 màu: Đỏ, Xanh, Đen',
N'Váy dài',N'Nữ', N'lụa',N'Váy xòe', N'Việt Nam', N'nhã nhặn',3);
insert into DetailProducts values('VN008', 'NCC11',N'váy dài 100cm, hai lớp, phần ngực may xếp ly kèm theo mút ngực, 
đằng sau lưng là khóa giọt lệ, áo khác cardigan dệt kim',N'Váy dài',N'Nữ', N'đũi xước mềm in hoa nhí',N'Váy hai dây', N'Việt Nam', N'Hàn Quốc',2);
insert into DetailProducts values('VN009', 'NCC11',N'chất liệu xốp phồng, free size <55kg, Màu sắc nhã nhặn thực sự phù hợp để tới công sở, đi làm hoặc đi chơi',
N'Váy dài',N'Nữ', N'voan',N'Váy trễ vai', N'Việt Nam', N'Hàn Quốc, sexy, Công sở',2);
insert into DetailProducts values('VN010', 'NCC08',N'Ngắn có quần trong bảo hộ, bản eo giữa eo',
N'Chân váy',N'Nữ', N'Kaki for',N'Váy xếp ly', N'Việt Nam', N'Thể thao, Hàn Quốc, Tối giản, sexy, Đường phố',3);
-- quần
insert into DetailProducts values('QN001', 'NCC12',N'Quần Simple và quần 3line được làm từ chất liệu umi cotton 100%, mềm , không nhăn, 
không co rút , không xù lông ngay cả khi giặt bằng máy', N'Quần dài',N'Nữ', N'Denim, Nỉ, kaki, Nhung, umi cotton mịn lì',N'Ống rộng', N'Việt Nam', N'Thể thao, Cơ bản, Hàn Quốc, Đường phố',3);
insert into DetailProducts values('QN002', 'NCC12',N'Chất liệu Jeans cotton mềm mịn nhẹ dày, giữ form thoáng mát đem lại cảm giác thoải mái nhất khi mặc thường xuyên',
N'Quần jean',N'Nữ', N'Denim ',N'Ống rộng', N'Việt Nam', N'Thể thao, Cơ bản, Hàn Quốc, sexy, Đường phố',3);
insert into DetailProducts values('QN003', 'NCC12',N'Sản phẩm thiết kế trẻ trung, cá tính, Màu sắc đa dạng, Chất liệu được chọn lọc kỹ càng, chất lượng tốt',
N'Quần dài',N'Nữ', N'Kaki',N'Ống rộng', N'Việt Nam', N'Hàn Quốc, Tối giản, Retro, Công sở',3);
insert into DetailProducts values('QN004', 'NCC12',N'Hàng freesize, Chất liệu co giãn, phong cách mới tạo sức hút cho từng sản phẩm',
N'Quần dài',N'Nữ', N'Da cá',N'Ống rộng chun gấu', N'Việt Nam', N'Thể thao, cá tính',3);
insert into DetailProducts values('QN005', 'NCC12',N'Mẫu trơn, bản eo bản to',
N'Quần dài',N'Nữ', N'Cotton',N'Skinny', N'Việt Nam', N'Thể thao, cơ bản',3);
insert into DetailProducts values('QN006', 'NCC12',N'Màu sắc: xám khói, bản eo: bản to',
N'Quần jean',N'Nữ', N'Denim',N'Ống rộng', N'Việt Nam', N'Cơ bản, Hàn Quốc, Retro, Đường phố',3);
insert into DetailProducts values('QN007', 'NCC12',N'Màu sắc: đen + xanh, bản eo: giữa eo, Chất liệu cao cấp, ko phai màu',
N'Quần jean',N'Nam, Nữ', N'Jean cao cấp',N'Ống suông rộng', N'Việt Nam', N'Cơ bản, Đường phố',3);
insert into DetailProducts values('QN008', 'NCC12',N'Mẫu trơn, được làm từ chất liệu kaki thoáng mát mặc thoải mái không bị nóng, không xù lông khi sử dụng lâu',
N'Quần jean',N'Nam, Nữ', N'Kaki, Sợi tổng hợp',N'Skinny', N'Việt Nam', N'Thể thao, Cơ bản, Hàn Quốc, Đường phố, Nhiệt đới',3);
insert into DetailProducts values('QN009', 'NCC12',N'Quần form CHÂU ÂU rộng rãi thoải mái, ống quần dài xăn lên tạo style chất ',
N'Quần jean',N'Nữ', N'Kaki',N'Ống suông', N'Việt Nam', N'Cơ bản, Hàn Quốc, Đường phố',3);
insert into DetailProducts values('QN010', 'NCC12',N'Chất thể thao co dãn thấm hút mồ hôi tốt, thoáng mát. Đường may tỉ mỉ, chắc chắc,Thiết kế: hiện đại, trẻ trung',
N'Quần đùi',N'Nam, Nữ', N'Cotton',N'quần short', N'Việt Nam', N'Cơ bản, Đường phố',3);
insert into DetailProducts values('QN011', 'NCC12',N'Quần đùi nữ ôm sexy, lưng cao form ngắn năng động, chất dày dặn, thoáng mát, co giãn tốt ',
N'Quần đùi',N'Nữ', N'Kaki',N'quần short', N'Việt Nam', N'Cơ bản, Hàn Quốc, sexy, Đường phố',2);
insert into DetailProducts values('QN012', 'NCC12',N'Quần đùi nữ mặc ở nhà chất liệu đũi siêu thoáng mát nhiều màu sắc',
N'Quần đùi',N'Nữ', N'Đũi',N'quần short', N'Việt Nam', N'Cơ bản',2);
insert into DetailProducts values('QN013', 'NCC12',N'Quần short nữ cạp liền siêu cao quần đùi nữ khóa đồng chất tuyết mưa đẹp thời trang thanh lịch sang trọng',
N'Quần đùi',N'Nữ', N'Khác',N'quần short', N'Việt Nam', N'Cơ bản',2);
insert into DetailProducts values('QN014', 'NCC12',N'Chất Liệu dày dặn, siêu thấm hút mồ hôi (100% sợi bông Cotton), Đường may chuẩn chỉnh, tỉ mỉ, chắc chắc',
N'Quần đùi',N'Nam', N'Cotton, Kaki',N'short ngố', N'Việt Nam', N'Thể thao, Cơ bản, Hàn Quốc, Đường phố',3);
insert into DetailProducts values('QN015', 'NCC12',N'QUẦN SHORT KAKI  NỮ– Trang phục cần có cho giới trẻ. Các bạn trẻ đam mê phong cách này luôn thích lựa chọn cho mình những món đồ đơn giản và cá tính',
N'Quần đùi',N'Nữ', N'kaki, co giãn, không bai, không xù',N'short đùi tua rua', N'Việt Nam', N'Cơ bản, Đường phố',3);
insert into DetailProducts values('QN016', 'NCC12',N'Chất mềm mịn, không xù lông. Form chuẩn Unisex cực đẹp, có hai màu đen - trắng',
N'Quần đùi',N'Nam, Nữ', N'Cotton, Sợi tổng hợp',N'short ống cạp chun', N'Việt Nam', N'Cơ bản, Đường phố',3);
-- áo
insert into DetailProducts values('AT014', 'NCC01',N'Áo sơ mi cổ tròn có cúc ngọc đóng/mở xinh xắn, viền áo được may cách điệu siêu xinh, có 2 túi giả bên ngực trang trí,
áo tay bồng đúng điệu.',N'Aó sơ mi',N'Nữ', N'Xốp in hoa (xịn)',N'Tiểu thư', N'Việt Nam', N'Hàn Quốc, nhã nhặn',3);
-- Áo khoác
insert into DetailProducts values('AK001', 'NCC13',N'Aó khoác dài tay kiểu nút cài',
N'Aó khoác',N'Nam, Nữ', N'nỉ bông',N'Kiểu nút cài', N'Việt Nam', N'Hàn Quốc',3);
insert into DetailProducts values('AK002', 'NCC13',N'Áo khoác BOMBER vải nỉ bông cotton, đẹp, không co rút, Hình in không bong tróc, đặc biệt không những giúp bạn giữ ấm trong mùa lạnh mà còn có thể chống nắng,
chống gió, chống bụi, chống rét, chống tia UV cực tốt',N'Aó khoác',N'Nam, Nữ', N'nỉ',N'Áo khoác bomber', N'Việt Nam', N'Hàn Quốc',3);
insert into DetailProducts values('AK003', 'NCC13',N'Thiết kế vải gió tráng bạc chống nước, chống gió tuyệt đối bên ngoài chiếc áo còn giữ ấm cơ thể với lớp lót lông cừu bên trong tạo cảm giác mềm mại và ấm áp,
không xù và không rụng lông ',N'Aó khoác',N'Nam, Nữ', N'lót lông cừu',N'Aó khoác dù', N'Việt Nam', N'Hàn Quốc',3);
insert into DetailProducts values('AK004', 'NCC13',N'Đường may chuẩn chỉnh, tỉ mỉ, chắc chắn. Bộ đồ mặc đi làm, ở nhà, mặc đi chơi hoặc khi vận động thể thao. Phù hợp khi mix đồ với nhiều loại.
Thiết kế hiện đại, trẻ trung, năng động. Dễ phối đồ.',N'Aó khoác',N'Nữ', N'Vải nỉ',N'Aó khoac form rộng', N'Việt Nam', N'Thể thao, Cơ bản, Hàn Quốc, Công sở, Cổ điển',3);
insert into DetailProducts values('AK005', 'NCC13',N'Áo sử dụng chất liệu bông siêu nhẹ loại 1, trần bông bằng phương pháp hiện đại nhất hiện nay giúp áo có độ bền cao, 
Cúc bấm nổi sang trọng, siêu bền',N'Aó khoác',N'Nam, Nữ', N'bông',N'Kiểu áo phao', N'Việt Nam', N'Hàn Quốc',3);

-- Favourite
insert into Favourites VALUES ('AT001', 1);

-- ImageComment;
insert into Comments values ('1','AT001' ,'anphan219',N'Sản phầm rất tốt' );
insert into ImageComments(nameI ,idP,status) values ('1','ao001.jpg');
-- image
-- áo

insert into Images(nameI ,idP,status) values('ao001.jpg', 'AT001',1);
insert into Images(nameI ,idP,status) values('ao002.jpg', 'AT002',1);
insert into Images(nameI ,idP,status) values('ao003.jpg', 'AT003',1);
insert into Images(nameI ,idP,status) values('ao004.jpg', 'AT004',1);
insert into Images(nameI ,idP,status) values('ao005.jpg', 'AT005',1);
insert into Images(nameI ,idP,status) values('ao006.jpg', 'AT006',1);
insert into Images(nameI ,idP,status) values('ao007.jpg', 'AT007',1);
insert into Images(nameI ,idP,status) values('ao008.jpg', 'AT008',1);
insert into Images(nameI ,idP,status) values('ao009.jpg', 'AT009',1);
insert into Images(nameI ,idP,status) values('ao010.jpg', 'AT010',1);
insert into Images(nameI ,idP,status) values('ao011.jpg', 'AT011',1);
insert into Images(nameI ,idP,status) values('ao012.jpg', 'AT012',1);
insert into Images(nameI ,idP,status) values('ao013.jpg', 'AT013',1);
insert into Images(nameI ,idP,status) values('ao014.jpg', 'AT014',1);

-- váy 
insert into Images(nameI ,idP,status) values('vay001.jpg', 'VN001',1);
insert into Images(nameI ,idP,status) values('vay002.jpg', 'VN002',1);
insert into Images(nameI ,idP,status) values('vay003.jpg', 'VN003',1);
insert into Images(nameI ,idP,status) values('vay004.jpg', 'VN004',1);
insert into Images(nameI ,idP,status) values('vay005.jpg', 'VN005',1);
insert into Images(nameI ,idP,status) values('vay006.jpg', 'VN006',1);
insert into Images(nameI ,idP,status) values('vay007.jpg', 'VN007',1);
insert into Images(nameI ,idP,status) values('vay008.jpg', 'VN008',1);
insert into Images(nameI ,idP,status) values('vay009.jpg', 'VN009',1);
insert into Images(nameI ,idP,status)values('vay010.jpg', 'VN010',1);
-- quần
insert into Images(nameI ,idP,status) values('quan001.jpg', 'QN001',1);
insert into Images(nameI ,idP,status) values('quan002.jpg', 'QN002',1);
insert into Images(nameI ,idP,status) values('quan003.jpg', 'QN003',1);
insert into Images(nameI ,idP,status) values('quan004.jpg', 'QN004',1);
insert into Images(nameI ,idP,status) values('quan005.jpg', 'QN005',1);
insert into Images(nameI ,idP,status) values('quan006.jpg', 'QN006',1);
insert into Images(nameI ,idP,status) values('quan007.jpg', 'QN007',1);
insert into Images(nameI ,idP,status) values('quan008.jpg', 'QN008',1);
insert into Images(nameI ,idP,status) values('quan009.jpg', 'QN009',1);
insert into Images(nameI ,idP,status) values('quan010.jpg', 'QN010',1);
insert into Images(nameI ,idP,status) values('quan011.jpg', 'QN011',1);
insert into Images(nameI ,idP,status) values('quan012.jpg', 'QN012',1);
insert into Images(nameI ,idP,status) values('quan013.jpg', 'QN013',1);
insert into Images(nameI ,idP,status) values('quan014.jpg', 'QN014',1);
insert into Images(nameI ,idP,status) values('quan015.jpg', 'QN015',1);
insert into Images(nameI ,idP,status) values('quan016.jpg', 'QN016',1);

-- áo khoác
insert into Images(nameI ,idP,status) values('aokhoac001.jpg', 'AK001',1);
insert into Images(nameI ,idP,status) values('aokhoac002.jpg', 'AK002',1);
insert into Images(nameI ,idP,status) values('aokhoac003.jpg', 'AK003',1);
insert into Images(nameI ,idP,status) values('aokhoac004.jpg', 'AK004',1);
insert into Images(nameI ,idP,status) values('aokhoac005.jpg', 'AK005',1);
-- import_Products
insert into ImportP VALUES('AT001', 50, 'NCC01');
insert into ImportP VALUES('AT002', 40, 'NCC01');
insert into ImportP VALUES('AT003', 60, 'NCC01');
insert into ImportP VALUES('AT004', 100, 'NCC01');
insert into ImportP VALUES('AT005', 30, 'NCC01');

insert into ImportP VALUES('AT006', 200, 'NCC02');
insert into ImportP VALUES('AT007', 70, 'NCC02');
insert into ImportP VALUES('AT008', 50, 'NCC02');
insert into ImportP VALUES('AT009', 30, 'NCC02');
insert into ImportP VALUES('AT010', 80, 'NCC02');

insert into ImportP VALUES('AT011', 150, 'NCC03');
insert into ImportP VALUES('AT012', 60, 'NCC03');
insert into ImportP VALUES('AT013', 70, 'NCC03');

insert into ImportP VALUES('VN001', 50, 'NCC04');
insert into ImportP VALUES('VN002', 50, 'NCC04');
insert into ImportP VALUES('VN003', 60, 'NCC04');
insert into ImportP VALUES('VN004', 40, 'NCC04');

insert into ImportP VALUES('VN005', 70, 'NCC05');
insert into ImportP VALUES('VN006', 250, 'NCC05');
insert into ImportP VALUES('VN007', 150, 'NCC05');
insert into ImportP VALUES('VN008', 100, 'NCC05');

insert into ImportP VALUES('VN009', 50, 'NCC06');
insert into ImportP VALUES('VN010', 40, 'NCC06');
insert into ImportP VALUES('QN001', 300, 'NCC06');
insert into ImportP VALUES('QN002', 210, 'NCC06');

insert into ImportP VALUES('QN003', 110, 'NCC07');
insert into ImportP VALUES('QN004', 90, 'NCC07');
insert into ImportP VALUES('QN005', 80, 'NCC07');
insert into ImportP VALUES('QN006', 120, 'NCC07');

insert into ImportP VALUES('QN007', 100, 'NCC08');
insert into ImportP VALUES('QN008', 90, 'NCC08');
insert into ImportP VALUES('QN009', 70, 'NCC08');
insert into ImportP VALUES('QN010', 30, 'NCC08');

insert into ImportP VALUES('QN011', 50, 'NCC09');
insert into ImportP VALUES('QN012', 90, 'NCC09');
insert into ImportP VALUES('QN013', 50, 'NCC09');
insert into ImportP VALUES('QN014', 80, 'NCC09');

insert into ImportP VALUES('QN015', 100, 'NCC10');
insert into ImportP VALUES('QN016', 110, 'NCC10');
insert into ImportP VALUES('AT014', 200, 'NCC10');

insert into ImportP VALUES('AK001', 90, 'NCC11');
insert into ImportP VALUES('AK002', 130, 'NCC11');

insert into ImportP VALUES('AK003', 230, 'NCC12');

insert into ImportP VALUES('AK004', 90, 'NCC13');
insert into ImportP VALUES('AK005', 250, 'NCC13');
select p.*,percent from Products p join Sale s on p.idP = s.idP;
-- DON_HANG
/*select * from CHITIET_SANPHAM;
select * from SANPHAM;
with x as (select sp.*, ROW_NUMBER() over (order by TenSP desc ) as r   from SANPHAM sp)
					select * from x where r between 1 and 3;

with x as (select *, ROW_NUMBER() over (order by TenSP ) as r from SANPHAM sp join CHITIET_SANPHAM ct on sp.MaSP = ct.MaSP where LoaiSP in(?) and TenSP like ?)
							 select * from x where r between ?*?-(?-1) and ?*?;
with x as (select sp.*, ROW_NUMBER() over (order by TenSP desc) as r from SANPHAM sp)
						select * from x where r between 1 and 3    ;   
                        with x as (select *, ROW_NUMBER() over (order by "+attribute+" "+proviso+ ") as r from SANPHAM where TenSP like '%Áo%')
					select * from x where r between 1 and 3 */
with x as (select *, ROW_NUMBER() over (order by namep desc ) as r from Products where Namep like N'%o%')
select * from x where r between 1 and 3;
select p.*,percent from Products p join Sale s on p.idP = s.idP;
with x as (select *, ROW_NUMBER() over (order by nameP desc ) as r from Products)
select * from x where r between 1 and 15;
select* from Accounts;
with x as (select sp.*, ROW_NUMBER() over (order by nameP ASC) as r from Products sp join DetailProducts ct on sp.idP = ct.idP where typeP in(N'Áo thun'))
							select * from x where r between 1 and 15