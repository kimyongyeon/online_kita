<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.HashMap,
			com.ec21.directory.VnExpDirectoryAction,
			com.ec21.common.Dao,
			com.ec21.util.Utility"
%><%
VnExpDirectoryAction vedAction = VnExpDirectoryAction.getInstance();
Utility util = Utility.getInstance();

Dao vedDao = new Dao();

int pageNum = util.getPageNum(util.getInt(request.getParameter("pageNum")));
String searchType = util.nullCheck(request.getParameter("searchType"));
String searchData = util.nullCheck(request.getParameter("searchData"));
String searchCate = util.nullCheck(request.getParameter("searchCate"));


String action = util.nullCheck(request.getParameter("action"));
int dir_no = util.getInt(request.getParameter("dir_no"));

if(!"".equals(dir_no))
	vedDao = vedAction.getExpDirectory(dir_no);

dir_no      = util.getInt(util.nullCheck(vedDao.getString(0, "DIR_NO")));
String comp_nm      = util.nullCheck(vedDao.getString(0, "COMP_NM"));
String addr         = util.nullCheck(vedDao.getString(0, "ADDR"));
String ceo          = util.nullCheck(vedDao.getString(0, "CEO"));
String tel_no       = util.nullCheck(vedDao.getString(0, "TEL_NO"));
String fax_no       = util.nullCheck(vedDao.getString(0, "FAX_NO"));
String web_site     = util.nullCheck(vedDao.getString(0, "WEB_SITE"));
String gobiz_id     = util.nullCheck(vedDao.getString(0, "GOBIZ_ID"));
String category_nm  = util.nullCheck(vedDao.getString(0, "CATEGORY_NM"));



%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>Gobiz Country Channel</title>
<%@include file="../include/commonCss.jsp" %>
<%@include file="../include/commonJs.jsp" %>

<script type="text/javascript">

function goList()
{
	formSubmit('listForm');
}

</script>
</head>
<body>
	<% String topAndLefMenu = "0504"; %>
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Head -->
		<%// String action = ""; //Duplicate local variable action 발생 topMenu Search 부분 수정예정 %>
		<%@include file="../include/topMenu.jsp" %>
		<!-- //Head -->
		<!-- LNB -->
		<%@include file="../include/leftMenu.jsp" %>
		<!-- //LNB -->

		<!-- Contents -->
		<div id="contents">
			<div class="bannerIndex"><a href="#none"><img src="../images/banner/banner_index.gif" alt="Dịch vụ kết nối kinh doanh"></a></div>
			<div class="location">
				<em>Trang chủ  </em> &#62;
				<em>Thông tin hữu ích  </em> &#62;
				<em class="on">Thư mục các nhà xuất khẩu Hàn Quốc</em>
			</div>
			<h3 class="title">Thư mục các nhà xuất khẩu Hàn Quốc</h3>



			<div class="tableTopInfo Type2">
<form name="listForm" action="koreanExportersList.jsp" method="post" >
<input type="hidden" name="action" value="<%=action%>"/>
	<input type="hidden" name="pageNum" value="<%=pageNum%>"/>
	<input type="hidden" name="searchCate" value="<%= searchCate %>"/>
	<input type="hidden" name="searchType" value="<%= searchType %>"/>
	<input type="hidden" name="searchData" value="<%= searchData %>"/>
</form>
				<span class="info"><%= comp_nm %></span>
			</div>

			<div class="TableTopSearch Type2">
				<em class="red">*</em> Source: Kita.net
			</div>

			<div class="tableType1">
				<table summary="Korean Exporters Director">
					<caption>Korean Exporters Director</caption>
					<colgroup>
						<col width="20%">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th>Địa chỉ</th>
							<td><%= addr %></td>
						</tr>
						<tr>
							<th>Quốc gia</th>
							<td><%= ceo %></td>
						</tr>
						<tr>
							<th>ĐT</th>
							<td><%= tel_no %></td>
						</tr>
						<tr>
							<th>FAX</th>
							<td><%= fax_no %></td>
						</tr>
						<tr>
							<th>Website</th>
							<td><a href="<%= web_site.indexOf("://") > 0? web_site : "http://"+web_site  %>" target="_blank"><%= web_site %></a></td>
						</tr>
						<tr>
							<th>e-Blog</th>
							<td><% if(!"".equals(gobiz_id)){ %><span class="button btnColor5 btnSize5"><a href="http://eblog.gobizkorea.com/<%= gobiz_id %>" target="_blank">Truy cập e-Blog</a></span><% } %></td>
						</tr>
						<tr class="last">
							<th>Loại hình</th>
							<td><%= category_nm %></td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="buttonLR">
				<span class="button btnColor3 btnSize3"><a href="javascript:goList();">Danh mục</a></span>
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