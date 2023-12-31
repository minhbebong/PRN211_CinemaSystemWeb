USE [CinemaSystem]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 8/25/2023 8:49:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Desc] [nvarchar](1024) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Film]    Script Date: 8/25/2023 8:49:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Film](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Desc] [nvarchar](1024) NOT NULL,
	[Length] [int] NOT NULL,
	[ImageURL] [nvarchar](128) NOT NULL,
	[ReleaseDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FilmCategory]    Script Date: 8/25/2023 8:49:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FilmCategory](
	[FilmID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FilmID] ASC,
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 8/25/2023 8:49:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Rows] [int] NOT NULL,
	[Cols] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Show]    Script Date: 8/25/2023 8:49:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Show](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FilmID] [int] NOT NULL,
	[Start] [datetime] NOT NULL,
	[End] [datetime] NOT NULL,
	[TicketPrice] [float] NOT NULL,
	[RoomID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 8/25/2023 8:49:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[ShowID] [int] NOT NULL,
	[UserID] [int] NULL,
	[OTP] [char](6) NOT NULL,
	[Row] [int] NOT NULL,
	[Col] [int] NOT NULL,
	[IsUsed] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ShowID] ASC,
	[Row] ASC,
	[Col] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 8/25/2023 8:49:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](64) NOT NULL,
	[Password] [nvarchar](64) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[AvatarURL] [nvarchar](128) NOT NULL,
	[Balance] [float] NOT NULL,
	[Role] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Name], [Desc]) VALUES (1, N'Action adventure', N'Phim phiêu lưu hành động kết hợp hành động gay cấn với cuộc hành trình mạo hiểm của nhân vật anh hùng. Những cảnh đánh đấm, đua xe và phiêu lưu tạo nên trải nghiệm kịch tính. Nhân vật thường can đảm, đối đầu với khó khăn, khám phá các môi trường đa dạng và tìm giải pháp cho những tình huống bất ngờ.')
INSERT [dbo].[Category] ([ID], [Name], [Desc]) VALUES (2, N'Romantic drama', N'Phim tâm lý tình cảm tập trung vào khám phá tâm hồn con người qua những cảm xúc, mối quan hệ và tình yêu. Nhân vật phức tạp, cốt truyện sâu sắc và tạo cảm xúc là điểm nhấn chính, thường được kết hợp với không gian và âm nhạc để tạo nên trải nghiệm tinh tế và đầy cảm xúc.')
INSERT [dbo].[Category] ([ID], [Name], [Desc]) VALUES (3, N'Horror', N'Phim kinh dị tập trung vào việc làm sợ hãi khán giả bằng cách sử dụng tình huống đáng sợ, quái dị và bí ẩn. Âm nhạc, ánh sáng đen tối và hình ảnh kỳ quái thường được sử dụng để tạo ra hiệu ứng đáng sợ.')
INSERT [dbo].[Category] ([ID], [Name], [Desc]) VALUES (4, N'Sports-Music film', N'Phim thể thao - âm nhạc kết hợp cảnh thể thao đầy cảm xúc với âm nhạc sôi động, tạo nên trải nghiệm năng lượng và cuốn hút.')
INSERT [dbo].[Category] ([ID], [Name], [Desc]) VALUES (5, N'Cartoon', N'Phim hoạt hình là loại phim dùng hình ảnh động vẽ hoặc tạo ra bằng máy tính để kể câu chuyện. Những nhân vật và cảnh quan trong phim hoạt hình có thể là hư cấu hoặc thực tế, tạo ra một thế giới độc đáo và thường mang tính biểu tượng. Thể loại này có thể dành cho cả trẻ em và người lớn, với nội dung từ hài hước đến lãng mạn, phiêu lưu hoặc giáo dục.')
INSERT [dbo].[Category] ([ID], [Name], [Desc]) VALUES (6, N'Humorous', N'Phim hài hước là thể loại tạo ra tiếng cười và vui vẻ cho khán giả bằng cách sử dụng tình huống hài hước, gây cười và những tình tiết lố bịch. Các nhân vật thường có tính cách độc đáo và thường xuyên tham gia vào các tình huống gây hỗn loạn hoặc khó đỡ, tạo ra sự giải trí qua các pha hài và màn biểu diễn vui nhộn.')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Film] ON 

INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (1, N'Cát Lún', N'Cát Lún kể về một cặp vợ chồng sắp ly hôn bị mắc kẹt trong cát lún khi đi bộ xuyên qua một khu rừng nhiệt đới ở Colombia. Họ sẽ chiến đấu với các yếu tố của rừng rậm và phải làm việc cùng nhau để tồn tại.', 95, N'https://www.vitalthrills.com/wp-content/uploads/2023/05/amcnettitles10.jpg', CAST(N'2023-08-01' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (2, N'Quái Vật Dưới Bể Nước', N'Quái Vật Dưới Bể Nước kể về sau khi bí ẩn thừa kế một tài sản ven biển bị bỏ hoang, Ben và gia đình vô tình giải phóng một sinh vật cổ xưa, không hoạt động lâu dài, khủng bố toàn bộ khu vực - bao gồm cả tổ tiên của chính anh ta - trong nhiều thế hệ.', 111, N'https://www.heavenofhorror.com/wp-content/uploads/2023/04/the-tank-2023-horror.jpg', CAST(N'2023-08-02' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (3, N'Vệ Binh Dải Ngân Hà 3', N'Vệ Binh Dải Ngân Hà 3 kể về Peter Quill, vẫn quay cuồng vì mất Gamora, phải tập hợp đội của mình xung quanh anh ta để bảo vệ vũ trụ cùng với việc bảo vệ một người trong số họ. Nếu bất kì một nhiệm vụ nào không hoàn thành xuất sắc, nó hoàn toàn có thể dẫn đến sự kết thúc của những Vệ Binh Giải Ngân Hà.', 149, N'https://www.murphysmultiverse.com/wp-content/uploads/2021/01/asdfljalsdf-1024x576.jpg', CAST(N'2023-08-03' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (4, N'Nhiệm Vụ Bất Khả Thi: Nghiệp Báo', N'Nhiệm Vụ Bất Khả Thi: Nghiệp Báo kể về Ethan Hunt và nhóm IMF của anh phải truy tìm một vũ khí nguy hiểm trước khi nó rơi vào tay kẻ xấu.', 164, N'https://i.ytimg.com/vi/2m1drlOZSDw/maxresdefault.jpg', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (5, N'Vây Hãm Không Lối Thoát', N'Vây Hãm Không Lối Thoát kể về bảy năm sau cuộc vây bắt ở Việt Nam, Ma Seok-do gia nhập một đội mới để điều tra một vụ án giết người. Anh sớm bắt đầu tìm hiểu sâu hơn khi phát hiện ra vụ án liên quan đến một loại ma túy tổng hợp và một băng nhóm côn đồ.', 104, N'https://image.tmdb.org/t/p/original/m1pbhLr3RzVe7AKG8QQX0xHjcqR.jpg', CAST(N'2023-08-05' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (6, N'Vụ Cướp Kim Cương', N'Vụ Cướp Kim Cương kể về một cựu võ sĩ MMA và những người anh em của mình phải giải cứu gia đình bị bắt cóc khỏi một tổ chức tội phạm nguy hiểm sau khi số kim cương bất hợp pháp trị giá 50 triệu USD bị đánh cắp.', 98, N'https://i.ytimg.com/vi/EdgdXTCnTpA/maxresdefault.jpg', CAST(N'2023-08-06' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (7, N'Một Năm Khó Quên', N'Một Năm Khó Quên: Mùa Đông kể về thay vì tham gia chuyến đi tốt nghiệp cùng bạn bè, Mabel buộc phải cùng bố mẹ đến một khu trượt tuyết ở Chile. Cô không ngờ rằng khóa tu lạnh giá này có thể giới thiệu cô với một nhóm bạn bí mật và một tình yêu tiềm năng.', 101, N'https://www.m9.news/wp-content/uploads/2023/06/An-Unforgettable-Year.jpeg', CAST(N'2023-08-07' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (8, N'Qua Ô Cửa Sổ', N'Qua Ô Cửa Sổ: Bên Kia Đại Dương: kể về sau một năm xa cách, Raquel và Ares đoàn tụ trong chuyến đi biển ướt át. Đối mặt với những lời tán tỉnh mới mẻ và nỗi bất an, liệu tình yêu của họ có thắng thế?', 111, N'https://i.ytimg.com/vi/gJFyXqqyLo4/maxresdefault.jpg', CAST(N'2023-08-07' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (9, N'Phát Hiện Hoàn Hảo', N'Phát Hiện Hoàn Hảo kể về màn tái xuất sự nghiệp của biên tập viên thời trang vấp phải trở ngại khi cô biết rằng chàng trai lạ mặt, quyến rũ cô hôn ở một bữa tiệc là đồng nghiệp mới kiêm con trai của sếp.', 99, N'https://i.ytimg.com/vi/OiTXSt5k7ok/maxresdefault.jpg', CAST(N'2023-08-08' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (10, N'Thiếu Gia Giả Nghèo 2', N'Thiếu Gia Giả Nghèo 2 kể về khi Paula rời Rio de Janeiro để tiếp tục công việc bác sĩ tình nguyện ở Amazon, Teto nảy ra kế hoạch bốc đồng để đi theo cô. Và rồi hỗn loạn xảy ra!', 89, N'https://esportsku.com/film/wp-content/uploads/2021/02/Rich-In-Love-2-1068x641.jpg', CAST(N'2023-08-08' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (11, N'Royalteen: Công Chúa Margrethe', N'Royalteen: Công Chúa Margrethe kể về sau vụ bê bối của mình tại buổi dạ hội, công chúa Margrethe muốn mọi chuyện trở lại bình thường khi cô vật lộn duy trì hình tượng hoàn hảo trong khi đối mặt với rắc rối gia đình.', 98, N'https://th.bing.com/th/id/OIP.PISqlOmOKCBAeRY6fL0ptgHaEK?pid=ImgDet&rs=1', CAST(N'2023-08-09' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (12, N'The Whale', N'The Whale kể về một giáo viên tiếng Anh mắc bệnh béo phì sống ẩn dật cố gắng kết nối lại với cô con gái tuổi teen bị ghẻ lạnh của mình.', 117, N'https://image.tmdb.org/t/p/w1280/yk5quAAVHvA9Q4VJ26KrMXWRIaq.jpg', CAST(N'2023-08-09' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (13, N'Tà Chú Cấm', N'Tà Chú Cấm kể về cặp vợ chồng Ning, Kwin và cô con gái 7 tuổi với tên gọi Ing. Vì khó khăn về tài chính, hai vợ chồng quyết định cho thuê ngôi nhà đang ở và chuyển đến một căn hộ chung cư giá rẻ để sinh sống. Sau khi những người thuê nhà chuyển đến, Ning nhận thấy chồng bắt đầu có những hành vi bất thường. Anh ta trở nên bí mật và thường biến mất khỏi căn hộ và lúc 4 giờ sáng. Kwin thậm chí còn có một hình xăm kỳ lạ ở ngực tựa như ký hiệu đặc biệt của một hội tà giáo bí ẩn. Khi hành vi của chồng ngày càng trở nên đáng lo ngại, cũng là lúc Ning nhận ra cô con gái của mình đang gặp hiểm nguy. Bí mật nào đang được che giấu trong ngôi nhà cho thuê của họ?', 122, N'https://i.ytimg.com/vi/O69zBsbiVsE/maxresdefault.jpg', CAST(N'2023-06-23' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (14, N'Bữa Tiệc Đẫm Máu', N'Bữa Tiệc Đẫm Máu kể về món quà tốt nghiệp của Audra là ngôi nhà mơ ước của cô ấy, nhưng nó nhanh chóng trở thành cơn ác mộng sống động khi một số vị khách không mời mà đến dự tiệc mừng nhà của cô ấy, những người không tinh tế lắm về việc họ không chấp thuận chủ nhân mới của ngôi nhà.
', 99, N'https://i.ytimg.com/vi/NirggCxwEno/maxresdefault.jpg', CAST(N'2023-08-11' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (15, N'Little Bone Lodge', N'Little Bone Lodge lấy bối cảnh là một cơn bão rất dữ dội, hai anh em tội phạm đang chạy trốn tìm nơi ẩn náu trong một trang trại hoang vắng. Bắt gia đình cư dân bị giam cầm, họ phát hiện ra ngôi nhà chứa đựng những bí mật đen tối của riêng nó.', 93, N'https://th.bing.com/th/id/OIP.RvjdOW_mXr5-Oms9XIX5XwHaEK?pid=ImgDet&rs=1', CAST(N'2023-08-12' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (16, N'Cơn Thịnh Nộ Từ Cõi Âm', N'Cơn Thịnh Nộ Từ Cõi Âm kể về Elly được một người bạn của gia đình nhờ chăm sóc một người phụ nữ lớn tuổi sống trong một căn nhà gỗ hẻo lánh trong vài ngày. Cô đồng ý, nhưng nhanh chóng phát hiện ra có một con quỷ đang ẩn náu trong người phụ nữ chỉ chực chờ để thoát ra.', 95, N'https://www.justwatch.com/images/backdrop/301281571/s1440/the-accursed-2022', CAST(N'2023-08-13' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (17, N'Ma Cây Trỗi Dậy', N'Ma Cây Trỗi Dậy kể về một câu chuyện phức tạp về hai chị em bị ghẻ lạnh, cuộc hội ngộ của họ bị cắt ngắn bởi sự trỗi dậy của những con quỷ chiếm hữu xác thịt, đẩy họ vào một cuộc chiến sinh tồn nguyên thủy khi họ đối mặt với phiên bản gia đình ác mộng nhất có thể tưởng tượng được.', 96, N'https://w0.peakpx.com/wallpaper/212/572/HD-wallpaper-evil-dead-rise-movie-poster-2023.jpg', CAST(N'2023-08-14' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (18, N'Tin và Tina', N'Tin và Tina kể về sau lần sảy thai đau thương, một cặp đôi trẻ nhận nuôi cặp song sinh kỳ quặc ở một tu viện. Nhưng việc chúng ám ảnh với tôn giáo nhanh chóng khiến gia đình họ xáo trộn.', 120, N'https://i.ytimg.com/vi/sJuRxNlSsvE/maxresdefault.jpg', CAST(N'2023-08-14' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (19, N'Huyền Thoại Pelé', N'Huyền Thoại Pelé kể về cuộc đời huyền thoại bóng đá Pele thưở thiếu thời ở khu Sao Paulo cho đến khi dẫn dắt đội tuyển Brazil cho đến chiến thắng World Cup đầu tiên năm 17 tuổi. Đây sẽ là một bộ phim truyền cảm hứng cho tất cả những ai đã, đang và sẽ theo đuổi ước mơ trở thành một cầu thủ.', 107, N'https://is5-ssl.mzstatic.com/image/thumb/Video123/v4/ef/0c/11/ef0c11d7-d237-f42c-c19c-6065b7b023a4/pr_source.png/2000x1125.jpg', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (20, N'Chị Em Kình Ngư', N'Chị Em Kình Ngư là câu chuyện từ Syria bị chiến tranh tàn phá đến Olympic Rio 2016, hai chị em trẻ tuổi bắt đầu cuộc hành trình mạo hiểm, dành trọn trái tim và kỹ năng bơi lội của họ cho chính nghĩa.', 135, N'https://dailyresearchplot.com/wp-content/uploads/2022/10/1-910.jpg', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (21, N'Bài Hát Con Tim ', N'Bài Hát Con Tim khi hát mừng cho một đám cưới nhanh chóng rơi vào hỗn loạn, chàng nhạc sĩ du mục phải lòng cô dâu đang gặp rắc rối với gia đình. Giờ thì chàng sẽ phải cứu cô gái ấy.', 95, N'https://static.titlovi.com/img/0308/308177-tt21339860.jpg', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (22, N'Trái Tim Màu Tím', N'Trái Tim Màu Tím kể về cô gái Cassie - một nhạc sĩ đang gặp khó khăn vì phải kết hôn với người đàn ông để đạt được lợi ích của mình. Lúc này đây, Cassie đã gặp gỡ được Luke một lính thủy đánh bộ cũng mong muốn kết hôn vì lợi ích quân sự của mình. Nên cả hai đã quyết định tiến hành một cuộc hôn nhân giả. Nhưng mọi việc lại gặp rắc rối khi từ một mối quan hệ giả lại trở thành thật.', 124, N'https://www.teknobeyin.com/dosyalar/2022/08/purple-hearts-kalplerimiz-bir-film.jpg', CAST(N'2023-08-14' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (23, N'Cuộc Truy Sát Trên Mỏm Núi', N'Cuộc Truy Sát Trên Mỏm Núi xoay quanh câu chuyện về cô gái trẻ tuổi Kelly, là một người ưa thích môn thể thao leo núi đầy mạo hiểm. Vì thế giờ đây, cô bắt đầu cuộc hành trình leo núi như mọi khi. Tuy nhiên, mọi thứ lại thay đổi, sau khi cô leo tới đỉnh núi thì bất ngờ bị bốn kẻ giết người đang tìm cách tiếp cận và sát hại cô. Liệu Kelly sẽ phải làm thế nào để có thể sống sót?', 86, N'https://v.lfushaar.com/wp-content/uploads/2022/06/The-Ledge-2022.jpg', CAST(N'2023-08-13' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (24, N'Hustle: Cuộc Đua NBA', N'Hustle: Cuộc Đua NBA kể về một siêu sao tiềm năng ở Tây Ban Nha, vị tuyển trạch viên bóng rổ xui xẻo bắt đầu chứng minh cả hai có đủ mọi yếu tố cần thiết để thành công ở NBA.', 117, N'https://image.tmdb.org/t/p/w1280/cOkfKDFGD28UePLwmrXwgf2txZY.jpg', CAST(N'2023-08-12' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (25, N'Khóa Chặt Cửa Nào Suzume', N'Khóa Chặt Cửa Nào Suzume kể về câu chuyện khi Suzume vô tình gặp một chàng trai trẻ đến thị trấn nơi cô sinh sống với mục đích tìm kiếm "một cánh cửa". Để bảo vệ Nhật Bản khỏi thảm họa, những cánh cửa rải rác khắp nơi phải được đóng lại, và bất ngờ thay Suzume cũng có khả năng đóng cửa đặc biệt này. Từ đó cả hai cùng nhau thực hiện sự mệnh "khóa chặt cửa"!', 122, N'https://pyzal.com/wp-content/uploads/2022/04/After-Your-Name-Makoto-Shinkai-unveils-the-trailer-for-his.png', CAST(N'2023-08-11' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (26, N'Người Nhện: Du Hành Vũ Trụ', N'Người Nhện: Du Hành Vũ Trụ kể về Sau khi gặp lại Gwen Stacy, chàng Spider-Man thân thiện đến từ Brooklyn phải du hành qua đa vũ trụ và gặp một nhóm Người Nhện chịu trách nhiệm bảo vệ các vũ trụ song song. Nhưng khi nhóm siêu anh hùng xung đột về cách xử lý một mối đe dọa mới, Miles buộc phải đọ sức với các Người Nhện khác và phải xác định lại ý nghĩa của việc trở thành một người hùng để có thể cứu những người cậu yêu thương nhất.', 140, N'https://images.hdqwalls.com/wallpapers/spiderman-into-the-spider-verse-cool-art-6a.jpg', CAST(N'2023-08-10' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (27, N'Mèo Béo Siêu Đẳng', N'Mèo Béo Siêu Đẳng kể về Maurice một chú mèo ngốc nghếch biết nói với biệt tài lừa đảo kiếm tiền siêu đỉnh. Darktan - chỉ huy của đàn chuột tinh quái đang có âm mưu với người bạn Maurice của mình về một hòn đảo thiên đường, nơi mà loài chuột và con người sống hòa bình với nhau. Liệu trò lừa đảo này của đôi bạn có bị phát hiện?', 93, N'https://th.bing.com/th/id/R.f52e31793a4d0ef42c6d47866633e001?rik=81LUIvK%2faf0dww&pid=ImgRaw&r=0', CAST(N'2023-08-09' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (28, N'Xác Ướp: Cuộc Phiêu Lưu Đến London', N'Xác Ướp: Cuộc Phiêu Lưu Đến London kể về ba xác ướp khi họ kết thúc ở London ngày nay và bắt đầu cuộc hành trình tìm kiếm chiếc nhẫn cũ của Hoàng gia, bị đánh cắp bởi nhà khảo cổ học đầy tham vọng Lord Carnaby.', 88, N'https://images.savoysystems.co.uk/SAL/172300.jpg', CAST(N'2023-08-06' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (29, N'Mèo Đi Hia: Điều Ước Cuối Cùng', N'Mèo Đi Hia: Điều Ước Cuối Cùng kể về Puss phát hiện ra rằng niềm đam mê phiêu lưu mạo hiểm của anh đã gây ra hậu quả: Anh đã đốt cháy 8 trong số 9 mạng sống của mình, bây giờ chỉ còn lại đúng một mạng. Anh ta bắt đầu một cuộc hành trình để tìm Điều ước cuối cùng thần thoại trong Rừng Đen nhằm khôi phục lại chín mạng sống của mình. ', 103, N'https://kinosvami.ru/wp-content/uploads/2022/04/zz1164.jpg', CAST(N'2023-08-16' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (30, N'Scrooge: Bài Hát Giáng Sinh', N'Scrooge: Bài Hát Giáng Sinh kể về vào một đêm Giáng sinh lạnh giá, kẻ hà tiện ích kỷ Ebenezer Scrooge chỉ còn một đêm để đối mặt với quá khứ của mình và thay đổi tương lai trước khi hết thời gian.', 100, N'https://www.hollywoodreporter.com/wp-content/uploads/2022/11/Scrooge-A-Christmas-Carol-Still-1-Netflix-Publicity-H-2022.jpg', CAST(N'2023-08-16' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (32, N'Liên Minh Siêu Thú DC', N'Liên Minh Siêu Thú DC kể về siêu cún Krypto và Superman là cặp bài trùng không thể tách rời, cùng sở hữu những siêu năng lực tương tự và cùng nhau chiến đấu chống lại tội phạm tại thành phố Metropolis. Khi Superman và những thành viên của Liên Minh Công Lý bị bắt cóc, Krypto phải thuyết phục cậu chàng Ace luộm thuộm, nàng Heo PB, Rùa Merton và Sóc Chip khai phá những sức mạnh tiềm ẩn và cùng nhau giải cứu các siêu anh hùng.', 106, N'https://image.tmdb.org/t/p/original/oRHGLlCHb9qeU8hpK07cLL7PRAm.jpg', CAST(N'2023-08-17' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (33, N'Thời Vận', N'Thời Vận theo chân cô bé tên Sam, người được xem là kém may mắn nhất trên thế giới. Tuy nhiên, mọi chuyện có cơ hội để thay đổi khi Sam lạc vào thế giới diệu kỳ nơi những loài động vật đang làm việc nhằm kiểm soát vận may và cả sự xui xẻo trên toàn thế giới.', 105, N'https://i.ytimg.com/vi/otozSH8434M/maxresdefault.jpg', CAST(N'2023-08-17' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (34, N'Tình Chị Duyên Em', N'Tình Chị Duyên Em lấy bối cảnh năm 1999, khi thế giới đang chìm trong nỗi sợ hãi Y2K - sự cố khiến hệ thống máy tính sụp đổ và dự đoán có thể làm trái đất diệt vong khi bước sang năm 2000. Ngay lúc này, hai chị em sinh đôi giống hệt nhau là “You” và “Me” cũng đang lo lắng cho tương lai của họ về việc “làm sao sống mà có thể thiếu vắng nhau”. ', 120, N'https://i.ytimg.com/vi/s7H5JV9wfdQ/maxresdefault.jpg', CAST(N'2023-08-18' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (35, N'Siêu Lừa Gặp Siêu Lầy', N'Siêu Lừa Gặp Siêu Lầy theo chân của Khoa – tên lừa đảo tầm cỡ “quốc nội” đến đảo ngọc Phú Quốc với mong muốn đổi đời. Tại đây, Khoa gặp Tú – tay lừa đảo “hàng real” và cùng Tú thực hiện các phi vụ từ nhỏ đến lớn. Cứ ngỡ sự ranh mãnh của Tú và sự may mắn trời cho của Khoa sẽ giúp họ trở thành bộ đôi bất khả chiến bại, nào ngờ lại đối mặt với nhiều tình huống dở khóc – dở cười.', 112, N'https://i.ytimg.com/vi/QKqixUIJrmo/maxresdefault.jpg', CAST(N'2023-08-18' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (36, N'Hôn Đi Hôn Đi ', N'Hôn Đi Hôn Đi kể về chàng trai trăng hoa tin mình có thể quyến rũ bất cứ người phụ nữ nào, kiên trì tán tỉnh một cô dâu tương lai ương ngạnh đã đính hôn với con trai của một chính trị gia tham vọng.', 107, N'https://dl.moviesr.net/images/wyY4L.jpg', CAST(N'2023-08-18' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (37, N'Dân Chơi III', N'Dân Chơi III kể về Dante, Elias, Jay và Silent Bob được Randal tuyển mộ sau một cơn đau tim để làm một bộ phim về cửa hàng tiện lợi đã bắt đầu tất cả.', 100, N'https://th.bing.com/th/id/R.7239e1709194e9bd16924c3d61aa9de8?rik=KLW91V2P6goRQA&pid=ImgRaw&r=0', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (38, N'Bốn Sát Thủ', N'Bốn Sát Thủ kể về bốn sát thủ về hưu bắt đầu hành động trở lại khi họ tình cờ gặp một cảnh sát ngay thẳng quyết tìm ra một tên sát nhân khó bắt.', 140, N'https://image.tmdb.org/t/p/w1280/vEB7RBUPJhEqzX9A9Lc7M238TNh.jpg', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (39, N'Cô Nàng Honor Society', N'Cô Nàng Honor Society kể về cô nàng Honor một sinh viên mới gia nhập vào trường học Harvard và có một tham vọng cực kỳ to lớn. Khi vào đây, cô quyết tâm hạ ngục ba đối thủ của mình để đạt được thành tích cao nhất của trường. Nhưng cô bắt đầu gặp trở ngại sau khi nhận ra kẻ thù lớn nhất của mình là chàng trai Michael.', 97, N'https://th.bing.com/th/id/OIP.UQFkoUXSgJNssZRZDrEYsgHaD4?pid=ImgDet&rs=1', CAST(N'2023-08-15' AS Date))
SET IDENTITY_INSERT [dbo].[Film] OFF
GO
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (1, 1)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (2, 1)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (3, 1)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (4, 1)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (5, 1)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (6, 1)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (7, 2)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (8, 2)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (9, 2)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (10, 2)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (11, 2)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (12, 2)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (13, 3)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (14, 3)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (15, 3)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (16, 3)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (17, 3)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (18, 3)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (19, 4)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (20, 4)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (21, 4)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (22, 4)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (23, 4)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (24, 4)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (25, 5)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (26, 5)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (27, 5)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (28, 5)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (29, 5)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (30, 5)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (32, 6)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (33, 6)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (34, 6)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (35, 6)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (36, 6)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (37, 6)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (38, 6)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (39, 6)
GO
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([ID], [Name], [Rows], [Cols]) VALUES (1, N'Phòng Thường 1', 10, 15)
INSERT [dbo].[Room] ([ID], [Name], [Rows], [Cols]) VALUES (2, N'Phòng Thường 2', 10, 15)
INSERT [dbo].[Room] ([ID], [Name], [Rows], [Cols]) VALUES (3, N'Phòng Thường 3', 10, 15)
INSERT [dbo].[Room] ([ID], [Name], [Rows], [Cols]) VALUES (4, N'Phòng VIP', 10, 10)
SET IDENTITY_INSERT [dbo].[Room] OFF
GO
SET IDENTITY_INSERT [dbo].[Show] ON 

INSERT [dbo].[Show] ([ID], [FilmID], [Start], [End], [TicketPrice], [RoomID]) VALUES (1, 2, CAST(N'2023-08-15T00:00:00.000' AS DateTime), CAST(N'2023-08-18T00:00:00.000' AS DateTime), 0, 4)
INSERT [dbo].[Show] ([ID], [FilmID], [Start], [End], [TicketPrice], [RoomID]) VALUES (4, 3, CAST(N'2023-08-16T00:00:00.000' AS DateTime), CAST(N'2023-08-17T00:00:00.000' AS DateTime), 0, 2)
INSERT [dbo].[Show] ([ID], [FilmID], [Start], [End], [TicketPrice], [RoomID]) VALUES (5, 1, CAST(N'2023-08-16T22:59:00.000' AS DateTime), CAST(N'2023-08-17T19:33:00.000' AS DateTime), 123, 1)
INSERT [dbo].[Show] ([ID], [FilmID], [Start], [End], [TicketPrice], [RoomID]) VALUES (6, 4, CAST(N'2023-08-15T23:38:00.000' AS DateTime), CAST(N'2023-08-16T20:12:00.000' AS DateTime), 0, 1)
SET IDENTITY_INSERT [dbo].[Show] OFF
GO
INSERT [dbo].[Ticket] ([ShowID], [UserID], [OTP], [Row], [Col], [IsUsed]) VALUES (1, 1, N'397865', 2, 3, 0)
INSERT [dbo].[Ticket] ([ShowID], [UserID], [OTP], [Row], [Col], [IsUsed]) VALUES (1, 1, N'345678', 2, 6, 1)
INSERT [dbo].[Ticket] ([ShowID], [UserID], [OTP], [Row], [Col], [IsUsed]) VALUES (1, 1, N'897653', 4, 5, 0)
INSERT [dbo].[Ticket] ([ShowID], [UserID], [OTP], [Row], [Col], [IsUsed]) VALUES (5, 5, N'916461', 1, 5, 0)
INSERT [dbo].[Ticket] ([ShowID], [UserID], [OTP], [Row], [Col], [IsUsed]) VALUES (5, 5, N'161857', 2, 6, 1)
INSERT [dbo].[Ticket] ([ShowID], [UserID], [OTP], [Row], [Col], [IsUsed]) VALUES (5, 5, N'004367', 3, 6, 0)
INSERT [dbo].[Ticket] ([ShowID], [UserID], [OTP], [Row], [Col], [IsUsed]) VALUES (6, 1, N'027593', 3, 9, 0)
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Email], [Password], [Name], [AvatarURL], [Balance], [Role]) VALUES (1, N'minh@gmail.com', N'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', N'minh@gmail.com', N'/assets/_2_d41d8cd98f00b204e9800998ecf8427e.jpg', 20000, 2)
INSERT [dbo].[User] ([ID], [Email], [Password], [Name], [AvatarURL], [Balance], [Role]) VALUES (5, N'hichic375@gmail.com', N'4e20613ec3a63732f98630b9429e1600d47a08f059496d39ffd353f0c3038f39', N'hichic375@gmail.com', N'/assets/default.jpg', 1000, 1)
INSERT [dbo].[User] ([ID], [Email], [Password], [Name], [AvatarURL], [Balance], [Role]) VALUES (6, N'lipbev@mail10p.cyou', N'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', N'lipbev@mail10p.cyou', N'/assets/default.jpg', 0, 0)
INSERT [dbo].[User] ([ID], [Email], [Password], [Name], [AvatarURL], [Balance], [Role]) VALUES (7, N'dieu1@gmail.com', N'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', N'dieu', N'/assets/_0_d41d8cd98f00b204e9800998ecf8427e.JPEG', 0, 0)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Room__737584F638944FEC]    Script Date: 8/25/2023 8:49:42 AM ******/
ALTER TABLE [dbo].[Room] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__User__A9D10534FC81ED18]    Script Date: 8/25/2023 8:49:42 AM ******/
ALTER TABLE [dbo].[User] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ticket] ADD  DEFAULT ((0)) FOR [IsUsed]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ((0)) FOR [Balance]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ((0)) FOR [Role]
GO
ALTER TABLE [dbo].[FilmCategory]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FilmCategory]  WITH CHECK ADD FOREIGN KEY([FilmID])
REFERENCES [dbo].[Film] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Show]  WITH CHECK ADD FOREIGN KEY([FilmID])
REFERENCES [dbo].[Film] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Show]  WITH CHECK ADD FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD FOREIGN KEY([ShowID])
REFERENCES [dbo].[Show] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Film]  WITH CHECK ADD CHECK  (([Length]>(0)))
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD CHECK  (([Rows]*[Cols]>(0)))
GO
ALTER TABLE [dbo].[Show]  WITH CHECK ADD CHECK  (([TicketPrice]>=(0)))
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD CHECK  (([OTP] like '[0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD CHECK  (([Role]=(2) OR [Role]=(1) OR [Role]=(0)))
GO
