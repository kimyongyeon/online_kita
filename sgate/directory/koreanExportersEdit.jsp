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

Dao vedDao = new Dao();
Dao muDao = new Dao();

int pageNum = util.getPageNum(util.getInt(request.getParameter("pageNum")));
String searchType = util.nullCheck(request.getParameter("searchType"));
String searchData = util.nullCheck(request.getParameter("searchData"));
String searchCate = util.nullCheck(request.getParameter("searchCate"));


String action = util.nullCheck(request.getParameter("action"));
int dir_no = util.getInt(request.getParameter("dir_no"));

muDao = muAction.getMpUnspsc(); // 카테고리 정보

if("UPDATE".equals(action))
	vedDao = vedAction.getExpDirectory(dir_no);

dir_no      = util.getInt(util.nullCheck(vedDao.getString(0, "DIR_NO")));
String comp_nm      = util.nullCheck(vedDao.getString(0, "COMP_NM"));
String addr         = util.nullCheck(vedDao.getString(0, "ADDR"));
String ceo          = util.nullCheck(vedDao.getString(0, "CEO"));
String tel_no       = util.nullCheck(vedDao.getString(0, "TEL_NO"));
String fax_no       = util.nullCheck(vedDao.getString(0, "FAX_NO"));
String web_site     = util.nullCheck(vedDao.getString(0, "WEB_SITE"));
String gobiz_id     = util.nullCheck(vedDao.getString(0, "GOBIZ_ID"));
String category_id  = util.nullCheck(vedDao.getString(0, "CATEGORY_ID"));

if(dir_no == 0) action = "INSERT";


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

function submitBtn()
{
	$('input[name=action]').val("<%= action %>");
	if(formCheck())
		formSubmit('dataForm');
}


function formCheck()
{

	if(!$.trim($('input[name=comp_nm]').val()))
	{
		alert('업체명을 입력하세요.');
		$('input[name=comp_nm]').focus();
		return false;
	}
	else
		return true;
}

function goDelete()
{
	if(confirm('삭제 후에는 복원이 불가합니다. 그대로 삭제하시겠습니까?')){
		$('input[name=action]').val("DELETE");
		formSubmit('dataForm');
	}
}

function goList()
{
	formSubmit('listForm');
}

function goGobizUrl(Id)
{
	if(!$.trim(Id))
	{
		alert('회원 ID을 입력하세요.');
		$('input[name=gobiz_id]').focus();
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
						<em class="on">Korean Exporters 상세정보</em>
					</span>
				</div>
				<!-- //Location-->
				<h4 class="title">Korean Exporters 업체 상세정보 관리</h4>

				<div class="tableType1 tableLeft">
					<table summary="Korean Exporters Directory Table">
<form name="listForm" action="koreanExportersList.jsp" method="post" >
  <input type="hidden" name="action" value="<%=action%>"/>
	<input type="hidden" name="pageNum" value="<%=pageNum%>"/>
	<input type="hidden" name="searchCate" value="<%= searchCate %>"/>
	<input type="hidden" name="searchType" value="<%= searchType %>"/>
	<input type="hidden" name="searchData" value="<%= searchData %>"/>
</form>
<form name="dataForm" action="koreanExportersEditSubmit.jsp" method="post" >
  <input type="hidden" name="action" value="<%=action%>"/>
  <input type="hidden" name="dir_no" value="<%=dir_no%>"/>
	<input type="hidden" name="pageNum" value="<%=pageNum%>"/>
	<input type="hidden" name="searchCate" value="<%= searchCate %>"/>
	<input type="hidden" name="searchType" value="<%= searchType %>"/>
	<input type="hidden" name="searchData" value="<%= searchData %>"/>
						<caption>Korean Exporters Directory</caption>
						<colgroup>
							<col width="15%"/>
							<col width="*"/>
						</colgroup>
						<tbody>
							<tr>
								<th>업체명</th>
								<td><input type="text" name="comp_nm" maxlength="256" value="<%= comp_nm %>" size="74"/></td>
							</tr>
							<tr>
								<th>주 소</th>
								<td><input type="text" name="addr" maxlength="256" value="<%= addr %>" size="74"/></td>
							</tr>
							<tr>
								<th>CEO</th>
								<td><input type="text" name="ceo" maxlength="64" value="<%= ceo %>" size="74"/></td>
							</tr>
							<tr>
								<th>TEL</th>
								<td><input type="text" name="tel_no" maxlength="30" value="<%= tel_no %>" size="30"/></td>
							</tr>
							<tr>
								<th>FAX</th>
								<td><input type="text" name="fax_no" maxlength="30" value="<%= fax_no %>" size="30"/></td>
							</tr>
							<tr>
								<th>Website</th>
								<td><input type="text" name="web_site" maxlength="128" value="<%= web_site %>" size="74"/></td>
							</tr>
							<tr><!--http://eblog.gobizkorea.com/ecobath-->
								<th>회원 ID<a href="javascript:goGobizUrl(this.gobiz_id.value);" class="eblog">e-Blog</a></th>
								<td>
									<input type="text" name="gobiz_id" maxlength="32" value="<%= gobiz_id %>" size="30"/>
								</td>
							</tr>
							<tr>
								<th>취급분야</th>
								<td>
									<p class="designSelecter2">
										<select name="category_id">
											<option value="">취급품목 선택하세요.</option>
											<option value="">-----------------------------------------</option>
											<% for(int i=0,j=muDao.getRowCnt(); i<j; i++) { %>
											<option value="<%= muDao.getString(i, "UNSPSC") %>" <%= category_id.equals(muDao.getString(i, "UNSPSC"))? "selected":""%>><%= muDao.getString(i, "ETITLE") %></option><% } %>
										</select>
							    </p>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="buttonC">
					<span class="button btnColor1 buttonSize2"><a href="javascript:submitBtn();"><%= (dir_no == 0)? "등 록":"수 정"%></a><em></em></span>
					<% if(dir_no > 0){ %><span class="button btnColor1 buttonSize2"><a href="javascript:goDelete();">삭 제</a><em></em></span><% } %>
					<span class="button btnColor1 buttonSize2"><a href="javascript:goList();">목 록</a><em></em></span>
</form>
				</div>

			</div>
		</div>
		<!-- //contents -->
	</div>
	<!-- //conteiner -->
</body>
</html>