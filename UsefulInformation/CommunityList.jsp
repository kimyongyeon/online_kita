<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.HashMap,
			com.ec21.community.VnCommunityAction,
			com.ec21.common.Dao,
			com.ec21.util.Utility"
%><%
VnCommunityAction vncAction = VnCommunityAction.getInstance();
Utility util = Utility.getInstance();

Dao vncListDao = new Dao();

HashMap<String, String> searchMap = new HashMap<String, String>();

String searchType = "ALL";
String searchData = util.nullCheck(request.getParameter("searchData"));

searchMap.put("searchType", searchType);
searchMap.put("searchData", searchData);

int pageNum = util.getPageNum(util.getInt(request.getParameter("pageNum")));
int totalCount = 0;
int rowCnt = 10;

totalCount = vncAction.getCommunityListTotalCount(searchMap); //리스트 총 갯수
vncListDao = vncAction.getCommunityList(pageNum, rowCnt, searchMap); // 리스트 정보

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

function submitBtn()
{	
	$('form[name=dataForm]').attr('action','CommunityEditForm.jsp');
	$('input[name=action]').val('INSERT');	
	formSubmit('dataForm');
}

function searchCom()
{
	$('input[name=pageNum]').val('');	
	formSubmit('searchFormB');
}

function goPage(pageNum)
{
	$('input[name=pageNum]').val(pageNum);	
	formSubmit('searchFormB');
}

function detailView(comNo)
{	
	$('form[name=dataForm]').attr('action','CommunityView.jsp');
	$('input[name=comNo]').val(comNo);
	formSubmit('dataForm');
}

</script>
</head>
<body>
<form name="dataForm" action="CommunityView.jsp" method="post">
<input type="hidden" name="searchData" value="<%=searchData%>"/>
<input type="hidden" name="pageNum" value="<%=pageNum%>"/>
<input type="hidden" name="action" value=""/>
<input type="hidden" name="comNo" value=""/>
</form>
<% 
String topAndLefMenu = "0505"; 
String topAndlefSecondMenu = "0000";
%>
	<!-- Wrapper -->
	<div id="wrapper">	
		
		<!-- Head -->
		<% String action = "CommunityList.jsp"; %>
  		<%@include file="../include/topMenu.jsp" %>		
		<!-- //Head -->
		
		<!-- LNB -->
		<%@include file="../include/leftMenu.jsp" %>
		<!-- //LNB -->
		
		<!-- Contents -->
		<div id="contents">
			<div class="bannerIndex"><a href="#none"><img src="../images/banner/banner_index.gif" alt="Dịch vụ kết nối kinh doanh"></a></div>
			<div class="location">			
				<em>Trang chủ</em> &#62;
				<em>Thông tin hữu ích  </em> &#62; 
				<em class="on">Cộng đồng doanh nghiệp</em>
			</div>
			<h3 class="title">Cộng đồng doanh nghiệp</h3>
			
			<div class="BizCom">
				<strong>Cộng đồng doanh nghiệp</strong>
				<span>Bên mua Việt Nam và Bên cung cấp Hàn Quốc</span>
				<p>
				Thảo luận giữa các doanh nghiệp về các chủ đề thông dụng như dịch vụ vận<br>
				chuyển, chứng chỉ, hóa đơn thanh toán, các vấn đề về thanh toán, thủ tục<br>
				hải quan & vận chuyển hàng hóa, ….<br>

				Hỏi, đáp và tìm kiếm các cơ hội kinh doanh mới
				</p>
			</div>
			
			<div class="tableTopInfo">
				<span class="info">Tổng: <strong><%=totalCount%></strong> chủ đề</span>
			</div>
			<form name="searchFormB" action="CommunityList.jsp" method="post">
			<div class="TableTopSearch">
				<input type="text" size="60" name="searchData" />				
				<input type="hidden" name="pageNum" value="<%=pageNum%>"/>
				<span class="button btnColor6 btnSize5"><a href="javascript:searchCom()" >Tìm kiếm</a></span>
				<span class="button btnColor5 btnSize5"><a href="javascript:submitBtn()" >Đăng chủ đề</a></span>
			</div>
			</form>
			
			<div class="tableType3">
				<table summary="Cộng đồng doanh nghiệp List">
					<caption>Cộng đồng doanh nghiệp List Table</caption>
					<colgroup>
						<col width="*">
						<col width="12%">
						<col width="13%">
						<col width="10%">
						<col width="8%">
					</colgroup>
					<thead>
						<tr>
							<th>Chủ đề</th>
							<th>Tác giả</th>
							<th>Đăng lần cuối</th>
							<th>Phản hồi</th>
							<th>Lượt xem</th>
						</tr>
					</thead>
					<tbody>
					<%
						if(vncListDao.getRowCnt() < 1)
						{
						%>
							<tr>
								<td colspan="5">No Data.</td>
							</tr>
						<%
						}
						else
						{
							for(int i=0,j=vncListDao.getRowCnt(); i<j; i++)
							{
							%>
							<tr class="<% if(i%2 != 0) out.print("eq"); else if( i == j-1 ) out.print("last eq"); %>">								
								<td class="TdLeft"><a href="javascript:detailView('<%=vncListDao.getInt(i, "COM_NO")%>')"><%=vncListDao.getString(i, "TITLE")%></a></td>
								<td><%=vncListDao.getString(i, "WRITER")%></td>
								<td><%=util.getDate(vncListDao.getString(i, "INPUT_DT"), "YYYY-MM-DD HH:MM")%></td>
								<td><%=vncListDao.getString(i, "REPLY")%></td>
								<td><%=vncListDao.getString(i, "READ_CNT")%></td>
							</tr>
						<%
							}
						}
						%>												
					</tbody>
				</table> 
			</div>
			
			<div class="buttonLR2">
				<span class="button btnColor5 btnSize5"><a href="javascript:submitBtn()">Đăng chủ đề</a></span>
			</div>
			
			<!-- Paging -->
			<%@ include file="/include/pageNavi.jsp" %>
			<!-- //paging -->
			
			
		</div>
		<!-- //Contents -->
		
		<!-- Footer -->
		<%@ include file="/include/footerMenu.jsp" %>
		<!-- //Footer -->
		
	</div>
	<!-- //Wrapper -->

</body>
</html>