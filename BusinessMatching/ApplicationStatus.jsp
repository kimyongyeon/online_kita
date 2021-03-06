<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.HashMap,
			com.ec21.BusinessMatching.BusinessMatchingAction,
			com.ec21.common.Dao,
			com.ec21.util.Utility"
%>
<%
	BusinessMatchingAction bmaAction = BusinessMatchingAction.getInstance();
	Utility util = Utility.getInstance();

	Dao bmaListDao = new Dao();
	HashMap<String, String> searchMap = new HashMap<String, String>();
	
	int pageNum = util.getPageNum(util.getInt(request.getParameter("pageNum")));
	int totalCount = 0;
	int rowCnt = 20;
	
	String searchType = "STATE";
	String state = util.nullCheck(request.getParameter("apply_state"));

	searchMap.put("searchType", searchType);
	searchMap.put("searchData", state);
	
	totalCount = bmaAction.getBmsListTotalCount(searchMap); //리스트 총 갯수
	bmaListDao = bmaAction.getBmsList(pageNum, rowCnt, searchMap); // 리스트 정보
	
	Dao countryList = bmaAction.selectCountry();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
	<meta name="description" content="" >
	<meta name="keywords" content="" >
	<title>Gobizkorea.com Việt Nam</title>
	<%@include file="../include/commonCss.jsp" %>
	<%@include file="../include/commonJs.jsp" %>
	
	<script type="text/javascript">
		function goPage(pageNum)
		{
			$('input[name=pageNum]').val(pageNum);
			formSubmit('dataASForm');
		}
		function topMenu(sel)
		{
			$('input[name=apply_state]').val(sel);
			formSubmit('dataASForm');
		}
	</script>
</head>
<body id="subSelectCheck">
	<!-- Wrapper -->
	<div id="wrapper">
		
		<% String topAndLefMenu = "010202"; %>
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
				<em>Trang chủ  </em> &#62;
				<em>Dịch vụ kết nối kinh doanh </em> &#62; 
				<em>BMS</em> &#62; 
				<em class="on">Đơn đăng ký BMS</em>
			</div>
			<h3 class="title">Đơn đăng ký BMS</h3>

			<!-- Table Info -->
			<div class="tableInfo">
				<div>
					<strong>Total :&nbsp;<em><%=totalCount%></em></strong>
					<span>Page&nbsp;(<em><%=pageNum%>/<% if(totalCount <= rowCnt) out.print("1"); else if(totalCount % rowCnt == 0) out.println(totalCount / rowCnt); else out.print(totalCount / rowCnt + 1);%></em>)</span>
				</div>
				<form name="dataASForm" action="ApplicationStatus.jsp" method="post">
					<input type="hidden" name="pageNum" value="1"/>
					<input type="hidden" name="apply_state" value="<%=state%>"/>
					<ul>
						<li <%if("com".equals(state)){%>class="on"<%}%>><a href="javascript:topMenu('com');">Completed</a></li>
						<li <%if("pro".equals(state)){%>class="on"<%}%>><a href="javascript:topMenu('pro');">In Progress</a></li>
						<li <%if("app".equals(state)){%>class="on"<%}%>><a href="javascript:topMenu('app');">Applied</a></li>
						<li <%if("".equals(state)){%>class="on"<%}%>><a href="javascript:topMenu();">All</a></li>
					</ul>
				</form>
			</div>
			<!-- //Table Info -->
			
			<div class="tableBMS">
				<table summary="BMS application status Table">
					<caption>BMS application status Table</caption>
					<colgroup>
						<col width="12%">
						<col width="12%">
						<col width="*">
						<col width="12%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<th>Applicant</th>
							<th>Country</th>
							<th>Buying Products</th>
							<th>Date</th>
							<th>Status</th>
						</tr>
					</thead>
					<tbody>
					<%
						if(bmaListDao.getRowCnt() < 1)
						{
						%>
							<tr>
								<td colspan="5">No Data.</td>
							</tr>
						<%
						}
						else
						{
							String stat = "";
							String stat_style = "";
							for(int i=0,j=bmaListDao.getRowCnt(); i<j; i++)
							{
								int num = totalCount + rowCnt - (rowCnt * pageNum + i); 					
								int seq = bmaListDao.getInt(i, "SEQ"); 					          			
								
								stat = bmaListDao.getString(i, "STATE"); 										
								if("1".equals(stat)){
									stat = "Applied";
									stat_style = "app";
								}else if("3".equals(stat) || "4".equals(stat)){
									stat = "In Progres";
									stat_style = "in";
								}else if("5".equals(stat) || "6".equals(stat) || "7".equals(stat)){
									stat = "Completed";
									stat_style = "com";
								}else{
									stat = "Applied";	
									stat_style = "app";
								}
								
								String userid = util.strSubLen(bmaListDao.getString(i, "USERID"),3,"***"); 								  // 아이디
								String ctrcd = bmaListDao.getString(i, "CTR_CD");
								for(int k=0; k<countryList.getRowCnt(); k++) {
									if(ctrcd.equals(countryList.getString(k, "CTR_CD"))){
										ctrcd = countryList.getString(k, "NM_EN");
									}
								}
								String keywd1 = bmaListDao.getString(i, "KEYWD1"); 								 
								String input_dt = bmaListDao.getString(i, "indate");
							%>
							<tr>
								<td><%=userid%></td>
								<td><%=ctrcd%></td>
								<td class="Tleft"><%=keywd1%></td>
								<td class="date"><%=input_dt%></td>
								<td><span class="bmsStatusIcon <%=stat_style%>"><%=stat%></span></td>
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