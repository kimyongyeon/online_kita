<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.ec21.servlet.DownServlet"
%><%
DownServlet dServlet = new DownServlet();
dServlet.service(request, response);
%>