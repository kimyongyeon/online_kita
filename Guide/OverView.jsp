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
		
		<% String topAndLefMenu = "0601"; %>
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
				<em class="on">Tổng quan</em>
			</div>
			<h3 class="title">Tổng quan</h3>
			
			<div class="conRadiusBox">
				<div class="top"></div>
				<div class="conRadiusBoxDetail">
					<h5 class="gold">Chào mừng quý vị đến với website GobizKOREA.</h5>
					<p class="text">
					GobizKOREA là một trang web thương mại quốc tế do Cục Quản lý Doanh nghiệp Vừa và Nhỏ (SMBA) và Hiệp hội <br>
					Doanh nghiệp Vừa và Nhỏ (SBC) của Chính phủ Hàn Quốc điều hành. Trang web này công bố thông tin về các sản phẩm<br>
					có chất lượng cao và cung cấp các dịch vụ kết nối nhà sản xuất cho các khách hàng nước ngoài khi tìm kiếm các đối tác kinh<br>
					doanh tin cậy. Chúng tôi đánh giá cao sự quan tâm và hỗ trợ của quý khách. Đồng thời, GobizKOREA cũng là một trang web<br>
					do cơ quan chính phủ điều hành để cung cấp các dịch vụ tin cậy như sau:  
					</p>
					<ul class="arrowBox">
						<li>Thông tin chi tiết về khoảng 60,000 sản phẩm Hàn Quốc.</li>
						<li>Hỗ trợ và dịch vụ cùng với nhà sản xuất để hợp tác kinh doanh thành công. </li>
						<li>Tìm kiếm đối tác kinh doanh, tổ chức cuộc họp, phiên dịch và hỗ trợ tại các cuộc họp cho khách hàng nước ngoài đến Hàn Quốc.</li>
					</ul>
					
					<div class="brownConRadiusBox">
						<h6 class="title">Các Dịch vụ Chín </h6>
						<ul>
							<li class="left">
								<h6>BMS (Dịch vụ Kết nối Kinh doanh)</h6>
								<div>
								Kháng hàng nước ngoài muốn nhập khẩu hàng<br>
								hóa của Hàn Quốc có thể đăng ký BMS. SBC sẽ tận<br>
								dụng mạng lưới doanh nghiệp vừa và nhỏ để giúp<br>
								quý khách có thể tìm ra một nhà sản xuất đáng <br>
								tin cậy đáp ứng nhu cầu của quý khách.
								</div>
							</li>
							<li>
								<h6>VAP (Chương trình Hỗ trợ Du khách)</h6>
								<div>
								VAP được thiết kế nhằm hỗ trợ khách hàng nước ngoài<br>
								đến với Hàn Quốc bằng cách tổ chức các cuộc họp<br>
								và hỗ trợ về mặt ngôn ngữ. Ngoài ra, tất cả các dịch<br>
								vụ hỗ trợ hậu cần liên quan như vận chuyển, đặt chỗ<br>
								khách sàn sẽ được cung cấp khi quy khách đến Hàn Quốc.
								</div>
							</li>
						</ul>
						<span class="text">Chúng tôi xin chân thành cảm ơn sự quan tâm của quý khách đối với GobizKOREA, và kính chúc quý công ty ngày càng thịnh vượng và thành công</span>
					</div>
					
				</div>
				<div class="bottom"></div>
			</div>			
			
						
		</div>
		<!-- //Contents -->
		
		<!-- Footer -->
		<%@include file="../include/footerMenu.jsp" %>
		<!-- //Footer -->
		
	</div>
	<!-- //Wrapper -->

</body>
</html>