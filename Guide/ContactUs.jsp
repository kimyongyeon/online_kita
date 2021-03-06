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
	
	<script type="text/javascript">
		// ====================================================
		// ok 버튼 클릭시
		// ====================================================
		function submitBtn()
		{
			if(formCheck()){
				formSubmit('dataForm');
			}
		}
		// ====================================================
		// cancel 버튼 클릭시
		// ====================================================
		function cancel()
		{		
			$('input[name=name]').val("");
			$('input[name=company]').val("");
			$('input[name=email]').val("");
			$('input[name=subject]').val("");
			$('textarea[name=description]').val("");	
		}
		// ====================================================
		// 폼 체크
		// ====================================================
		function formCheck()
		{
			if(!$.trim($('input[name=name]').val()))
			{
				alert('name을 입력하세요.');
				$('input[name=name]').focus();
				return false;
			}
			else if(!$.trim($('input[name=company]').val()))
			{
				alert('company를 입력하세요.');
				$('input[name=company]').focus();
				return false;
			}
			else if(!$.trim($('input[name=email]').val()))
			{
				alert('email을 입력하세요.');
				$('input[name=email]').focus();
				return false;
			}
			else if(!$.trim($('input[name=subject]').val()))
			{
				alert('suject을 입력하세요.');
				$('input[name=subject]').focus();
				return false;
			}
			else if(!$.trim($('textarea[name=description]').val()))
			{
				alert('description을 입력하세요.');
				$('textarea[name=description]').focus();
				return false;
			}
			else if ( !isValidEmail2(document.dataForm,"email") ) {
				//alert('올바른 Email을 입력하세요.');
				$('input[name=email]').focus();
				return false;
			}
			else{
				return true;
			}
		}
		// ====================================================
		// 글자 길이 제한.
		// ====================================================
		function checkLength(objname, maxlength) {
			var objstr = objname.value; // 입력된 문자열을 담을 변수 
			var objstrlen = objstr.length; // 전체길이
			// 변수초기화 
			var maxlen = maxlength; // 제한할 글자수 최대크기 
			var i = 0; // for문에 사용 
			var bytesize = 0; // 바이트크기 
			var strlen = 0; // 입력된 문자열의 크기
			var onechar = ""; // char단위로 추출시 필요한 변수 
			var objstr2 = ""; // 허용된 글자수까지만 포함한 최종문자열
			// 입력된 문자열의 총바이트수 구하기
			for (i = 0; i < objstrlen; i++) {
				// 한글자추출 
				onechar = objstr.charAt(i);
				if (escape(onechar).length > 4) {
					bytesize += 2; // 한글이면 2를 더한다. 
				} else {
					bytesize++; // 그밗의 경우는 1을 더한다.
				}
				if (bytesize <= maxlen) { // 전체 크기가 maxlen를 넘지않으면 
					strlen = i + 1; // 1씩 증가
				}
			}
			// 총바이트수가 허용된 문자열의 최대값을 초과하면 
			if (bytesize > maxlen) {
				alert("Max Length " + maxlength + " Over...!!!"); // match를 이용해서 영어로된 name을 한글로 변환해서 출력한다. 
				objstr2 = objstr.substr(0, strlen);
				objname.value = objstr2;
			}
			objname.focus();
		}
	</script>
</head>
<body id="subSelectCheck">
	<!-- Wrapper -->
	<div id="wrapper">
		
		<% String topAndLefMenu = "0606"; %>
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
				<em class="on">Liên hệ</em>
			</div>
			<h3 class="title">Liên hệ</h3>
			
			<div class="ContantsTop">
				<b>Phiếu truy vấn:</b>
				Nếu quý khách đang tìm kiếm một sản phẩm hoặc dịch vụ của Hàn Quốc, xin vui lòng đăng ký Dịch vụ Business Matching Service<br>
				(Dịch vụ Kết nối Kinh doanh) tại Gobizkorea.com Quý khách cũng có thể liên hệ với chúng tôi để biết thêm thông tin chi tiết. Rất mong nhận được các ý kiến đóng góp từ quý khách hàng.
			</div>
			<div class="ContantsBottom"></div>
			
			<h5 class="title">Liên hệ</h5>
			<span class="subTitle"><em class="red">*</em>Xin vui lòng điền vào các ô bắt buộc</span>
			
			<div class="tableType1">
				<form name="dataForm" action="ContactUsSubmit.jsp" method="post" >
					<table summary="Contact Us table">
						<caption>Contact Us table</caption>
						<colgroup>
							<col width="20%">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
							<th><em class="red">*</em>Họ tên</th>
								<td><input type="text" size="100" class="text" name="name" id="name" maxlength="128" onkeyup="checkLength(this,128)"></td>
							</tr>
							<tr>
							<th><em class="red">*</em>Công ty</th>
								<td><input type="text" size="100" class="text" name="company" id="company" maxlength="512" onkeyup="checkLength(this,512)"></td>
							</tr>
							<tr>
							<th><em class="red">*</em>E-mail</th>
								<td><input type="text" size="100" class="text" name="email" id="email" maxlength="512" onkeyup="checkLength(this,512)"></td>
							</tr>
							<tr>
							<th><em class="red">*</em>Nội dung</th>
								<td><input type="text" size="100" class="text" name="subject" id="subject" maxlength="1024" onkeyup="checkLength(this,1024)"></td>
							</tr>
							<tr>
							<th><em class="red">*</em>Mô tả</th>
								<td>
									<textarea rows="15" cols="95" name="description" id="description"></textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			
			<div class="buttonC2">
				<span class="button btnColor1 btnSize1"><a href="javascript:submitBtn();" class="w80">OK</a></span>
				<span class="button btnColor3 btnSize1"><a href="javascript:cancel();" class="w80">Hủy</a></span>
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