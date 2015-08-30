<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.HashMap,
			com.ec21.contact_us.VnContactUsAction,
			com.ec21.common.Dao,
			com.ec21.util.Utility"
%>
<%
	VnContactUsAction vcuAction = VnContactUsAction.getInstance();
	Utility util = Utility.getInstance();
	Dao vcuListDao = new Dao();
	HashMap<String, String> searchMap = new HashMap<String, String>();
	
	String contactNo = util.nullCheck(request.getParameter("contactNo"));     
	vcuListDao = vcuAction.getContactUs(contactNo);
	
	String BTN_INSERT_NAME = "등 록";
	String BTN_UPDATE_NAME = "수 정";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
			// ====================================================
			// 현재요일 설정
			// ====================================================
			var currentTime = new Date();
			var month = currentTime.getMonth() + 1;
			var day = currentTime.getDate();
			var year = currentTime.getFullYear();
			$("td[id=reply_dt]").text(year+"년 "+month+"월 "+day+"일");
			// ====================================================
			// submitBtn 클릭시 
			// ====================================================
			$('#submitBtn').click(function () {
				var gubun = $("span[id=submitBtn]").text();
				if(gubun == "<%=BTN_UPDATE_NAME%>"){
					
					if(formCheck()){
						$('input[name=action]').val("UPDATE");
						formSubmit('dataForm');
					}
					
				}else if(gubun == "<%=BTN_INSERT_NAME%>"){
					
					if(formCheck()){
						$('input[name=action]').val("INSERT");
						formSubmit('dataForm');
					}
				}
	        });
			// ====================================================
			// 폼 체크
			// ====================================================
			function formCheck()
			{
				if(!$.trim($('textarea[name=reply_content]').val()))
				{
					alert('답변을 입력하세요.');
					$('textarea[name=reply_content]').focus();
					return false;
				}else{
					return true;
				}
			}
		})
	</script>

</head>

<body>
	<!-- conteiner -->
	<div class="conainer">
		
		<!-- LNB -->
		<% String leftMenu = "0207"; %>
  		<%@include file="../include/sgateLeftMenu.jsp" %>
		<!-- //LNB -->
		
		<!-- contents -->
		<div class="contents">
			<div class="contentsDetail">	
			
				<!-- Location-->
				<div class="location">
					<h2>게시판 관리</h2>
					<img src="../images/text/textTitle02.gif" alt="게시판관리"/>
					<span>
						<em>Main</em>&#62;
						<em>게시판 관리</em>&#62;
						<em class="on">Contact Us 상세정보 및 답변 등록</em>
					</span>
				</div>
				<!-- //Location-->
				
				<h4 class="title">Contact Us 상세정보 및 답변 등록</h4>
				<div class="tableType1 tableLeftType2">
					<form name="dataForm" action="contactUsManagerProc.jsp" method="post" >
					<input type="hidden" name="contactNo" value="<%=contactNo%>"/>
					<input type="hidden" name="toEmail" value="<%=vcuListDao.getString(0, "EMAIL")%>"/>
					<input type="hidden" name="action" value=""/>
					<input type="hidden" name="admin_id" value="<%=vcuListDao.getString(0, "ADMIN_ID")%>"/>
					<table summary="등록 및 수정 게시판">
						<caption>등록 및 수정을 할 수 있는 테이블입니다.</caption>
						<colgroup>
							<col width="190"/>
							<col width="220"/>
							<col width="190"/>
							<col width="220"/>
						</colgroup>
						<tbody>
							<tr>
								<th>등록자</th>
								<td> <%=vcuListDao.getString(0, "WRITER")%></td>
								<th>이메일</th>
								<td><a href="mailto:<%=vcuListDao.getString(0, "EMAIL")%>"> <%=vcuListDao.getString(0, "EMAIL")%></a></td>
							</tr>
							<tr>
								<th>회사명</th>
								<td><%=vcuListDao.getString(0, "COMP_NM")%></td>
								<th>등록일</th>
								<td><%=util.getDate(vcuListDao.getString(0, "INPUT_DT"), "YYYY-MM-DD")%></td>
							</tr>
							<tr>
								<th>제목</th>
								<td colspan="3">
									<div style="width: 550px; height: auto;  overflow: hidden;" >
										<%=vcuListDao.getString(0, "TITLE")%>
									</div>
									
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td colspan="3">
									<div style="width: 550px; height: auto;  overflow: hidden;" >
									<%=vcuListDao.getString(0, "CONTENT")%>
									</div>
								</td>
							</tr>
							<tr>
								<th>답변제목</th>
								<td colspan="3" class="left">
									<input type="text" size="80" name="reply_subject" id="reply_subject" value="Re: <%=vcuListDao.getString(0, "TITLE")%>" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<th>답변</th>
								<td colspan="3">
									<textarea cols="80" rows="10" class="replyTextarea" name="reply_content" id="reply_content"><%=vcuListDao.getString(0, "REPLY_CONTENT")%></textarea>
								</td>
							</tr>
							
							<tr>
								<th>답변자</th>
								<td> <%=vcuListDao.getString(0, "ADMIN_ID")%></td>
								<th>처리일</th>
								<td id="reply_dt"></td>
							</tr>
							
						</tbody>
					</table>
					</form>
				</div>
				<script type="text/javascript">
				valueTxtRe();
				</script>
				<div class="buttonC">
					<span class="button btnColor1 buttonSize2" id="submitBtn"><a href="#"><%= vcuListDao.getString(0, "REPLY_CONTENT").equals("") ? BTN_INSERT_NAME : BTN_UPDATE_NAME %></a><em></em></span>
					<span class="button btnColor1 buttonSize2"><a href="contactUsList.jsp">목록</a><em></em></span>
				</div>
				
				
								
			</div>
		</div>
		<!-- //contents -->
		
	</div>
	<!-- //conteiner -->
	
</body>
</html>