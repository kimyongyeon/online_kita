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
		
		<% String topAndLefMenu = "0603"; %>
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
				<em class="on">Đến với Gobiz Korea</em>
			</div>
			<h3 class="title">Đến với Gobiz Korea</h3>
			
			
			<div class="aboutgobizkorea">
				<div>
					<h5 class="gold">Hiệp hội Doanh nghiệp Vừa và Nhỏ (SBC)</h5>
					<p>
					là một tổ chức chính phủ phi lợi nhuận được thành lập để triển khai các chính sách và chương trình của chính phủ giúp các<br>
					 doanh nghiệp vừa và nhỏ (DNVVN) của Hàn Quốc tăng trưởng và phát triển
					</p>
					<p>
					Để đạt được mục tiêu này, SBC tổ chức các chương trình tài chính và phi tài chính cho các DNVVN. Thông qua các<br>
					chương trình tài chính, SBC sẽ hỗ trợ tài chính cho các DNVVN để mở rộng hoạt động, phát triển sản phẩm mới và<br>
					chuyển đổi cấu trúc kinh doanh của họ. Đối với các chương trình phi tài chính như chương trình tư vấn, đào tạo, marketing<br>
					và các chương trình hợp tác toàn cầu, SBC hỗ trợ các DNVVN tăng cường tính cạnh trang toàn cầu 
					</p>
				</div>
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