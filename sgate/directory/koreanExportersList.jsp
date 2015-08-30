<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.HashMap,
			com.ec21.directory.VnExpDirectoryAction,
			com.ec21.common.MpUnspscAction,
			com.ec21.common.Dao,
			com.ec21.util.Utility"
%><%
VnExpDirectoryAction vedAction = VnExpDirectoryAction.getInstance();
MpUnspscAction muAction = MpUnspscAction.getInstance();
Utility util = Utility.getInstance();

Dao vedListDao = new Dao();
Dao vedListTotalDao = new Dao();
Dao muDao = new Dao();
HashMap<String, String> searchMap = new HashMap<String, String>();

int pageNum = util.getPageNum(util.getInt(request.getParameter("pageNum")));
int totalCount = 0;
int rowCnt = 10;

String searchType = util.nullCheck(request.getParameter("searchType"));
String searchData = util.nullCheck(request.getParameter("searchData"));
String searchCate = util.nullCheck(request.getParameter("searchCate"));
if("".equals(searchType)) searchType = "comp_nm";

searchMap.put("searchType", searchType);
searchMap.put("searchData", searchData);
searchMap.put("searchCate", searchCate);


totalCount = vedAction.getExpDirectoryListTotalCount(searchMap); //리스트 총 갯수
vedListDao = vedAction.getExpDirectoryList(pageNum, rowCnt, searchMap); // 리스트 정보

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


function goEdit(dirNo)
{
	$('input[name=action]').val("UPDATE");
	$('input[name=dir_no]').val(dirNo);
	formSubmit('dataForm');
}

function goCheckDelete()
{
	if(!chkList()){
		alert("삭제하실 업체를 선택하세요.");
	 	return;
	}

	if(confirm('삭제 후에는 복원이 불가합니다. 그대로 삭제하시겠습니까?')){
    formSubmit('editForm');
	}
}

function chkList(){
	var vBool = false;
	if (document.editForm.chkNo){
		if (document.editForm.chkNo.length){
			for (var i = 0 ; i < document.editForm.chkNo.length ; i++){
				if(document.editForm.chkNo[i].checked){
					vBool = true;
					break;
				}
			}
		} else {
			if(document.editForm.chkNo.checked) vBool = true;
		}
	}
	else return false;

	if(!vBool) return false;

	return true;
}


function goGobizUrl(Id)
{
	if(!$.trim(Id))
	{
		return;
	}
	window.open("http://eblog.gobizkorea.com/"+Id, "_blank", "top=100,left=100,width=900 height=900, menubar=yes,directories=yes,resizable=yes,status=yes,scrollbars=yes");
}

</script>
</head>
<body>
	<!-- conteiner -->
	<div class="conainer">
		<!-- LNB -->
		<% String leftMenu = "0203"; %>
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
						<em class="on">Korean Exporters Directory</em>
					</span>
				</div>
				<!-- //Location-->
				<h4 class="title">Korean Exporters Directory 관리</h4>
				<div class="searchBox2">
<form name="searchForm" action="koreanExportersList.jsp" method="post">
						<input type="hidden" name="pageNum" value="<%=pageNum%>"/>
						<input type="hidden" name="searchType" value="comp_nm"/>
						<div class="searchBoxType2">
							<p class="comName"><label>업체명</label><input type="text" name="searchData" value="<%=searchData%>"/></p>
							<p class="designSelecter2">
								<em>취급분야</em>
								<select name="searchCate">
									<option value="">취급품목 선택하세요.</option>
									<option value="">-----------------------------------------</option>
									<% for(int i=0,j=muDao.getRowCnt(); i<j; i++) { %>
									<option value="<%= muDao.getString(i, "UNSPSC") %>" <%= searchCate.equals(muDao.getString(i, "UNSPSC"))? "selected":""%>><%= muDao.getString(i, "ETITLE") %></option><% } %>
								</select>
							</p>
						</div>
						<span class="searchBtn"><img src="../../sgate/images/btn/btn_search2.gif" alt="검색" name="searchBtn"/></span>
					</form>
				</div>
				<p class="searchResult">총 <em><%=totalCount%></em> 건 / 페이지 <em><%=pageNum%></em> / <em><%=totalCount / rowCnt + 1%></em></p>
				<div class="buttonR">
					<span class="button btnColor1 buttonSize2"><a href="koreanExportersEdit.jsp?action=INSERT">등 록</a><em></em></span>
					<span class="button btnColor1 buttonSize2"><a href="javascript:goCheckDelete();">삭 제</a><em></em></span>
				</div>
				<div class="tableType1">
					<table summary="Korean Exporters Directory">
<form name="dataForm" action="koreanExportersEdit.jsp" method="post" >
	<input type="hidden" name="action" value="UPDATE"/>
	<input type="hidden" name="dir_no" value=""/>
	<input type="hidden" name="pageNum" value="<%=pageNum%>"/>
	<input type="hidden" name="searchCate" value="<%= searchCate %>"/>
	<input type="hidden" name="searchType" value="comp_nm"/>
	<input type="hidden" name="searchData" value="<%= searchData %>"/>
</form>
<form name="editForm" action="koreanExportersEditSubmit.jsp" method="post" >
	<input type="hidden" name="action" value="CHK_DELETE"/>
	<input type="hidden" name="pageNum" value="<%=pageNum%>"/>
	<input type="hidden" name="searchCate" value="<%= searchCate %>"/>
	<input type="hidden" name="searchType" value="comp_nm"/>
	<input type="hidden" name="searchData" value="<%= searchData %>"/>
						<caption>Korean Exporters Directory</caption>
						<colgroup>
							<col width="6%"/>
							<col width="6%"/>
							<col width="*"/>
							<col width="30%"/>
						</colgroup>
						<thead>
							<tr>
								<th>선택</th>
								<th>No.</th>
								<th>업체명</th>
								<th>취급분야</th>
							</tr>
						</thead>
						<tbody>
						<%
						if(vedListDao.getRowCnt() < 1)
						{
						%>
							<tr>
								<td colspan="4">No Data.</td>
							</tr>
						<%
						}
						else
						{
							for(int i=0,j=vedListDao.getRowCnt(); i<j; i++)
							{
							%>
							<tr>
								<td><input type=checkbox name="chkNo" value="<%= vedListDao.getString(i, "DIR_NO") %>"></td>
								<td><%= totalCount + rowCnt - (rowCnt * pageNum + i) %></td>
								<td class="left"><a href="javascript:goEdit('<%=vedListDao.getInt(i, "DIR_NO")%>');"><%=vedListDao.getString(i, "COMP_NM")%></a>
									<% if(!"".equals(vedListDao.getString(i, "GOBIZ_ID"))){ %><a href="javascript:goGobizUrl('<%=vedListDao.getString(i, "GOBIZ_ID")%>');" class="eblog">e-Blog</a><% } %></td>
								<td><%=vedListDao.getString(i, "CATEGORY_NM")%></td>
							</tr>
							<%
							}
						}
						%>
						</tbody>
</form>
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