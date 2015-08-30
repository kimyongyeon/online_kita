<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.HashMap,
			com.ec21.board.VnNewsBoardAction,
			com.ec21.common.Dao,
			com.ec21.util.Utility"
%><%
VnNewsBoardAction vnbAction = VnNewsBoardAction.getInstance();
Utility util = Utility.getInstance();

Dao vnbListDao = new Dao();

HashMap<String, String> searchMap = new HashMap<String, String>();

int pageNum = util.getPageNum(util.getInt(request.getParameter("pageNum")));
int totalCount = 0;
int rowCnt = 10;

String searchType = util.nullCheck(request.getParameter("searchType"));
String searchData = util.nullCheck(request.getParameter("searchData"));

searchMap.put("newsType", "IN"); //Korea Industry News
searchMap.put("searchType", searchType);
searchMap.put("searchData", searchData);

totalCount = vnbAction.getNewsListTotalCount(searchMap); //리스트 총 갯수
vnbListDao = vnbAction.getNewsList(pageNum, rowCnt, searchMap); // 리스트 정보

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

function goPage(pageNum)
{
	$('input[name=pageNum]').val(pageNum);
	formSubmit('searchForm');
}
</script>
</head>
<body>
	<% String topAndLefMenu = "0502"; %>
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
				<em class="on">Korea Industry News</em>			</div>
			<h3 class="title">Korea Industry News</h3>
			<div class="tableType3">
				<table summary="Korea Industry News">
					<caption>Korea Industry News</caption>
					<colgroup>
						<col width="12%">
						<col width="*">
						<col width="12%">
						<col width="12%">
					</colgroup>
					<thead>
						<tr>
							<th>No.</th>
							<th>Title</th>
							<th>Date</th>
							<th>Hit</th>
						</tr>
					</thead>
					<tbody>
					<%
					if(vnbListDao.getRowCnt() < 1)
					{
					%>
						<tr>
							<td colspan="4">No Data.</td>
						</tr>
					<%
					}
					else
					{
						for(int i=0,j=vnbListDao.getRowCnt(); i<j; i++)
						{
						%>
						<tr>
							<td><%=totalCount + rowCnt - (rowCnt * pageNum + i)%></td>
							<td class="left"><a href="IndustryNewsView.jsp?newsNo=<%=vnbListDao.getInt(i, "NEWS_NO")%>&pageNum=<%=pageNum%>"><%=vnbListDao.getString(i, "TITLE")%></a></td>
							<td><%=util.getDate(vnbListDao.getString(i, "INPUT_DT"), "YYYY-MM-DD")%></td>
							<td><%=vnbListDao.getString(i, "READ_CNT")%></td>
						</tr>
						<%
						}
					}
					%>
					</tbody>
				</table>
			</div>
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
</body>
</html>