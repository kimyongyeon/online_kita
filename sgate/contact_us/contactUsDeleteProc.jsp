<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.io.*,
			java.util.*,
			com.ec21.contact_us.VnContactUsAction,
			com.ec21.common.Dao,
			com.ec21.util.Utility"
%>
<%@include file="../../include/commonCss.jsp" %>
<%@include file="../../include/commonJs.jsp" %>
<%
	Utility util = Utility.getInstance();
	VnContactUsAction vcuAction = VnContactUsAction.getInstance();
	
	//form parameter
	String action        = util.nullCheck(request.getParameter("action"));
	String contact_no     = util.nullCheck(request.getParameter("contactNo"));
	
	HashMap<String, String> dataMap = new HashMap<String, String>();
	dataMap.put("contact_no", contact_no + "");
	
	Dao dao = vcuAction.deleteContactUs(dataMap);
	
	String nextUrl = "";
	if(dao.getResult()){
		nextUrl = "contactUsList.jsp"; 
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