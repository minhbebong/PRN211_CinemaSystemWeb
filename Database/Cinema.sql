USE [CinemaSystem]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 8/16/2023 9:57:12 AM ******/
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
/****** Object:  Table [dbo].[Film]    Script Date: 8/16/2023 9:57:12 AM ******/
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
/****** Object:  Table [dbo].[FilmCategory]    Script Date: 8/16/2023 9:57:12 AM ******/
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
/****** Object:  Table [dbo].[Room]    Script Date: 8/16/2023 9:57:12 AM ******/
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
/****** Object:  Table [dbo].[Show]    Script Date: 8/16/2023 9:57:12 AM ******/
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
/****** Object:  Table [dbo].[Ticket]    Script Date: 8/16/2023 9:57:12 AM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 8/16/2023 9:57:12 AM ******/
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

INSERT [dbo].[Category] ([ID], [Name], [Desc]) VALUES (1, N'Action', N'Là thể loại có nội dung hành động, đánh đấm hoặc sử dụng nhiều loại vũ khí và nhiều băng nhóm giang hồ đối địch với nhau. Truyện thường mang đến cảm giác mạnh cho người đọc, có thể là những cảnh đánh nhau tất tay, máu me và không dành cho những người yếu tim hoặc tâm lý yếu.')
INSERT [dbo].[Category] ([ID], [Name], [Desc]) VALUES (2, N'Comedy', N'Là thể loại chứa đựng nhiều tình tiết hài hước, dễ khiến độc giả bật cười, tuy nhiên, thể loại này không chỉ dừng lại ở đó, đan xen giữa những yếu tố gây cười là những bài học về cuộc sống không thể bỏ qua.')
INSERT [dbo].[Category] ([ID], [Name], [Desc]) VALUES (3, N'Mystery', N'Là thể loại luôn khiến cho người xem có cảm giác thích thú tò mò, đôi khi phải “xoắn não” để phân tích những tình tiết trong phim. Các chủ đề quen thuộc trong anime thuộc thể loại này thường là án mạng, những tội ác, các sự kiện trong quá khứ, kí ức hay hành động của con người,… Với cách xây dựng cốt truyện ly kì, thể loại Mystery luôn khiến người xem phải chăm trú, tập trung vào từng cảnh phim, đôi khi phải ngẫm nghĩ, suy luận về những vấn đề trong phim.')
INSERT [dbo].[Category] ([ID], [Name], [Desc]) VALUES (4, N'Romance', N'Là những câu chuyện về tình yêu. Ớ đây chúng ta sẽ lấy ví dụ như tình yêu giữa một người con trai và con gái, bên cạnh đó đặc điểm thể loại này là kích thích trí tưởng tượng của bạn về tình yêu. Đây cũng là thể loại mà nói dễ hiểu là "lãng mạng, mơ mộng, bay bổng".')
INSERT [dbo].[Category] ([ID], [Name], [Desc]) VALUES (5, N'Fiction', N'Là từ chỉ mọi loại tác phẩm, mà trong một phần hay xuyên suốt toàn bộ, chúng nói về các thông tin và sự kiện không có thật. Những tác phẩm này là do hư cấu nên hay dựa trên các giả thuyết — nói cách khác, chúng là sản phẩm của trí tưởng tượng của tác giả.')
INSERT [dbo].[Category] ([ID], [Name], [Desc]) VALUES (6, N'Isekai', N'là một tiểu thể loại light novel, manga, anime và video game kỳ ảo (fantasy) của Nhật Bản, xoay quanh một người bình thường được đưa đến hoặc bị mắc kẹt trong một vũ trụ song song. Isekai bao gồm hay không chỉ có thể loại xuyên không hay chuyển sinh (sinh ra ở một thế giới khác).')
INSERT [dbo].[Category] ([ID], [Name], [Desc]) VALUES (7, N'Harem', N'Harem là một thể loại của anime và manga, trong đó tập trung vào nhân vật chính, thường là tình yêu, gắn kết với 2 hoặc nhiều hơn nhân vật khác giới hoặc cùng giới[1] Dạng phổ biến nhất của harem là một nhân vật nam chính và một nhóm nhân vật nữ[2] Một số biến thể gần đây của harem cho phép cả mối quan hệ thân mật giữa nhiều nhân vật cùng giới là yuri harem và yaoi harem.')
INSERT [dbo].[Category] ([ID], [Name], [Desc]) VALUES (8, N'Fantasy', N'Fantasy thường xuất hiện các yếu tố chỉ có trong tưởng tượng như phép thuật, thần chú, các nàng tiên, phù thủy, quái vật, quỷ vương, rồng, các vị thần, hiệp sĩ, anh hùng,... Đúng như ý nghĩa của nó, thể loại fantasy tạo nên một thế giới khiến chúng ta tha hồ thỏa mãn trí tưởng tượng, đó là lí do tại sao fantasy được coi là một trong những thể loại được yêu thích nhất trên toàn thế giới.')
INSERT [dbo].[Category] ([ID], [Name], [Desc]) VALUES (9, N'Psychological thriller', N'Là một thể loại mà yếu tố căng thẳng thường xuyên được các nhà làm phim khai thác để cuốn người xem vào bí ẩn cuối cùng.')
INSERT [dbo].[Category] ([ID], [Name], [Desc]) VALUES (10, N'Action', N'Là thể loại có nội dung hành động, đánh đấm hoặc sử dụng nhiều loại vũ khí và nhiều băng nhóm giang hồ đối địch với nhau. Truyện thường mang đến cảm giác mạnh cho người đọc, có thể là những cảnh đánh nhau tất tay, máu me và không dành cho những người yếu tim hoặc tâm lý yếu.')
INSERT [dbo].[Category] ([ID], [Name], [Desc]) VALUES (11, N'Comedy', N'Là thể loại chứa đựng nhiều tình tiết hài hước, dễ khiến độc giả bật cười, tuy nhiên, thể loại này không chỉ dừng lại ở đó, đan xen giữa những yếu tố gây cười là những bài học về cuộc sống không thể bỏ qua.')
INSERT [dbo].[Category] ([ID], [Name], [Desc]) VALUES (12, N'Mystery', N'Là thể loại luôn khiến cho người xem có cảm giác thích thú tò mò, đôi khi phải “xoắn não” để phân tích những tình tiết trong phim. Các chủ đề quen thuộc trong anime thuộc thể loại này thường là án mạng, những tội ác, các sự kiện trong quá khứ, kí ức hay hành động của con người,… Với cách xây dựng cốt truyện ly kì, thể loại Mystery luôn khiến người xem phải chăm trú, tập trung vào từng cảnh phim, đôi khi phải ngẫm nghĩ, suy luận về những vấn đề trong phim.')
INSERT [dbo].[Category] ([ID], [Name], [Desc]) VALUES (13, N'Romance', N'Là những câu chuyện về tình yêu. Ớ đây chúng ta sẽ lấy ví dụ như tình yêu giữa một người con trai và con gái, bên cạnh đó đặc điểm thể loại này là kích thích trí tưởng tượng của bạn về tình yêu. Đây cũng là thể loại mà nói dễ hiểu là "lãng mạng, mơ mộng, bay bổng".')
INSERT [dbo].[Category] ([ID], [Name], [Desc]) VALUES (14, N'Fiction', N'Là từ chỉ mọi loại tác phẩm, mà trong một phần hay xuyên suốt toàn bộ, chúng nói về các thông tin và sự kiện không có thật. Những tác phẩm này là do hư cấu nên hay dựa trên các giả thuyết — nói cách khác, chúng là sản phẩm của trí tưởng tượng của tác giả.')
INSERT [dbo].[Category] ([ID], [Name], [Desc]) VALUES (15, N'Isekai', N'là một tiểu thể loại light novel, manga, anime và video game kỳ ảo (fantasy) của Nhật Bản, xoay quanh một người bình thường được đưa đến hoặc bị mắc kẹt trong một vũ trụ song song. Isekai bao gồm hay không chỉ có thể loại xuyên không hay chuyển sinh (sinh ra ở một thế giới khác).')
INSERT [dbo].[Category] ([ID], [Name], [Desc]) VALUES (16, N'Harem', N'Harem là một thể loại của anime và manga, trong đó tập trung vào nhân vật chính, thường là tình yêu, gắn kết với 2 hoặc nhiều hơn nhân vật khác giới hoặc cùng giới[1] Dạng phổ biến nhất của harem là một nhân vật nam chính và một nhóm nhân vật nữ[2] Một số biến thể gần đây của harem cho phép cả mối quan hệ thân mật giữa nhiều nhân vật cùng giới là yuri harem và yaoi harem.')
INSERT [dbo].[Category] ([ID], [Name], [Desc]) VALUES (17, N'Fantasy', N'Fantasy thường xuất hiện các yếu tố chỉ có trong tưởng tượng như phép thuật, thần chú, các nàng tiên, phù thủy, quái vật, quỷ vương, rồng, các vị thần, hiệp sĩ, anh hùng,... Đúng như ý nghĩa của nó, thể loại fantasy tạo nên một thế giới khiến chúng ta tha hồ thỏa mãn trí tưởng tượng, đó là lí do tại sao fantasy được coi là một trong những thể loại được yêu thích nhất trên toàn thế giới.')
INSERT [dbo].[Category] ([ID], [Name], [Desc]) VALUES (18, N'Psychological thriller', N'Là một thể loại mà yếu tố căng thẳng thường xuyên được các nhà làm phim khai thác để cuốn người xem vào bí ẩn cuối cùng.')
INSERT [dbo].[Category] ([ID], [Name], [Desc]) VALUES (19, N'Action', N'Là thể loại có nội dung hành động, đánh đấm hoặc sử dụng nhiều loại vũ khí và nhiều băng nhóm giang hồ đối địch với nhau. Truyện thường mang đến cảm giác mạnh cho người đọc, có thể là những cảnh đánh nhau tất tay, máu me và không dành cho những người yếu tim hoặc tâm lý yếu.')
INSERT [dbo].[Category] ([ID], [Name], [Desc]) VALUES (20, N'Comedy', N'Là thể loại chứa đựng nhiều tình tiết hài hước, dễ khiến độc giả bật cười, tuy nhiên, thể loại này không chỉ dừng lại ở đó, đan xen giữa những yếu tố gây cười là những bài học về cuộc sống không thể bỏ qua.')
INSERT [dbo].[Category] ([ID], [Name], [Desc]) VALUES (21, N'Mystery', N'Là thể loại luôn khiến cho người xem có cảm giác thích thú tò mò, đôi khi phải “xoắn não” để phân tích những tình tiết trong phim. Các chủ đề quen thuộc trong anime thuộc thể loại này thường là án mạng, những tội ác, các sự kiện trong quá khứ, kí ức hay hành động của con người,… Với cách xây dựng cốt truyện ly kì, thể loại Mystery luôn khiến người xem phải chăm trú, tập trung vào từng cảnh phim, đôi khi phải ngẫm nghĩ, suy luận về những vấn đề trong phim.')
INSERT [dbo].[Category] ([ID], [Name], [Desc]) VALUES (22, N'Romance', N'Là những câu chuyện về tình yêu. Ớ đây chúng ta sẽ lấy ví dụ như tình yêu giữa một người con trai và con gái, bên cạnh đó đặc điểm thể loại này là kích thích trí tưởng tượng của bạn về tình yêu. Đây cũng là thể loại mà nói dễ hiểu là "lãng mạng, mơ mộng, bay bổng".')
INSERT [dbo].[Category] ([ID], [Name], [Desc]) VALUES (23, N'Fiction', N'Là từ chỉ mọi loại tác phẩm, mà trong một phần hay xuyên suốt toàn bộ, chúng nói về các thông tin và sự kiện không có thật. Những tác phẩm này là do hư cấu nên hay dựa trên các giả thuyết — nói cách khác, chúng là sản phẩm của trí tưởng tượng của tác giả.')
INSERT [dbo].[Category] ([ID], [Name], [Desc]) VALUES (24, N'Isekai', N'là một tiểu thể loại light novel, manga, anime và video game kỳ ảo (fantasy) của Nhật Bản, xoay quanh một người bình thường được đưa đến hoặc bị mắc kẹt trong một vũ trụ song song. Isekai bao gồm hay không chỉ có thể loại xuyên không hay chuyển sinh (sinh ra ở một thế giới khác).')
INSERT [dbo].[Category] ([ID], [Name], [Desc]) VALUES (25, N'Harem', N'Harem là một thể loại của anime và manga, trong đó tập trung vào nhân vật chính, thường là tình yêu, gắn kết với 2 hoặc nhiều hơn nhân vật khác giới hoặc cùng giới[1] Dạng phổ biến nhất của harem là một nhân vật nam chính và một nhóm nhân vật nữ[2] Một số biến thể gần đây của harem cho phép cả mối quan hệ thân mật giữa nhiều nhân vật cùng giới là yuri harem và yaoi harem.')
INSERT [dbo].[Category] ([ID], [Name], [Desc]) VALUES (26, N'Fantasy', N'Fantasy thường xuất hiện các yếu tố chỉ có trong tưởng tượng như phép thuật, thần chú, các nàng tiên, phù thủy, quái vật, quỷ vương, rồng, các vị thần, hiệp sĩ, anh hùng,... Đúng như ý nghĩa của nó, thể loại fantasy tạo nên một thế giới khiến chúng ta tha hồ thỏa mãn trí tưởng tượng, đó là lí do tại sao fantasy được coi là một trong những thể loại được yêu thích nhất trên toàn thế giới.')
INSERT [dbo].[Category] ([ID], [Name], [Desc]) VALUES (27, N'Psychological thriller', N'Là một thể loại mà yếu tố căng thẳng thường xuyên được các nhà làm phim khai thác để cuốn người xem vào bí ẩn cuối cùng.')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Film] ON 

INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (1, N'SPY x FAMILY', N'Đặc vụ "Twilight" của Westalis được cử trà trộn vào nước địch để thám sát kẻ thù đang có âm mưu phá hoại nền hòa bình đông tây. Vì tính chất của nhiệm vụ, bậc thầy cải trang Twilight bắt buộc phải lập gia đình và có con thì mới có thể tiếp cận được mục tiêu. Với một kẻ chưa từng có người thân và luôn làm việc một mình, Twilight sớm tìm thấy mình mắc kẹt trong chuyện gia đình dở khóc dở cười.', 80, N'https://res.cloudinary.com/quang2002/image/upload/spy-x-family_phgcz5', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (2, N'Suy Luận Hư Cấu', N'Kotoko Iwanaga là một cô gái đã được "Yêu ma" tôn làm thần trí tuệ để đứng ra giải quyết những vẫn đề chúng gặp phải mỗi ngày. Cô dính tiếng sét ái tình với  Kuro Sakuragawa, người bị chúng "Yêu ma" khiếp sợ. Tổ hợp hai người khác thường từ đó ngày ngày giải quyết các sự vụ của "Yêu quái" tạo nêu những câu chuyện "Tình yêu x Truyền thuyết x Bí ẩn"! Liệu hai người họ sẽ gặp những chuyện gì, tình yêu của họ sẽ tới được đâu?', 90, N'https://res.cloudinary.com/quang2002/image/upload/in_spectre_smjhfm', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (3, N'Lúc đó tôi đã chuyển sinh thành Slime OAD', N'Satoru Mikami vốn đang có cuộc sống bình lặng thì bị một gã côn đồ đâm chết trên phố. Anh kết thúc cuộc đời ở tuổi 37. Bỗng nhiên khi lấy lại ý thức, anh không thể nghe, cũng không thể nhìn thấy gì. Anh phát hiện ra mình đã chuyển sinh thành một con Slime. Anh bắt đầu tận hưởng cuộc đời mới của mình, tuy cũng chưa hài lòng lắm vì mình thuộc giống quái vật cấp thấp nhất. Tuy nhiên, cuộc chạm trán với một con quái vật cấp thảm họa, "Bạo Phong Long Veldora", đã khiến cuộc đời chú Slime bé nhỏ thay đổi hoàn toàn. Veldora đặt cho anh một cái tên mới là Rimuru. Và kể từ đây, Rimuru bắt đầu cuộc hành trình khám phá thế giới mới, bị cuốn vào trận chiến giữa tộc Yêu tinh và tộc Nha Lang, gặp gỡ thêm nhiều bạn bè và chạm trán với nhiều kẻ thù hùng mạnh. Huyền thoại về chú Slime mạnh nhất sắp sửa được mở ra.', 80, N'https://res.cloudinary.com/quang2002/image/upload/72e24c93e7b0c336fa188eb1201565e1_vu42zf', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (4, N'Shikimori-san của tôi không chỉ dễ thương', N'Izumi là một nam sinh trung học bị xui xẻo bẩm sinh. Bạn gái của cậu là một cô bạn cùng lớp tên là Shikimori. Shikimori rất xinh đẹp, dễ thương và tràn đầy tình yêu, tuy nhiên mỗi khi Izumi gặp rắc rối, cô lại trở thành người bạn gái ngầu nhất trên đời! Cuộc sống thường ngày dễ thương và đầy những pha kỳ thú của Shikimori, Izumi và những người bạn sẽ bắt đầu tại đây.', 80, N'https://i.ytimg.com/vi/jjd_anr5KwU/maxresdefault.jpg', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (5, N'Đại ma vương mạnh nhất lịch sử chuyển sinh thành dân làng A', N'Varvatos là Ma Vương mạnh nhất lịch sử đã được lưu danh trong thần thoại. Quá chán nản với kiếp làm vua dài đằng đẵng bởi sức mạnh đã khiến mà trở nên cô độc, cậu đã chuyển sinh thành một dân làng tên Ard Meteor ở 1000 năm sau. Tuy nhiên, tương lai lại là nơi mà nền văn minh ma pháp đã suy tàn. Ma pháp cũng đã suy yếu đi nhiều. Ard và người bạn thơ ấu Ireena đã nhập học tại học viện ma pháp. Dù cậu có muốn không tỏ ra là người đặc biệt, nhưng sức mạnh của cậu lại quá đỗi khác thường. Những lời khiêu chiến, những lời đồn đại cứ vậy mà tới không ngừng. Thế rồi, Ma Tộc từng một thời thống trị thế giới đã bắt đầu có hành động mờ ám... Liệu cựu Ma Vương có thể mang lại hòa bình và sống một cuộc đời bình dị chăng?', 80, N'https://cdn.myanimelist.net/s/common/uploaded_files/1615037475-de748543fba24f4553c983172690afce.jpeg', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (6, N'Chào mừng đến với lớp học đề cao thực lực', N'Truyện kể về trường cao trung Koudo Ikusei, một ngôi trường danh tiếng với cơ sở vật chất cực kì hiện đại, nơi 100% học sinh sẽ đỗ đại học hoặc tìm được việc làm. Học sinh nơi đây có thể hưởng mọi quyền lợi và tự do cá nhân. Việc chi tiêu trong trường được thanh toán bằng điểm tích lũy. Nhưng sự thật thì các quyền lợi này chỉ dành cho những học sinh cao cấp. Nhân vật chính là Ayanokoji Kiyotaka – thành viên của lớp D, là nơi các học sinh "yếu kém" bị đào thải, không ai coi trọng. Ayanokoji sẽ làm gì để tồn tại trong ngôi trường này?', 80, N'https://preview.redd.it/s2frn7kz9ou31.jpg?width=640&crop=smart&auto=webp&s=40d98be1411e93d49ca528fe54d61424b4c062dc', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (7, N'Mob Psycho 100', N'Shigeo "MOB" Kageyama là một học sinh trung học năm hai bình thường, muốn sống một đời bình dị.Tuy là một người dễ dàng mất hút trong đám đông, nhưng cậu lại có siêu năng lực bẩm sinh mạnh mẽ hơn người.Mob chỉ muốn có một tuổi thanh xuân yên bình nên đã luôn cố gắng kìm nén, nhưng bao trận chiến lại tới khiến cảm xúc của cậu bùng nổ.Những ngày thanh xuân trở nên thật hỗn loạn, tương lai nào sẽ đón đợi Mob?', 80, N'https://i-amp.ex-cdn.com/mgn.vn/files/news/2021/10/23/mob-psycho-100-mua-3-duoc-an-dinh-voi-vi-tri-dao-dien-moi-031418.jpg', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (8, N'Cạo râu xong, tôi nhặt gái về nhà', N'Yoshida là một nhân viên văn phòng 26 tuổi, vừa bị crush suốt 5 năm trời từ chối. Trên đường mượn rượu giải sầu về, anh nhìn thấy một nữ sinh trung học đang ngồi bên xó đường. <br> - "Sao em lại ngồi đây?". <br> - "Nè... Em cho anh xơi đó. <br> Cho em ở nhà anh được không?"', 80, N'https://otakukart.com/wp-content/uploads/2021/04/featured.png', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (9, N'Cuộc Phiêu Lưu Kỳ Bí của JoJo', N'Năm 2001 tại thành phố Naples của Ý, Giorno Giovanna - con trai của DIO, nhưng là hậu duệ của Jonathan Joestar, có ước mơ trở thành Gangstar để loại bỏ những kẻ buôn ma túy cho trẻ em từ nội bộ bên trong.', 80, N'https://wallpaperaccess.com/full/2671779.jpg', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (10, N'Re:Zero - Bắt đầu lại từ con số 0 tại thế giới khác', N'Câu chuyện kể về Natsuki Subaru, một chàng trai tuổi teen đã bỏ học làm NEET bỗng nhiên được triệu hồi đến một thế giới khác. Tại đây, cậu được ban cho sức mạnh ""Trở về từ cái chết"". Mỗi lần chết đi, cậu sẽ quay trở lại một mốc thời gian xác định nào đó. Điều đặc biệt là cậu không được phép tiết lộ với bất cứ ai về sức mạnh này.Trong một thế giới tàn khốc, nơi tính mạng của những người quan trọng với mình liên tục bị đe dọa, một mình gánh trên vai một trọng trách lớn lao, Natsuki Subaru bắt đầu cuộc hành trình của mình.', 80, N'https://cdn.akamai.steamstatic.com/steam/apps/1277510/capsule_616x353.jpg?t=1611984622', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (11, N'SPY x FAMILY', N'Đặc vụ "Twilight" của Westalis được cử trà trộn vào nước địch để thám sát kẻ thù đang có âm mưu phá hoại nền hòa bình đông tây. Vì tính chất của nhiệm vụ, bậc thầy cải trang Twilight bắt buộc phải lập gia đình và có con thì mới có thể tiếp cận được mục tiêu. Với một kẻ chưa từng có người thân và luôn làm việc một mình, Twilight sớm tìm thấy mình mắc kẹt trong chuyện gia đình dở khóc dở cười.', 80, N'https://res.cloudinary.com/quang2002/image/upload/spy-x-family_phgcz5', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (12, N'Suy Luận Hư Cấu', N'Kotoko Iwanaga là một cô gái đã được "Yêu ma" tôn làm thần trí tuệ để đứng ra giải quyết những vẫn đề chúng gặp phải mỗi ngày. Cô dính tiếng sét ái tình với  Kuro Sakuragawa, người bị chúng "Yêu ma" khiếp sợ. Tổ hợp hai người khác thường từ đó ngày ngày giải quyết các sự vụ của "Yêu quái" tạo nêu những câu chuyện "Tình yêu x Truyền thuyết x Bí ẩn"! Liệu hai người họ sẽ gặp những chuyện gì, tình yêu của họ sẽ tới được đâu?', 80, N'https://res.cloudinary.com/quang2002/image/upload/in_spectre_smjhfm', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (13, N'Lúc đó tôi đã chuyển sinh thành Slime OAD', N'Satoru Mikami vốn đang có cuộc sống bình lặng thì bị một gã côn đồ đâm chết trên phố. Anh kết thúc cuộc đời ở tuổi 37. Bỗng nhiên khi lấy lại ý thức, anh không thể nghe, cũng không thể nhìn thấy gì. Anh phát hiện ra mình đã chuyển sinh thành một con Slime. Anh bắt đầu tận hưởng cuộc đời mới của mình, tuy cũng chưa hài lòng lắm vì mình thuộc giống quái vật cấp thấp nhất. Tuy nhiên, cuộc chạm trán với một con quái vật cấp thảm họa, "Bạo Phong Long Veldora", đã khiến cuộc đời chú Slime bé nhỏ thay đổi hoàn toàn. Veldora đặt cho anh một cái tên mới là Rimuru. Và kể từ đây, Rimuru bắt đầu cuộc hành trình khám phá thế giới mới, bị cuốn vào trận chiến giữa tộc Yêu tinh và tộc Nha Lang, gặp gỡ thêm nhiều bạn bè và chạm trán với nhiều kẻ thù hùng mạnh. Huyền thoại về chú Slime mạnh nhất sắp sửa được mở ra.', 80, N'https://res.cloudinary.com/quang2002/image/upload/72e24c93e7b0c336fa188eb1201565e1_vu42zf', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (14, N'Shikimori-san của tôi không chỉ dễ thương', N'Izumi là một nam sinh trung học bị xui xẻo bẩm sinh. Bạn gái của cậu là một cô bạn cùng lớp tên là Shikimori. Shikimori rất xinh đẹp, dễ thương và tràn đầy tình yêu, tuy nhiên mỗi khi Izumi gặp rắc rối, cô lại trở thành người bạn gái ngầu nhất trên đời! Cuộc sống thường ngày dễ thương và đầy những pha kỳ thú của Shikimori, Izumi và những người bạn sẽ bắt đầu tại đây.', 80, N'https://i.ytimg.com/vi/jjd_anr5KwU/maxresdefault.jpg', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (15, N'Đại ma vương mạnh nhất lịch sử chuyển sinh thành dân làng A', N'Varvatos là Ma Vương mạnh nhất lịch sử đã được lưu danh trong thần thoại. Quá chán nản với kiếp làm vua dài đằng đẵng bởi sức mạnh đã khiến mà trở nên cô độc, cậu đã chuyển sinh thành một dân làng tên Ard Meteor ở 1000 năm sau. Tuy nhiên, tương lai lại là nơi mà nền văn minh ma pháp đã suy tàn. Ma pháp cũng đã suy yếu đi nhiều. Ard và người bạn thơ ấu Ireena đã nhập học tại học viện ma pháp. Dù cậu có muốn không tỏ ra là người đặc biệt, nhưng sức mạnh của cậu lại quá đỗi khác thường. Những lời khiêu chiến, những lời đồn đại cứ vậy mà tới không ngừng. Thế rồi, Ma Tộc từng một thời thống trị thế giới đã bắt đầu có hành động mờ ám... Liệu cựu Ma Vương có thể mang lại hòa bình và sống một cuộc đời bình dị chăng?', 80, N'https://cdn.myanimelist.net/s/common/uploaded_files/1615037475-de748543fba24f4553c983172690afce.jpeg', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (16, N'Chào mừng đến với lớp học đề cao thực lực', N'Truyện kể về trường cao trung Koudo Ikusei, một ngôi trường danh tiếng với cơ sở vật chất cực kì hiện đại, nơi 100% học sinh sẽ đỗ đại học hoặc tìm được việc làm. Học sinh nơi đây có thể hưởng mọi quyền lợi và tự do cá nhân. Việc chi tiêu trong trường được thanh toán bằng điểm tích lũy. Nhưng sự thật thì các quyền lợi này chỉ dành cho những học sinh cao cấp. Nhân vật chính là Ayanokoji Kiyotaka – thành viên của lớp D, là nơi các học sinh "yếu kém" bị đào thải, không ai coi trọng. Ayanokoji sẽ làm gì để tồn tại trong ngôi trường này?', 80, N'https://preview.redd.it/s2frn7kz9ou31.jpg?width=640&crop=smart&auto=webp&s=40d98be1411e93d49ca528fe54d61424b4c062dc', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (17, N'Mob Psycho 100', N'Shigeo "MOB" Kageyama là một học sinh trung học năm hai bình thường, muốn sống một đời bình dị.Tuy là một người dễ dàng mất hút trong đám đông, nhưng cậu lại có siêu năng lực bẩm sinh mạnh mẽ hơn người.Mob chỉ muốn có một tuổi thanh xuân yên bình nên đã luôn cố gắng kìm nén, nhưng bao trận chiến lại tới khiến cảm xúc của cậu bùng nổ.Những ngày thanh xuân trở nên thật hỗn loạn, tương lai nào sẽ đón đợi Mob?', 80, N'https://i-amp.ex-cdn.com/mgn.vn/files/news/2021/10/23/mob-psycho-100-mua-3-duoc-an-dinh-voi-vi-tri-dao-dien-moi-031418.jpg', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (18, N'Cạo râu xong, tôi nhặt gái về nhà', N'Yoshida là một nhân viên văn phòng 26 tuổi, vừa bị crush suốt 5 năm trời từ chối. Trên đường mượn rượu giải sầu về, anh nhìn thấy một nữ sinh trung học đang ngồi bên xó đường. <br> - "Sao em lại ngồi đây?". <br> - "Nè... Em cho anh xơi đó. <br> Cho em ở nhà anh được không?"', 80, N'https://otakukart.com/wp-content/uploads/2021/04/featured.png', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (19, N'Cuộc Phiêu Lưu Kỳ Bí của JoJo', N'Năm 2001 tại thành phố Naples của Ý, Giorno Giovanna - con trai của DIO, nhưng là hậu duệ của Jonathan Joestar, có ước mơ trở thành Gangstar để loại bỏ những kẻ buôn ma túy cho trẻ em từ nội bộ bên trong.', 80, N'https://wallpaperaccess.com/full/2671779.jpg', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (20, N'Re:Zero - Bắt đầu lại từ con số 0 tại thế giới khác', N'Câu chuyện kể về Natsuki Subaru, một chàng trai tuổi teen đã bỏ học làm NEET bỗng nhiên được triệu hồi đến một thế giới khác. Tại đây, cậu được ban cho sức mạnh ""Trở về từ cái chết"". Mỗi lần chết đi, cậu sẽ quay trở lại một mốc thời gian xác định nào đó. Điều đặc biệt là cậu không được phép tiết lộ với bất cứ ai về sức mạnh này.Trong một thế giới tàn khốc, nơi tính mạng của những người quan trọng với mình liên tục bị đe dọa, một mình gánh trên vai một trọng trách lớn lao, Natsuki Subaru bắt đầu cuộc hành trình của mình.', 80, N'https://cdn.akamai.steamstatic.com/steam/apps/1277510/capsule_616x353.jpg?t=1611984622', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (21, N'SPY x FAMILY', N'Đặc vụ "Twilight" của Westalis được cử trà trộn vào nước địch để thám sát kẻ thù đang có âm mưu phá hoại nền hòa bình đông tây. Vì tính chất của nhiệm vụ, bậc thầy cải trang Twilight bắt buộc phải lập gia đình và có con thì mới có thể tiếp cận được mục tiêu. Với một kẻ chưa từng có người thân và luôn làm việc một mình, Twilight sớm tìm thấy mình mắc kẹt trong chuyện gia đình dở khóc dở cười.', 80, N'https://res.cloudinary.com/quang2002/image/upload/spy-x-family_phgcz5', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (22, N'Suy Luận Hư Cấu', N'Kotoko Iwanaga là một cô gái đã được "Yêu ma" tôn làm thần trí tuệ để đứng ra giải quyết những vẫn đề chúng gặp phải mỗi ngày. Cô dính tiếng sét ái tình với  Kuro Sakuragawa, người bị chúng "Yêu ma" khiếp sợ. Tổ hợp hai người khác thường từ đó ngày ngày giải quyết các sự vụ của "Yêu quái" tạo nêu những câu chuyện "Tình yêu x Truyền thuyết x Bí ẩn"! Liệu hai người họ sẽ gặp những chuyện gì, tình yêu của họ sẽ tới được đâu?', 80, N'https://res.cloudinary.com/quang2002/image/upload/in_spectre_smjhfm', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (23, N'Lúc đó tôi đã chuyển sinh thành Slime OAD', N'Satoru Mikami vốn đang có cuộc sống bình lặng thì bị một gã côn đồ đâm chết trên phố. Anh kết thúc cuộc đời ở tuổi 37. Bỗng nhiên khi lấy lại ý thức, anh không thể nghe, cũng không thể nhìn thấy gì. Anh phát hiện ra mình đã chuyển sinh thành một con Slime. Anh bắt đầu tận hưởng cuộc đời mới của mình, tuy cũng chưa hài lòng lắm vì mình thuộc giống quái vật cấp thấp nhất. Tuy nhiên, cuộc chạm trán với một con quái vật cấp thảm họa, "Bạo Phong Long Veldora", đã khiến cuộc đời chú Slime bé nhỏ thay đổi hoàn toàn. Veldora đặt cho anh một cái tên mới là Rimuru. Và kể từ đây, Rimuru bắt đầu cuộc hành trình khám phá thế giới mới, bị cuốn vào trận chiến giữa tộc Yêu tinh và tộc Nha Lang, gặp gỡ thêm nhiều bạn bè và chạm trán với nhiều kẻ thù hùng mạnh. Huyền thoại về chú Slime mạnh nhất sắp sửa được mở ra.', 80, N'https://res.cloudinary.com/quang2002/image/upload/72e24c93e7b0c336fa188eb1201565e1_vu42zf', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (24, N'Shikimori-san của tôi không chỉ dễ thương', N'Izumi là một nam sinh trung học bị xui xẻo bẩm sinh. Bạn gái của cậu là một cô bạn cùng lớp tên là Shikimori. Shikimori rất xinh đẹp, dễ thương và tràn đầy tình yêu, tuy nhiên mỗi khi Izumi gặp rắc rối, cô lại trở thành người bạn gái ngầu nhất trên đời! Cuộc sống thường ngày dễ thương và đầy những pha kỳ thú của Shikimori, Izumi và những người bạn sẽ bắt đầu tại đây.', 80, N'https://i.ytimg.com/vi/jjd_anr5KwU/maxresdefault.jpg', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (25, N'Đại ma vương mạnh nhất lịch sử chuyển sinh thành dân làng A', N'Varvatos là Ma Vương mạnh nhất lịch sử đã được lưu danh trong thần thoại. Quá chán nản với kiếp làm vua dài đằng đẵng bởi sức mạnh đã khiến mà trở nên cô độc, cậu đã chuyển sinh thành một dân làng tên Ard Meteor ở 1000 năm sau. Tuy nhiên, tương lai lại là nơi mà nền văn minh ma pháp đã suy tàn. Ma pháp cũng đã suy yếu đi nhiều. Ard và người bạn thơ ấu Ireena đã nhập học tại học viện ma pháp. Dù cậu có muốn không tỏ ra là người đặc biệt, nhưng sức mạnh của cậu lại quá đỗi khác thường. Những lời khiêu chiến, những lời đồn đại cứ vậy mà tới không ngừng. Thế rồi, Ma Tộc từng một thời thống trị thế giới đã bắt đầu có hành động mờ ám... Liệu cựu Ma Vương có thể mang lại hòa bình và sống một cuộc đời bình dị chăng?', 1234, N'https://cdn.myanimelist.net/s/common/uploaded_files/1615037475-de748543fba24f4553c983172690afce.jpeg', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (26, N'Chào mừng đến với lớp học đề cao thực lực', N'Truyện kể về trường cao trung Koudo Ikusei, một ngôi trường danh tiếng với cơ sở vật chất cực kì hiện đại, nơi 100% học sinh sẽ đỗ đại học hoặc tìm được việc làm. Học sinh nơi đây có thể hưởng mọi quyền lợi và tự do cá nhân. Việc chi tiêu trong trường được thanh toán bằng điểm tích lũy. Nhưng sự thật thì các quyền lợi này chỉ dành cho những học sinh cao cấp. Nhân vật chính là Ayanokoji Kiyotaka – thành viên của lớp D, là nơi các học sinh "yếu kém" bị đào thải, không ai coi trọng. Ayanokoji sẽ làm gì để tồn tại trong ngôi trường này?', 1234, N'https://preview.redd.it/s2frn7kz9ou31.jpg?width=640&crop=smart&auto=webp&s=40d98be1411e93d49ca528fe54d61424b4c062dc', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (27, N'Mob Psycho 100', N'Shigeo "MOB" Kageyama là một học sinh trung học năm hai bình thường, muốn sống một đời bình dị.Tuy là một người dễ dàng mất hút trong đám đông, nhưng cậu lại có siêu năng lực bẩm sinh mạnh mẽ hơn người.Mob chỉ muốn có một tuổi thanh xuân yên bình nên đã luôn cố gắng kìm nén, nhưng bao trận chiến lại tới khiến cảm xúc của cậu bùng nổ.Những ngày thanh xuân trở nên thật hỗn loạn, tương lai nào sẽ đón đợi Mob?', 1234, N'https://i-amp.ex-cdn.com/mgn.vn/files/news/2021/10/23/mob-psycho-100-mua-3-duoc-an-dinh-voi-vi-tri-dao-dien-moi-031418.jpg', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (28, N'Cạo râu xong, tôi nhặt gái về nhà', N'Yoshida là một nhân viên văn phòng 26 tuổi, vừa bị crush suốt 5 năm trời từ chối. Trên đường mượn rượu giải sầu về, anh nhìn thấy một nữ sinh trung học đang ngồi bên xó đường. <br> - "Sao em lại ngồi đây?". <br> - "Nè... Em cho anh xơi đó. <br> Cho em ở nhà anh được không?"', 1234, N'https://otakukart.com/wp-content/uploads/2021/04/featured.png', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (29, N'Cuộc Phiêu Lưu Kỳ Bí của JoJo', N'Năm 2001 tại thành phố Naples của Ý, Giorno Giovanna - con trai của DIO, nhưng là hậu duệ của Jonathan Joestar, có ước mơ trở thành Gangstar để loại bỏ những kẻ buôn ma túy cho trẻ em từ nội bộ bên trong.', 1234, N'https://wallpaperaccess.com/full/2671779.jpg', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[Film] ([ID], [Name], [Desc], [Length], [ImageURL], [ReleaseDate]) VALUES (30, N'Re:Zero - Bắt đầu lại từ con số 0 tại thế giới khác', N'Câu chuyện kể về Natsuki Subaru, một chàng trai tuổi teen đã bỏ học làm NEET bỗng nhiên được triệu hồi đến một thế giới khác. Tại đây, cậu được ban cho sức mạnh ""Trở về từ cái chết"". Mỗi lần chết đi, cậu sẽ quay trở lại một mốc thời gian xác định nào đó. Điều đặc biệt là cậu không được phép tiết lộ với bất cứ ai về sức mạnh này.Trong một thế giới tàn khốc, nơi tính mạng của những người quan trọng với mình liên tục bị đe dọa, một mình gánh trên vai một trọng trách lớn lao, Natsuki Subaru bắt đầu cuộc hành trình của mình.', 1234, N'https://cdn.akamai.steamstatic.com/steam/apps/1277510/capsule_616x353.jpg?t=1611984622', CAST(N'2023-08-15' AS Date))
SET IDENTITY_INSERT [dbo].[Film] OFF
GO
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (1, 1)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (1, 2)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (2, 3)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (2, 4)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (2, 5)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (3, 1)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (3, 6)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (3, 7)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (3, 8)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (4, 2)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (4, 4)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (5, 6)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (5, 8)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (6, 9)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (7, 1)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (7, 2)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (7, 5)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (8, 2)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (8, 4)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (9, 1)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (9, 5)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (9, 8)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (10, 6)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (10, 7)
INSERT [dbo].[FilmCategory] ([FilmID], [CategoryID]) VALUES (10, 8)
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
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Room__737584F69370F2FF]    Script Date: 8/16/2023 9:57:13 AM ******/
ALTER TABLE [dbo].[Room] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__User__A9D10534D51BD97A]    Script Date: 8/16/2023 9:57:13 AM ******/
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
