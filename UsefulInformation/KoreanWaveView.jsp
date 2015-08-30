<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.HashMap,
			com.ec21.board.VnNewsBoardAction,
			com.ec21.common.Dao,
			com.ec21.util.Utility"
%><%
VnNewsBoardAction vnbAction = VnNewsBoardAction.getInstance();
Utility util = Utility.getInstance();

Dao vnbDao = new Dao();
HashMap<String, String> searchMap = new HashMap<String, String>();

int pageNum = util.getPageNum(util.getInt(request.getParameter("pageNum")));
int newsNo = util.getInt(request.getParameter("newsNo"));
String newsType = "WN"; //Korean Wave News

vnbDao = vnbAction.getNews(newsType, newsNo);
vnbAction.updateBoardReadCnt(newsType, newsNo); // 조회수 증가

String writer       = util.nullCheck(vnbDao.getString(0, "WRITER"));
String title        = util.nullCheck(vnbDao.getString(0, "TITLE"));
String inputDt      = util.nullCheck(vnbDao.getString(0, "INPUT_DT"));
String contents     = util.nullCheck(vnbDao.getString(0, "CONTENTS"));
String summary      = util.nullCheck(vnbDao.getString(0, "SUMMARY"));
String listImage    = util.nullCheck(vnbDao.getString(0, "LIST_IMAGE"));
String orgListImage = util.nullCheck(vnbDao.getString(0, "ORG_LIST_IMAGE"));
String attFile      = util.nullCheck(vnbDao.getString(0, "ATT_FILE"));
String orgAttFile   = util.nullCheck(vnbDao.getString(0, "ORG_ATT_FILE"));
String readCnt      = util.nullCheck(vnbDao.getString(0, "READ_CNT"));

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
<body>
	<% String topAndLefMenu = "0507"; %>
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Head -->
		<% String action = "NewAndNoticeList.jsp"; %>
		<%@include file="../include/topMenu.jsp" %>
		<!-- //Head -->
		<!-- LNB -->
		<%@include file="../include/leftMenu.jsp" %>
		<!-- //LNB -->
		<!-- Contents -->
		<div id="contents">
			<div class="bannerIndex"><a href="#none"><img src="../images/banner/banner_index.gif" alt="Dịch vụ kết nối kinh doanh"></a></div>
			<div class="location">
				<em>Home</em> &#62;
				<em>Getting to Korea </em> &#62;
				<em class="on">Korean Wave News</em>
			</div>
			<h3 class="title">Korean Wave News</h3>

			<div class="tableType1">
				<table summary="Korean Wave News">
					<caption>Korean Wave News</caption>
					<colgroup>
						<col width="10%">
						<col width="*">
						<col width="10%">
						<col width="13%">
						<col width="10%">
						<col width="12%">
					</colgroup>
					<tbody>
						<tr  class="lineR">
							<th>No.</th>
							<td colspan="5" class="last"><%=title%></td>
						</tr>
						<tr class="lineR">
							<th>File</th>
							<td><a href="javascript:fileDownload('<%=orgAttFile%>', '/files/<%=attFile%>');" style="text-decoration: underline;"><%=orgAttFile%></a></td>
							<th>Date</th>
							<td><%=util.getDate(inputDt, "YYYY-MM-DD")%></td>
							<th>Hit</th>
							<td class="last	"><%=readCnt%></td>
						</tr>
						<tr>
							<td colspan="6">
								<div class="textViewType1"><%=contents%></div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="buttonLR">
				<span class="button btnColor3 btnSize3"><a href="KoreanWaveList.jsp?pageNum=<%=pageNum%>">List</a></span>
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