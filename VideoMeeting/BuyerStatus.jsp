<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.ec21.common.Dao,
			com.ec21.videoMeeting.VideoMeetingAction,
			com.ec21.util.Utility"
%><%
Utility util = Utility.getInstance();
VideoMeetingAction vmAction = VideoMeetingAction.getInstance();

Dao bsListDao = new Dao();

int pageNum = util.getPageNum(util.getInt(request.getParameter("pageNum")));
int totalCount = 0;
int rowCnt = 10;

HashMap<String, String> searchMap = new HashMap<String, String>();

String searchType = util.nullCheck(request.getParameter("searchType"));
String searchData = util.nullCheck(request.getParameter("searchData"));

searchMap.put("searchType", searchType);
searchMap.put("searchData", searchData);

totalCount = vmAction.getBuyerStatusTotalCount(searchMap); //리스트 총 갯수
bsListDao = vmAction.getBuyerStatusList(pageNum, rowCnt, searchMap); // 리스트 정보

%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<meta name="description" content="" >
<meta name="keywords" content="" >
<title>Gobizkorea.com Việt Nam</title>
<%@include file="../include/commonCss.jsp" %>
<script type="text/javascript">document.domain = "gobizkorea.com";</script>
<%@include file="../include/commonJs.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
});

function goSearch(){
	var f = document.sForm;

	f.action = "./BuyerStatus.jsp";
	f.method = "post";
	f.submit();
}

function goPage(pageNum)
{
	$('input[name=pageNum]').val(pageNum);
	formSubmit('sForm');
}
</script>
</head>
<body id="subSelectCheck">
	<% String topAndLefMenu = "0303"; %>
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
				<em>Trang chủ </em> &#62;
				<em>Họp Trực tuyến </em> &#62;
				<em class="on">Tình trạng Người mua</em>
			</div>
			<h3 class="title">Tình trạng Người mua</h3>
			<div class="msg2">
				<B>Quý khách có thể kiểm tra tình trạng phù hợp.</B>
				- Nếu quý khách nhìn thấy thông tin chi tiết phù hợp, xin vui lòng kích vào mục gửi.
			</div>
			<form name="sForm" method="post" action="BuyerStatus.jsp">
			<input type="hidden" name="pageNum" value="<%=pageNum%>">
			<div class="my_search_box">
				<select name="searchType" id="searchType">
					<option value="1">Company</option>
					<option value="2">Country</option>
					<option value="3">Buying Products</option>
				</select>
				<input type="text" name="searchData" id="searchData" size="30" value="<%=searchData%>" style="width:225px;">
				<a href="javascript:goSearch();">search</a>
			</div>
			</form>
			<!-- Table Info -->
			<div class="tableInfo">
				<div>
					<strong>Tổng số :&nbsp;<em><%=totalCount%></em></strong>
					<span>Trang &nbsp;(<em><%=pageNum%>/<%=totalCount / rowCnt + 1 %></em>)</span>
				</div>

			</div>
			<!-- //Table Info -->

			<div class="tableBMS">
				<table summary="BMS application status Table">
					<caption>BMS application status Table</caption>
					<colgroup>
						<col width="10%">
						<col width="16%">
						<col width="*">
						<col width="25%">
						<col width="20%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<th>NO</th>
							<th>Company</th>
							<th>Country</th>
							<th>Buying Products</th>
							<th>Available Meeting Date & Time</th>
							<th>Matching Status</th>
						</tr>
					</thead>
					<tbody>
						<%
						for(int i=0,j=bsListDao.getRowCnt(); i<j; i++)
						{
						%>
						<tr>
							<td><%=totalCount + rowCnt - (rowCnt * pageNum + i)%></td>
							<td><%=bsListDao.getString(i, "COMPANY_NM")%></td>
							<td><%=bsListDao.getString(i, "CTR_CD_EN")%></td>
							<td><a href="http://www.gobizkorea.com/evm_buyer_status.do" target="_buyer"><%=bsListDao.getString(i, "EMEMO")%></a></td>
							<td class="date"><%=bsListDao.getString(i, "TALK_DATE")%>&nbsp;<%=bsListDao.getString(i, "TALK_TIME")%></td>
							<td>
								<%

								String bStatus = bsListDao.getString(i, "STATUS");
								String statStyle = "";
								String statText = "";

								if("1".equals(bStatus))
								{
									statStyle = "app";
									statText = "Applied";
								}
								else if("2".equals(bStatus))
								{
									statStyle = "in";
									statText = "In Progress";
								}
								else if("3".equals(bStatus))
								{
									statStyle = "com";
									statText = "Completed";
								}
								else if("4".equals(bStatus))
								{
									statStyle = "in";
									statText = "In Completed";
								}
								else
								{
									statStyle = "app";
									statText = "Applied";
								}
								%>
								<a href="http://www.gobizkorea.com/evm_buyer_status.do" target="_buyer"><span class="bmsStatusIcon <%=statStyle%>"><%=statText%></span></a>
							</td>
						</tr>
						<%
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