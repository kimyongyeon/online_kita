<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.HashMap,
			com.ec21.BusinessMatching.BusinessMatchingAction,
			com.ec21.common.Dao,
			com.ec21.util.Utility"
%>
<%
	BusinessMatchingAction bmAction = BusinessMatchingAction.getInstance();
	Utility util = Utility.getInstance();

	Dao bmListDao = new Dao();
	
	int pageNum = util.getPageNum(util.getInt(request.getParameter("pageNum")));
	int totalCount = 0;
	int rowCnt = 10;
	
	HashMap<String, String> searchMap = new HashMap<String, String>();
	
	totalCount = bmAction.getBusinessMatchingListTotalCount(searchMap); //리스트 총 갯수
	bmListDao = bmAction.getBusinessMatchingList(pageNum, rowCnt, searchMap); // 리스트 정보
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
	<meta name="description" content="" >
	<meta name="keywords" content="" >
	<title>Gobizkorea.com Việt Nam</title>
	<link rel="stylesheet" type="text/css" href="../css/common.css" >
	<%@include file="../include/commonCss.jsp" %>
	<%@include file="../include/commonJs.jsp" %>
	
	<script type="text/javascript">
		function goPage(pageNum)
		{
			$('input[name=pageNum]').val(pageNum);
			formSubmit('dataSsForm');
		}
	</script>
	
</head>
<body id="subSelectCheck">
	<form name="dataSsForm" action="SuccessStoriesList.jsp" method="post">
		<input type="hidden" name="pageNum" value="<%=pageNum%>"/>
	</form>
	<!-- Wrapper -->
	<div id="wrapper">
		<% String topAndLefMenu = "0104"; %>
		<% String action = ""; %>
		<!-- Head -->
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
				<em>Dịch vụ kết nối kinh doanh </em> &#62; 
				<em class="on">Thành công</em>
			</div>
			<h3 class="title">Thành công</h3>
			<div class="msg type1">
				Tìm hiểu về thành công của người mua nhờ sự hỗ trợ của GobizKOREA.com.
			</div>
			
			<!-- Table Info -->
			<div class="tableInfo">
				<div>
					<strong>Tổng số  :&nbsp;<em>4,500</em></strong>
					<span>trang &nbsp;(<em>1/222</em>)</span>
				</div>
			</div>
			<!-- //Table Info -->
			
			<div class="tableBMS">
				<table summary="Success stories Table">
					<caption>Success storiess Table</caption>
					<colgroup>
						<col width="12%">
						<col width="*">
						<col width="23%">
					</colgroup>
					<thead>
						<tr>
							<th>No</th>
							<th>Title</th>
							<th>Company</th>
						</tr>
					</thead>
					<tbody>
						<%
						if(bmListDao.getRowCnt() < 1)
						{
						%>
							<tr>
								<td colspan="5">No Data.</td>
							</tr>
						<%
						}
						else
						{
							for(int i=0,j=bmListDao.getRowCnt(); i<j; i++)
							{
								int num = totalCount + rowCnt - (rowCnt * pageNum + i);
								int id = bmListDao.getInt(i, "ID"); 					
								String title = bmListDao.getString(i, "TITLE"); 				
								String org_co_name = bmListDao.getString(i, "ORG_CO_NAME"); 	
								title = (title.length() > 30) ? title = title.substring(0,20) + "..." : title;
								
							%>
							<tr>
								<td><%=num%></td>
								<td class="left"><a href="SuccessStoriesView.jsp?id=<%=id%>"><%=title%></a></td>
								<td><%=org_co_name%></td>
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