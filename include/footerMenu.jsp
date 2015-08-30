<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*, java.text.*"
%><%  
 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy");
 String year = formatter.format(new java.util.Date());
%><div id="footer">
	<div class="banner">
		<script src="../js/partners.js" language="JavaScript" type="text/javascript"></script>
		<ul class="footerBtn">
			<li><a href="#none"><img src="../images/btn/btn_gobizkoreaPartners.gif" alt="GobizKoreaPartners"></a></li>
			<li><a href="#none"><img src="../images/btn/btn_partnershipAPP.gif" alt="PartnershipApplication"></a></li>
		</ul>
		<div class="footerLink">
			<a href="#none">Business Matching Service</a> | <a href="#none">Visitor(Buyer) Assistance Program</a> | <a href="#none">Korean Product</a> | <a href="#none">Online Premier Product Gallery</a><br>
			<a href="#none">TOP 100 KOREAN SUPPLIERS</a> | <a href="#none">Product Promotion Video</a> | <a href="#none">Video Meeting</a> | <a href="#none">Trysumer</a><br>
			<a href="#none">My page</a> | <a href="#none">Go Gobiz</a> | <a href="#none">Contact us</a> | <a href="#none">Sitemap</a>
		</div>
		<address>
			<img src="../images/icon/icon_footerLOGO.gif" alt="Gobizkorea.com">
			<span>Copyright &copy; 1996-<%=year%> SBC(Small &#38; medium Business Corporation), All Rights Reserved.</span>
			<img src="../images/icon/icon_footerSMBA.gif" alt="SMBA">
			<img src="../images/icon/icon_footerSBC.gif" alt="SBC">
		</address>
	</div>
</div>