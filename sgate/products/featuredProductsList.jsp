<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.HashMap,
			com.ec21.common.Dao,
			com.ec21.product.VnFeaturedProdAction,
			com.ec21.util.Utility"
%><%
VnFeaturedProdAction vfpAction = VnFeaturedProdAction.getInstance();
Utility util = Utility.getInstance();

Dao vfpListDao = new Dao();

HashMap<String, String> searchMap = new HashMap<String, String>();

int pageNum = util.getPageNum(util.getInt(request.getParameter("pageNum")));
int totalCount = 0;
int rowCnt = 10;

totalCount = vfpAction.getFeaturedProdListTotalCount(); //리스트 총 갯수
vfpListDao = vfpAction.getFeaturedProdList(pageNum, rowCnt); // 리스트 정보

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

});

function goPage(pageNum)
{
	$('input[name=pageNum]').val(pageNum);
	formSubmit('searchForm');
}

function deleteBtn(gesiNo)
{
	if(confirm('삭제 후에는 복원이 불가합니다. 그대로 삭제하시겠습니까?'))
		location.href = "deleteFeaturedProduct.jsp?action=DELETE&gesiNo=" + gesiNo + '&pageNum=<%=pageNum%>';
}
</script>
</head>
<body>
	<!-- conteiner -->
	<div class="conainer" style="position: absolute;">
		<!-- LNB -->
		<% String leftMenu = "01"; %>
		<%@include file="../include/sgateLeftMenu.jsp" %>
		<!-- //LNB -->
		<!-- contents -->
		<div class="contents">
			<div class="contentsDetail">
				<!-- Location-->
				<div class="location">
					<h2>메인컨텐츠 관리</h2>
					<img src="../../sgate/images/text/textTitle01.gif" alt="메인컨텐츠관리"/>
					<span>
						<em>Main</em>&#62;
						<em>메인컨텐츠 관리</em>&#62;
						<em class="on">Featured Products 관리</em>
					</span>
				</div>
				<!-- //Location-->
				<h4 class="title">Featured Products 관리
					<em class="sub">
						<span class="button btnColor1 buttonSize2"><a href="featuredProductsEdit.jsp?action=INSERT">신규 등록</a><em></em></span>
					</em>
				</h4>
				<div class="tableType1">
					<table summary="Featured Products">
						<caption>Featured Products관리</caption>
						<colgroup>
							<col width="8%"/>
							<col width="*"/>
							<col width="18%"/>
							<col width="20%"/>
						</colgroup>
						<thead>
							<tr>
								<th>No.</th>
								<th>Featured Products 구분</th>
								<th>게재 기간</th>
								<th>관리</th>
							</tr>
						</thead>
						<tbody>
						<%
						if(vfpListDao.getRowCnt() < 1)
						{
						%>
							<tr>
								<td colspan="5">No Data.</td>
							</tr>
						<%
						}
						else
						{
							for(int i=0,j=vfpListDao.getRowCnt(); i<j; i++)
							{
							%>
							<tr>
								<td><%=totalCount + rowCnt - (rowCnt * pageNum + i)%></td>
								<td><a href="featuredProductsEdit.jsp?action=UPDATE&gesiNo=<%=vfpListDao.getInt(i, "GESI_NO")%>">FP 등록상품 - <%=vfpListDao.getInt(i, "GESI_NO")%>차</a></td>
								<td><%=util.getDate(vfpListDao.getString(i, "GESI_SDAY"), "YYYY-MM-DD")%> ~ <%=util.getDate(vfpListDao.getString(i, "GESI_EDAY"), "YYYY-MM-DD")%></td>
								<td>
									<span class="button btnColor2 buttonSize1"><a href="featuredProductsEdit.jsp?action=UPDATE&gesiNo=<%=vfpListDao.getInt(i, "GESI_NO")%>">수정</a><em></em></span>
									<span class="button btnColor2 buttonSize1"><a href="javascript:deleteBtn(<%=vfpListDao.getInt(i, "GESI_NO")%>);">삭제</a><em></em></span>
								</td>
							</tr>
							<%
							}
						}
						%>
						</tbody>
					</table>
				</div>
				<form name="searchForm" action="featuredProductsList.jsp" method="post">
					<input type="hidden" name="pageNum" value="<%=pageNum%>"/>
				</form>
				<br/>
				<!-- Paging -->
				<%@include file="../include/pageNavi.jsp" %>
				<!-- //paging -->
				<br/><br/>
			</div>
		</div>
		<!-- //contents -->
	</div>
	<!-- //conteiner -->
</body>
</html>