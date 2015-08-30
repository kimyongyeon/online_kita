<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.ec21.util.Utility"
%><%
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
$(document).ready(function(){

});
</script>
</head>
<body id="subSelectCheck">
	<% String topAndLefMenu = "0402"; %>
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Head -->
		<% String action = "TripKoreaAbout.jsp"; %>
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
				<em>Local Events</em> &#62;
				<em class="on">Trade Show</em>
			</div>
			<h3 class="title">Trade Show</h3>

			<div class="TradeShowMSG">
				<p>
				Korean governments and affiliated organizations organize and participate in world-renowned trade shows, and host Korean exhibitions<br>
				in overseas markets to provide many opportunities for Korean companies to meet trustworthy business partners from other countries.
				</p>
				<strong>Check out the trade shows that Korean suppliers are participated in and start your business with Korea!</strong>
			</div>

			<div class="tradeShowTop">
				<img src="../images/banner/bannerTradeShow.gif" alt="Vietnam International Shop + Franchise Show 2011">
				<div>
					<h4>Vietnam International Shop + Franchise Show 2011</h4>
					<span>2011-11-24 ~ 2011-11-30</span>
					<em>Viet nam</em>
				</div>
			</div>
			<div class="tradeMission">
				<h5 class="titleType2">Trade Mission Information</h5>
				<div class="tableType2">
					<table summary="Trade Mission Information Table">
						<caption>Trade Mission Information</caption>
						<colgroup>
							<col width="30%">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th>Event Date(s)</th>
								<td>2011-11-24 ~ 2011-11-30</td>
							</tr>
							<tr>
								<th>Venue</th>
								<td>Saigon Exhibition & Convention Center, Ho Chi Minh City</td>
							</tr>
							<tr>
								<th>Organizer(s)</th>
								<td>Korea International Trade Association(KITA), COEX</td>
							</tr>
							<tr>
								<th>Website</th>
								<td><a href="www.vietsf.com" target="_blank">www.vietsf.com</a></td>
							</tr>
							<tr>
								<th>Products & Services Focus</th>
								<td>General Items</td>
							</tr>
							<tr class="last">
								<th class="VTop">General Information</th>
								<td>
								A Korean Business Delegation organized by Youngin City, Small & Medium Business
								Corporation(SBC) and KOTRA is visiting Viet nam and Cambodia from Nov. 24 ~ 30 for
								purpose of exploring international business opportunities. The delegation consists of
								Korean SMEs looking for initializing business with distinguished companies in the visiting
								countries. The trade meetings are planning to be held in Ho Chi Minh and Phnom Penh during the visit.
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<h5 class="titleType2 second">Korean Participant Information</h5>
				<div class="tableType2">
					<table summary="Korean Participant Information">
						<caption>Korean Participant Information</caption>
						<colgroup>
							<col width="30%">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th>Number of Korean Exhibitors</th>
								<td>10</td>
							</tr>
							<tr class="last">
								<th>Featured Products & Services</th>
								<td>General Items</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="TradeTip">
				If you are interested in the trade mission and the visiting Korean companies, Please contact below for more detailed<br>
				information.
				</div>

				<h5 class="titleType2 second">Contact Information</h5>
				<div class="tableType2">
					<table summary="Contact Information">
						<caption>Contact Information</caption>
						<colgroup>
							<col width="30%">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th>Phone</th>
								<td>Ho Chi Minh : +84-8-3822-3944/3950, Phnon Penh : +855-23-999 099</td>
							</tr>
							<tr>
								<th>Fax</th>
								<td>Ho Chi Minh : +84-8-3822-3941, Phnon Penh : +855-23-211-598</td>
							</tr>
							<tr class="last">
								<th>E-mail</th>
								<td>Ho Chi Minh : kotrasgn@hanmail.net, Phnon Penh : kotrapnh@gmail.com</td>
							</tr>
						</tbody>
					</table>
				</div>

				<ul class="tradeMissionBanner">
					<li><a href="#none"><img src="../images/banner/banner_trade_01.gif" alt="BMS"></a></li>
					<li><a href="#none"><img src="../images/banner/banner_trade_02.gif" alt="VAP"></a></li>
				</ul>

			</div>
			<div class="tradeMissionBottom"></div>

		</div>
		<!-- //Contents -->
		<!-- Footer -->
		<%@include file="../include/footerMenu.jsp" %>
		<!-- //Footer -->
	</div>
	<!-- //Wrapper -->
</body>
</html>