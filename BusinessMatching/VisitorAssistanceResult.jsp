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
		
		<% String topAndLefMenu = "0103"; %>
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
				<em>Dịch vụ kết nối kinh do</em> &#62; 
				<em class="on">Chương trình hỗ trợ khách hàng VAP</em>
			</div>
			<h3 class="title">Đơn đăng ký VAP  </h3>
			<!-- Tab BMS APP -->
			<div class="tabBMSapp">
				<ul>
					<li><img src="../images/icon/icon_vap_01_off.gif" alt="Company Details"></li>
					<li><img src="../images/icon/icon_vap_02_off.gif" alt="roduct Detail"></li>
					<li><img src="../images/icon/icon_vap_03_off.gif" alt="Travel Information"></li>
					<li><img src="../images/icon/icon_vap_04_on.gif" alt="Application Completed"></li>
				</ul>
			</div>
			<!-- //Tab BMS APP -->
						
			<!-- Step3 -->
			<div class="lastStep">
				<p>
				Bạn đã đăng ký thành công. 
				<span>Đội ngũ nhân lực trên toàn cầu của chúng tôi sẽ tiến hành kiểm tra mọi thông tin trên và liên lạc với bạn sớm nhất có thể.</span>
				</p>
				</div>
				<div class="buttonC2">
					<span class="button btnColor1 btnSize1"><a href="#">Kiểm tra đơn đăng ký VAP</a></span>
					<span class="button btnColor3 btnSize1"><a href="#">Tới Trang chủ</a></span>
				</div>
			<!-- //Step3 -->
			
		</div>
		<!-- //Contents -->
		
		<!-- Footer -->
		<%@include file="../include/footerMenu.jsp" %>
		<!-- //Footer -->
		
	</div>
	<!-- //Wrapper -->

</body>
</html>