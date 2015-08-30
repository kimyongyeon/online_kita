<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>Gobiz Country Channel</title>
<%@include file="../include/commonCss.jsp" %>
<%@include file="../include/commonJs.jsp" %>
<script type="text/javascript" src="../../design/js/vietnamCommon.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#previewContents').html(opener.previwContents());
})
</script>
</head>
<body style="background: none;padding:10px;">
	<div style="width:100%;margin:auto;">
		<div id="previewContents" >

		</div>
	</div>
</body>
</html>