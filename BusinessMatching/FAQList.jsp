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
	<link rel="stylesheet" type="text/css" href="../css/common.css" >
	<%@include file="../include/commonCss.jsp" %>
	<%@include file="../include/commonJs.jsp" %>
</head>
<body id="subSelectCheck">
	<!-- Wrapper -->
	<div id="wrapper">
		
		<% String topAndLefMenu = "0105"; %>
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
				<em>Dịch vụ kết nối kinh doanh</em> &#62; 
				<em class="on">Giải đáp thắc mắc</em>
			</div>
			<h3 class="title">Giải đáp thắc mắc</h3>
			
			<!-- Tab Menu -->
			<div class="tab">
				<ul>
					<li class="con1"><a href="#none"><img src="../images/btn/btn_tab_01_on.gif" alt="BMS" ></a></li>
					<li class="con2"><a href="#none"><img src="../images/btn/btn_tab_02_off.gif" alt="VAP" ></a></li>
				</ul>
			</div>
			<!-- //Tab Menu -->
			
			<!-- BMS -->
			<div class="faq">
					<div class="tabView1">
					<h5 class="titleTab">BMS</h5>
					<ul>
						<li>
							<strong>BMS là gì?</strong>
							<span>
							BMS là một dịch vụ kết nối kinh doanh hỗ trợ người mua ở nước ngoài đang tìm kiếm sản phẩm và đối tác kinh doanh tại Hàn Quốc.
							Dịch vụ do cơ quan chính phủ Hàn Quốc và Hiệp hội các doanh nghiệp vừa và nhỏ Hàn Quốc cung cấp. 
							</span>
						</li>
						<li>
							<strong>Làm thế nào để đăng ký dịch vụ kết nối kinh doanh BMS?</strong>
							<span>
							Click chuột vào nút “Đơn đăng ký BMS”.<br>
							Kiểm tra “Thông tin Công ty và Liên hệ" → Đăng ký “Thông tin sản phẩm được mua" → Nộp đơn
							</span>
						</li>
						<li>
							<strong>Làm thế nào để truy cập mục Phản hồi yêu cầu?</strong>
							<span>
							Phản hồi yêu cầu của bạn sẽ được gửi tới bạn trong thời gian sớm nhất
							Đơn đăng ký đã nộp và phản hồi liên quan có tại Trang của tôi  
							Phản hồi bao gồm những thông tin cơ bản về nhà cung cấp Hàn Quốc mà bạn yêu cầu, đồng thời bạn có thể liên hệ trực tiếp với họ.
							</span>
						</li>
						<li>
							<strong>Chi phí cho dịch vụ Kết nối kinh doanh BMS là bao nhiêu?</strong>
							<span>BMS (Dịch vụ kết nối kinh doanh) hoạt động dựa trên nguồn vốn do cơ quan chính phủ Hàn Quốc hỗ trợ, và hoàn toàn miễn phí</span>
						</li>
						<li>
							<strong>Làm thế nào để kết nối với các Công ty Hàn Quốc?</strong>
							<span>
							Chúng tôi sẽ tiến hành tìm kiếm các công ty đáp ứng được tối đa nhu cầu của bạn trong danh sách các công ty Hàn Quốc 
							đăng ký tại SBC đồng thời hỗ trợ các bạn trong quá trình liên hệ với họ
							</span>
						</li>
						<li>
							<strong>Ngoài ra tôi còn được hưởng dịch vụ nào nếu tới Hàn Quốc sau khi đã tìm được sản phẩm như ý muốn?</strong>
							<span>
							Khi đăng ký VAP (Chương trình hỗ trợ Khách hàng) bạn sẽ được trợ giúp trong việc sắp xếp các cuộc gặp, 
							cũng như có được thông tin về các điều luật quy định thương mại Hàn Quốc, giao thông, và việc ăn ở tại Hàn Quốc.
							Dịch vụ này hoàn toàn miễn phí, bạn có thể tìm kiếm mọi thông tin chi tiết về dịch vụ tại mục VAP trong trang web này. 
							</span>
						</li>
					</ul>
				</div>
				<div class="tabView2">
					<h5 class="titleTab">VAP</h5>
					<ul>
						<li>
							<strong>VAP là gì?</strong>
							<span>
							VAP là một chương trình hỗ trợ người mua là khách nước ngoài tới thăm Hàn Quốc được hoạt động nhờ kênh GobizKOREA.
							</span>
						</li>
						<li>
							<strong>Làm thế nào để đăng ký dịch vụ VAP?</strong>
							<span>
							Click chuột vào nút “Đơn đăng ký VAP”.<br>
							Kiểm tra “Thông tin Công ty và Liên hệ" → Đăng ký “Thông tin sản phẩm được mua" → Đăng ký “Kế hoạch tới Hàn Quốc" → Nộp đơn đăng ký
							</span>
						</li>
						<li>
							<strong>Làm thế nào để truy cập mục phản hồi truy vấn?</strong>
							<span>
							Phản hồi truy vấn sẽ được gửi tới bạn sớm nhất có thể.<br>
							Đơn đăng ký và phản hồi liên quan có tại Trang của tôi.

							</span>
						</li>
						<li>
							<strong>Chi phí cho dịch vụ Chương trình hỗ trợ khách hàng VAP là bao nhiêu?</strong>
							<span>Chương trình hỗ trợ khách hàng VAP hoạt động dựa trên nguồn vốn do cơ quan chính phủ Hàn Quốc hỗ trợ, và hoàn toàn miễn phí</span>
						</li>
					</ul>
				</div>
				<div class="buttonC">
					<span class="button btnColor1 btnSize1"><a href="#">Liên hệ</a></span>
				</div>
			</div>
			<!-- //BMS -->
			
			<script type="text/javascript">
				faq();
			</script>
			
		</div>
		<!-- //Contents -->
		
		<!-- Footer -->
		<%@include file="../include/footerMenu.jsp" %>
		<!-- //Footer -->
		
	</div>
	<!-- //Wrapper -->

</body>
</html>