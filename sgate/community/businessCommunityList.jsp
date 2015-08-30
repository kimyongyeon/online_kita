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

int pageNum = util.getPageNum(util.getInt(request.getParameter("pageNum")));
int totalCount = 0;
int rowCnt = 10;

String searchType = util.nullCheck(request.getParameter("searchType"));
String searchData = util.nullCheck(request.getParameter("searchData"));

searchMap.put("searchType", searchType);
searchMap.put("searchData", searchData);

totalCount = vncAction.getCommunityListTotalCount(searchMap); //리스트 총 갯수
vncListDao = vncAction.getCommunityList(pageNum, rowCnt, searchMap); // 리스트 정보

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

function detailView(comNo)
{	
	$('input[name=comNo]').val(comNo);
	formSubmit('dataForm');
}

function deleteBtn(comNo) 
{		
	alert($('input[name=comID]').is(':checked'));
	if($('input[name=comID]').is(':checked'))
	{
		if(confirm('삭제 후에는 복원이 불가합니다.\n삭제시 해당 댓글도 함께 삭제 됩니다.\n그대로 삭제하시겠습니까?'))
		{	
			$('form[name=dataForm]').attr('action','businessCommunityEditSubmit.jsp');		
			$('input[name=action]').val("MULTI_DELETE");
			formSubmit('dataForm');
		}
	}
	else
	{
		alert("삭제할 글을 선택해 주세요");	
	}	
}
</script>
</head>
<body>

	<!-- conteiner -->
	<div class="conainer">
		
		<!-- LNB -->
		<% String leftMenu = "0205"; %>
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
						<em class="on">Business Community 관리</em>
					</span>
				</div>
				<!-- //Location-->
				
				<h4 class="title">Business Community 관리</h4>
				<div class="searchBox">
					<form name="searchForm" action="businessCommunityList.jsp" method="post">
					<input type="hidden" name="pageNum" value=""/>					
						<div class="designSelecter">
							<select name="searchType">
								<option value="title" <%if("title".equals(searchType)){%>selected="selected"<%}%>>제목</option>
								<option value="content" <%if("content".equals(searchType)){%>selected="selected"<%}%>>내용</option>								
							</select>
						</div>
						<span class="searchArea">
							<input type="text" name="searchData" value="<%=searchData%>"/>
							<img src="../../sgate/images/btn/btn_search.gif" alt="검색" name="searchBtn" />
						</span>
					</form>
				</div>
				<p class="searchResult">총 <em><%=totalCount%></em> 건 / 페이지 <em><%=pageNum%></em> / <em><% if(totalCount <= rowCnt) out.print("1"); else if(totalCount % rowCnt == 0) out.println(totalCount / rowCnt); else out.print(totalCount / rowCnt + 1);%></em></p>
				
				<form name="dataForm" action="businessCommunityView.jsp" method="post">
				<input type="hidden" name="searchType" value="<%=searchType%>"/>
				<input type="hidden" name="searchData" value="<%=searchData%>"/>
				<input type="hidden" name="pageNum" value="<%=pageNum%>"/>
				<input type="hidden" name="action" value=""/>
				<input type="hidden" name="comNo" value=""/>
				<div class="buttonR">
					<span class="button btnColor1 buttonSize2"><a href="javascript:deleteBtn()">선택 삭제</a><em></em></span>
					<span class="button btnColor1 buttonSize2"><a href="businessCommunityEdit.jsp?action=INSERT">신규 등록</a><em></em></span>
				</div>
				<div class="tableType1">
					<table summary="뉴스 및 공지사항 게시판">
						<caption>뉴스및공지사항</caption>
						<colgroup>
							<col width="7%"/>
							<col width="7%"/>
							<col width="*"/>
							<col width="13%"/>
							<col width="14%"/>
							<col width="12%"/>
							<col width="7%"/>
						</colgroup>
						<thead>
							<tr>
								<th>선택</th>
								<th>번호</th>
								<th>제목</th>
								<th>등록자명</th>
								<th>등록일</th>
								<th>댓글</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
						<%
						if(vncListDao.getRowCnt() < 1)
						{
						%>
							<tr>
								<td colspan="7">No Data.</td>
							</tr>
						<%
						}
						else
						{
							for(int i=0,j=vncListDao.getRowCnt(); i<j; i++)
							{
							%>
							<tr>
								<td><input type="checkbox" name="comID" value="<%=vncListDao.getInt(i, "COM_NO")%>"/></td>
								<td><%=totalCount + rowCnt - (rowCnt * pageNum + i)%></td>
								<td class="left"><a href="javascript:detailView('<%=vncListDao.getInt(i, "COM_NO")%>')"><%=vncListDao.getString(i, "TITLE")%></a></td>
								<td><%=vncListDao.getString(i, "WRITER")%></td>
								<td><%=util.getDate(vncListDao.getString(i, "INPUT_DT"), "YYYY-MM-DD")%></td>
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
				</form>	
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