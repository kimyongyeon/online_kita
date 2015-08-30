<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.io.*,
			java.util.*,
			com.ec21.contact_us.VnContactUsAction,
			com.ec21.common.Dao,
			com.ec21.mail.SendMail,
			com.ec21.util.Utility"
%>
<%@include file="../include/commonCss.jsp" %>
<%@include file="../include/commonJs.jsp" %>
<%
	Utility util = Utility.getInstance();
	VnContactUsAction vcuAction = VnContactUsAction.getInstance();
	
	//form parameter
	String action        = util.nullCheck(request.getParameter("action"));
	String contact_no    = util.nullCheck(request.getParameter("contactNo"));
	String reply_content = util.nullCheck(request.getParameter("reply_content"));
	String reply_subject = util.nullCheck(request.getParameter("reply_subject"));
	String email		 = util.nullCheck(request.getParameter("toEmail"));
	String admin_id 	 = util.nullCheck(request.getParameter("admin_id"));
	
	HashMap<String, String> dataMap = new HashMap<String, String>();
	dataMap.put("contact_no", contact_no + "");
	dataMap.put("reply_content", reply_content);
	dataMap.put("admin_id", admin_id);
	
	Dao dao = vcuAction.updateContactUs(dataMap);
	
	// localhost 안되면, IP를 적어서 보내야 한다.
	SendMail sm = new SendMail("localhost","UTF-8");
	String fromEmail = "amdin@ec21.com";
	String toEmail = email;
	String subject = reply_subject;
	String content = reply_content;
	sm.sendHtml(fromEmail, toEmail, subject, content);
	
	String nextUrl = "";
	if(dao.getResult()){
		nextUrl = "contactUsList.jsp"; 
	}
	
	if(!"".equals(nextUrl))
		response.sendRedirect(nextUrl);
	else
		response.sendError(response.SC_NOT_FOUND);
	
	// 분기처리 할 이유가 없음. 어자피 무조건 업데이트 임. 내용은 있는 상태이고
	// 관리자ID와 답변내용은 업데이트 될 것임.
/* 	// 등록시
	if(action.equals("INSERT")){
		HashMap<String, String> dataMap = new HashMap<String, String>();
		dataMap.put("contact_no", contact_no + "");
		dataMap.put("reply_content", reply_content);
		dataMap.put("admin_id", admin_id);
	}
	// 수정시
	else if(action.equals("UPDATE")){ 
		HashMap<String, String> dataMap = new HashMap<String, String>();
		dataMap.put("contact_no", contact_no + "");
		dataMap.put("reply_content", reply_content);
		dataMap.put("admin_id", admin_id);
	}
 */	
%>

<script type="text/javascript">
	$(document).ready(function(){
	})
</script>