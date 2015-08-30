<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.HashMap,
			com.ec21.common.MpUnspscAction,
			com.ec21.product.VnFeaturedProdAction,
			com.ec21.board.VnNewsBoardAction,
			com.ec21.directory.VnExpDirectoryAction,
			com.ec21.expand_comp.VnExpandCompAction,
			com.ec21.community.VnCommunityAction,
			com.ec21.common.Dao,
			com.ec21.util.Utility"
%><%
MpUnspscAction muAction = MpUnspscAction.getInstance();
VnFeaturedProdAction vfpAction = VnFeaturedProdAction.getInstance();
VnNewsBoardAction vnbAction = VnNewsBoardAction.getInstance();
VnExpDirectoryAction vedAction = VnExpDirectoryAction.getInstance();
VnExpandCompAction vecAction = VnExpandCompAction.getInstance();
VnCommunityAction vncAction = VnCommunityAction.getInstance();
Utility util = Utility.getInstance();

Dao muDao = new Dao();  // Category
Dao vfpDao = new Dao(); // Featured Product
Dao vnbDao = new Dao(); // News & Noticee
Dao vnbDaoIN = new Dao(); // Korea Industry News
Dao vedDao = new Dao(); // Korean Exporters
Dao vecDao = new Dao(); // Korean Companies in VN
Dao vncDao = new Dao(); // Business Community

HashMap<String, String> searchMap = new HashMap<String, String>();
searchMap.put("searchType", "");
searchMap.put("searchData", "");
searchMap.put("searchType2", "");
searchMap.put("searchData2", "");
searchMap.put("searchCate", "");

muDao = muAction.getMpUnspsc(); // 카테고리 정보
vfpDao = vfpAction.getMainFeaturedProdList();
vedDao = vedAction.getExpDirectoryList(1, 6, searchMap);
vecDao = vecAction.getExpandCompList(1, 6, searchMap);
vncDao = vncAction.getCommunityList(1, 5, searchMap);
searchMap.put("newsType", "IN");
vnbDaoIN = vnbAction.getNewsList(1, 2, searchMap);

searchMap.put("newsType", "NN");
searchMap.put("searchType", "LIST_IMAGE");
searchMap.put("searchData", "2");
vnbDao = vnbAction.getNewsList(1, 2, searchMap);


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>Gobiz Country Channel</title>
<link rel="stylesheet" type="text/css" href="/css/common.css" />
<!--[if IE 6]>
<link rel="stylesheet" type="text/css" href="/css/ie6.css" />
<![endif]-->
<!--[if IE 7.0]>
<link rel="stylesheet" type="text/css" href="/css/ie7.css" />
<![endif]-->
<script type="text/javascript" src="/js/jquery-1.6.4.min.js"></script>
<script type="text/javascript" src="/js/ui.js"></script>
<script type="text/javascript" src="/js/filestyle.js"></script>
</head>
<body>
	<% String topAndLefMenu = "0000"; %>
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Head -->
		<div id="head">
			<h1>
				<a href="#none" title="Gobizkorea.com Việt Nam">Gobizkorea.com Việt Nam</a>
			</h1>
			<ul id="login">
				<li><a href="#none" title="Sign In">Sign In</a></li>
				<li class="last"><a href="#none" title="Join Free">Join Free</a></li>
			</ul>
			<ul id="languageMenu">
				<li><a href="#none" title="English">English</a></li>
				<li class="ch"><a href="#none" title="中文">中文</a></li>
				<li class="ko"><a href="#none" title="한글">한글</a></li>
			</ul>
			<ul id="sns">
				<li class="fb"><a href="http://www.facebook.com/sbcGOBIZ" target="_blank" title="FaceBook">FaceBook</a></li>
				<li class="tw"><a href="http://twitter.com/#!/sbcgobiz" target="_blank" title="Twitter">Twitter</a></li>
				<li class="ln"><a href="http://kr.linkedin.com/in/gobizkorea" target="_blank" title="LinkedIn">LinkedIn</a></li>
				<li class="yb"><a href="http://www.youtube.com/gobizkorea/" target="_blank" title="YouTube">YouTube</a></li>
			</ul>
			<!-- GNB -->
			<ul id="gnb">
				<li><a href="#none" title="Dịch vụ kết nối kinh doanh">Dịch vụ kết nối kinh doanh</a></li>
				<li><a href="#none" title="Sản phẩm">Sản phẩm</a></li>
				<li><a href="#none" title="Hội thảo qua Video">Hội thảo qua Video</a></li>
				<li><a href="#none" title="Sự kiện">Sự kiện</a></li>
				<li><a href="#none" title="Thông tin hữu ích">Thông tin hữu ích</a></li>
				<li><a href="#none" title="Hướng dẫn">Hướng dẫn</a></li>
				<li class="last"><a href="#none" title="Trang của tôi">Trang của tôi</a></li>
			</ul>
			<!-- //GNB -->
		</div>
		<!-- //Head -->
		<!-- Categories -->
		<div id="categori">

			<dl class="frist">
				<dt>Chuyên mục chính</dt>
				<dd class="frist"><a href="#none">Sản xuất linh kiện (<em>34</em>)</a></dd>
				<dd><a href="#none">Sản xuất máy móc (<em>58</em>)</a></dd>
				<dd><a href="#none">Thiết bị thí nghiệm (<em>62</em>)</a></dd>
				<dd><a href="#none">Thiết bị xây dựng (<em>38</em>)</a></dd>
				<dd><a href="#none">Thiết bị CNTT, Viễn thông (<em>43</em>)</a></dd>
				<dd><a href="#none">Hệ thống phân phối (<em>88</em>)</a></dd>
				<dd><a href="#none">Thiết bị giáo dục và giải trí (<em>124</em>)</a></dd>
				<dd><a href="#none">Thiết bị điện, chiếu sáng (<em>33</em>)</a></dd>
				<dd><a href="#none">May mặc, hành lý, Thiết bị chăm sóc cá nhân (<em>56</em>)</a></dd>
				<dd class="last"><a href="#none">Thực phẩm, đồ uống, thuốc lá (<em>120</em>)</a></dd>
			</dl>

			<dl>
				<dt>Tất cả danh mục</dt>
				<% for(int i=0,j=muDao.getRowCnt(); i<j && i<=25; i++) { %>
				<dd <%= i==0? "class=frist":(i==25? "class=last":"") %>><a href="/productCategory.do?unspsc=<%= muDao.getString(i, "UNSPSC") %>"><%= muDao.getString(i, "VN_TITLE") %></a></dd><% } %>
			</dl>

			<ul>
				<li><a href="#none" title="Chuyến công tác tới Hàn Quốc"><img src="../images/tmp/tmp_banner_01.gif" alt="Chuyến công tác tới Hàn Quốc"></a></li>
				<li><a href="#none" title="Hallyu vui vẻ Làn sóng Hàn Quốc"><img src="../images/tmp/tmp_banner_02.gif" alt="Hallyu vui vẻ Làn sóng Hàn Quốc"></a></li>
				<li><a href="#none" title="Chào mừng đến với GobizKorea"><img src="../images/tmp/tmp_banner_03.gif" alt="Chào mừng đến với GobizKorea"></a></li>
				<li><a href="#none" title="AAPEX"><img src="../images/tmp/tmp_banner_04.gif" alt="AAPEX"></a></li>
			</ul>

		</div>
		<!-- //Categories -->

		<!-- Contents -->
		<div id="contents">

			<!-- SearchBar -->
			<div id="searchBox">
				<form name="searchForm" action="#" method="post">
				<div class="categoriSelecter">
					<select class="FakeSelect" name="" >
						<option value="">Chuyên mục</option>
						<%
						for(int i=0,j=muDao.getRowCnt(); i<j; i++)
						{
						%>
						<option value="<%= muDao.getString(i, "UNSPSC") %>"><%= muDao.getString(i, "ETITLE") %></option>
						<%
						}
						%>
					</select>
				</div>
				<div class="searchForm">
					<input type="text" value="Tìm kiếm nhà cung cấp phù hợp tại Hàn Quốc" class="searchInput"/>
					<a href="#none"><span class="searchBtn">Tìm kiếm</span></a>
					<a href="#none"><span class="plusBtn">Tìm kiếm nâng cao</span></a>
				</div>
				</form>

				<!--ul>
					<li class="titleTopic">Hot Keyword :</li>
					<li><a href="#none">fertilizer</a></li>
					<li><a href="#none">- centrifugal fans</a></li>
					<li><a href="#none">- sodium hydrogen carbonate</a></li>
					<li><a href="#none">- pet chip</a></li>
					<li><a href="#none">- uk plug</a></li>
					<li><a href="#none">- drilling rig</a></li>
					<li><a href="#none">- carbon black</a></li>
				</ul-->
			</div>
			<!-- //SearchBar -->

			<!-- VN info -->
			<div class="quickTapMenu">
				<ul class="rollimg">
					<li><a href="#none"><img src="../images/banner/banner01.jpg" alt="Kênh GobizKorea Vietnam là gì"></a></li>
					<li><a href="#none"><img src="../images/banner/banner02.jpg" alt="Kênh GobizKorea Vietnam là gì"></a></li>
					<li><a href="#none"><img src="../images/banner/banner03.jpg" alt="Kênh GobizKorea Vietnam là gì"></a></li>
					<li><a href="#none"><img src="../images/banner/banner04.jpg" alt="Kênh GobizKorea Vietnam là gì"></a></li>
				</ul>
				<ul class="rollBtn">
					<li class="on"><a href="#none">GobizKorea Việt Nam</a></li>
					<li><a href="#none">Dịch vụ kết nối kinh doanh</a></li>
					<li><a href="#none">Chương trình hỗ trợ khách hàng</a></li>
					<li class="last"><a href="#none">Hội thảo qua Video về thương mại điện tử</a></li>
				</ul>
			</div>
			<!-- //VN info -->
			<div class="bannerIndex"><a href="#none"><img src="../images/banner/banner_index.gif" alt="Dịch vụ kết nối kinh doanh"></a></div>

			<!-- Product Rolling Box-->
			<div class="rollBox">
				<div class="rollBoxTitle">
					<h3>Sản phẩm chính</h3>
					<a href="#none">Xem thêm</a>
				</div>
				<div class="rollBoxItem">
					<div class="BtnLeft"><a href="#none"><img src="../images/btn/btn_roll_left.gif" alt="more Profuct"></a></div>
					<div  class="rollBoxItemDetail">
						<div class="viewBoxIndex">
						<ul class="tab1">
						<% for(int i=0; i<20; i++) { %>
						<%= i>0 && i%10==0 ? "</ul><ul class='tab2'>":"" %>
						<% if(i<vfpDao.getRowCnt()){ %>
						<li<%= i>0 && (i+1)%5==0 ? " class='last'":"" %>><a href="<%= vfpDao.getString(i, "URL") %>" target="_blank"><img src="/images/products/<%=vfpDao.getInt(i, "GESI_NO")%>/<%= vfpDao.getString(i, "IMAGE") %>" alt="Product" width="117" height="117"><em><%= vfpDao.getString(i, "PROD_NM") %></em></a></li>
						<% } else { %>
						<li<%= i>0 && (i+1)%5==0 ? " class='last'":"" %>></li>
						<% } %>
						<% } %>
						</div>
						</div>
					<div class="BtnRight"><a href="#none"><img src="../images/btn/btn_roll_right.gif" alt="more Profuct"></a></div>
				</div>
			</div>
			<script type="text/javascript">
			//	indexR();
			</script>
			<!-- //Product Rolling Box-->

			<!-- NoticeBox -->
			<div class="noticeBox">

				<div class="left">
					<h4>
					Tin tức &#38; Thông báo
					<a href="/UsefulInformation/NewsAndNoticeList.jsp">Xem thêm</a>
					</h4>
					<ul>
					<% for(int i=0,j=vnbDao.getRowCnt(); i<j && i<2; i++) { %>
						<li <%= i>0 && (i+1)%2==0 ? " class='last'":"" %> style="height:75px;">
							<img src="/images/boards/<%= vnbDao.getString(i, "LIST_IMAGE") %>" width="79" height="79" alt="thumbnail IMG" >
							<a href="/UsefulInformation/NewsAndNoticeView.jsp?newsNo=<%= vnbDao.getString(i, "NEWS_NO") %>">
								<strong><%= vnbDao.getString(i, "TITLE") %></strong><br>
								<%= vnbDao.getString(i, "SUMMARY").length()>120? vnbDao.getString(i, "SUMMARY").substring(0, 120)+"..": vnbDao.getString(i, "SUMMARY") %>
							</a>
						</li>
						<% } %>
					</ul>
				</div>
				<div class="right">
					<h4>
					Tin tức ngành Công nghiệp Hàn Quốc
					<a href="/UsefulInformation/IndustryNewsList.jsp">Xem thêm</a>
					</h4>
					<ul>
						<% for(int i=0,j=vnbDaoIN.getRowCnt(); i<j && i<2; i++) { %>
						<li <%= i>0 && (i+1)%2==0 ? " class='last'":"" %> style="height:75px;">
							<a href="/UsefulInformation/IndustryNewsView.jsp?newsNo=<%= vnbDaoIN.getString(i, "NEWS_NO") %>">
								<strong><%= vnbDaoIN.getString(i, "TITLE") %></strong><br>
								<%= vnbDaoIN.getString(i, "SUMMARY").length()>220? vnbDaoIN.getString(i, "SUMMARY").substring(0, 220)+"..": vnbDaoIN.getString(i, "SUMMARY") %>
							</a>
						</li>
						<% } %>
					</ul>
				</div>
			</div>
			<!-- //NoticeBox -->

			<!-- VN TradeNews -->
			<div class="vnTradeNews">

				<div class="left">
					<h4><b>Phái đoàn</b> Thương mại đến Việt Nam</h4>
					<p>
						<a href="#none" class="img"><img src="../images/tmp/dummry_tradeNews01.gif" alt="Trade Images"></a>
						<a href="#none" class="imgText">
							<strong>Phái đoàn Thương mại SBC 2012 đến Việt Nam</strong><br>
							<em>Trung tâm Hội chợ và Triển lãm Sài Gòn tại TP. Hồ Chí Minh</em><br>
							<u>Từ ngày 10/01 ~ 10/03</u>
						</a>
					</p>
				</div>

				<div class="right">
					<h4><b>Triển lãm</b> Thương mại tại Việt Nam</h4>
					<p>
						<a href="#none" class="img"><img src="../images/tmp/dummry_tradeNews02.gif" alt="Trade Images"></a>
						<a href="#none" class="imgText">
							<strong>Triển lãm Cửa hàng và Nhượng quyền Thương mại Quốc tế tại Việt Nam 2012</strong><br>
							<em>Trung tâm Hội chợ và Triển lãm Sài Gòn tại TP. Hồ Chí Minh</em><br>
							<u>Từ ngày 11/03 ~ 11/05</u>
						</a>
					</p>
				</div>

			</div>
			<!-- // VN TradeNews -->

			<!-- KO TradeNews -->
			<div class="koTradeNews">

				<div class="left">
					<h4>Danh sách các nhà sản xuất Hàn Quốc<a href="/UsefulInformation/koreanExportersList.jsp">Xem thêm</a></h4>
					<ul>
					<% for(int i=0,j=vedDao.getRowCnt(); i<j; i++) { %>
						<li <%= i==(j-1)? "class=last":"" %>><a href="/UsefulInformation/koreanExportersView.jsp?dir_no=<%=vedDao.getInt(i, "DIR_NO")%>"><%=vedDao.getString(i, "COMP_NM").length()>34? vedDao.getString(i, "COMP_NM").substring(0, 34)+"..":vedDao.getString(i, "COMP_NM")  %></a><% if(!"".equals(vedDao.getString(i, "GOBIZ_ID"))){ %><a href="http://eblog.gobizkorea.com/<%=vedDao.getString(i, "GOBIZ_ID")%>" target="_blank" class="eblog" title="e-Blog">e-blog</a><% } %><% } %>
					</ul>
				</div>

				<div class="right">
					<h4>Các Công ty Hàn Quốc tại Việt Nam<a href="/UsefulInformation/koreanCompaniesInVNList.jsp">Xem thêm</a></h4>
					<ul>
					<% for(int i=0,j=vecDao.getRowCnt(); i<j; i++) { %>
						<li <%= i==(j-1)? "class=last":"" %>><a href="/UsefulInformation/koreanCompaniesInVNView.jsp?exp_no=<%=vecDao.getInt(i, "EXP_NO")%>" class="link"><%=vecDao.getString(i, "COMP_NM").length()>26? vecDao.getString(i, "COMP_NM").substring(0, 26)+"..":vecDao.getString(i, "COMP_NM")%></a><em><%=vecDao.getString(i, "LOCAL_AREA")%></em><% if(!"".equals(vecDao.getString(i, "GOBIZ_ID"))){ %><a href="http://eblog.gobizkorea.com/<%=vecDao.getString(i, "GOBIZ_ID")%>" target="_blank" class="eblog" title="e-Blog">e-blog</a><% } %><% } %>
					</ul>
				</div>

			</div>
			<!-- //KO TradeNews -->


			<!-- BizCommunication -->
			<div class="bizCom">
				<h4>Cộng đồng doanh nghiệp<a href="/UsefulInformation/CommunityList.jsp">Xem thêm</a></h4>
				<div class="bizComDetail">
					<table summary="BizCommunication">
						<caption>Cộng đồng doanh nghiệp</caption>
						<colgroup>
							<col width="*">
							<col width="12%">
							<col width="13%">
							<col width="10%">
							<col width="10%">
						</colgroup>
						<thead>
							<tr>
								<th>Chủ đề</th>
								<th>Tác giả</th>
								<th class="Tcenter">Bài mới</th>
								<th>Phản hồi</th>
								<th>Số lần xem</th>
							</tr>
						</thead>
						<tbody>
							<% for(int i=0,j=vncDao.getRowCnt(); i<j; i++) { %>
						<tr>
								<td><a href="/UsefulInformation/CommunityView.jsp?comNo=<%= vncDao.getInt(i, "COM_NO") %>"><%= vncDao.getString(i, "TITLE") %></a></td>
								<td><%= vncDao.getString(i, "WRITER") %></td>
								<td class="Tcenter"><%= util.getDate(vncDao.getString(i, "INPUT_DT"), "YYYY-MM-DD") %></td>
								<td class="Tcenter"><%= vncDao.getString(i, "REPLY") %></td>
								<td class="Tcenter"><%= vncDao.getString(i, "READ_CNT") %></td>
							</tr>
						<% } %>
						</tbody>
					</table>
				</div>
			</div>
			<!-- //BizCommunication -->

			<div class="IndexBanner">
				<ul>
					<li><a href="#none"><img src="../images/tmp/bannerIndex_04.gif" alt="Small Business Corporation"></a></li>
					<li><a href="#none"><img src="../images/tmp/bannerIndex_01.gif" alt="Thông tin hữu ích về Hàn Quốc"></a></li>
					<li><a href="#none"><img src="../images/tmp/bannerIndex_02.gif" alt="Dynamic KOREA"></a></li>
					<li class="last"><a href="#none"><img src="../images/tmp/bannerIndex_03.gif" alt="GEP"></a></li>
				</ul>
			</div>

		</div>
		<!-- Contents -->

		<!-- Footer -->
		<%@include file="/include/footerMenu.jsp" %>
		<!-- //Footer -->
	</div>
	<!-- //Wrapper -->
	<script type="text/javascript" src="/js/function_index.js"></script>
</body>
</html>