<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.HashMap,
			com.ec21.board.VnNewsBoardAction,
			com.ec21.common.Dao,
			com.ec21.util.Utility"
%><%
VnNewsBoardAction vnbAction = VnNewsBoardAction.getInstance();
Utility util = Utility.getInstance();

Dao vnbDao = new Dao();
HashMap<String, String> searchMap = new HashMap<String, String>();

String action = util.nullCheck(request.getParameter("action"));
int newsNo = util.getInt(request.getParameter("newsNo"));
String newsType = "IN"; //Korea Industry News

if("UPDATE".equals(action))
	vnbDao = vnbAction.getNews(newsType, newsNo);

String writer       = util.nullCheck(vnbDao.getString(0, "WRITER"));
String title        = util.nullCheck(vnbDao.getString(0, "TITLE"));
String inputDt      = util.nullCheck(vnbDao.getString(0, "INPUT_DT"));
String contents     = util.nullCheck(vnbDao.getString(0, "CONTENTS"));
String summary      = util.nullCheck(vnbDao.getString(0, "SUMMARY"));
String listImage    = util.nullCheck(vnbDao.getString(0, "LIST_IMAGE"));
String orgListImage = util.nullCheck(vnbDao.getString(0, "ORG_LIST_IMAGE"));
String attFile      = util.nullCheck(vnbDao.getString(0, "ATT_FILE"));
String orgAttFile   = util.nullCheck(vnbDao.getString(0, "ORG_ATT_FILE"));
String readCnt      = util.nullCheck(vnbDao.getString(0, "READ_CNT"));

%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>Gobiz Country Channel</title>
<%@include file="../include/commonCss.jsp" %>
<%@include file="../include/commonJs.jsp" %>
<script type="text/javascript" src="../../sgate/js/tinymce/jscripts/tiny_mce/jquery.tinymce.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('input[name=orgListImage] ').hover(mouserOverCursor, mouserOutCursor).click(orgFileNameDisplayChange);
	$('input[name=orgAttFile] ').hover(mouserOverCursor, mouserOutCursor).click(orgFileNameDisplayChange);

	tinymceConfig();
});

function submitBtn()
{
	if(formCheck())
		formSubmit('dataForm');
}

function preview()
{
	window.open('preview.jsp', 'preview', 'toolbar=0, location=0, directories=0, status=0, menubar=0, scrollbars=yes, resizable=0, width=800, height=600, top=100, left=100');
}

function deleteFile(newsNo, type)
{
	if(confirm('삭제 후에는 복원이 불가합니다. 그대로 삭제하시겠습니까?'))
	{
		$.ajax({
			url: 'deleteFile.jsp',
			type: 'post',
			dataType: 'text',
			data: { 'newsNo' : newsNo, 'newsType' : 'IN', 'type': type},
			timeout: 30000,
			success: function (data) {
				if("SUCCESS" == $.trim(data))
				{
					alert("삭제되었습니다");
					$('.orgFileName').css('display', 'none');
				}
				else
					alert("오류가 발생하여 삭제하지 못하였습니다.\n 다시 시도해 주세요");
			},
			error : function() {
				alert("오류가 발생하여 삭제하지 못하였습니다.\n 다시 시도해 주세요");
			}
		});
	}
}

function previwContents()
{
	var contents  = tinyMCE.get('contents').getContent();

	return contents;
}

function orgFileNameDisplayChange()
{
	if($(this).siblings('.orgFileName').css('display') != undefined)
	{
		if($(this).siblings('.orgFileName').css('display') != 'none')
		{
			if(confirm('업로드 된 파일을 지우고 새로운 파일을 입력하시겠습니까?'))
			{
				$(this).siblings('.orgFileName').css('display', 'none');
				$(this).siblings('.orgFileName').children('input.changeFlag').val('Y');
			}
			else
				return false;
		}
	}
}

function formCheck()
{
	//tinyMCE.triggerSave();
	var contents  = tinyMCE.get('contents').getContent();

	if(!$.trim($('input[name=title]').val()))
	{
		alert('제목을 입력하세요.');
		$('input[name=title]').focus();
		return false;
	}
<%
if(!"INSERT".equals(action))
{
%>	else if(!$.trim($('input[name=inputDt]').val()))
	{
		alert('등록일을 입력하세요.');
		$('input[name=inputDt]').focus();
		return false;
	}
<%
}
%>	else if(!$.trim(contents))
	{
		alert('내용을 입력하세요.');
		$('textarea[name=contents]').focus();
		tinyMCE.get('contents').focus();
		return false;
	}
	else if(!$.trim($('textarea[name=summary]').val()))
	{
		alert('내용 요약을 입력하세요.');
		$('textarea[name=summary]').focus();
		return false;
	}
	else
		return true;
}

function deleteBtn(newsNo)
{
	if(confirm('삭제 후에는 복원이 불가합니다. 그대로 삭제하시겠습니까?'))
		location.href = "deleteNewsBoard.jsp?action=DELETE&newsType=IN&newsNo=" + newsNo;
}
</script>
</head>
<body>
	<!-- conteiner -->
	<div class="conainer">
		<!-- LNB -->
		<% String leftMenu = "0202"; %>
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
						<em class="on">Korea Industry News 등록 및 수정</em>
					</span>
				</div>
				<!-- //Location-->
				<h4 class="title">Korea Industry News 등록 및 수정</h4>
				<form name="dataForm" action="koreaIndustryNewsEditSubmit.jsp" enctype="multipart/form-data" method="post" >
				<input type="hidden" name="action" value="<%=action%>"/>
				<input type="hidden" name="newsNo" value="<%=newsNo%>"/>
				<input type="hidden" name="newsType" value="IN"/>
				<div class="tableType1">
					<table summary="등록 및 수정 게시판">
						<caption>등록 및 수정을 할 수 있는 테이블입니다.</caption>
						<colgroup>
							<col width="28%"/>
							<col width="22%"/>
							<col width="15%"/>
							<col width="15%"/>
							<col width="10%"/>
							<col width="10%"/>
						</colgroup>
						<tbody>
							<tr>
								<th>제목</th>
								<td colspan="5" class="left">
									<input type="text" name="title" size="80" value="<%=title%>"/>
								</td>
							</tr>
							<tr>
								<th>작성자</th>
								<td>김번역</td>
								<th>등록일</th>
								<td><input type="text" name="inputDt" size="15" value="<%=util.getDate(inputDt, "YYYY-MM-DD")%>" <%if("INSERT".equals(action)){%>readonly="readonly"<%}%>/></td>
								<th>조회수</th>
								<td class="Tcenter"><%=readCnt%></td>
							</tr>
							<tr>
								<th>내용</th>
								<td colspan="5" style="padding:6px;">
									<div class="tinymceTable">
										<textarea id="contents" name="contents" style="width:100%;" class="subTitleWrite tinymce"><%=contents%></textarea>
									</div>
								</td>
							</tr>
							<tr>
								<th>내용요약<br/>(메인용 최대100자)</th>
								<td colspan="5" style="padding:6px;">
									<textarea name="summary" rows="4" style="width:670px;" class="subTitleWrite"><%=summary%></textarea>
								</td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td colspan="5" style="text-align:left;padding-left:6px;">
									<input type="file" name="orgAttFile" class="fileUp" size="55"/>
									<%
									if(!"".equals(attFile) && !"".equals(orgAttFile))
									{
									%>
									<div class="orgFileName" style="margin-top:7px;">
										<a href="javascript:fileDownload('<%=orgAttFile%>', '/files/<%=attFile%>');"><%=orgAttFile%></a>
										<span> <a href="javascript:deleteFile(<%=newsNo%>, 'FILE');"> 삭제 </a> </span>
										<input type="hidden" class="changeFlag" name="fileChangeFlag" value="N"/>
									</div>
									<%
									}
									%>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="buttonC">
					<span class="button btnColor1 buttonSize2"><a href="javascript:preview();">미리보기</a><em></em></span>
					<%
					String btnName = "등 록";

					if("UPDATE".equals(action))
						btnName = "수 정";
					%>
					<span id="insertBtn" class="button btnColor1 buttonSize2"><a href="javascript:submitBtn();"><%=btnName%></a><em></em></span>
					<span class="button btnColor1 buttonSize2"><a href="javascript:deleteBtn('<%=newsNo%>')">삭 제</a><em></em></span>
					<span class="button btnColor1 buttonSize2"><a href="koreaIndustryNewsList.jsp">목 록</a><em></em></span>
				</div>
				</form>
			</div>
		</div>
		<!-- //contents -->
	</div>
	<!-- //conteiner -->
</body>
</html>