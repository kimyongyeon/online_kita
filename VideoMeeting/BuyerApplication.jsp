<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.ec21.common.Dao,
			com.ec21.common.MpCtrCd2Action,
			com.ec21.util.Utility"
%><%
Utility util = Utility.getInstance();
MpCtrCd2Action mcc2Action = MpCtrCd2Action.getInstance();

Dao ctrDao = new Dao();

ctrDao = mcc2Action.getMpCtrCd2List();

%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<meta name="description" content="" >
<meta name="keywords" content="" >
<title>Gobizkorea.com Việt Nam</title>
<%@include file="../include/commonCss.jsp" %>
<link href="../css/jquery-ui-1.8.18.datepicker.custom.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript">document.domain = "gobizkorea.com";</script>
<%@include file="../include/commonJs.jsp" %>
<script type="text/javascript" src="../js/datepicker/jquery-ui.datepicker.min.js"></script>
<script type="text/javascript" src="../js/datepicker/jquery.ui.datepicker-ko.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.datepicker').datepicker({
		showOn: "button",
		buttonImage: "../images/icon/icon_cal.gif",
		buttonImageOnly: true,
		showAnim : 'slideDown',
		showOtherMonths: true,
		selectOtherMonths: true,
		showButtonPanel: true,
		minDate: '+7D'
	});
});

function goRegister(f){
	var msg = "Would you like to register?";
	var url = "BuyerApplicationSubmit.jsp";

	if(f.seq.value == '0')
		f.seq.value = "";

	if(f.status.value == 'revision')
	{
		msg = "Would you like to modify?";
		url = "";
	}

	var email = f.email.value;

	//필수입력사항 체크
	if(f.companyNm.value == ''){
		alert('Please enter your company name');
		f.companyNm.focus();
		return;
	}else if(f.ctrCd.value == ''){
		alert('Please select your country');
		f.ctrCd.focus();
		return;
	}else if(f.gmt.value == ''){
		alert('Please select your GMT');
		f.gmt.focus();
		return;
	}else if(f.buyerNm.value == ''){
		alert('Please enter contact-person name');
		f.buyerNm.focus();
		return;
	}else if(email == ''){
		alert('Please enter your E-mail which make frequent use of ID');
		f.email.focus();
		return;
	}else if(email.indexOf('.') < 0){
		alert('Please check your E-mail');
		f.email.focus();
		return;
	}else if(email.indexOf('@') < 0){
		alert('Please check your E-mail');
		f.email.focus();
		return;
	}else if(f.address.value == ''){
		alert('Please enter your address');
		f.address.focus();
		return;
	}else if(f.phone.value == ''){
		alert('Please enter your phone number');
		f.phone.focus();
		return;
	}else if(f.fax.value == ''){
		alert('Please enter your fax number');
		f.fax.focus();
		return;
	}else if(f.website.value == ''){
		alert('Please enter your website address');
		f.website.focus();
		return;
	}else if(f.talkDate.value == ''){
		alert('Please select Meeting dates');
		return;
	}else if(f.talkTime.value == ''){
		alert('Please select Meeting times');
		return;

	}else if(f.unspsc.value == ''){
		alert('Please select interested categorys');
		return;
	}

	if(f.talkDate.value != ''){

		if(!isValidDate(f.talkDate.value)) {
			alert("The date format is incorrect.");
			f.talkDate.value = "";
			return;
		}

		if(!dateDiffCheck(f.talkDate.value)){
			alert('Please select a date after today.');
			f.talkDate.value = "";
			return;
		}
	}

	if(f.talkDate2.value != ''){
		if(!isValidDate(f.talkDate2.value)) {
			alert("The date format is incorrect.");
			f.talkDate2.value = "";
			return;
		}
		if(!dateDiffCheck(f.talkDate2.value)){
			alert('Please select a date after today.');
			f.talkDate2.value = "";
			return;
		}
	}

	if(f.talkDate3.value != ''){
		if(!isValidDate(f.talkDate3.value)) {
			alert("The date format is incorrect.");
			f.talkDate3.value = "";
			return;
		}
		if(!dateDiffCheck(f.talkDate3.value)){
			alert('Please select a date after today.');
			f.talkDate3.value = "";
			return;
		}
	}

	if(f.talkDate4.value != ''){
		if(!isValidDate(f.talkDate4.value)) {
			alert("The date format is incorrect.");
			f.talkDate4.value = "";
			return;
		}
		if(!dateDiffCheck(f.talkDate4.value)){
			alert('Please select a date after today.');
			f.talkDate4.value = "";
			return;
		}
	}


	if(confirm(msg)){
		f.action = url;
		f.method = "post";
		f.submit();
	}else {
		return;
	}
}

function cat_sch( frm, pos){
	var f = document.sForm;
	if(f.blogId.value == ""){
		window.open("http://www.gobizkorea.com/popup/unspscSearch.do?frm="+frm, "usrid_win",
		"top=10,left=10,width=678,height=610,scrollbars=yes,resizable=no");
	}else {
		return;
	}
}

function dateDiffCheck(chkDate){
	var result = false;
	var today = new Date();

	//date setting : YYYY-mm-dd 형식으로..
	var intToday = today.getYear() +"";
	if(today.getMonth()+1 < 10) intToday += "0";
	intToday += (today.getMonth() +1)+"";

	if(today.getDate() < 10) intToday += "0";
	intToday += today.getDate()+"";



	if(chkDate != ''){
		if(chkDate.indexOf('-') > 0){
			chkDate = chkDate.split("-").join("");
		}
		intToday = Math.round(intToday);
		chkDate = Math.round(chkDate);

		if(intToday < chkDate){

			result = true;
		}else {

			result = false;
		}
	}

	return result;
}

function meetNumChk(){
	var meetNum = document.getElementById("meetNum");

	var talkDate = document.getElementById("talkDate");
	var talkDate2 = document.getElementById("talkDate2");
	var talkDate3 = document.getElementById("talkDate3");
	var talkDate4 = document.getElementById("talkDate4");

	var talkTime = document.getElementById("talkTime");
	var talkTime2 = document.getElementById("talkTime2");
	var talkTime3 = document.getElementById("talkTime3");
	var talkTime4 = document.getElementById("talkTime4");

	var cnt = 0;

	if(talkTime.selectedIndex > 0 && talkDate.value != '') cnt++;
	if(talkTime2.selectedIndex > 0 && talkDate2.value != '') cnt++;
	if(talkTime3.selectedIndex > 0 && talkDate3.value != '') cnt++;
	if(talkTime4.selectedIndex > 0 && talkDate4.value != '') cnt++;

	meetNum.value = cnt;
}

function goCtrCdNmChk(selIdx){
	if(selIdx != 0){
		var val = document.sForm.ctrCd.options[selIdx].text;
		document.sForm.countryNm.value = val;
	}
}

//날짜형식 체크 = 형식은 yyyy-MM-dd
function isValidDate(iDate){

	//10자리체크
	if(iDate.length !=10 ){
		return false;
	}
	oDate = new Date();
	oDate.setFullYear(iDate.substring(0,4));
	oDate.setMonth(Math.round(iDate.substring(6,7))-1);
	oDate.setDate(iDate.substring(8));

	if(oDate.getFullYear() != iDate.substring(0,4) ||
		oDate.getMonth() +1 != Math.round(iDate.substring(6,7)) ||
		oDate.getDate() != iDate.substring(8)) {

		return false;
	}

	return true;
}
</script>
</head>
<body id="subSelectCheck">
	<% String topAndLefMenu = "0302"; %>
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Head -->
		<% String action = "NewAndNoticeList.jsp"; %>
		<%@include file="../include/topMenu.jsp" %>
		<!-- //Head -->
		<!-- LNB -->
		<%@include file="../include/leftMenu.jsp" %>
		<!-- //LNB -->
		<!-- Contents -->
		<div id="contents">
			<div class="bannerIndex"><a href="#none"><img src="../images/banner/banner_index.gif" alt="Dịch vụ kết nối kinh doanh"></a></div>
			<div class="location">
				<em>Trang chủ </em> &#62;
				<em>Họp Trực tuyến</em> &#62;
				<em class="on">Đơn của Người mua</em>
			</div>
			<h3 class="title">Đơn của Người mua</h3>
			<form name="sForm" method="post">
			<input type="hidden" name="seq" value="<%//=seq %>"/>
			<input type="hidden" name="blogId" value="<%//=blogId %>"/>
			<input type="hidden" name="objId" value="<%//=objId %>"/>
			<input type="hidden" name="status" value="<%//=status %>"/>
			<input type="hidden" name="countryNm" />
			<div class="video">
				<div class="top"></div>
				<div class="evm">
					<div class="topText">
						<h6>EVM</h6>
						<em>eTrade Video Meeting</em>
						<div>
							<strong>
							The best online face-to-face video meetingfor<br>buyer and korean suppliers.
							</strong>
							GobizKorea should correctly inform buyer's information to Korean suppliers
							for buyer's goods ranging. To mutually provide precise and reliable business
							information between buyers and Korean Suppliers, Please fill out this
							application on the below.
						</div>
					</div>
					<P>
						<span>Nếu quý khách có sẵn tài khoản, xin vui lòng đăng<br>
						nhập trước khi điền vào hồ sơ. GobizKorea.com khuyến cáo<br>
						quý khách nên tham gia thành viên để có nhiều lợi ích hơn.</span>
						<a href="http://kr.gobizkorea.com/inc/jsp/down.jsp?file_path=/att/evm/&file_nm=QuickGuide.pdf" target="_blank">Hướng Dẫn Nhanh</a>
					</P>
				</div>
				<h4 class="title">Thông tin Người mua</h4>
				<span class="subTitle"><em class="red">*</em>Xin vui lòng điền vào các ô bắt buộc</span>
				<div class="tabBMSstepTable">
					<table summary="Buyer Information">
						<caption>Buyer Information Table</caption>
						<colgroup>
							<col width="19%">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th><em class="red">*</em>Tên công ty</th>
								<td>
									<input type="text" name="companyNm" value="<%//=strCompanyNm %>" size="70" maxlength="150" style="ime-mode:disabled;">
								</td>
							</tr>
							<tr>
								<th><em class="red">*</em>Quốc gia</th>
								<td>
									<select name="ctrCd" style="width: 270px;">
										<option value="">Xin vui lòng lựa chọn</option>
										<%
										if(ctrDao != null && ctrDao.getRowCnt() > 0)
										{
											String ctrNm = "";
											String code = "";

											for(int i=0, j=ctrDao.getRowCnt(); i<j; i++)
											{
												ctrNm = util.nullCheck(ctrDao.getString(i, "CTR_CD_EN"));
												code = util.nullCheck(ctrDao.getString(i, "CTR_CD"));
										%>
											<option value="<%=code %>" <%//=code.equals(Util.getNotNull(mpGlobalApply.getCtrCd()))?"selected":"" %>><%=ctrNm %></option>
										<%
											}
										}
										%>
									</select>
								</td>
							</tr>
							<tr>
								<th><em class="red">*</em>GMT </th>
								<td>
									<select name="gmt" style="width: 270px;">
										<option value="">Xin vui lòng lựa chọn</option>
										<%
										for(int i=-11,j=12; i<=j; i++)
										{
										%>
										<option value="<%if(i > 0){%>+<%}%><%=i%>" <%//="-11".equals(Util.getNotNull(mpGlobalApply.getGmt()))?"selected":"" %>><%if(i > 0){%>+<%}%><%=i%></option>
										<%
										}
										%>
									</select>
								</td>
							</tr>
							<tr>
								<th><em class="red">*</em>Họ tên</th>
								<td>
									<input type="text" name="buyerNm" value="<%//=strBuyerNm %>"  maxlength="200" size="70" style="ime-mode:disabled;">
								</td>
							</tr>
							<tr>
								<th><em class="red">*</em>Email</th>
								<td>
									<input type="text" name="email" value="<%//=usrEmail %>" maxlength="200" size="70" style="ime-mode:disabled;">
								</td>
							</tr>
							<tr>
								<th><em class="red">*</em>Địa chỉ</th>
								<td>
									<input type="text" name="address" value="" maxlength="200" size="70" style="ime-mode:disabled;">
								</td>
							</tr>
							<tr>
								<th><em class="red">*</em>ĐT</th>
								<td>
									<input type="text" name="phone" value="" maxlength="200" size="70" style="ime-mode:disabled;">
								</td>
							</tr>
							<tr>
								<th><em class="red">*</em>Fax</th>
								<td>
									<input type="text" name="fax" value="" maxlength="200" size="70" style="ime-mode:disabled;">
								</td>
							</tr>
							<tr>
								<th><em class="red">*</em>Website</th>
								<td>
									<input type="text" name="website" value="" maxlength="200" size="70" style="ime-mode:disabled;">
								</td>
							</tr>
							<tr>
								<th> Ngày & Thời gian<br>có thể tiến hành họp</th>
								<td>
									<ul class="meetingTime">
										<li>
											<span><em>*</em><b>1</b></span>
											<span><input type="text" size="7" maxlength="10" name="talkDate" id="talkDate" value="<%//=strTalkDate %>" class="datepicker" readonly="readonly"/></span>
											<select name="talkTime" onchange="meetNumChk();">
												<option value="">==Time select==</option>
												<%
												for(int i=0,j=24; i<j; i++)
												{
												%>
													<option value="<%if(i<10){%>0<%}%><%=i%>:00 ~ <%if(i<10){%>0<%}%><%=i%>:50" <%//=strTalkTime.equals("01:00 ~ 01:50")?"selected":"" %>><%if(i<10){%>0<%}%><%=i%>:00 ~ <%if(i<10){%>0<%}%><%=i%>:50</option>
												<%
												}
												%>
											</select>
										</li>
										<li>
											<span><em>*</em><b>2</b></span>
											<span><input type="text" size="7" maxlength="10" name="talkDate2" id="talkDate2" value="<%//=strTalkDate2 %>" class="datepicker" readonly="readonly"/></span>
											<select name="talkTime2" onchange="meetNumChk();">
												<option value="">==Time select==</option>
												<%
												for(int i=0,j=24; i<j; i++)
												{
												%>
													<option value="<%if(i<10){%>0<%}%><%=i%>:00 ~ <%if(i<10){%>0<%}%><%=i%>:50" <%//=strTalkTime2.equals("01:00 ~ 01:50")?"selected":"" %>><%if(i<10){%>0<%}%><%=i%>:00 ~ <%if(i<10){%>0<%}%><%=i%>:50</option>
												<%
												}
												%>
											</select>
										</li>
										<li>
											<span><em>*</em><b>3</b></span>
											<span><input type="text" size="7" maxlength="10" name="talkDate3" id="talkDate3" value="<%//=strTalkDate3 %>" class="datepicker" readonly="readonly"/></span>
											<select name="talkTime3" onchange="meetNumChk();">
												<option value="">==Time select==</option>
												<%
												for(int i=0,j=24; i<j; i++)
												{
												%>
													<option value="<%if(i<10){%>0<%}%><%=i%>:00 ~ <%if(i<10){%>0<%}%><%=i%>:50" <%//=strTalkTime3.equals("01:00 ~ 01:50")?"selected":"" %>><%if(i<10){%>0<%}%><%=i%>:00 ~ <%if(i<10){%>0<%}%><%=i%>:50</option>
												<%
												}
												%>
											</select>
										</li>
										<li class="last">
											<span><em>*</em><b>4</b></span>
											<span><input type="text" size="7" maxlength="10" name="talkDate4" id="talkDate4" value="<%//=strTalkDate4 %>" class="datepicker" readonly="readonly"/></span>
											<select name="talkTime4" onchange="meetNumChk();">
												<option value="">==Time select==</option>
												<%
												for(int i=0,j=24; i<j; i++)
												{
												%>
													<option value="<%if(i<10){%>0<%}%><%=i%>:00 ~ <%if(i<10){%>0<%}%><%=i%>:50" <%//=strTalkTime4.equals("01:00 ~ 01:50")?"selected":"" %>><%if(i<10){%>0<%}%><%=i%>:00 ~ <%if(i<10){%>0<%}%><%=i%>:50</option>
												<%
												}
												%>
											</select>
										</li>
									</ul>
									<span class="orange PL10">Nếu quý khách cần tổ chức từ 5 lần trở lên, xin vui lòng điền lại vào hồ sơ này.</span>
								</td>
							</tr>
							<tr>
								<th><em class="red">*</em>Loại hình mong muốn</th>
								<td class="UNSPSCtd">
									<input type="text" name="unspsc" size="15" class="input" maxlength=8 value="<%//=strUnspsc%>" readonly="readonly" onclick="cat_sch('sForm', 'unspsc')" />
									<input type="text" name="unspsc_name" size="30" value="<%//=strUnEtitle %>" readonly/>
									<a href="javascript:cat_sch('sForm','unspsc')" class="UNSPSCSearch"><span class="btn_UNSPSC">UNSPSC Search</span></a>
								</td>
							</tr>
							<tr>
								<th>Sản phẩm mua</th>
								<td>
									<textarea name="ememo" style="ime-mode:disabled;" cols="60" rows="3"><%//=Util.getNotNull(mpGlobalApply.getEmemo()) %></textarea>
									<span class="orange">Xin vui lòng mô tả sản phẩm muốn mua từ các nhà cung cấp Hàn Quốc</span>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="buttonC2">
					<span class="button btnColor1 btnSize1"><a href="javascript:goRegister(sForm);" >Đăng ký </a></span>
				</div>
				<div class="bottom"></div>
			</div>
			</form>
		</div>
		<!-- //Contents -->
		<!-- Footer -->
		<%@include file="../include/footerMenu.jsp" %>
		<!-- //Footer -->
	</div>
	<!-- //Wrapper -->
</body>
</html>