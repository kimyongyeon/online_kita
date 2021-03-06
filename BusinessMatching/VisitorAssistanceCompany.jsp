<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.HashMap,
			com.ec21.BusinessMatching.BusinessMatchingAction,
			com.ec21.common.Dao,
			com.ec21.util.Utility"
%>
<%
	Utility util = Utility.getInstance();

	// 회원정보
	String userid = ""; // userid가 존재할경우 쿠키정보에서 넣어준다.
	String gbn = ""; // 구분 기업,개인,해외고객,일반기업
	gbn = "2";
	HashMap<String, String> dataMap = new HashMap<String, String>();
	BusinessMatchingAction bma = new BusinessMatchingAction();
	
	//dataMap.put("userid", userid);
	//dataMap.put("gbn", gbn);
	//Dao bmaDAO = bma.selectMpMem(dataMap); // 회원정보 가져온다.
	
	// bztpDAO : business Type
	dataMap = new HashMap<String, String>();
	dataMap.put("cat_cd", "BZTP");
	Dao bztpList = bma.selectBZTPorBMJT(dataMap); 
	// bmjtDAO : jot title
	dataMap = new HashMap<String, String>();
	dataMap.put("cat_cd", "BMJT");
	Dao bmjtList = bma.selectBZTPorBMJT(dataMap); 
	// countryDAO : country
	Dao countryList = bma.selectCountry();
	
	
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
	
<script type="text/javascript">
		
	function pageNext()
	{
		if(formCheck())
			formSubmit('dataForm');
	}
	
	function formCheck()
	{
		if ( document.dataForm.company_name.value.trim().length == 0 ) {
			alert('Please fill in all the mandatory fields(*)');
			document.dataForm.company_name.focus();
			return false;
		} else if ( document.dataForm.country.selectedIndex <= 0  ) {
			alert('Please fill in all the mandatory fields(*)');
			document.dataForm.country.focus();
			return false;
		} else if ( document.getElementById("country").value.trim()=="" ) {
			alert('Please fill in all the mandatory fields(*)');
			document.dataForm.country.focus();
			return false;
		} else if ( document.dataForm.business_type.selectedIndex <= 0  ) {
			alert('Please fill in all the mandatory fields(*)');
			document.dataForm.business_type.focus();
			return false;
		} else if ( document.dataForm.address.value.trim().length == 0 ) {
			alert('Please fill in all the mandatory fields(*)');
			document.dataForm.address.focus();
			return false;
		} else if ( document.dataForm.president_name.value.trim().length == 0 ) {
			alert('Please fill in all the mandatory fields(*)');
			document.dataForm.president_name.focus();
			return false;
		} else if ( document.dataForm.contact_name.value.trim().length == 0 ) {
			alert('Please fill in all the mandatory fields(*)');
			document.dataForm.contact_name.focus();
			return false;
		} else if ( document.dataForm.phone.value.trim().length == 0 ) {
			alert('Please fill in all the mandatory fields(*)');
			document.dataForm.phone.focus();
			return false;
		} else if ( !isValidEmail2(document.dataForm,"email") ) {
			alert('Please fill in all the mandatory fields(*)');
			return false;
		} else if ( document.dataForm.company_introduction.value.trim().length > 2000 ) {
			alert('Please fill in all the mandatory fields(*)');
			document.dataForm.company_introduction.focus();
			return false;
		} else {
			return true;
		}
	}
		
</script>

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
					<li><img src="../images/icon/icon_vap_01_on.gif" alt="Company Details"></li>
					<li><img src="../images/icon/icon_vap_02_off.gif" alt="roduct Detail"></li>
					<li><img src="../images/icon/icon_vap_03_off.gif" alt="Travel Information"></li>
					<li><img src="../images/icon/icon_vap_04_off.gif" alt="Application Completed"></li>
				</ul>
			</div>
			<!-- //Tab BMS APP -->
			
			<h4 class="title">
				Thông tin Công ty – Liên hệ
			</h4>
			<span class="subTitle"><em class="red">*</em>Vui lòng điền các thông tin vào ô trống bắt buộc</span>
			
			<!-- Step1 -->
			<form name="dataForm" action="VisitorAssistanceProduct.jsp" method="post">
			<div class="tabBMSstepDetail">
				<div class="top"></div>
				<div class="tabBMSstep1">
					<p class="tabBMStitle">
					Khi chúng tôi liên hệ với các nhà cung cấp Hàn Quốc theo yêu cầu của bạn, chúng tôi có trách nhiệm thông báo chính xác đầy đủ thông tin người mua
					Nếu không điền đầy đủ thông tin chi tiết, nhà cung cấp Hàn Quốc không có đủ cơ sở tin cậy phía bạn, đồng thời yêu cầu của bạn sẽ không được thảo luận.
					Để cung cấp các thông tin kinh doanh tin cậy và chính xác giữa bạn và các đối tác nhà cung cấp của Hàn Quốc, hãy điền đầy đủ các ô còn trống sau đây.
					</p>
					<div class="tabBMSstepTable">
						<table summary="Company &#38; Contact Information">
							<caption>Company &#38; Contact Information Table</caption>
							<colgroup>
								<col width="18%">
								<col width="*">
							</colgroup>
							<tbody>
								<tr>
									<th><em class="red">*</em> Tên công ty</th>
									<td><input type="text" id="" size="60" name="company_name" id="company_name"></td>
								</tr>
								<tr>
									<th>Giới thiệu Công ty</th>
									<td>
										<textarea rows="3" cols="90" name="company_introduction" id="company_introduction"></textarea>
										<span class="red">Giới thiệu chung, tóm tắt các nét chính về Công ty như quá trình thành lập công ty, ngành nghề kinh doanh </span>
									</td>
								</tr>
								<tr>
									<th><em class="red">*</em>Quốc gia</th>
									<td>
										<select name="country" id="country">
											<option>Chọn tên quốc gia</option>
											<% for(int i=0,j=countryList.getRowCnt(); i<j; i++) { %>
						      				<option value="<%= countryList.getString(i, "CTR_CD") %>" <%= "01".equals(countryList.getString(i, "CTR_CD"))? "selected":""%>><%= countryList.getString(i, "NM_EN") %></option><% } %>
										</select>
									</td>
								</tr>
								<tr>
									<th><em class="red">*</em>Loại hình kinh doanh</th>
									<td>
										<select name="business_type" id="business_type">
											<option>Chọn loại hình kinh doanh</option>
											<% for(int i=0,j=bztpList.getRowCnt(); i<j; i++) { %>
						      				<option value="<%= bztpList.getString(i, "CD") %>" <%= "01".equals(bztpList.getString(i, "CD"))? "selected":""%>><%= bztpList.getString(i, "CD_EN") %></option><% } %>
										</select>
									</td>
								</tr>
								<tr>
									<th>MÃ ZIP</th>
									<td><input type="text" id="" size="60" name="zip_code" id="zip_code"></td>
								</tr>
								<tr>
									<th><em class="red">*</em>Địa chỉ</th>
									<td>
										<input type="text" id="" size="60" name="address" id="address">
										<span class="red">
											Điền thông tin chi tiết về Địa chỉ, từ đó nhà cung cấp phía Hàn Quốc có thể gửi các tài liệu cứng như Thông tin công ty, Danh mục Sản phẩm và Sản phẩm mẫu 
										</span>
									</td>
								</tr>
								<tr>
									<th><em class="red">*</em>Tên Giám đốc</th>
									<td><input type="text" id="" size="60" name="president_name" id="president_name"></td>
								</tr>
								<tr>
									<th><em class="red">*</em>Tên người liên hệ</th>
									<td><input type="text" id="" size="60" name="contact_name" id="contact_name"></td>
								</tr>
								<tr>
									<th> Chức vụ</th>
									<td>
										<select name="job_title" id="job_title">
											<option>Chọn chức vụ</option>
											<% for(int i=0,j=bmjtList.getRowCnt(); i<j; i++) { %>
						      				<option value="<%= bmjtList.getString(i, "CD") %>" <%= "01".equals(bmjtList.getString(i, "CD"))? "selected":""%>><%= bmjtList.getString(i, "CD_EN") %></option><% } %>
										</select>
									</td>
								</tr>
								<tr>
									<th><em class="red">*</em>Điện thoại</th>
									<td><input type="text" id="" size="60" name="phone" id="phone"></td>
								</tr>
								<tr>
									<th>Fax</th>
									<td><input type="text" id="" size="60" name="fax" id="fax"></td>
								</tr>
								<tr>
									<th><em class="red">*</em>Email</th>
									<td><input type="text" id="" size="60" name="email" id="email"></td>
								</tr>
								<tr>
									<th>Email thay thế</th>
									<td><input type="text" id="" size="60" name="alternative_email" id="alternative_email"></td>
								</tr>
								<tr>
									<th>URL</th>
									<td><input type="text" id="" size="60" name="url" id="url"></td>
								</tr>
								<tr>
									<th>Số D-U-N-S</th>
									<td><input type="text" id="" size="60" name="duns_number" id="duns_number"></td>
								</tr>
							</tbody>
						</table>	
					</div>
				</div>
				
				<div class="buttonC2">
					<span class="button btnColor1 btnSize1"><a href="javascript:pageNext();" class="w80">TIẾP THEO</a></span>
				</div>
				
				<div class="bottom"></div>
			</div>
			</form>
			<!-- //Step1 -->

		</div>
		<!-- //Contents -->
		
		<!-- Footer -->
		<%@include file="../include/footerMenu.jsp" %>
		<!-- //Footer -->
		
	</div>
	<!-- //Wrapper -->

</body>
</html>