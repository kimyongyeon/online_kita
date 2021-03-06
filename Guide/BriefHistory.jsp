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
		
		<% String topAndLefMenu = "0605"; %>
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
				<em>BHướng dẫn</em> &#62; 
				<em class="on">Tóm tắt Lịch sử</em>
			</div>
			<h3 class="title">Tóm tắt Lịch sử</h3>
			
			<div class=" BriefHistory">
				<h6>Từ năm 2000-2009</h6>
				<ol>
					<li>
						<em>Tháng 01/2009 </em>
						<span>Ban Giám đốc của Trung tâm Cải tiến APEC SME<br> chuyển đổi Trung tâm thành SBC</span>
					</li>
					<li>
						<em>Tháng 02/2008 </em>
						<span>Thành lập "Korea Desk" <br>(Cơ quan Hỗ trợ Cộng đồng Doanh nghiệp Hàn Quốc) tại Indonesia </span>
					</li>
					<li>
						<em>Tháng 01/2007 </em>
						<span>Thành lập "Korea Desk" tại Philippines</span>
					</li>
					<li>
						<em>Tháng 09/2006 </em>
						<span>Thành lập "Novosibirsk Technology Cooperation Center“ <br>(Trung tâm Hợp tác Công nghệ Novosibirsk) tại Nga </span>
					</li>
					<li>
						<em>Tháng 03/2005 </em>
						<span>Thành lập "Qingdao SME Support Center"<br>(Trung tâm Hỗ trợ SME Thanh Đảo) tại Trung Quốc</span>
					</li>
					<li>
						<em>Tháng 11/2003 </em>
						<span>Thành lập Viện Đào tạo Gyungsan</span>
					</li>
					<li class="last">
						<em>Tháng 09/2001 </em>
						<span>Thành lập Viện Đào tạo Gwangju</span>
					</li>
				</ol>
				<h6>Từ năm 1970-1999</h6>
				<ol>
					<li>
						<em>Tháng 12/1999 </em>
						<span>Thành lập Trung tâm Mua sắm Công nghiệp Vừa và Nhỏ</span>
					</li>
					<li>
						<em>Tháng 4/1996 </em>
						<span>Thành lập Trung tâm Công nghệ Sản xuất Tiên tiến (CAMTECH) </span>
					</li>
					<li>
						<em>Tháng 12/1995 </em>
						<span>Thành lập Trung tâm Phân phối Công nghiệp Vừa và Nhỏ </span>
					</li>
					<li>
						<em>Tháng 07/1995 </em>
						<span>Thành lập Trung tâm Phân phối Công nghiệp Vừa và Nhỏ</span>
					</li>
					<li>
						<em>Tháng 10/1982 </em>
						<span>Thành lập Viện Đào tạo Doanh nghiệp Vừa và Nhỏ (SBTI)</span>
					</li>
					<li class="last">
						<em>Tháng 01/1979 </em>
						<span>Thành lập SBC</span>
					</li>
				</ol>
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