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

searchMap.put("newsType", "NN"); //news & notice
searchMap.put("searchType", searchType);
searchMap.put("searchData", searchData);

totalCount = vnbAction.getNewsListTotalCount(searchMap); //리스트 총 갯수
vnbListDao = vnbAction.getNewsList(pageNum, rowCnt, searchMap); // 리스트 정보

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
});

function search()
{
	formSubmit('searchForm');
}

function goPage(pageNum)
{
	$('input[name=pageNum]').val(pageNum);
	formSubmit('searchForm');
}

function deleteBtn(newsNo)
{
	if(confirm('삭제 후에는 복원이 불가합니다. 그대로 삭제하시겠습니까?'))
		location.href = "deleteNewsBoard.jsp?action=DELETE&newsType=NN&newsNo=" + newsNo + '&pageNum=<%=pageNum%>';
}
</script>
</head>
<body>
	<!-- conteiner -->
	<div class="conainer">
		<!-- LNB -->
		<% String leftMenu = "0201"; %>
		<%@include file="../include/sgateLeftMenu.jsp" %>
		<!-- //LNB -->
		<!-- contents -->
		<div class="contents">
			<div class="contentsDetail">
				<!-- Location-->
				<div class="location">
					<h2>게시판 관리</h2>
					<img src="../../sgate/images/text/textTitle02.gif" alt="게시판관리"/>
					<span>
						<em>Main</em>&#62;
						<em>게시판 관리</em>&#62;
						<em class="on">News &#38; Notice 관리</em>
					</span>
				</div>
				<!-- //Location-->
				<h4 class="title">News &#38; Noticee 관리</h4>

				<div class="searchBox">
					<form name="searchForm" action="newsAndNoticeList.jsp" method="post">
						<input type="hidden" name="pageNum" value="<%=pageNum%>"/>
						<div class="designSelecter">
							<select name="searchType">
								<option value="title" <%if("title".equals(searchType)){%>selected="selected"<%}%>>제목</option>
								<option value="contents" <%if("contents".equals(searchType)){%>selected="selected"<%}%>>내용</option>
							</select>
						</div>
						<span class="searchArea">
							<input type="text" name="searchData" value="<%=searchData%>"/>
							<img src="../../sgate/images/btn/btn_search.gif" alt="검색" name="searchBtn"/>
						</span>
					</form>
				</div>
				<p class="searchResult">총 <em><%=totalCount%></em> 건 / 페이지 <em><%=pageNum%></em> / <em><%=totalCount / rowCnt + 1%></em></p>
				<div class="buttonR">
					<span class="button btnColor1 buttonSize2"><a href="newsAndNoticeEdit.jsp?action=INSERT">신규 등록</a><em></em></span>
				</div>
				<div class="tableType1">
					<table summary="뉴스 및 공지사항 게시판">
						<caption>뉴스및공지사항</caption>
						<colgroup>
							<col width="7%"/>
							<col width="*"/>
							<col width="13%"/>
							<col width="10%"/>
							<col width="14%"/>
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>등록일</th>
								<th>조회수</th>
								<th>관리</th>
							</tr>
						</thead>
						<tbody>
						<%
						if(vnbListDao.getRowCnt() < 1)
						{
						%>
							<tr>
								<td colspan="5">No Data.</td>
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
								<td class="left"><a href="newsAndNoticeEdit.jsp?action=UPDATE&newsNo=<%=vnbListDao.getInt(i, "NEWS_NO")%>"><%=vnbListDao.getString(i, "TITLE")%></a></td>
								<td><%=util.getDate(vnbListDao.getString(i, "INPUT_DT"), "YYYY-MM-DD")%></td>
								<td><%=vnbListDao.getString(i, "READ_CNT")%></td>
								<td>
									<span class="button btnColor2 buttonSize1"><a href="newsAndNoticeEdit.jsp?action=UPDATE&newsNo=<%=vnbListDao.getInt(i, "NEWS_NO")%>">수정</a><em></em></span>
									<span class="button btnColor2 buttonSize1"><a href="javascript:deleteBtn(<%=vnbListDao.getInt(i, "NEWS_NO")%>);">삭제</a><em></em></span>
								</td>
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
		</div>
		<!-- //contents -->
	</div>
	<!-- //conteiner -->
</body>
</html>