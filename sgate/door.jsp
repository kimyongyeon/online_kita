<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.ec21.util.Utility"
%><%
Utility util = Utility.getInstance();

String returnURL = util.nullCheck(request.getParameter("returnURL"));
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>Gobiz Country Channel</title>
<link rel="stylesheet" type="text/css" href="../sgate/css/common.css" />
<!--[if IE 6]>
<link rel="stylesheet" type="text/css" href="../sgate/css/ie6.css" />
<![endif]-->
<!--[if IE 7.0]>
<link rel="stylesheet" type="text/css" href="../sgate/css/ie7.css" />
<![endif]-->
<script type="text/javascript" src="../sgate/js/jquery.min.js"></script>
<script type="text/javascript" src="../sgate/js/ui.js"></script>
<script type="text/javascript" src="../sgate/js/vietnamSgateCommon.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#loginBtn').hover(mouserOverCursor, mouserOutCursor).click(login);
});

function login()
{
	if('' == $('input[name=adminId]').val())
	{
		$('input[name=adminId]').focus()
		alert('아이디를 입력하세요.');
		return false;
	}
	else if('' == $('input[name=password]').val())
	{
		$('input[name=password]').focus()
		alert('패스워드를 입력하세요.');
		return false;
	}
	else
		formSubmit('loginForm');
}
</script>
</head>
<body id="index">
	<!-- WrapperIndex -->
	<div class="wrapperIndex">
		<div class="loginBox">
			<div class="loginBoxDetail">
				<h1>베트남 온라인무역관 관리자시스템</h1>
				<img src="../sgate/images/text/text_titleIndex.gif" alt="배트남 온라인무역관 관리자시스템" class="title"/>
				<div>
					<form name="loginForm" action="login/loginSubmit.jsp" method="post">
					<input type="hidden" name="returnURL" value="<%=returnURL%>"/>
					<ul>
						<li><label><img src="../sgate/images/text/text_index_id.gif" alt="User ID"/></label><input name="adminId" type="text"/></li>
						<li><label><img src="../sgate/images/text/text_index_pw.gif" alt="Password"/></label><input name="password" type="password"/></li>
					</ul>
					<span><img src="../sgate/images/btn/btn_login.gif" alt="로그인" id="loginBtn"/></span>
					</form>
				</div>
			</div>
		</div>	</div>
	<!-- //WrapperIndex -->
</body>
</html>