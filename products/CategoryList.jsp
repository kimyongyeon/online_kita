<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.ec21.common.Dao,
			com.ec21.common.MpUnspscAction,
			com.ec21.product.VnFeaturedProdAction,
			com.ec21.util.Utility"
%><%
Utility util = Utility.getInstance();
MpUnspscAction muAction = MpUnspscAction.getInstance();
VnFeaturedProdAction vfpAction = VnFeaturedProdAction.getInstance();

Dao muDao = new Dao();  // Category
Dao vfpDao = new Dao();  // Feature Products

String unspsc = util.nullCheck(request.getParameter("unspsc"));

int pageNum = util.getPageNum(util.getInt(request.getParameter("pageNum")));
int totalCount = 0;
int rowCnt = 10;

muDao = muAction.getMpUnspsc(); // 카테고리 정보
vfpDao = vfpAction.getMainFeaturedProdList();

%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	<% String topAndLefMenu = "0201"; %>
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Head -->
		<% String action = "CategoryList.jsp"; %>
		<%@include file="../include/topMenu.jsp" %>
		<!-- //Head -->
		<!-- LNB -->
		<div class="LNBtype">
			<dl class="frist">
				<%
				/*
				Featured Categories
				53	Apparel, Luggage, Personal Care	/ Quần áo, hành lý, đồ dùng cá nhân
				50	Food Beverage, Tobacco          / Thực phẩm, đồ uống, thuốc lá
				12	Chemicals and Gas Materials     / Nguyên liệu hóa chất và khí
				27	Tools, General Machinery        / Công cụ và máy móc thông dụng
				42	Medical Equipment               / Thiết bị y tế
				30	Building, Construction Compo.   / Thiết bị xây dựng và thi công
				43	IT, Telecommunications          / IT, viễn thông
				54	Jewelry, Gemstone               / Đá, đá quý
				49	Sports, Recreational Equipment  / Thiết bị thể thao, giải trí
				39	Electrical, Lighting Components / Thiết bị điện và chiếu sáng
				*/
				%>
				<dt>Chuyên mục chính</dt>
				<dd class="frist"><a href="#none">Quần áo, hành lý, đồ dùng cá nhân</a></dd>
				<dd><a href="#none">Thực phẩm, đồ uống, thuốc lá</a></dd>
				<dd><a href="#none">Nguyên liệu hóa chất và khí</a></dd>
				<dd><a href="#none">Công cụ và máy móc thông dụng</a></dd>
				<dd><a href="#none">Thiết bị y tế</a></dd>
				<dd><a href="#none">Thiết bị xây dựng và thi công</a></dd>
				<dd><a href="#none">IT, viễn thông</a></dd>
				<dd><a href="#none">Đá, đá quý</a></dd>
				<dd><a href="#none">Thiết bị thể thao, giải trí</a></dd>
				<dd class="last"><a href="#none">Thiết bị điện và chiếu sáng</a></dd>
			</dl>
			<dl class="ProductLNB">
				<dt>Tất cả danh mục</dt>
				<%
				for(int i=0,j=muDao.getRowCnt(); i<j && i<=25; i++)
				{
				%>
				<dd <%if(unspsc.equals(muDao.getString(i, "UNSPSC"))){%>class="on"<%}%> <%= i==0 ? "class=frist": (i==25 ? "class=last":"") %>><a href="CategoryList.jsp?unspsc=<%= muDao.getString(i, "UNSPSC") %>"><%= muDao.getString(i, "VN_TITLE") %></a></dd>
				<%
				}
				%>
			</dl>
		</div>
		<!-- //LNB -->

		<!-- Contents -->
		<div id="contents">
			<div class="bannerIndex"><a href="#none"><img src="../images/banner/banner_index.gif" alt="Dịch vụ kết nối kinh doanh"></a></div>
			<div class="location">
				<em>Trang chủ </em> &#62;
				<em>Featured Products</em> &#62;
				<em class="on">Featured Products</em>
			</div>
			<h3 class="title">Featured Products</h3>

			<!-- Featured Products List -->
			<div class="featuredProduct rollBoxItem" style="width:730px;">
				<div class="fpLeft"><a href="#none" class="left "><img src="../images/btn/btn_product_L.gif" alt="left"></a></div>
				<div class="rollBoxItemDetail" style="width:675px;height:324px;margin-left:28px;">
					<div class="viewBoxIndex">
						<%
						for(int i=0,j=vfpDao.getRowCnt(); i<j; i++)
						{
							if(i == 0 || i + 1 == 11)
							{
						%><ul class="tab<%if(i + 1 == 11){%>2<%}else{%>1<%}%>" style="width:685px;margin-left:1px;">
						<%
							}
						%><li>
								<a href="<%=vfpDao.getString(i, "URL")%>" target="_product">
									<img width="117" height="117" src="../images/products/<%=vfpDao.getString(i, "GESI_NO")%>/<%=vfpDao.getString(i, "IMAGE")%>" alt="<%=vfpDao.getString(i, "PROD_NM")%>"/>
									<em style="height:30px;"><%=vfpDao.getString(i, "PROD_NM")%></em>
								</a>
							</li>
						<%
							if(i + 1 == 10 || i + 1 == j)
							{
						%></ul>
						<%
							}
						}
						%>
					</div>
				</div>
				<div class="fpRight"><a href="#none" class="right"><img src="../images/btn/btn_product_R.gif" alt="right"></a></div>
			</div>
			<!-- //Featured Products List -->

			<!-- ProductList Type1 -->
			<h5 class="ProductListTitle">Products</h5>
			<span class="iconSubTitleText">Recently List</span>
			<div class="ProductListType1">
				<div class="top">
					<span class="selectInquiry"><a href="#none">Select to Inquiry</a></span>
					<span>Total:&nbsp;<strong>126,987</strong>/page(<em><strong>1</strong>/4,223</em>)</span>
					<ul>
						<li class="on"><a href="#none" class="btnProLi">List</a></li>
						<li><a href="#none" class="btnProAl">Album</a></li>
						<li>
							<select>
								<option>15</option>
								<option>30</option>
								<option>50</option>
							</select>
							<em>items per page</em>
						</li>
					</ul>
				</div>
				<!-- Type변환:개발시 삭제주석-->
				<div class="ProductListBottomType2">
					<ul>
						<li>
							<div>
								<input type="checkbox" class="check">
								<img src="../images/product/productL01.gif" alt="ProductIMG">
								<div class="detail">
									<h6>Functional insects-Proof Clothes </h6>
									<a href="#none">
									Features - Mosquitos will die just sitting of or grazing against this product.<br>
									- It prevents mosquitos from attacking you and hax both insecticidal and avoiding effects.<br>
									-The dffects lasts for…
									</a>
									<span>TAEYOUNG TEXTILE<em>Featured</em></span>
								</div>
							</div>
							<div class="btnBox">
								<span class="In"><a href="#none">Inquiry</a></span>
								<span class="eM"><a href="#none">eMeeting</a></span>
							</div>
						</li>
						<li>
							<div>
								<input type="checkbox" class="check">
								<img src="../images/product/productL01.gif" alt="ProductIMG">
								<div class="detail">
									<h6>Functional insects-Proof Clothes </h6>
									<a href="#none">
									Features - Mosquitos will die just sitting of or grazing against this product.<br>
									- It prevents mosquitos from attacking you and hax both insecticidal and avoiding effects.<br>
									-The dffects lasts for…
									</a>
									<span>TAEYOUNG TEXTILE<em>Featured</em></span>
								</div>
							</div>
							<div class="btnBox">
								<span class="In"><a href="#none">Inquiry</a></span>
								<span class="eM"><a href="#none">eMeeting</a></span>
							</div>
						</li>
						<li>
							<div>
								<input type="checkbox" class="check">
								<img src="../images/product/productL01.gif" alt="ProductIMG">
								<div class="detail">
									<h6>Functional insects-Proof Clothes </h6>
									<a href="#none">
									Features - Mosquitos will die just sitting of or grazing against this product.<br>
									- It prevents mosquitos from attacking you and hax both insecticidal and avoiding effects.<br>
									-The dffects lasts for…
									</a>
									<span>TAEYOUNG TEXTILE<em>Featured</em></span>
								</div>
							</div>
							<div class="btnBox">
								<span class="In"><a href="#none">Inquiry</a></span>
								<span class="eM"><a href="#none">eMeeting</a></span>
							</div>
						</li>
						<li class="last">
							<div>
								<input type="checkbox" class="check">
								<img src="../images/product/productL01.gif" alt="ProductIMG">
								<div class="detail">
									<h6>Functional insects-Proof Clothes </h6>
									<a href="#none">
									Features - Mosquitos will die just sitting of or grazing against this product.<br>
									- It prevents mosquitos from attacking you and hax both insecticidal and avoiding effects.<br>
									-The dffects lasts for…
									</a>
									<span>TAEYOUNG TEXTILE<em>Featured</em></span>
								</div>
							</div>
							<div class="btnBox">
								<span class="In"><a href="#none">Inquiry</a></span>
								<span class="eM"><a href="#none">eMeeting</a></span>
							</div>
						</li>
					</ul>

				</div>
				<!-- //Type변환:개발시 삭제주석-->
			</div>
			<!-- //ProductList Type1 -->
			<!-- Paging -->
			<%@include file="../include/pageNavi.jsp" %>
			<!-- //paging -->
		</div>
		<!-- //Contents -->
		<!-- Footer -->
		<%@include file="../include/footerMenu.jsp" %>
		<!-- //Footer -->
	</div>
	<!-- //Wrapper -->
	<script type="text/javascript" src="../js/featuredProductsRolling.js"></script>

</body>
</html>