<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.ec21.util.*"
%><%
String nextUrl =  util.nullCheck(request.getParameter("nextUrl"));

session.invalidate(); //session 파괴

if (!"".equals(nextUrl))
{
	response.sendRedirect (nextUrl);
	return;
}
else
{
	response.sendRedirect ("/");
	return;
}
%>