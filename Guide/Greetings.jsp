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
		
		<% String topAndLefMenu = "0604"; %>
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
				<em>Hướng dẫn </em> &#62; 
				<em class="on">Thư ngỏ</em>
			</div>
			<h3 class="title">Thư ngỏ</h3>
			
			<div class="greeting">
				<p class="col2">
				<strong>Nền </strong>kinh tế thế giới đang trải qua các biến động nhanh chóng do quá trình phát triển công nghệ thông tin với<br>
				tốc độ ngày càng cao và quá trình toàn cầu hóa mở rộng chưa từng có. Những biến động này làm cho chúng ta phải đương đầu với<br>
				các thách thức mới trong thời kỳ siêu cạnh tranh không biên giới. 
				</p>
				<p class="col2">
				<strong>Sự </strong>mở rộng nhanh chóng của các thỏa thuận WTO đa phương<br>
				và FTAs song phương đẩy các doanh nghiệp vừa và nhỏ của Hàn Quốc (DNVVN)<br> 
				phải tăng cường cạnh tranh toàn cầu. Hơn nữa, trong một nền kinh tế tri thức, <br>
				họ phải có các chiến lược quản lý theo các nguồn lực tăng trưởng như phát triển công nghệ và cải tiến. 
				</p>
				<p class="col2">
				<strong>Kể </strong>từ khi thành lập năm 1979, Hiệp hội Doanh nghiệp Vừa và Nhỏ (SBC)
				đã và đang cung cấp nhiều loại hình dịch vụ như tài chính, tư vấn, đào tạo, marketing và các
				chương trình hợp tác quốc tế nhằm đẩy mạnh tính cạnh tranh toàn cầu của các DNVVN 
				</p>
				<p>
				<strong>Các </strong>DNVVN luôn luôn đóng vai trò trụ cột và động lực phát triển của nền kinh tế Hàn Quốc. 
				</p>
				<p>
				<strong>SBC </strong>vô cùng tự nào về thành quả đã đạt được trong ba mươi năm qua. SBC là một tổ <br>
				chức theo định hướng khách hàng, sẵn sàng giúp đỡ các DNVVN tại chỗ<br>
				để đáp ứng yêu cầu của họ. Tại SBC, chúng tôi cam kết nỗ lực hết mình<br>
				để trở thành đối tác tốt nhất cho các DNVVN tại Hàn Quốc.
				</p>
				<p class="photoceo"><img src="../images/icon/icon_ceo.gif" alt="SBC President"></p>
				<p class="sign">
					<img src="../images/icon/icon_sign.gif" alt="park, cheol-kyu"><br>
					Park, Cheol-Kyu<br>
					Chủ tịch<br>
					SBC
				</p>
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