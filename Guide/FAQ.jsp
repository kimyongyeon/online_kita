<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.HashMap,
			com.ec21.util.Utility"
%>
<%
	Utility util = Utility.getInstance();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
	<meta name="description" content="" >
	<meta name="keywords" content="" >
	<title>Gobizkorea.com Việt Nam</title>
	<%@include file="../include/commonCss.jsp" %>
	<%@include file="../include/commonJs.jsp" %>
</head>
<body id="subSelectCheck">
	<!-- Wrapper -->
	<div id="wrapper">
		
		<% String topAndLefMenu = "0602"; %>
		<% String action = ""; %>
		<!-- Head -->
  		<%@include file="../include/topMenu.jsp" %>		
		<!-- //Head -->
		<!-- LNB -->
		<%@include file="../include/leftMenu.jsp" %>	
		<!-- //LNB -->
		
		<!-- Contents -->
		<div id="contents">

			<div class="bannerIndex"><a href="#none"><img src="../images/banner/banner_index.gif" alt="Dịch vụ kết nối kinh doanh"></a></div>
			<div class="location">
				<em>Trang chủ  </em> &#62;
				<em>Hướng dẫn</em> &#62; 
				<em class="on">Câu hỏi Thường gặp</em>
			</div>
			<h3 class="title">Câu hỏi Thường gặp</h3>
			
			<!-- Tab Menu -->
			<div class="tabType2" >
				<ul id="tab01">
					<li class="frist on"><a href="#tab_1" class=" tab1">BMS</a></li>
					<li><a href="#tab_2" class="tab2">VAP</a></li>
					<li><a href="#tab_3" class="tab3">Đăng ký</a></li>
					<li><a href="#tab_4" class="tab4">Đăng nhập<br> &amp; Mật khẩu</a></li>
					<li><a href="#tab_5" class="tab5">Tài khoản<br>Thành viên</a></li>
					<li><a href="#tab_6" class="tab6">Trang<br>của tôi</a></li>
					<li><a href="#tab_7" class="tab7">Truy vấn<br>&amp; Báo giá</a></li>
					<li><a href="#tab_8" class="tab8">Tìm kiếm<br>&amp; Lưu trữ</a></li>
					<li><a href="#tab_9" class="tab9">Lừa đảo<br>&amp; Thư rác</a></li>
					<li><a href="#tab_10" class="tab10">Khác</a></li>
				</ul>
			</div>
			<!-- //Tab Menu -->
			
			<!-- BMS -->
			<div class="faq2">
					<div class="tabView1" id="tab_1">
					<h5 class="titleTab">BMS</h5>
					<ul>
						<li>
							<strong>BMS là gì?</strong>
							<span>
							BMS là một dịch vụ kết nối kinh doanh hỗ trợ những người mua hàng là người nước ngoài trong quá trình tìm kiếm sản phẩm<br>
							và đối tác kinh doanh tại Hàn Quốc. Dịch vụ do cơ quan chính phủ Hàn Quốc và Hiệp hội doanh nghiệp vừa và nhỏ Hàn Quốc cung cấp (SBC). 
							</span>
						</li>
						<li>
							<strong>Làm thế nào để đăng ký dịch vụ kết nối kinh doanh BMS?</strong>
							<span>
							Click chuột vào nút “Đơn đăng ký dịch vụ BMS”.<br>
							Kiểm tra “Thông tin Công ty và Liên hệ" → Đăng ký “Thông tin sản phẩm được mua" → Nộp đơn
							</span>
						</li>
						<li>
							<strong>Làm thế nào để truy cập mục Phản hồi Truy vấn?</strong>
							<span>
							Phản hồi truy vấn của quý khác sẽ được gửi tới quý khách sớm<br>
							Đơn đăng ký đã nộp và phản hồi liên quan có tại Trang của tôi <br>
							Phản hồi bao gồm những thông tin cơ bản về công ty cung cấp Hàn Quốc mà quý khách yêu cầu, đồng thời quý khách có thể liên hệ trực tiếp với họ. 
							</span>
						</li>
						<li>
							<strong>Chi phí cho dịch vụ Kết nối kinh doanh BMS là bao nhiêu?</strong>
							<span>BMS (Dịch vụ kết nối kinh doanh) hoạt động dựa trên nguồn vốn do cơ quan chính phủ Hàn Quốc hỗ trợ, và hoàn toàn miễn phí </span>
						</li>
						<li>
							<strong>Làm thế nào để kết nối với các Công ty Hàn Quốc? </strong>
							<span>
							Chúng tôi sẽ tiến hành tìm kiếm các công ty đáp ứng được tối đa nhu cầu của quý khách trong danh sách các công ty Hàn Quốc đăng 
							ký tại SBC đồng thời hỗ trợ các quý khách trong quá trình liên hệ với họ
							</span>
						</li>
						<li>
							<strong>Ngoài ra tôi còn được hưởng dịch vụ nào nếu tới Hàn Quốc sau khi đã tìm được sản phẩm như ý muốn?  </strong>
							<span>
							Khi đăng ký VAP (Chương trình hỗ trợ Khách hàng) quý khách sẽ được trợ giúp trong việc sắp xếp các cuộc gặp, 
							cũng như có được thông tin về các điều luật quy định thương mại Hàn Quốc, giao thông, và việc ăn ở tại Hàn Quốc. 
							Dịch vụ này hoàn toàn miễn phí, quý khách có thể tìm kiếm mọi thông tin chi tiết về dịch vụ tại mục VAP trong trang web này. 
							</span>
						</li>
					</ul>
				</div>
				<div class="tabView2" id="tab_2">
					<h5 class="titleTab">VAP</h5>
					<ul>
						<li>
							<strong>VAP là gì?</strong>
							<span>
							VAP là một chương trình hỗ trợ mà GobizKOREA áp dụng đối với người mua là khách nước ngoài tới thăm Hàn Quốc. 
							</span>
						</li>
						<li>
							<strong>Làm thế nào để đăng ký dịch vụ VAP?</strong>
							<span>
							Click chuột vào nút “Đơn đăng ký VAP”.<br>
							Kiểm tra “Thông tin Công ty và Liên hệ" → Đăng ký “Thông tin mua sản phẩm " → <br>Đăng ký “Kế hoạch tới Hàn Quốc" → Nộp đơn đăng ký
							</span>
						</li>
						<li>
							<strong>Làm thế nào để truy cập mục phản hồi truy vấn?</strong>
							<span>
							Phản hồi truy vấn sẽ được gửi tới quý khách sớm.<br>
							Đơn đăng ký và phản hồi liên quan có tại Trang của tôi.
							</span>
						</li>
						<li>
							<strong>Chi phí VAP như thế nào? </strong>
							<span>Chương trình hỗ trợ khách hàng VAP hoạt động dựa trên nguồn vốn do cơ quan chính phủ Hàn Quốc, hoàn toàn miễn phí.</span>
						</li>
					</ul>
				</div>
				<div class="tabView3" id="tab_3">
					<h5 class="titleTab">Đăng ký</h5>
					<ul>
						<li>
							<strong>Làm cách nào tôi có thể đăng ký là thành viên của kênh GobizKOREA?</strong>
							<span>
							Nếu đây là lần đầu tiên quý khách truy cập vào kênh GobizKOREA, hãy click vào [Đăng ký], đọc các điều 
							khoản thỏa thuận (TOA) và click chuột vào [Đồng ý], sau đó điền đầy đủ các thông tin vào các trường bắt buộc. (Các trường bắt buộc là các trường đánh dấu *.)
							Cuối cùng, click [Đăng ký] và quý khách sẽ nhận được email xác nhận thông qua địa chỉ mail quý khách đã cung cấp.
							 Quý khách cần phải click vào nút [Xác nhận] trong email để có ID chấp thuận quý khách là thành viên và đăng  ký. 

							</span>
						</li>
						<li>
							<strong>Phải mất bao lâu tư cách thành viên của tôi mới được chấp thuận?</strong>
							<span>
							Sau khi quý khách đăng ký thông tin tài khoản, ngay lập tức email xác nhận sẽ được gửi cho quý khách. 
							quý khách càng nhanh chóng xác nhận, tư cách thành viên của quý khách càng sớm được chấp thuận. 
							Nếu quý khách không nhận được email xác thực, vui lòng truy cập web chủ tại liên hệ
							</span>
						</li>
						<li>
							<strong>Chi phí thế nào khi tôi đăng ký là thành viên của kênh GobizKOREA và sử dụng dịch vụ của kênh này ?</strong>
							<span>
							Kênh GobizKOREA miễn phí đăng ký thành viên và sử dụng dịch vụ.
							GobizKOREA được hoạt động bởi hai tổ chức chính phủ phi lợi nhuận của Hàn Quốc là SMBA và SBC
							</span>
						</li>
						<li>
							<strong>Tại sao tôi nên đăng ký là thành viên của kênh GobizKOREA?</strong>
							<span>
							Quý khách có thể miễn phí sử dụng BMS và VAP. Đồng thời, quý khách cũng có thể truy vấn 
							các thông tin về sản phẩm và dữ liệu của bất kỳ công ty nào đã đăng ký tại kênh GobizKorea.
							</span>
						</li>
						<li>
							<strong>Tại sao trong quá trình Đăng ký, tôi vẫn gặp lỗi mà không hiểu do đâu?</strong>
							<span>
							Nếu trong quá trình Đăng ký, quý khách gặp bất kỳ khó khăn nào, vui lòng gửi mail cho chúng tôi với thông tin chi tiết tại  liên hệ. 
							Phải chắc chắn rằng quý khách đã gửi toàn bộ các thông tin chi tiết về các lỗi mà quý khách đã gặp phải và một file ảnh cửa sổ 
							đính kèm, nếu có thể, vì điều này rất cần thiết cho chúng tôi xem xét và xử lý lỗi. Khi chúng tôi sửa xong lỗi, chúng tôi sẽ liên hệ với quý khách ngay khi có thể
							</span>
						</li>
					</ul>
				</div>
				<div class="tabView4" id="tab_4">
					<h5 class="titleTab">Đăng nhập &amp; Mật khẩu</h5>
					<ul>
						<li>
							<strong>Nếu tôi không nhớ ID và/hoặc mật khẩu, tôi nên làm gì?</strong>
							<span>
							Nếu quý khách không nhớ được ID và/hoặc mật khẩu, vui lòng thực hiện các bước sau:<br>
							1. Click vào [Tìm kiếm ID/Mật khẩu] cạnh mục [Đăng nhập].<br>
							2. Nhập địa chỉ email quý khách đã cung cấp trong quá trình Đăng ký. <br>
							3. Click chuột vào [Gửi]. Hệ thống sẽ tự động gửi các thông tin về ID và Mật khẩu về địa chỉ mail của quý khách. <br>
							Nếu quý khách không nhớ địa chỉ mail, vui lòng truy cập liên hệ bằng tên của quý khách, tên công ty và/hoặc tên của Giám đốc điều hành thông qua email <br>
							tại phần liên hệ. Web chủ sẽ xác nhận<br>
							thông tin và gửi email ID và mật khẩu mặc định cho quý khách. <br>
							Quý khách nên đổi mật khẩu mặc định ngay khi đăng nhập<br>
							
							Vui lòng ghi rõ tên công ty vào mục tiêu đề như sau:<br>
							- Tiêu đề: Truy vấn ID và mật khẩu (GobizKOREA, Inc.)
							</span>
						</li>
						<li>
							<strong>Tôi có thể đổi mật khẩu bằng cách nào?</strong>
							<span>
							Quý khách có thể đổi mật khẩu theo các bước sau:<br>
							1.  Đăng nhập và truy cập [Trang của tôi]<br>
							2. Click vào [Sửa thông tin tài khoản]<br>
							3. Nhập mật khẩu mới <br>
							4. Nhập mật khẩu mới từ phần 3 trong mục [Xác nhận mật khẩu mới] <br>
							5. Click chuột vào [Đăng ký] ở phía dưới.
							</span>
						</li>
						<li>
							<strong>Tại sao trong quá trình đăng nhập, tôi vẫn gặp lỗi?</strong>
							<span>
							Khi hệ thống hiển thị tin nhắn báo lỗi trong quá trình Đăng nhập, vui lòng kiểm tra các bước sau:<br>
							(1) Nhập sai mật khẩu <br>
							Vui lòng kiểm tra phím  “In hoa“ , và đảm bảo rằng quý khách không nhập phím space giữa các ký tự trong mật khẩu của quý khách. <br>
							(2) Lỗi máy chủ nội bộ<br>
							Nếu hệ thống hiển thị  tin nhắn “Lỗi máy chủ nội bộ“ , có thể do lỗi mạng tạm thời hoặc sự cố khởi động lại máy chủ. <br>
							Hãy tắt toàn bộ trình duyệt và khởi động lại máy. Lối này cũng có thể do quý khách sử dụng các trình duyệt internet ngoài IE hoặc Netscape. <br>
							(3) Lỗi Cookie  <br>
							Nếu quý khách gặp phải lỗi cookie, vui lòng thực hiện các bước sau:<br>
							1)Đối với Internet Explorer 6.0 : Click vào [Công cụ/tùy chọn internet]; Click [Xóa Cookies] và [Xóa Tệp tin]; Click [Bảo mật] và cài đặt là [Mặc định]; Click<br>
							 [Riêng tư], cài đặt ở mức [Trung bình].<br>
							2) Đối với Internet Explorer 5.x : Click vào [Công cụ/tùy chọn internet]; Click [Bảo mật]; Click [Vùng Internet]; Cài đặt [Bảo mật] theo mức [Cao]<br>
							 hoặc [Mức tùy chọn], Cuộn về [Cookies] và click và [Kích hoạt]<br>
							cho hai tùy chọn cookie.<br>
							3) Đối với Internet Explorer 4.x : Click [Xem lại] và kiểm tra [Tùy chọn Internet]; Click [ Nâng cao]; Cuộn về [Bảo mật];<br>
							 Click [Luôn chấp nhận Cookies] trong mục [Cookies].<br>
							4) Đối với Netscape 4.x : Click [Sửa] sau đó [Ưa thích]; Click [Nâng cao]; Kiểm tra [Chấp nhận toàn bộ Cookies].<br>
							Nếu vẫn xảy ra sự cố, tìm các thư mục mà hệ thống đã cài đặt (Ví dụ Tiểu thư mục "Cookies" và “Tệp tin Internet tạm thời" của C:Windows).<br>
							 Xóa toàn bộ file có tên "Cookies“ sau đó khởi động lại máy. <br>
							(4) Quý khách không thể sử dụng Tài khoản lúc này<br>
							Tài khoản của quý khách đã bị treo hoặc không kích hoạt. Vui lòng liên hệ với chúng tôi trong phần Liên hệ để có thông tin chi tiết. <br>
							(5) Chậm mở trang <br>
							Có thể quý khách đang gặp sự cố mạng tạm thời hoặc sự cố khởi động lại máy. <br>
							Thử lại và nếu hệ thống vẫn xảy ra lỗi đó, vui lòng gửi mail cho chúng tôi và đính kèm URL mà quý khách đang cần mở. Chúng tôi sẽ xem xét sự cố ngay khi có thể. 
							</span>
						</li>
						<li>
							<strong>Tôi phải làm gì để bảo mật tài khoản của tôi?</strong>
							<span>
							Vui lòng thực hiện các bước sau để bảo mật tài khoản của quý khách trong kênh GobizKOREA:<br>
							1. Sử dụng mật khẩu mà quý khách dễ nhớ và người khác không thể đoán dễ dàng. Mật khẩu là trường hợp nhạy cảm và quý khách<br>
							nên sử dụng mật khẩu bằng cả các ký tự chữ và số (Ví dụ Seong5496)<br>
							2. Đăng nhập và đổi mật khẩu vào bất kỳ thời điểm nào mà quý khách cho rằng tài khoản của quý khách có vấn đề về bảo mật.<br>
							Thông tin chi tiết vui lòng tham khảo trong phần “Cách thức đổi mật khẩu” 
							</span>
						</li>
					</ul>
				</div>
				<div class="tabView5" id="tab_5">
					<h5 class="titleTab">Tài khoản Thành viên</h5>
					<ul>
						<li>
							<strong>Làm cách nào tôi có thể chỉnh sửa thông tin tài khoản?</strong>
							<span>
							Nếu quý khách muốn thay đổi thông tin tài khoản của mình, ví dụ như đại chỉ thư, số điện thoại, xin vui lòng thực hiện thao tác sau: <br>
							1. Đăng nhập và vào mục [MyPage] (Trang của tôi)<br>
							2. Kích [Edit Account Information] (Chỉnh sửa thông tin tài khoản)<br>
							3. Nhập thông tin mới <br>
							4. Đảm bảo rằng tất cả các thông tin mới là thông tin chính xác và kích [Register] (đăng ký) ở dưới cùng.<br>
							</span>
						</li>
						<li>
							<strong>Tôi có thể thay đổi ID thành viên của tôi không?</strong>
							<span>
							Chúng tôi lấy làm tiếc khi thông báo rằng không thể thay đổi ID của quý khách. Vì lý do bảo mật, tất cả thông tin tài khoản GobizKOREA<br>
							gắn với các ID thành viên. Tuy nhiên, quý khách có thể đăng ký thành viên mới bằng ID mới. Nếu quý khách không sử dụng ID cũ,<br>
							xin vui lòng liên hệ  với chúng tôi, và chúng tôi sẽ tạm ngừng việc sử dụng ID cũ đó. <br>
							Xin vui lòng viết "Changing the member's ID“ (Thay đổi ID của thành viên) trong khu vực chủ đề của phiếu truy vấn và thông báo <br>
							cho chúng tôi tên ID cũ và mới tại vùng văn bản.

							</span>
						</li>
						
					</ul>
				</div>
				<div class="tabView6" id="tab_6">
					<h5 class="titleTab">Trang của tôi</h5>
					<ul>
						<li>
							<strong>Tổng quan</strong>
							<span>
							[Trang của tôi] là thanh công cụ quản lý tài khoản cá nhân của các thành viên trong kênh GobizKOREA. Chức năng này liên quan đến: <br>
							1. Quản lý thông tin tài khoản (Sửa số điện thoại, địa chỉ email,….)<br>
							2. Kiểm tra các thông tin truy vấn và phản hồi<br>
							3. Thông tin ứng dụng BMS và phản hồi<br>
							4. Thông tin ứng dụng VAP và phản hồi<br>
							5. Scrapbook về các thông tin sản phẩm và/hoặc công ty mà quý khách quan tâm<br>
							6. Phân loại các vùng ưu thích của quý khách.
							</span>
						</li>
						<li>
							<strong>Sửa thông tin tài khoản</strong>
							<span>
						   “Thông tin cơ bản” bao gồm các thông tin cá nhân và thông tin công ty trong quá trình Đăng ký. Quý khách có thể sửa thông tin<br>
						    cá nhân sau khi đăng nhập và cũng có thể hủy tư cách thành viên của mình. <br>
							Sửa thông tin tài khoản trên [Trang của tôi> Sửa thông tin tài khoản] bất kỳ khi nào thông tin cá nhân và/hoặc thông tin công ty thay đổi.<br>
							Quý khách có thể sửa thông tin tài khoản sau khi đăng nhập.<br>
							Ý kiến của quý khách<br>
							Nếu quý khách chưa hài lòng với dịch vụ mà GobizKOREA cung cấp hoặc gặp bất kỳ khó khăn nào, vui lòng liên hệ với chung tôi tại mục liên hệ. <br>
							Nếu quý khách chưa hài lòng về các phản hồi và/hoặc các bước cần thực hiện mà chúng tôi đưa ra, và muốn hủy tư cách thành viên, quý khách có<br>
							thể thực hiện lệnh hủy bằng cách truy cập [Trang của tôi> Sửa thông tin tài khoản].
							</span>
						</li>
						<li>
							<strong>Lịch sử truy vấn</strong>
							<span>
							Quý khách có thể kiểm tra bất kỳ truy vấn nào quý khách đã gửi và phản hồi mà quý khách đã nhận trước đó. <br>
							Quý khách có thể trực tiếp liên hệ với các công ty dựa trên các thông tin đã cung cấp trong phản hồi.<br>
							Vùi lòng điền vào Bảng khảo sát mức độ hài lòng về phản hồi truy vấn. Nếu quý khách đánh giá mức độ hài lòng<br>
							ở mức “thấp”, BMS Global Sourcing Team sẽ gửi thông tin về BMS qua email cho quý khách để hỗ trợ quý khách<br>
							tìm kiếm sản phẩm và/hoặc thông tin mà quý khách cần tìm hiểu.<br>
							Nếu quý khách vẫn chưa hài lòng với phản hồi, vui lòng gửi email cho chúng tôi. BMS Global Sourcing Team sẽ gửi<br>
							thông tin về BMS qua email cho quý khách để hỗ trợ quý khách tìm kiếm sản phẩm và/hoặc thông tin mà quý khách cần tìm hiểu. <br>
							Vui lòng tham khảo phần [Truy vấn & Báo giá] để có thông tin chi tiết.
							</span>
						</li>
						<li>
							<strong>BMS của tôi</strong>
							<span>
							Kiểm tra danh sách các ứng dụng BMS và phản hồi
							</span>
						</li>
						<li>
							<strong>VAP của tôi</strong>
							<span>
							Kiểm tra danh sách ứng dụng VAP và phản hồi
							</span>
						</li>
						<li>
							<strong>Sản phẩm ưa thích</strong>
							<span>
							Quý khách có thể lưu các thông tin về công ty và sản phẩm quý khách quan tâm vào Scrapbook. <br>
							Nếu quý khách xem các thông tin về công ty và sản phẩm quý khách đang quan tâm trong khi xem qua<br>
							Korean Company Blogs, click vào [Sản phẩm ưa thích]. quý khách sẽ có thể truy cập các thông tin trong [Trang của tôi> Ưu thích của tôi > Sản phẩm ưu thích].
							</span>
						</li>
					</ul>
				</div>
				<div class="tabView7" id="tab_7">
					<h5 class="titleTab">Truy vấn &amp; Báo giá</h5>
					<ul>
						<li>
							<strong>Tôi có thể gửi một phiếu truy vấn bằng cách nào?</strong>
							<span>
							Điều này thật quá dễ dàng!!! Quý khách có thể gửi một phiếu truy vấn bằng thực hiện theo 3 hướng dẫn như sau :<br>
							Kích [Inquiry] (Truy vấn) ở phía bên phải của danh sách sản phẩm; hoặc vào phần blog của công ty/sản phẩm mà quý khách quan tâm<br>
							-> Kích [Inquiry] (Truy vấn) -> Điền vào [Inquiry Form] (Mẫu truy vấn) -> Kích [OK] trong Cửa sổ Truy vấn.
							</span>
						</li>
						<li>
							<strong>Tôi có thể kiểm tra phản hồi thông tin truy vấn như thế nào?</strong>
							<span>
							Quý khách có thể kiểm tra phản hồi trên [My Page>Inquiry] (Trang của tôi> Truy vấn) sau khi đăng nhập. 
							</span>
						</li>
						<li>
							<strong>Làm thế nào để tôi có thể lấy phản hồi (hồi đáp) một cách hiệu quả?</strong>
							<span>
							1. Điều quan trọng nhất! Xin vui lòng kiểm tra số điện thoại và thông tin địa chỉ chính xác.<br>
							(Quý khách có thể chỉnh sửa thông tin trên [My Page>Edit Account Information] (Trang của tôi> Hiệu chỉnh thông tin tài khoản).)<br>
							2. Bổ sung giới thiệu tóm tắt về công ty và bản thân. Không có thông tin này, truy vấn của quý khách có thể được coi là thư rác<br>
							hoặc gian lận, trong trường hợp đó quý khách sẽ không nhận được bất kỳ phản hồi nào.<br>
							3. Khi yêu cầu báo giá, xin vui lòng gửi thông tin cụ thể, ví dụ số lượng đặt hàng (Lưu ý: nếu truy vấn có quý khách quá ngắn hoặc<br>
							không đầy đủ, nó có thể bị coi là truy vấn không trung thực)
							</span>
						</li>
						<li>
							<strong>Làm thế nào tôi có thể đảm bảo rằng tôi sẽ nhận được nhiều phản hồi hơn từ Truy vấn?</strong>
							<span>
							Để đảm bảo thu được nhiều thông tin truy vấn thông qua GobizKOREA, chúng tôi khuyến cáo như sau.<br>
							Xin vui lòng cung cấp càng nhiều thông tin chi tiết càng tốt. <br>
							Thêm vào các mục cụ thể về sản phẩm và dịch vụ cũng như điều kiện mua hàng mong muốn, Điều này giúp<br>
							nhà cung cấp có một bức tranh tổng quát hơn về nhu cầu của quý khách và có nhiều cơ hội nhận phản hồi hơn.
							</span>
						</li>
						<li>
							<strong>Tôi có thể kiểm tra thông tin truy vấn trước đây được không?</strong>
							<span>							
							Tất nhiên là quý khách có thể làm được! Xin vui lòng đăng nhập vào trang web và vào mục [Trang của tôi]. Quý khách có thể kiểm<br>
							tra thông tin truy vấn và phản hồi ở mục [Inquiry History] (Lịch sử Truy vấn). <br>
							1. Đăng nhập vào GobizKOREA (www.GobizKOREA.com)<br>
							2. Vào mục [Check My Page>Inquiry History>Past Inquiries and Responses] (Kiểm tra Trang của tôi>Lịch sử Truy vấn và Phản hồi)
							</span>
						</li>
					</ul>
				</div>
				<div class="tabView8" id="tab_8">
					<h5 class="titleTab">Tìm kiếm &amp; Lưu trữ</h5>
					<ul>
						<li>
							<strong>Tôi có thể tìm nhà sản xuất bằng cách nào thông qua GobizKOREA?</strong>
							<span>
							    <b>1. Tìm kiếm Thông thường (Tìm kiếm Từ khóa)</b><br>
								Nhập từ khóa sản phẩm hoặc tên công ty trong trường tìm kiếm.<br>
								-> Kích [Find] (Tìm)<br>
								-> Kiểm tra chi tiết về sản phẩm và công ty trong danh sách kết quả tìm kiếm. <br>
								<b>2. Tìm kiếm Chi tiết </b><br>
								Quý khách có thể tìm các sản phẩm hoặc công ty theo các điều kiện tìm kiếm mà quý khách lựa chọn. <br>
								Có thể tìm thấy các sản phẩm bằng từ khóa, loại hình, ngày đăng ký.<br>
								Có thể tìm thấy các công ty bằng từ khóa, loại hình doanh nghiệp.<br>
								Lựa chọn các điều kiện tìm kiếm mà quý khách lựa chọn.<br>
								-> Kích [Find] (Tìm)<br>
								-> Kiểm tra chi tiết về sản phẩm và công ty trong danh sách kết quả tìm kiếm.<br>
								<b>3. Tìm theo Loại hình Sản phẩm </b><br>
								Lựa chọn điều kiện tìm kiếm mà quý khách lựa chọn.<br>
								GobizKOREA sử dụng UNSPSC để có các sản phẩm được phân chia thành hai loại khác nhau.
							</span>
						</li>
						<li>
							<strong>Mẹo Tìm kiếm Từ khóa</strong>
							<span>
							Xin vui lòng ghi chép các thông tin sau khi sử dụng tính năng tìm kiếm từ khóa tại GobizKOREA.<br>

							Cách sử dụng các từ khóa: <br>
							1. Sử dụng cụm từ chính xác (ví dụ: chuyển mạch tự động).<br>
							2. Nếu quý khách cảm thấy không hài lòng với kết quả tìm được, xin vui lòng thử lại bằng ít từ hơn.<br>
							3. Một từ khóa có quá nhiều chi tiết có thể không cho kết quả mong muốn (ví dụ đồng hồ số đeo tay chống nước).<br>
							4. Tìm kiếm một sản phẩm mỗi lần.
							</span>
						</li>
					</ul>
				</div>
				<div class="tabView9" id="tab_9">
					<h5 class="titleTab">Lừa đảo &amp; Thư rác</h5>
					<ul>
						<li>
							<strong>Tôi nên làm gì khi nghi ngờ mình là nạn nhân của hành vi lừa đảo hoặc thư rác?</strong>
							<span>
							   Nếu quý khách nghi ngờ rằng quý khách là nạn nhân của hành vi lừa đảo hoặc thư rác từ một thành viên  GobizKorea khác, xin vui lòng<br>
							   liên hệ với chúng tôi ngay lập tức. Đầu tiên, xin vui lòng gửi cho chúng tôi thư điện tử liên quan, nhật ký điện thoại, ID thành viên nghi ngờ<br>
							   và địa chỉ email (nếu có) tại Liên hệ. Trên cơ sở TOA, chúng tôi có thể nghi ngờ quyền thành viên bị xâm hại.<br>
							   Nếu quý khách nhận được email câu hỏi hoặc cuộc gọi, xin vui lòng liên hệ với chúng tôi ngay lập tức.
							</span>
						</li>
						<li>
							<strong>Tôi có thể làm gì để nâng cao tính bảo mật khi liên hệ với đối tác kinh doanh tiềm năng?</strong>
							<span>
							Thật không may, có rất nhiều loại hình lừa đảo tin học. Trong đó có ba loại hình quen thuộc nhất như sau: (Đây là thông tin giúp quý khách tránh hoặc ngăn ngừa thiệt hại tiềm tàng) <br>

							- Chuyển khoản Ngân hàng (Email gian lận) <br>
							Email gian lận lần đầu xảy ra tại Nigeria, nhưng nó đã lan tràn sang các quốc gia khác. Email gian lận thường xuất<br>
							hiện với tư cách một số đối tượng giàu có (một doanh nhân nổi tiếng hoặc một viên chức chính phủ). Họ thường<br>
							nói rằng khách hàng đang tìm kiếm một nơi gửi tiền an toàn của một người đã khuất, và rằng 20~30% tài sản thừa kế <br>
							của họ sẽ được thanh toán như khoản tiền hoa hồng nếu người nhận cung cấp cho họ tài khoản ngân hàng.<br>
							
							- Báo giá (Lấy Thông tin Cá nhân)<br>
							Một số đối tượng gian lận yêu cầu báo giá trong quá trình giao dịch. Yêu cầu này để rút quỹ của nạn nhân và mua mẫu sử dụng tên và danh tiếng<br>
							của quý công ty. Lưu ý rằng thông tin cá nhân bị đánh cắp có thể được sử dụng trong các hành vi gian lận khác.<br>
							
							- Gian lận Thẻ Tín dụng<br>
							Cần đặc biệt chú ý khi đối tác kinh doanh mà quý khách gặp gỡ online chỉ thực hiện thanh toán bằng séc hoặc thẻ tín dụng. Có thể có nguy cơ sử <br>
							dụng séc giả mạo hoặc thẻ tín dụng bị đánh cắp  và cuối cùng quý khách sẽ trở thành nạn nhân của vụ lừa đảo nếu quý khách chấp nhận điều kiện thanh toán đó. 
							
							Đường link liên quan: <br>
							<a href="http://www.cauce.org" target="_blank">· http://www.cauce.org</a><br>
							Một trong số các tổ chức hàng đầu chuyên về phòng chống thư rác, cụ thể là thư rác thương mại. Nó cung cấp thông tin về thư rác và các mẹo để ngăn ngừa thư rác. Quý khách nghĩ gì khi
							chung tay đóng góp vào công việc quan trọng này?<br>
							<a href="http://www.mail-abuse.com" target="_blank">· http://www.mail-abuse.com</a><br>
							Hệ thống ngăn ngừa lạm dụng thư điện tử: Một tổ chức phi chính phủ chuyên về bảo vệ máy tính khỏi đối tượng gửi thư rác. Tham khảo PBL được tổ chức công bố.<br>
							<a href="http://www.tincher.to/antispam.htm" target="_blank">· http://www.tincher.to/antispam.htm</a><br>
							Thông tin tổng hợp về thư rác điện tử.<br>
							<a href="http://www.fraud.org" target="_blank">· http://www.fraud.org</a><br>
							<a href="http://www.fincen.gov" target="_blank">· http://www.fincen.gov</a>
							</span>
						</li>
					</ul>
				</div>
				<div class="tabView10" id="tab_10">
					<h5 class="titleTab">Khác</h5>
					<ul>
						<li>
							<strong>Lỗi Cookie là gì?</strong>
							<span>
							Giống như nhiều trang web khác, lỗi thường xuất hiện ở nhiều trang web khác nhau, trình duyệt internet cần phải thương thích với cookie<br>
							và các chức năng khác trên trang web GobizKOREA để quý khách đăng nhập.<br>
							"Cookie" trong Internet thể hiện một số lượng nhỏ thông tin mà trình duyệt internet (IE, Netscape) lưu trữ để duy trì hồ sơ của người dùng<br>
							trên trang web. GobizKOREA sử dụng cookie cho phép các thành viên truy cập thông tin mà họ muốn từ trang web một cách kịp thời, giúp<br>
							giảm thiểu bất tiện của việc đăng nhập mỗi lần khi quý khách chuyển đến một phần khác của trang web.<br>
							Nếu cài đặt trình duyệt của quý khách không cho phép sử dụng cookie, điều đó có thể ảnh hưởng đến tình trạng đăng nhập của quý khách và gây lỗi cookie<br>
							khi sử dụng các dịch vụ trên trang web.
							</span>
						</li>
						<li>
							<strong>Quý khách nên làm gì khi xảy ra Lỗi Cookie?</strong>
							<span>
							Nếu quý khách đang bị lỗi cookie, xin vui lòng thực hiện các thao tác sau: <br>
							Internet Explorer 6.0 :<br>
							Kích [Tool/Internet Options] (Công cụ/Tùy chọn Internet); Kích [Delete Cookies] (Xóa Cookie) và Kích [Delete Files] (Xóa File);<br>
							Kích [Security] (Bảo mật) và cài đặt [Default] (Mặt định); Kích [Privacy] (Cá nhân), Cài đặt [Medium] (Bình thường).<br>
							Internet Explorer 5.x :<br>
							Kích [Tool/Internet Options] (Công cụ/Tùy chọn Internet); Kích [Security] (Bảo mật); Kích [Internet Zone] (Vùng Internet);<br>
							Cài đặt [Security] (Bảo mật) cấp độ [High] (Cao) hoặc [Custom Level] (cấp tùy chonj), Chuyến đến [Cookies] và kích [Enable] (kích hoạt) để cho phép hai lựa chọn cookie.<br>
							Internet Explorer 4.x :<br>
							Kích [View] (Xem xét) và kiểm tra [Internet option] (Tùy chọn internet); Kích [Advanced] (Cao cấp); Chuyển đến [Security] (Bảo mật);<br>
							Kích [Always Accept Cookies] (Luôn chấp nhận Cookie) dưới [Cookies].<br>
							Netscape 4.x :<br>
							Kích [Edit] (Sửa đổi), sau đó [Preferences] (Ưu thích); Kích [Advanced] (Cao cấp);<br>
							Kiểm tra [Accept All Cookies] (Chấp nhận tất cả cookie). Nếu có vấn đề gì xảy ra, hãy tìm thư mục vào hệ thống<br>
							đã được lắp đặt (ví dụ thư mục phụ "Cookies" và "Temporary Internet Files" (Các file internet tạm thời) của C:Windows).<br>
							Xóa tất cả file có tên "Cookies" và sau đó khởi động lại máy tính.
							</span>
						</li>
						<li>
							<strong>Trao đổi Banner với GobizKOREA </strong>
							<span>
							IChúng tôi có chính sách chỉ trao đổi banner với các công ty và tổ chức đáp ứng các tiêu chí cài đặt trước.<br>
							Các bên đủ tiêu chuẩn là các trang thị trường điện tử, chính phủ (các cơ quan chính phủ), hoặc các tổ chức <br>
							tương tự (các nhà sản xuất/ nhập khẩu/ nhà phân phối riêng không có trong danh mục trao đổi banner) <br>
							Các đối tác banner cần đăng ký hình ảnh banner và mô tả ngắn gọn về GobizKorea trên trang web của họ. Khi banner<br>
							của đối tác quá nhỏ hoặc quá lớn, có thể điều chỉnh để phù hợp giao thức. <br>
							Nếu quý khách đủ điều kiện và sẵn sàng trao đổi banner với chúng tôi, xin vui lòng liên hệ web chủ. Viết<br>
							"Banner Exchange with GobizKorea" trong dòng chủ đề, và đường dẫn URL của trang web cũng như tên tổ chức trong dòng văn bản. 
							</span>
						</li>
						
					</ul>
				</div>
				<script type="text/javascript">
					faqUse();
				</script>
				<div class="buttonC">
					<span class="button btnColor1 btnSize1"><a href="#">Liên hệ</a></span>
				</div>
			</div>
			<!-- //BMS -->
		
			
		</div>
		<!-- //Contents -->
		
		<!-- Footer -->
		<%@include file="../include/footerMenu.jsp" %>
		<!-- //Footer -->
		
	</div>
	<!-- //Wrapper -->

</body>
</html>