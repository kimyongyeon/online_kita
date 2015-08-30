<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.ec21.util.Utility"
%><%
Utility util = Utility.getInstance();
%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<meta name="description" content="" >
<meta name="keywords" content="" >
<title>Gobizkorea.com Việt Nam</title>
<%@include file="../include/commonCss.jsp" %>
<%@include file="../include/commonJs.jsp" %>
<script type="text/javascript">
$(document).ready(function(){

});
</script>
</head>
<body>
	<% String topAndLefMenu = "0301"; %>
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Head -->
		<% String action = "About.jsp"; %>
		<%@include file="../include/topMenu.jsp" %>
		<!-- //Head -->
		<!-- LNB -->
		<%@include file="../include/leftMenu.jsp" %>
		<!-- //LNB -->
		<!-- Contents -->
		<div id="contents">
			<div class="bannerIndex"><a href="#none"><img src="../images/banner/banner_index.gif" alt="Dịch vụ kết nối kinh doanh"></a></div>
			<div class="location">
				<em>Trang chủ</em> &#62;
				<em>Họp Trực tuyến</em> &#62;
				<em class="on">Thông tin về Họp Trực tuyến</em>
			</div>
			<h3 class="title">Thông tin về Họp Trực tuyến</h3>

			<div class="conRadiusBox">
				<div class="top"></div>
					<div class="conRadiusBoxDetail">


					<h5 class="gold">
						Tiện ích Họp Trực tuyến Thương mại Điện tử (eTrade Video Meeting) là gì?<br>
						<span>Tiện ích Họp Trực tuyến Thương mại điện tử là cuộc họp trực tuyến trực tiếp giữa người mua, người phiên dịch và các nhà cung cấp Hàn Quốc đủ năng lực.</span>
					</h5>
					<div class="aboutVideo">
						<em>Buyer</em>
						<strong>Interpreter</strong>
						<span>Korean<br>Supplier</span>
						<ul>
							<li>100% Free Korean Government Supports</li>
							<li>Auido + Vido + Text + Document</li>
							<li>Real Time 1:1,1:N</li>
						</ul>
						<ol>
							<li>Kích chuột  </li>
							<li>Kết nối </li>
							<li>Họp</li>
							<li>Giao tiếp</li>
						</ol>
					</div>

					<div class="listBoxVideo">
						<h5 class="gold type3">Lý do Họp Trực tuyến?</h5>
						<ul class="arrowList ">
							<li>Tiện ích Họp Trực tuyến Thương mại điện tử sẽ cho phép quý khách kết nối với bất kỳ ai, tại bất kỳ nơi nào trong thời gian thực.</li>
							<li>Giúp tiết kiệm thời gian và tiền bạc trong việc đi lại làm ăn.</li>
							<li>Dễ dàng họp bàn kinh doanh với các khách hàng ở xa. </li>
							<li>Hạn chế thư từ và gọi điện. </li>
							<li>Giúp các cuộc họp bàn kinh doanh hiệu quả và thành công hơn.</li>
						</ul>
						<h5 class="gold type3">Lý do Họp Trực tuyến?</h5>
						<ul class="arrowList">
							<li>Các chuyên gia thương mại dày dặn kinh nghiệm sẽ hỗ trợ các cuộc họp của quý khách cùng với phiên dịch Anh-Việt giữa quý </li>
							<li>khách và công ty Hàn Quốc để kinh doanh thành công.</li>
							<li>Cung cấp miễn phí giải pháp họp trực tuyến cụ thể.</li>
						</ul>
						<h5 class="gold type3">Lý do Họp Trực tuyến?</h5>
						<ul class="arrowList ">
							<li>Trên cơ sở hồ sơ của quý khách, GobizKorea sẽ hẹn gặp đối tác Hàn Quốc mà quý khách chỉ định.</li>
						</ul>
					</div>

					<div class="aboutVideoIMG">
						<span class="text1">Buyer</span>
						<ul class="text1">
							<li>Register your information</li>
							<li>Select your<br>Categories/items</li>
							<li>Open your schedules</li>
						</ul>
						<span class="text2">Supplier</span>
						<ul class="text2">
							<li>Select potential buyers</li>
							<li>Make appointments<br>with the buyers</li>
							<li>Open your schedules</li>
						</ul>
						<span class="text3">eTrade Video Meeting</span>
						<em class="text1">Interpreter</em>
						<em class="text2">Matchinge</em>
						<em class="text3">Buyer</em>
						<em class="text4">Supplier</em>
					</div>

					<div class="listBoxVideo">
						<h5 class="gold type3">Để tham gia Họp Trực tuyến Thương mại Điện tử cần có những thiết bị gì?</h5>
						<ul class="arrowList ">
							<li>Máy tính cá nhân</li>
							<li>Webcam</li>
							<li>Tai nghe </li>
						</ul>
					</div>

					<div class="subText">Cách thức nộp đơn?</div>
					<div class="buttonC3">
						<span class="button btnSize4 btnColor4"><a href="#none">NỘP ĐƠN</a></span>
					</div>

					<div class="aboutContactList">
						<ul>
							<li>
								<img src="../images/icon/icon_SBC.gif" alt=" SBC">
								<span>SBC KOREA : +82-2-3667-3883</span>
								<em>E-mail : <a href="mailto:trade02@gobizkorea.com">trade02@gobizkorea.com</a></em>
							</li>
						</ul>
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