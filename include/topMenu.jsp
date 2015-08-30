<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%>
<%
/**
 * Top Menu List
 * 순번 : 메뉴명
 *-- 01 : Dịch vụ kết nối kinh doanh
 *-- 02 : Sản phẩm
 *-- 03 : Hội thảo qua Video
 *-- 04 : Sự kiện
 *-- 05 : Thông tin hữu ích
 *-- 06 : Hướng dẫn
 *-- 07 : Trang của tôi
 */
String topMenu = topAndLefMenu.substring(0, 2);
%><div id="head" class="subHead">
	<h1>
		<a href="http://vn.gobizkorea.com" title="Gobizkorea.com Việt Nam">Gobizkorea.com Việt Nam</a>
	</h1>
	<ul id="login">
		<li><a href="#none" title="Sign In">Sign In</a></li>
		<li class="last"><a href="#none" title="Join Free">Join Free</a></li>
	</ul>
	<ul id="languageMenu">
		<li><a href="http://www.gobizkorea.com" title="English">English</a></li>
		<li class="ch"><a href="http://cn.gobizkorea.com" title="中文">中文</a></li>
		<li class="ko"><a href="http://kr.gobizkorea.com" title="한글">한글</a></li>
	</ul>
	<ul id="sns">
		<li class="fb"><a href="http://www.facebook.com/sbcGOBIZ" target="_blank" title="FaceBook">FaceBook</a></li>
		<li class="tw"><a href="http://twitter.com/#!/sbcgobiz" target="_blank" title="Twitter">Twitter</a></li>
		<li class="ln"><a href="http://kr.linkedin.com/in/gobizkorea" target="_blank" title="LinkedIn">LinkedIn</a></li>
		<li class="yb"><a href="http://www.youtube.com/gobizkorea/" target="_blank" title="YouTube">YouTube</a></li>
	</ul>
	<!-- GNB -->
	<ul id="gnbTypeSub">
		<li <%if("01".equals(topMenu)){%>class="on"<%}%>><a href="/BusinessMatching/MachingServiceInfo.jsp" title="Dịch vụ kết nối kinh doanh">Dịch vụ kết nối kinh doanh</a></li>
		<li <%if("02".equals(topMenu)){%>class="on"<%}%>><a href="/products/CategoryList.jsp" title="Sản phẩm">Sản phẩm</a></li>
		<li <%if("03".equals(topMenu)){%>class="on"<%}%>><a href="/VideoMeeting/About.jsp" title="Hội thảo qua Video">Hội thảo qua Video</a></li>
		<li <%if("04".equals(topMenu)){%>class="on"<%}%>><a href="/LocalEvent/TradeMission.jsp" title="Sự kiện">Sự kiện</a></li>
		<li <%if("05".equals(topMenu)){%>class="on"<%}%>><a href="/UsefulInformation/NewsAndNoticeList.jsp" title="Thông tin hữu ích">Thông tin hữu ích</a></li>
		<li <%if("06".equals(topMenu)){%>class="on"<%}%>><a href="/Guide/OverView.jsp" title="Hướng dẫn">Hướng dẫn</a></li>
		<li class="last<%if("07".equals(topMenu)){%> on<%}%>"><a href="#none" title="Trang chủ">Trang của tôi</a></li>
	</ul>
	<!-- //GNB -->
	<!-- Search -->
	<div class="subSearch">
		<form name="searchForm" action="<%=action%>">
			<input type="hidden" name="pageNum" value="<%=util.getPageNum(util.getInt(request.getParameter("pageNum")))%>"/>
		<div class="categoriSelecter">
			<select class="FakeSelect">
				<option>Chuyên mục</option>
				<option>Apparel, Luggage, Personal Care</option>
				<option>Building, Construction Compo.</option>
				<option>Building, Construction Machinery</option>
				<option>Chemicals and Gas Materials</option>
				<option>Cleaning Equipment</option>
				<option>Distribution Systems</option>
				<option>Domestic Appliances</option>
				<option>Agricultural Equipment</option>
				<option>Apparel, Luggage, Personal Care</option>
				<option>Building, Construction Compo.</option>
				<option>Building, Construction Machinery</option>
				<option>Chemicals and Gas Materials</option>
				<option>Cleaning Equipment</option>
				<option>Distribution Systems</option>
				<option>Domestic Appliances</option>
			</select>
		</div>
		<div class="searchForm">
			<input type="text" value="Tìm kiếm nhà cung cấp phù hợp tại Hàn Quốc" class="searchInput">
			<span class="searchBtn"><a href="#none">Tìm kiếm</a></span>
			<span class="plusBtn"><a href="#none">Tìm kiếm nâng cao</a></span>
		</div>
		</form>
	</div>
	<!-- //Search -->
</div>