<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.HashMap,
			com.ec21.util.Utility"
%>
<%
	Utility util = Utility.getInstance();

	String company_name = request.getParameter("company_name");
	String company_introduction = request.getParameter("company_introduction");
	String country = request.getParameter("country");
	String business_type = request.getParameter("business_type");
	String zip_code = request.getParameter("zip_code");
	String address = request.getParameter("address");
	String president_name = request.getParameter("president_name");
	String contact_name = request.getParameter("contact_name");
	String job_title = request.getParameter("job_title");
	String phone = request.getParameter("phone");
	String fax = request.getParameter("fax");
	String email = request.getParameter("email");
	String alternative_email = request.getParameter("alternative_email");
	String url = request.getParameter("url");
	String duns_number = request.getParameter("duns_number");
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

<script type="text/javascript">
	function pageNext()
	{
		if(formCheck())
			formSubmit('dataForm');
	}
	
	function formCheck()
	{
		if ( document.dataForm.buying_product.value.trim().length == 0 ) {
			alert("Please enter Buying product.");
			document.dataForm.buying_product.focus();
			return false;
		} else if ( document.dataForm.technical_specification.value.trim().length == 0 ) {
			alert("Please enter Technical Specification.");
			document.dataForm.technical_specification.focus();
			return false;
		} else if ( document.dataForm.usage.value.trim().length == 0 ) {
			alert("Please enter Usage.");
			document.dataForm.usage.focus();
			return false;
		} else if ( document.dataForm.buying_product.value.trim().length > 2000 ) {
			alert("Please enter Buying product.");
			document.dataForm.buying_product.focus();
			return false;
		} else if ( document.dataForm.technical_specification.value.trim().length > 2000 ) {
			alert("Please enter Technical Specification.");
			document.dataForm.technical_specification.focus();
			return false;
		} else if ( document.dataForm.usage.value.trim().length > 2000 ) {
			alert("Please enter Usage.");
			document.dataForm.usage.focus();
			return false;
		} else if ( document.dataForm.dimension.value.trim().length > 2000 ) {
			alert("Please enter Dimension.");
			document.dataForm.dimension.focus();
			return false;
		} else if ( document.dataForm.etc_1.value.trim().length > 2000 ) {
			alert("Please enter etc_1.");
			document.dataForm.etc_1.focus();
			return false;
		} else if ( document.dataForm.etc_2.value.trim().length > 2000 ) {
			alert("Please enter etc_2.");
			document.dataForm.etc_2.focus();
			return false;
		} else {
			return true;
		}
	}
	
	function contac_change(val){
		if(val == "BC06"){
			other.style.visibility="visible";
			other.style.display = 'block';
		}else{
			other.style.visibility="hidden";
			other.style.display = 'none';
			document.dataForm.route_to_come.value="";
		}
	}
	
	function pop_addfile(){
		var form = document.dataForm;

		if ( Number(form.fileCnt.value) > 0 ) {
			alert(" Can't attach 1 more file.");
			return;
		}
		var url = "pop_addfile.jsp?fileCnt="+form.fileCnt.value+"&path=bms";
		window.open(url, "pop_addfile", "top=10, left=10, width=400, height=230, scrollbars=no, resizable=no");
	}
		
</script>

<body id="subSelectCheck">
	<!-- Wrapper -->
	<div id="wrapper">
		
		<% String topAndLefMenu = "0102"; %>
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
				<em class="on">Đơn đăng ký BMS</em>
			</div>
			<h3 class="title">Đơn đăng ký BMS</h3>
			<!-- Tab BMS APP -->
			<div class="tabBMSapp">
				<ul>
					<li><img src="../images/btn/btn_tab_bms_01_off.gif" alt="Company Details"></li>
					<li><img src="../images/btn/btn_tab_bms_02_on.gif" alt="Product Detail"></li>
					<li><img src="../images/btn/btn_tab_bms_03_off.gif" alt="Application Completed"></li>
				</ul>
			</div>
			<!-- //Tab BMS APP -->
			
			<h4 class="title">
				Thông tin sản phẩm
			</h4>
			<span class="subTitle"><em class="red">*</em>Vui lòng điền các thông tin trong ô trống bắt</span>
			
			<!-- Step1 -->
			<form name="dataForm" action="ProductApplicationSubmit.jsp" method="post">
			<input type="hidden" name="company_name" id="company_name" value="<%=company_name%>" />
			<input type="hidden" name="company_introduction" id="company_introduction" value="<%=company_introduction%>" />
			<input type="hidden" name="country" id="country" value="<%=country%>" />
			<input type="hidden" name="business_type" id="business_type" value="<%=business_type%>" />
			<input type="hidden" name="zip_code" id="zip_code" value="<%=zip_code%>" />
			<input type="hidden" name="address" id="address" value="<%=address%>" />
			<input type="hidden" name="president_name" id="president_name" value="<%=president_name%>" />
			<input type="hidden" name="contact_name" id="contact_name" value="<%=contact_name%>" />
			<input type="hidden" name="job_title" id="job_title" value="<%=job_title%>" />
			<input type="hidden" name="phone" id="phone" value="<%=phone%>" />
			<input type="hidden" name="fax" id="fax" value="<%=fax%>" />
			<input type="hidden" name="email" id="email" value="<%=email%>" />
			<input type="hidden" name="alternative_email" id="alternative_email" value="<%=alternative_email%>" />
			<input type="hidden" name="url" id="url" value="<%=url%>" />
			<input type="hidden" name="duns_number" id="duns_number" value="<%=duns_number%>" />
			<div class="tabBMSstepDetail">
				<div class="top"></div>
				<div class="tabBMSstep1">
					<p class="tabBMStitle Type2">Nêu thông tin cụ thể chi tiết.</p>
					<div class="tabBMSstepTable">
						<table summary="Company &#38; Contact Information">
							<caption>Company &#38; Contact Information Table</caption>
							<colgroup>
								<col width="18%">
								<col width="15%">
								<col width="*">
							</colgroup>
							<tbody>
								<tr>
									<th rowspan="6"><em class="red">*</em>Thông tin<br>Sản phẩm</th>
									<td colspan="2">
									Trong cùng một danh mục sản phẩm, các thông tin về quy cách - đặc điểm, kích thước, <br> mục đích sử dụng,
									v.v… của nhà cung cấp có thể không giống nhau.<br>
									Điền thông tin chi tiết. Việc bạn tải hình ảnh hoặc bản vẽ sẽ giúp ích nhiều hơn trong quá trình tìm kiếm
									 nhà cung cấp phù hợp nhất với nhu cầu kinh doanh của bạn. 
									</td>
								</tr>
								<tr>
									<td class="TDtype2"><em class="red">*</em>Sản phẩm mua</td>
									<td>
										<textarea rows="3" cols="60" id="buying_product" name="buying_product"></textarea>
										<span class="red">VD) Tấm GI (cuộn)</span>
									</td>
								</tr>
								<tr>
									<td class="TDtype2"><em class="red">*</em>Technical Specification</td>
									<td>
										<textarea rows="3" cols="60" id="technical_specification" name="technical_specification"></textarea>
										<span class="red">VD) ASTM A653, G90, LFQ</span>
									</td>
								</tr>
								<tr>
									<td class="TDtype2"><em class="red">*</em>Sử dụng</td>
									<td>
										<textarea rows="3" cols="60" id="usage" name="usage"></textarea>
										<span class="red">VD) Chế tạo tấm phủ và bệ đỡ cố định cho các thiết bị chiếu sáng</span>
									</td>
								</tr>
								<tr>
									<td class="TDtype2">Kích thước</td>
									<td>
										<textarea rows="3" cols="60" id="dimension" name="dimension"></textarea>
										<span class="red">VD) – Dày 0.9mm x rộng 141mm – Số lượng 30Tấn/tháng
      									<br>&nbsp;&nbsp;&nbsp;&nbsp;-Dày 0.9mm x rộng 200.5mm – Số lượng 50Tấn/tháng</span>
									</td>
								</tr>
								<tr>
									<td class="TDtype2">Tên, số sản phẩm mẫu</td>
									<td>
										<textarea rows="4" cols="60" id="model_name" name="model_name"></textarea>
										<span class="red">VD) – dày 0.9mm x rộng 141mm – Số lượng 30Tấn/tháng</span>
									</td>
								</tr>
								
								<tr>
									<th>Khối lượng đơn hàng</th>
									<td colspan="2">
										<input type="text" size="60" id="order_volume" name="order_volume">
									</td>
								</tr>
								<tr>
									<th>Yêu cầu đặc biệt </th>
									<td colspan="2">
										<textarea rows="3" cols="60" id="requirements" name="requirements"></textarea>
									</td>
								</tr>
								<tr>
									<th> Truy cập<br>gobizkorea.com</th>
									<td colspan="2">
										<select id="route_to_come" name="route_to_come" onChange="contac_change(this.value)">
											<option value="BC01">google</option>
											<option value="BC02">yahoo</option>
											<option value="BC03">email</option>
											<option value="BC04">introduction by friend</option>
											<option value="BC05">trade show</option>
											<option value="BC07">banner</option>
											<option value="BC06">others</option>
										</select>
										<input type="text" name="bmsContacEtc" id="other" style="float:left; display:none; padding-right:5px;" />
									</td>
								</tr>
								<tr>
									<th>Công ty Hàn Quốc</th>
									<td colspan="2">
										<ul>
											<li class="skyBlue">1. Nếu bạn gặp khó khăn trong việc liên hệ với các nhà cung cấp Hàn Quốc  </li>
											<li class="skyBlue">2. Nếu bạn cần các thông tin chính xác hơn hoặc không nhận được phản hồi từ nhà cung cấp</li>
											<li class="skyBlue">3. Nếu bạn đã từng được giới thiệu với công ty bạn đang tìm kiếm</li>
										</ul>
										<div class="productDetailBox">
											<span>
												<label>Công ty 1</label>
												<input type="text" size="20" id="company_1" name="company_1">
											</span>
											<span>
												<label>Sản phẩm</label>
												<input type="text" size="20" id="product_1" name="product_1">
											</span>
											<textarea rows="3" cols="73" id="etc_1" name="etc_1"></textarea>
											<span class="red">VD) Số điện thoại, Tên người liên hệ, v.v…</span>
										</div>
										<div class="productDetailBox">
											<span>
												<label>Công ty 2</label>
												<input type="text" size="20" id="company_2" name="company_2">
											</span>
											<span>
												<label>Sản phẩm</label>
												<input type="text" size="20" id="product_2" name="product_2">
											</span>
											<textarea rows="3" cols="73" id="etc_2" name="etc_2"></textarea>
											<span class="red">VD) Số điện thoại, Tên người liên hệ, v.v…</span>
										</div>
									</td>
								</tr>
							</tbody>
						</table>	
					</div>
				</div>
				
				<div class="buttonC2">
					<span class="button btnColor1 btnSize1"><a href="javascript:pageNext();" class="w80">NEXT</a></span>
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