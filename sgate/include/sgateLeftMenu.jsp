<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%><%
/**
 *leftMenu
 *
 *- 01 : Featured Products
 *- 02 : 게시판 관리
 *-- 0201 : News & Notice
 *-- 0202 : Korea Industry News
 *-- 0203 : Korean Exporters
 *-- 0204 : Korean Companies in VN
 *-- 0205 : Business Community
 *-- 0206 : Korean Wave 뉴스
 *-- 0207 : contact us 관리
 */

String tempLeftMenu = leftMenu.substring(0, 2);

%>		<div class="lnb">
			<h1><img src="../../sgate/images/icon/icon_logo.gif" alt="베트남 온라인무역관 관리자시스템"/></h1>
			<ul>
				<li class="frist"><a href="../products/featuredProductsList.jsp"><img src="../../sgate/images/btn/btn_lnb01_<%if("01".equals(tempLeftMenu)){%>on<%}else{%>off<%}%>.png" alt="Featured Products" class="png24"/></a></li>
				<li>
					<a href="../board/newsAndNoticeList.jsp"><img src="../../sgate/images/btn/btn_lnb02_<%if("02".equals(tempLeftMenu)){%>on<%}else{%>off<%}%>.png" alt="게시판 관리" class="png24"/></a>
					<ul>
						<li <%if("0201".equals(leftMenu)){%>class="on"<%}%>><a href="../board/newsAndNoticeList.jsp" >News &#38; Notice</a></li>
						<li <%if("0202".equals(leftMenu)){%>class="on"<%}%>><a href="../board/koreaIndustryNewsList.jsp">Korea Industry News</a></li>
						<li <%if("0203".equals(leftMenu)){%>class="on"<%}%>><a href="../directory/koreanExportersList.jsp">Korean Exporters Directory</a></li>
						<li <%if("0204".equals(leftMenu)){%>class="on"<%}%>><a href="../expand_comp/koreanCompaniesInVNList.jsp">Korean Companies in VN</a></li>
						<li <%if("0205".equals(leftMenu)){%>class="on"<%}%>><a href="../community/businessCommunityList.jsp">Business Community</a></li>
						<li <%if("0206".equals(leftMenu)){%>class="on"<%}%>><a href="../board/koreanWaveNewsList.jsp">Korean Wave 뉴스</a></li>
						<li <%if("0207".equals(leftMenu)){%>class="on"<%}%>><a href="../contact_us/contactUsList.jsp">Contact Us 관리</a></li>
					</ul>
				</li>
			</ul>
		</div>