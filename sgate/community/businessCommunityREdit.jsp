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

//ger Parameter
String action = util.nullCheck(request.getParameter("action"));
int comNo = util.getInt(request.getParameter("comNo"));

String writer   = "Admin";
String inputDt  = new java.text.SimpleDateFormat ("yyyyMMdd").format(new java.util.Date());

vncListDao = vncAction.getCommunityView(comNo); //리스트 detail

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
	
})

function submitBtn()
{	
	formSubmit('dataForm');
}

function cancel()
{		
	$('input[name=title]').val("");
	$('textarea[name=content]').val("");	
}

function goList()
{	
	$('form[name=dataForm]').attr('action','businessCommunityView.jsp');	
	formSubmit('dataForm');
}


function formCheck()
{
	if(!$.trim($('input[name=title]').val()))
	{
		alert('제목을 입력하세요.');
		$('input[name=title]').focus();
		return false;
	}	
	else if(!$.trim(content))
	{
		alert('내용을 입력하세요.');
		$('textarea[name=content]').focus();		
		return false;
	}	
	else
		return true;
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
						<em class="on">Business Community 댓글 등록</em>
					</span>
				</div>
				<!-- //Location-->
				
				<form name="dataForm" action="businessCommunityEditSubmit.jsp"  method="post" >
				<input type="hidden" name="action" value="REPLY_INSERT"/>	
				<input type="hidden" name="comNo" value="<%=comNo%>"/>
				<input type="hidden" name="writer" value="Admin"/>
				
				<h4 class="title">Business Community 댓글 등록</h4>
				<div class="tableType1 tableLeftType2">
					<table summary="등록 및 수정 게시판">
						<caption>등록 및 수정을 할 수 있는 테이블입니다.</caption>
						<colgroup>
							<col width="28%"/>
							<col width="23%"/>
							<col width="20%"/>
							<col width="*"/>
						</colgroup>
						<tbody>
							<tr>
								<th>제목</th>
								<td colspan="5" class="left"><input type="text" size="80" name="title" value="RE : <%=vncListDao.getString(0, "TITLE") %>"/></td>
							</tr>
							<tr>
								<th>작성자</th>
								<td>Admin(관리자)</td>
								<th>등록일</th>
								<td><input type="text" name="inputDt" size="15" value="<%=util.getDate(inputDt, "YYYY-MM-DD")%>" readonly="readonly"/></td>
							</tr>
							<tr>
								<th>댓글</th>
								<td colspan="3">
									<textarea cols="80" rows="10" class="replyTextarea" name="content"></textarea>
								</td>
							</tr>
							<tr>
								<th>원본<br/>게시물</th>
								<td colspan="3">
									<pre class="Tleft">
Date : <%=util.getDate(vncListDao.getString(0,"INPUT_DT"),"YYYY-MM-DD")%>
Writer : <%=vncListDao.getString(0, "WRITER") %>
Subject : <%=vncListDao.getString(0, "TITLE") %>

<%=vncListDao.getString(0, "CONTENT") %>										
									</pre>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="buttonC">
					<span class="button btnColor1 buttonSize2"><a href="javascript:submitBtn()" >등록</a><em></em></span>
					<span class="button btnColor1 buttonSize2"><a href="javascript:cancel()">취소</a><em></em></span>
					<span class="button btnColor1 buttonSize2"><a href="javascript:goList()">목록</a><em></em></span>
				</div>
								
				</form>				
			</div>
		</div>
		<!-- //contents -->
		
	</div>
	<!-- //conteiner -->
	
</body>
</html>