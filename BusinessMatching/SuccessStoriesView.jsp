<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.HashMap,
			com.ec21.BusinessMatching.BusinessMatchingAction,
			com.ec21.common.Dao,
			com.ec21.util.Utility"
%>
<%
	BusinessMatchingAction bmAction = BusinessMatchingAction.getInstance();
	Utility util = Utility.getInstance();
	Dao bmListDao = new Dao();
	HashMap<String, String> searchMap = new HashMap<String, String>();
	
	String id = util.nullCheck(request.getParameter("id"));     
	bmListDao = bmAction.getBusinessMatching(id);
	
	String org_co_name = bmListDao.getString(0, "org_co_name");
	String reporter_name = bmListDao.getString(0, "reporter_name");
	String content = bmListDao.getString(0, "content");
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
		
		<% String topAndLefMenu = "0104"; %>
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
				<em>Trang chủ </em> &#62;
				<em>Dịch vụ kết nối kinh doanh </em> &#62; 
				<em class="on">Thành công</em>
			</div>
			<h3 class="title">Thành công</h3>
						
			<div class="tableBMSview">
				<table summary="Success stories Table">
					<caption>Success storiess Table</caption>
					<colgroup>
						<col width="20%">
						<col width="80%">
					</colgroup>
					<thead>
						<tr>
							<th colspan="2"><a href="#none">Take a Benefit of Free Business Matching Service</a></th>
						</tr>
					</thead>
					<tbody>
						<tr class="viewInfo">
							<th>Company</th>
							<td><%=org_co_name %></td>
						</tr>
						<tr class="viewInfo">
							<th>Buyer Name</th>
							<td><%=reporter_name %></td>
						</tr>
						<tr class="last">
							<td colspan="2">
								<div>
								<%=content %>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="buttonLR">
				<span class="button btnColor2 btnSize3"><a href="SuccessStoriesList.jsp">List</a></span>
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