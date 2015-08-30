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
<body>
	<!-- Wrapper -->
	<div id="wrapper">
		
		<% String topAndLefMenu = "0101"; %>
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
				<em>Trang chủ</em> &#62;
				<em>Dịch vụ kết nối kinh doanh</em> &#62; 
				<em class="on">Dịch vụ kết nối GoBizKorea</em>
			</div>
			<h3 class="title">Dịch vụ kết nối GoBizKorea</h3>
			

			<!-- Marching Service -->
			<div class="conRadiusBox">
				<div class="top"></div>
					<div class="conRadiusBoxDetail">
						<h5 class="gold">
							Dịch vụ kết nối kinh doanh (BMS)<br/>
							<span>Ứng dụng BMS được thiết kế nhằm hỗ trợ khách hàng trên toàn cầu tìm kiếm sản phẩm và các đối tác kinh doanh phù hợp tại Hàn Quốc</span>
						</h5>
						<ul class="arrowBox">
							<li>Nguồn nhân lực trên toàn cầu của chúng tôi có nhiệm vụ luôn sẵn sàng hỗ trợ khách hàng tìm kiếm các Doanh nghiệp vừa và nhỏ (SMEs)<br>
							 của Hàn Quốc đáng tin cậy và được tuyển lựa từ trước trong vòng 7 ngày!</li>
							<li>Website GoBizKorea.com cung cấp cơ sở dữ liệu về các công ty chế tạo và nhà cung cấp lớn nhất Hàn Quốc có nhu cầu trở <br>
							thành đối tác của các khách hàng trên toàn cầu </li>
							<li>Ứng dụng BMS hoạt động bởi các Hiệp hội các Công ty vừa và nhỏ, cơ quan Chính phủ Hàn Quốc nhằm phát triển<br> các Doanh nghiệp vừa và nhỏ tại Hàn Quốc</li>
						</ul>
						
						<div class="matchingIMG">
							<img src="../images/tmp/bizMatching01.jpg" alt="bizMatching01">
							<span class="fristImg07">Apply</span>
							<span class="fristImg01">Search & Pre-screen</span>
							<span class="fristImg02" >Check Intent</span>
							<span class="fristImg03">Confirm</span>
							<span class="fristImg04">Provide <br>meeting<br>schedules</span>
							<span class="fristImg05">GobizKOREA SMEs Database</span>
							<span class="fristImg06">Global Sourcing<br>Professionals</span>
							<span class="fristImg08">GobizKOREA<br>SMFs</span>
							<span class="fristImg09">Global Buyer</span>
						</div>
						<div class="buttonC">
							<span class="button btnColor1 btnSize1"><a href="#">ĐĂNG KÝ NGAY</a></span>
						</div>
						
						<h5 class="gold type1">Chương trình hỗ trợ khách hàng</h5>
						<ul class="arrowBox">
							<li> Bên cạnh dịch vụ kết nối kinh doanh BMS, nguồn nhân lực có tay nghề trên toàn cầu còn có khả năng sẵn sàng đồng <br>
							hành cùng khách hàng trong các cuộc hội thảo kinh doanh với các Doanh nghiệp vừa và nhỏ tại Hàn Quốc!</li>
							<li>Sắp xếp các cuộc hội thảo kinh doanh với các Doanh nghiệp vừa và nhỏ tại Hàn Quốc </li>
							<li>Dịch vụ đưa đón và phiên dịch tiếng Hàn – Tiếng Anh. </li>
							<li>Cung cấp các thông tin hữu ích như việc đi lại, ăn ở, ban giám đốc các Công ty Hàn Quốc, v.v… </li>
						</ul>
						<div class="matchingIMG">
							<img src="../images/tmp/bizMatching02.jpg" alt="bizMatching02">							
							<span class="secondImg01">Global Sourcing<br>Professionals</span>
							<span class="secondImg02">Apply</span>
							<span class="secondImg03">Check Intent</span>
							<span class="secondImg04">Confirm</span>
							<span class="secondImg05">Provide<br>meeting<br>schedules</span>
							<span class="secondImg06">Arrange meeting</span>
							<span class="secondImg07">GobizKOREA<br>SMFs</span>
							<span class="secondImg07">GobizKOREA<br>SMFs</span>
							<span class="secondImg08">Global Buyer</span>
						</div>
						<div class="buttonC">
							<span class="button btnColor1 btnSize1"><a href="#">ĐĂNG KÝ NGAY</a></span>
						</div>
						
						<!-- MemberList -->
						<h5 class="red type1">Đội ngũ hỗ trợ khách hàng bao gồm những ai ?<br><span>Nguồn nhân lực trên toàn cầu</span></h5>
						<ul class="membersBox">
							<li class="list">
								<h6>
									Gemma SEO<a href="mailto:ysseo@gobizkorea.com">ysseo@gobizkorea.com</a><br>
									<span>12 năm kinh nghiệp về xuất nhập khẩu</span>
								</h6>
								<div class="memberInfo">
									<p><img src="../images/member/member_01.gif" alt="Gemma SEO"></p>
									<ul>
										<li>
											<strong>Chuyên ngành</strong>
											IT, Điện tử, Viển thông: 8 năm <br>
											Hóa học: 4 năm 
										</li>
										<li>
											<strong>Thị trường chính</strong>
											Đức, Pháp, Trung Quốc, Đài Loan, Nga, Ấn Độ 
										</li>
										<li>
											<strong>Tham dự triển lãm  </strong>
											IFA Berlin, CEBIT Hannover, CES, SVYAZ-EXPOCOMM,
											 Triển lãm thiết bị điện tử Hồng Kông 
										</li>
									</ul>
								</div>
								<div class="MemberBottom"></div>
							</li>
							<li class="list right">
								<h6>
									Eric Lee<a href="mailto:eric@gobizkorea.com">eric@gobizkorea.com</a><br>
									<span>13 năm kinh nghiệp về xuất nhập khẩu</span>
								</h6>
								<div class="memberInfo">
									<p><img src="../images/member/member_02.gif" alt="Eric Lee"></p>
									<ul>
										<li>
											<strong>Chuyên ngành</strong>
											IT, Điện tử, Viễn thông : 8 năm<br>
											Hóa học : 4 năm
										</li>
										<li>
											<strong>Thị trường chính</strong>
											Đức, Pháp, Trung Quốc, Đài Loan, Nga, Ấn Độ 
										</li>
										<li>
											<strong>Tham dự triển lãm </strong>
											IFA Berlin, CEBIT Hannover, CES, SVYAZ-EXPOCOMM,<br>
											Triển lãm Thiết bị điện tử Hồng Kông 
										</li>
									</ul>
								</div>
								<div class="MemberBottom"></div>
							</li>
							<li class="list">
								<h6>
									YD Kim<a href="mailto:sfinger@gobizkorea.com">sfinger@gobizkorea.com</a><br>
									<span>14 năm kinh nghiệm về xuất nhập khẩu</span>
								</h6>
								<div class="memberInfo">
									<p><img src="../images/member/member_04.gif" alt="YD Kim"></p>
									<ul>
										<li>
											<strong>Chuyên ngành</strong>
											IT, Điện tử: 7 năm <br>
											An ninh bảo mật : 3 năm<br>
											Sản phẩm tiêu dùng : 4 năm
										</li>
										<li>
											<strong>Thị trường chính</strong>
											Châu Âu, Nga, Mỹ, Các nước Trung Đông
										</li>
										<li>
											<strong>Tham dự triển lãm</strong>
											CEBIT, CES, IFA, TRIỂN LÃM THIẾT BỊ ĐIỆN TỬ<br>
											 HỒNG KÔNG, SECUTECH, IFSEC, GITEX 
										</li>
									</ul>
								</div>
								<div class="MemberBottom"></div>
							</li>
							<li class="list right">
								<h6>
									Julia Bang<a href="mailto:julia_bang@gobizkorea.com"> julia_bang@gobizkorea.com</a><br>
									<span>4 năm kinh nghiệm về xuất nhập khẩu</span>
								</h6>
								<div class="memberInfo">
									<p><img src="../images/member/member_05.gif" alt="Julia Bang"></p>
									<ul>
										<li>
											<strong>Chuyên ngành</strong>
											Điện tử : 2 năm<br>
											Sản phẩm tiêu dùng : 2 năm
										</li>
										<li>
											<strong>Thị trường chính </strong>
											Châu Âu, Nam Mỹ 
										</li>
										<li>
											<strong>Tham dự triển lãm </strong>
											Triển lãm Công nghệ - Inno, KIMES,<br>
											Triển lãm Nữ trang Quốc tế Trung Quốc (Qingdao) 
										</li>
									</ul>
								</div>
								<div class="MemberBottom"></div>
							</li>
							<li class="list">
								<h6>
									Derek Kim<a href="mailto:derek@gobizkorea.com">derek@gobizkorea.com</a><br>
									<span>8 năm kinh nghiệm về xuất nhập khẩu</span>
								</h6>
								<div class="memberInfo">
									<p><img src="../images/member/member_06.gif" alt="Derek Kim"></p>
									<ul>
										<li>
											<strong>Chuyên ngành</strong>
											Sản phẩm xuất bản và in ấn : 3 năm <br>
											Sản phẩm từ năng lượng mới/năng lượng tái tạo : 4 năm<br>
											Lĩnh vực bán dẫn : 2 năm 
										</li>
										<li>
											<strong>Thị trường chính</strong>
											Trung Quốc, Malaysia, Phi-lip-pin, Anh,  Hà Lan, Pháp
										</li>
										<li>
											<strong>Tham dự triển lãm</strong>
											Thế giới giấy 2005, Năng lượng mặt trời 2007,<br>
											Triển lãm Semicon 2010 
										</li>
									</ul>
								</div>
								<div class="MemberBottom"></div>
							</li>
							<li class="list right">
								<h6>
									Tracy Choi<a href="mailto:tracy0312@gobizkorea.com">tracy0312@gobizkorea.com </a><br>
									<span>4 năm kinh nghiệm về xuất nhập khẩu</span>
								</h6>
								<div class="memberInfo">
									<p><img src="../images/member/member_07.gif" alt="Tracy Choi"></p>
									<ul>
										<li>
											<strong>Chuyên ngành  </strong>
											Máy móc : 2 năm<br>
											Sản phẩm tiêu dùng : 2 năm
										</li>
										<li>
											<strong>Thị trường chính </strong>
											Mỹ, Châu Âu, Đông Nam Á và Trung Đông 
										</li>
										<li>
											<strong>Tham dự triển lãm</strong>
											WQA Aquatech tại Las Vegas, Korean League<br>
											tại Munkyng, Triển lãm quy trình xử lý và thiết bị Nhà Máy Hóa Chất Korea 
										</li>
									</ul>
								</div>
								<div class="MemberBottom"></div>
							</li>
							<li class="list last">
								<h6>
									ST Kim<a href="mailto:smatsuda@gobizkorea.com">smatsuda@gobizkorea.com</a><br>
									<span>9 năm kinh nghiệm về xuất nhập khẩu</span>
								</h6>
								<div class="memberInfo">
									<p><img src="../images/member/member_08.gif" alt="ST Kim"></p>
									<ul>
										<li>
											<strong>Chuyên ngành  </strong>
											Linh kiện ô tô : 6 năm<br>
											LED, Da, Hóa học : 3 năm
										</li>
										<li>
											<strong>Thị trường chính </strong>
											Mỹ, Châu Âu, Nhật Bản, Trung Quốc
										</li>
										<li>
											<strong>Tham dự triển lãm</strong>
											CEBIT, CES, TRIỂN LÃM VỀ DA – HỒNG KÔNG,<br>
											TRIỂN LÃM KINTEX LED, TRIỂN LÃM MÔ-TÔ QUỐC TẾ FRANKFURT
										</li>
									</ul>
								</div>
								<div class="MemberBottom"></div>
							</li>
							<li class="list right last">
								<h6>
									Young Park <a href="mailto:skach@gobizkorea.com ">skach@gobizkorea.com </a><br>
									<span>14 năm kinh nghiệm về xuất nhập khẩu</span>
								</h6>
								<div class="memberInfo">
									<p><img src="../images/member/member_03.gif" alt="Gemma Seo"></p>
									<ul>
										<li>
											<strong>Chuyên ngành</strong>
											Máy móc : 5 năm<br>
											IT, Điện tử : 6 năm<br>
											Ô tô: 3 năm 
										</li>
										<li>
											<strong>Thị trường chính </strong>
											Châu Âu, Châu Á, Bắc + Nam Mỹ, Châu Phi, toàn cầu
										</li>
									</ul>
								</div>
								<div class="MemberBottom"></div>
							</li>
							
							
						</ul>
						<!-- //MemberList -->
									
					</div>
				<div class="bottom"></div>
			</div>
			<!-- //Marching Service -->
			
			
			
			
			
		</div>
		<!-- //Contents -->
		
		<!-- Footer -->
		<%@include file="../include/footerMenu.jsp" %>
		<!-- //Footer -->
		
	</div>
	<!-- //Wrapper -->

</body>
</html>