<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.HashMap,
			com.ec21.expand_comp.VnExpandCompAction,
			com.ec21.common.MpUnspscAction,
			com.ec21.common.Dao,
			com.ec21.util.Utility"
%><%
VnExpandCompAction vecAction = VnExpandCompAction.getInstance();
MpUnspscAction muAction = MpUnspscAction.getInstance();
Utility util = Utility.getInstance();

Dao vecListDao = new Dao();
Dao vecListTotalDao = new Dao();
Dao muDao = new Dao();
HashMap<String, String> searchMap = new HashMap<String, String>();

int pageNum = util.getPageNum(util.getInt(request.getParameter("pageNum")));
int totalCount = 0;
int rowCnt = 10;

String searchType = util.nullCheck(request.getParameter("searchType"));
String searchData = util.nullCheck(request.getParameter("searchData"));
String searchType2 = util.nullCheck(request.getParameter("searchType2"));
String searchData2 = util.nullCheck(request.getParameter("searchData2"));
String searchCate = util.nullCheck(request.getParameter("searchCate"));
if("".equals(searchType)) searchType = "comp_nm";
if("".equals(searchType)) searchType = "local_area";

searchMap.put("searchType", searchType);
searchMap.put("searchData", searchData);
searchMap.put("searchType2", searchType2);
searchMap.put("searchData2", searchData2);
searchMap.put("searchCate", searchCate);


totalCount = vecAction.getExpandCompListTotalCount(searchMap); //리스트 총 갯수
vecListDao = vecAction.getExpandCompList(pageNum, rowCnt, searchMap); // 리스트 정보

muDao = muAction.getMpUnspsc(); // 카테고리 정보

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

$(document).ready(function(){
	$('img[name=searchBtn]').hover(mouserOverCursor, mouserOutCursor).click(search);
})

function search()
{
	formSubmit('searchForm');
}

function goPage(pageNum)
{
	$('input[name=pageNum]').val(pageNum);
	formSubmit('searchForm');
}


function goView(dirNo)
{
	$('input[name=action]').val("UPDATE");
	$('input[name=exp_no]').val(dirNo);
	formSubmit('dataForm');
}

</script>
</head>
<body>
	<% String topAndLefMenu = "0504"; %>
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Head -->
		<% String action = ""; %>
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
				<em class="on">Các công ty Hàn Quốc tại Việt  Nam</em>
			</div>
			<h3 class="title">Các công ty Hàn Quốc tại Việt  Nam</h3>

			<!-- SearchBox Getting to ko -->
			<div class="searchBoxGetting">
<form name="searchForm" action="koreanCompaniesInVNList.jsp" method="post">
						<input type="hidden" name="pageNum" value="<%=pageNum%>"/>
						<input type="hidden" name="searchType" value="comp_nm"/>
						<input type="hidden" name="searchType2" value="local_area"/>
				<ul>
					<li>
						<span>Công ty</span>
						<input type="text" name="searchData" value="<%=searchData%>"/>
					</li>
					<li>
						<span>Loại hình</span>
						<select name="searchCate" class="sel1">
							<option value="">Chọn một loại hình </option>
							<option value="">----------------------</option>
						<% for(int i=0,j=muDao.getRowCnt(); i<j; i++) { %>
						<option value="<%= muDao.getString(i, "UNSPSC") %>" <%= searchCate.equals(muDao.getString(i, "UNSPSC"))? "selected":""%>><%= muDao.getString(i, "ETITLE") %></option><% } %>
						</select>
						<span class="text2">Địa điểm</span>
						<input type="text" name="searchData2" value="<%=searchData2%>" class="sel2"/>
					</li>
				</ul>
				<a href="javascript:search()" class="searchBtn">Tìm kiếm</a>
</form>
<form name="dataForm" action="koreanCompaniesInVNView.jsp" method="post" >
	<input type="hidden" name="action" value="UPDATE"/>
	<input type="hidden" name="exp_no" value=""/>
	<input type="hidden" name="pageNum" value="<%=pageNum%>"/>
	<input type="hidden" name="searchCate" value="<%= searchCate %>"/>
	<input type="hidden" name="searchType" value="comp_nm"/>
	<input type="hidden" name="searchData" value="<%= searchData %>"/>
	<input type="hidden" name="searchType2" value="local_area"/>
	<input type="hidden" name="searchData2" value="<%= searchData2 %>"/>
</form>
			</div>
			<!-- //SearchBox Getting to ko -->

			<div class="tableInfo">
				<div>
					<strong>Tổng &nbsp;<em><%=totalCount%></em> chủ đề</strong>
					<!--span>Page&nbsp;(<em><%=pageNum%>/<%=totalCount / rowCnt + 1%></em>)</span-->
				</div>
			</div>

			<div class="TableTopSearch">
				<em class="red">*</em> Source: www.globalwindow.org
			</div>

			<div class="tableType3">
				<table summary="Business Community List">
					<caption>Business Community List Table</caption>
					<colgroup>
						<col width="12%">
						<col width="*">
						<col width="15%">
						<col width="30%">
					</colgroup>
					<thead>
						<tr>
							<th>STT</th>
							<th>Địa chỉ</th>
							<th>Loại hình</th>
							<th>Địa điểm</th>
						</tr>
					</thead>
					<tbody>
						<%
						if(vecListDao.getRowCnt() < 1)
						{
						%>
							<tr>
								<td colspan="4">No Data.</td>
							</tr>
						<%
						}
						else
						{
							for(int i=0,j=vecListDao.getRowCnt(); i<j; i++)
							{
							%>
						<tr>
							<td><%= totalCount + rowCnt - (rowCnt * pageNum + i) %></td>
							<td class="TdLeft">
								<a href="javascript:goView('<%=vecListDao.getInt(i, "EXP_NO")%>');"><%=vecListDao.getString(i, "COMP_NM")%></a>
								<% if(!"".equals(vecListDao.getString(i, "GOBIZ_ID"))){ %><a href="http://eblog.gobizkorea.com/<%=vecListDao.getString(i, "GOBIZ_ID")%>" target="_blank" class="eblog Tright">eblog</a><% } %></td>
							</td>
							<td><%=vecListDao.getString(i, "LOCAL_AREA")%></td>
							<td><%=vecListDao.getString(i, "CATEGORY_NM")%></td>
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