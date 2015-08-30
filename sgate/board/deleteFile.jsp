<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.ec21.board.VnNewsBoardAction,
			com.ec21.util.Utility"
%><%
Utility util = Utility.getInstance();

VnNewsBoardAction vnbAction = VnNewsBoardAction.getInstance();

int newsNo = util.getInt(request.getParameter("newsNo"));
String type = util.nullCheck(request.getParameter("type"));
String newsType = util.nullCheck(request.getParameter("newsType"));

if(!"".equals(newsNo))
{
	try
	{
		vnbAction.deleteFile(newsNo, newsType, type);
		out.println("SUCCESS");
	}
	catch(Exception e)
	{
		out.println("FAILURE");
	}
}
else
{
	out.println("FAILURE");
}
%>