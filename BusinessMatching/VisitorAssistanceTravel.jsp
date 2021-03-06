<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.HashMap,
			java.util.*,
			com.ec21.util.Utility"
%>
<%
	Utility util = Utility.getInstance();
	// 1step Data
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
	<link href="/css/jquery-ui-1.8.18.datepicker.custom.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="/js/datepicker/jquery-ui.datepicker.min.js"></script>
	<script type="text/javascript" src="/js/datepicker/jquery.ui.datepicker-ko.js"></script>
</head>

<script type="text/javascript">

	$(document).ready(function(){
		$.datepicker.setDefaults( $.datepicker.regional[ "ko" ] );
		$('.datepicker').datepicker({
			showOn: "button",
			buttonImage: "/images/datepicker/calendar.gif",
			buttonImageOnly: true,
			showAnim : 'slideDown',
			showOtherMonths: true,
			selectOtherMonths: true,
			showButtonPanel: true
		});
	});
	
	function save(){
		if ( document.dataVaForm.visiting_schedule.value.trim().length > 2000 ) {
			alert("Please fill in all the mandatory fields(*)");
			document.dataVaForm.visiting_schedule.focus();
		} else {
			formSubmit("dataVaForm");
		}
	}

	function isTime(obj) {
		if (obj.value != "") {
			var hour  = obj.value.substring(0, 2);
			var min   = obj.value.substring(3, 5);

			if (!(isValidHour(hour) && isValidMin(min))) {
				alert("Invalid Time.");
				obj.value = "";
				obj.focus();
			}
		}
	}

	/**
	* 유효한(존재하는) 시(時)인지 체크
	*/
	function isValidHour(hh) {
		var h = parseInt(hh, 10);
		return (h >= 0 && h <= 23);
	}

	/**
	* 유효한(존재하는) 분(分)인지 체크
	*/
	function isValidMin(mi) {
		var m = parseInt(mi, 10);
		return (m >= 0 && m <= 59);
	}

	function cancel(){
		if(!confirm(' Do you want to cancel your application?')){
			return;
		}else{
			if(!confirm('Your VAP application has been cancelled.\nThe first 2 stages you have completed are identical \nto the BMS application process, and you can now \nautomatically apply for BMS. \nWould you like to apply now?')){
				location.href = "#";
			}else{
				document.dataVaForm.action = "#" ;
				document.dataVaForm.submit() ;
			}
		}
	}
</script>

<body>
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
					<li><img src="../images/icon/icon_vap_03_on.gif" alt="Travel Information"></li>
					<li><img src="../images/icon/icon_vap_04_off.gif" alt="Application Completed"></li>
				</ul>
			</div>
			<!-- //Tab BMS APP -->
			
			<h4 class="title">
				Thông tin Đi lại
			</h4>
			<span class="subTitle"><em class="red">*</em>Theo giờ Hàn Quốc</span>
			
			<!-- Step3 -->
			<form name="dataVaForm" action="VisitorAssitanceSubmit.jsp" method="post">
			<%
				for (Enumeration e = request.getParameterNames(); e.hasMoreElements() ;){
					String strTemp = (String)e.nextElement();
					out.println("<input type='hidden' name='"+strTemp+"' value='"+request.getParameter(strTemp)+"'>");
					System.out.println("<input type='hidden' name='"+strTemp+"' value='"+request.getParameter(strTemp)+"'>");
				}
			%>
			
			<div class="tabBMSstepDetail">
				<div class="top"></div>
				<div class="tabBMSstep1">
					<p class="tabBMStitle Type2">Nêu thông tin cụ thể chi tiết.</p>
					<p class="tabBMStitle">
					Chương trình nhằm hỗ trợ các khách hàng là người mua nước ngoài, những người có ý định tới Hàn Quốc. 
					Trong trường hợp bạn không có dự định tới Hàn Quốc nhưng có nhu cầu tìm kiếm nhà cung cấp, hãy đăng ký chương trình kết nối kinh doanh BMS
					</p>
					<div class="tabBMSstepTable">
						<table summary="Company &#38; Contact Information">
							<caption>Company &#38; Contact Information Table</caption>
							<colgroup>
								<col width="27%">
								<col width="30%">
								<col width="*">
							</colgroup>
							<thead>
								<tr>
									<th>Chuyến bay tới Hàn Quốc</th>
									<th>Từ (Thành phố/ Ngày/ Giờ)</th>
									<th class="last">Tới (Thành phố/ Ngày/ Giờ)</th>
								</tr>
							</thead>
							<tbody>
								<tr class="tradeInfo">
									<td>
										<input type="text" size="21" name="flight_to_korea" id="flight_to_korea" maxlength="80">
										<span>ex) KE954</span>
									</td>
									<td>
										<input type="text" size="8" name="ftk_from_city" id="ftk_from_city" maxlength="80">
										<input type="text" size="7" name="ftk_from_date" id="ftk_from_date" maxlength="10" readonly="readonly" class="datepicker">
										<input type="text" size="6" name="ftk_from_time" id="ftk_from_time" maxlength="5" onblur="javascript:isTime(this);">
										<span>ex) Cairo/2008-11-24/23:10</span>
									</td>
									<td class="last">
										<input type="text" size="8" name="ftk_to_city" id="ftk_to_city" maxlength="80">
										<input type="text" size="7" name="ftk_to_date" id="ftk_to_date" maxlength="10" readonly="readonly" class="datepicker">
										<input type="text" size="6" name="ftk_to_time" id="ftk_to_time" maxlength="5" onblur="javascript:isTime(this);">
										<span>ex) Incheon/2008-11-24/23:10</span>
									</td>
								</tr>
								<tr class="tradeInfo">
									<td>
										<input type="text" size="21" name="flight_from_korea" id="flight_from_korea" maxlength="80">
										<span>ex) KE954</span>
									</td>
									<td>
										<input type="text" size="8" name="ffk_from_city" id="ffk_from_city" maxlength="80">
										<input type="text" size="7" name="ffk_from_date" id="ffk_from_date" maxlength="10" readonly="readonly">
										<input type="text" size="6" name="ffk_from_time" id="ffk_from_time" maxlength="5" onblur="javascript:isTime(this);">
										<span>ex) Cairo/2008-11-24/23:10</span>
									</td>
									<td class="last">
										<input type="text" size="8" name="ffk_to_city" id="ffk_to_city" maxlength="80">
										<input type="text" size="7" name="ffk_to_date" id="ffk_to_date" maxlength="10" readonly="readonly">
										<input type="text" size="6" name="ffk_to_time" id="ffk_to_time" maxlength="5" onblur="javascript:isTime(this);">
										<span>ex) Incheon/2008-11-24/23:10</span>
									</td>
								</tr>
								<tr class="tradeInfo">
									<td colspan="3" class="last">
										<span class="tipText"><b>Thông tin khách hàng</b>(Nêu rõ mục đích chính của chuyến đi tới Hàn Quốc và thông tin chi tiết về việc ăn ở)</span>
										<textarea cols="120" rows="5"></textarea>
									</td>
								</tr>
							</tbody>
						</table>	
					</div>
				</div>
				
				<div class="buttonC2">
					<span class="button btnColor1 btnSize1"><a href="javascript:save();">TIẾP THEO</a></span>
					<span class="button btnColor3 btnSize1"><a href="javascript:cancel();" class="w80">Cancel</a></span>
				</div>
				
				<div class="bottom"></div>
			</div>
			</form>
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