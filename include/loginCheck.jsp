<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.ec21.util.Utility"
%><%
Utility util = Utility.getInstance();

String adminId = (String)session.getAttribute("adminId");

String thisURL = request.getRequestURI();

if("".equals(util.nullCheck(adminId)))
{
	response.sendRedirect("/login/loginSubmit.jsp?returnURL="+thisURL);
	return;
}
%>

