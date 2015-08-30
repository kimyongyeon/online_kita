<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.io.*,
			java.util.*,
			com.ec21.contact_us.VnContactUsAction,
			com.ec21.common.Dao,
			com.ec21.util.Utility"
%>
<%@include file="../include/commonCss.jsp" %>
<%@include file="../include/commonJs.jsp" %>
<%
	Utility util = Utility.getInstance();
	VnContactUsAction vcuAction = VnContactUsAction.getInstance();
	//form parameter
	int contact_no     = vcuAction.getContactUsNoSeq();
	String writer      = util.nullCheck(request.getParameter("name"));       // 이름
	String gobiz_id    = "test";
	String comp_nm     = util.nullCheck(request.getParameter("company"));    // 회사명
	String email       = util.nullCheck(request.getParameter("email"));      // 이메일
	String title       = util.nullCheck(request.getParameter("subject"));    // 제목
	String content     = util.nullCheck(request.getParameter("description"));// 상세내용
	
	HashMap<String, String> dataMap = new HashMap<String, String>();
	dataMap.put("contact_no", contact_no + "");
	dataMap.put("writer", writer);
	dataMap.put("gobiz_id", gobiz_id);
	dataMap.put("comp_nm", comp_nm);
	dataMap.put("email", email);
	dataMap.put("title", title);
	dataMap.put("content", content);
	
	Dao dao = vcuAction.insertContactUs(dataMap);
	
	String nextUrl = "";
	if(dao.getResult()){
		nextUrl = "ContactUs.jsp"; 
	}
	
	if(!"".equals(nextUrl))
		response.sendRedirect(nextUrl);
	else
		response.sendError(response.SC_NOT_FOUND);

%>

<script type="text/javascript">
	$(document).ready(function(){
	})
</script>