use master

GO

IF exists (select name from sysdatabases where name='SOF301ASM')
drop Database SOF301ASM

GO

Create Database SOF301ASM

GO

use SOF301ASM
Go

IF OBJECT_ID('category') IS NOT NULL
DROP TABLE category

GO

CREATE TABLE category (
  categoryid   int           NOT NULL PRIMARY KEY,
  categoryname nvarchar(100) NOT NULL
)

go
INSERT INTO category VALUES (1,N'Quần')
INSERT INTO category VALUES (2,N'Áo')
INSERT INTO category VALUES (3,N'Đầm')
INSERT INTO category VALUES (4,N'Áo khoác')
INSERT INTO category VALUES (5,N'Vớ & Quần vớ nữ')

GO


IF OBJECT_ID('product') IS NOT NULL
DROP TABLE product

GO
CREATE TABLE product (
  product_id    int            NOT NULL PRIMARY KEY,
  category_id   int            NOT NULL,
  product_name  nvarchar(100)  NOT NULL,
  product_price        int            NOT NULL,
  product_img          nvarchar(100)  NULL,
  product_description  nvarchar(500)  NULL 
   ) 

Go
INSERT INTO product VALUES (1,1,N'Quần shorts jeans nữ',250,'quans1.png',N'Được may từ chất liệu vải bền đẹp, thoáng mát với thiết kế đơn giản, nữ tính, xinh đẹp và phong cách mỗi khi ra ngoài')
INSERT INTO product VALUES (2,1,N'Quần jeans lửng',270,'quanl1.png',N'Được may từ chất liệu vải bền đẹp, thoáng mát với thiết kế đơn giản, nữ tính, xinh đẹp và phong cách mỗi khi ra ngoài')
INSERT INTO product VALUES (3,1,N'Quần jeans dài',300,'quand1.png',N'Được may từ chất liệu vải bền đẹp, thoáng mát với thiết kế đơn giản, nữ tính, xinh đẹp và phong cách mỗi khi ra ngoài')
INSERT INTO product VALUES (4,1,N'Quần jeans rách',200,'quanr1.png',N'Được may từ chất liệu vải bền đẹp, thoáng mát với thiết kế đơn giản, nữ tính, xinh đẹp và phong cách mỗi khi ra ngoài')
INSERT INTO product VALUES (5,1,N'Quần JP01',220,'quanj1.png',N'Được may từ chất liệu vải bền đẹp, thoáng mát với thiết kế đơn giản, nữ tính, giúp bạn gái luôn trẻ trung, xinh đẹp và phong cách mỗi khi ra ngoài')
INSERT INTO product VALUES (6,1,N'Quần JP02',220,'quanj2.png',N'Được may từ chất liệu vải bền đẹp, thoáng mát với thiết kế đơn giản, nữ tính, giúp bạn gái luôn trẻ trung, xinh đẹp và phong cách mỗi khi ra ngoài')

INSERT INTO product VALUES (7,2,N'Áo thun xám',150,'ao5.png',N'Được may từ chất liệu vải thun bền , mặc cảm giác thoáng mát , nữ tính , giúp bạn cảm thấy thoải mái với mùa hè')
INSERT INTO product VALUES (8,2,N'Áo công sở',200,'ao1.png',N'Được may với chất liệu tốt , làm nổi bật với người phụ nữ công sở 2017')
INSERT INTO product VALUES (9,2,N'Áo công sở',200,'ao4.png',N'Được may với chất liệu tốt , làm nổi bật với người phụ nữ công sở 2017')
INSERT INTO product VALUES (10,2,N'Áo thun',250,'ao6.png',N'Được may từ chất liệu vải thun bền , mặc cảm giác thoáng mát , nữ tính , giúp bạn cảm thấy thoải mái')
INSERT INTO product VALUES (11,2,N'Áo kiểu JJ01',180,'ao2.png',N'Đang cập nhật')
INSERT INTO product VALUES (12,2,N'Áo kiểu JJ02',170,'ao3.png',N'Đang cập nhật')

INSERT INTO product VALUES (13,3,N'Đầm Body',250,'dam-body.png',N'Với thiết kế thân đầm liền ôm body, nhằm tôn lên 3 vòng đầy đặn tạo nên nét quyến rũ gợi cảm.')
INSERT INTO product VALUES (14,3,N'Đầm Công sở',280,'idam-cs.png',N'Thiết kế vô cùng trẻ trung, đơn giản nhưng đặc biệt với nét sang trọng pha chút điệu đà được phái đẹp mê mẩn')
INSERT INTO product VALUES (15,3,N'Đầm Công sở',270,'dam-cs2.png',N'Thiết kế vô cùng trẻ trung, đơn giản nhưng đặc biệt với nét sang trọng pha chút điệu đà được phái đẹp mê mẩn.')
insert into product values (16,3,N'Đầm Dạ tiệc',350,'dam-datiec.png',N'Màu sắc nổi bật, form chuẩn dáng vừa mặc, dễ dàng mang đến cho các nàng sự trẻ trung, năng động và không kém phần thanh lịch')
insert into product values (17,3,N'Đầm Maxi',200,'dam-maxi.png',N'Dạo gần đây những mẫu đầm maxi nữ thiết kế đến từ các hotgirl luôn là sự lựa chọn tuyệt vời cho cô gái với nhiều kiểu dáng khác nhau để phù hợp hơn với vóc dáng cũng như hoàn cảnh sự kiện.')
insert into product values (18,3,N'Đầm Maxi',200,'dam-maxi2.png',N'Dạo gần đây những mẫu đầm maxi nữ thiết kế đến từ các hotgirl luôn là sự lựa chọn tuyệt vời cho cô gái với nhiều kiểu dáng khác nhau để phù hợp hơn với vóc dáng cũng như hoàn cảnh sự kiện.')
insert into product values (19,3,N'Đầm Ren',300,'dam-ren.png',N'Thật duyên dáng và sang trọng đầm ren xòe hoa xinh xắn mang lại nét đẹp thật kiêu sa lộng lẫy mà vẫn thật xinh xắn trẻ trung cho bạn gái. Với chất liệu vải ren hoa cao cấp')
insert into product values (20,3,N'Đầm Ren',300,'dam-ren2.png',N'Thật duyên dáng và sang trọng đầm ren xòe hoa xinh xắn mang lại nét đẹp thật kiêu sa lộng lẫy mà vẫn thật xinh xắn trẻ trung cho bạn gái. Với chất liệu vải ren hoa cao cấp')

insert into product values(21,4,N'Áo khoác Adachi',150,'aokhoac1.png',N'Đang cập nhật')
insert into product values(22,4,N'Áo khoác Kaki ',170,'aokhoac2.png',N'Đang cập nhật')
insert into product values(23,4,N'Áo khoác kéo',150,'aokhoac3.png',N'Đang cập nhật')
insert into product values(24,4,N'Áo khoác bóng chày',180,'aokhoac4.png',N'Đang cập nhật')
insert into product values(25,4,N'Áo khoác nỉ',200,'aokhoac5.png',N'Đang cập nhật')

insert into product values(26,5,N'Tất đùi nữ lưới cực sexy, nóng bỏng',300,'tat1.png',N'Thời trang mùa thu đông luôn có một sức nóng nhất định đối với phái đẹp . Vậy  Zozo  sẽ giới thiệu tới các bạn tất đùi  mới lạ độc đáo  thời trang  cho bạn gái.')
insert into product values(27,5,N'Quần kẹp tất cực sexy 2139',250,'tat2.png',N'Sản phẩm bền, mịn, thoáng khí giúp che được những khuyết điểm trên chân, cho bạn thoải mái diện đồ ngắn mà không lo chân xấu.')
insert into product values(28,5,N'Quần kẹp tất dây hạt cườm cực sexy',220,'tat3.png',N'Quần thiết kế 4 dây móc cài quần ren đính hạt cườm  tạo điểm nhấn cho đôi chân thon dài.')


go


IF OBJECT_ID('users') IS NOT NULL
DROP TABLE users

GO

CREATE TABLE users (
  username     nvarchar(30)   NOT NULL PRIMARY KEY,
  password     nvarchar(30)   NOT NULL,
  fullname     nvarchar(50)   NULL,
  role         int            NULL,
  email        nvarchar(100)  NULL,
  address      nvarchar(100)  NULL,
  phone        nvarchar(20)   NULL
) 
go
INSERT INTO users VALUES ('vu','123',N'Lê Nguyễn Hoài Vũ',1,'vulnhps05401@fpt.edu.vn','TP.HCM','0939361105')
INSERT INTO users VALUES ('admin','admin',N'Admin',1,'vulnhps05400@fpt.edu.vn','TP.HCM','0938253844')
INSERT INTO users VALUES ('tam','123',N'Minh Tâm',0,'tamntmps053049@fpt.edu.vn','TP.HCM','')

