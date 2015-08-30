<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.ec21.board.VnNewsBoardAction,
			com.ec21.util.Utility"
%><%
Utility util = Utility.getInstance();

VnNewsBoardAction vnbAction = VnNewsBoardAction.getInstance();

String action = util.nullCheck(request.getParameter("action"));
int pageNum = util.getPageNum(util.getInt(request.getParameter("pageNum")));
int newsNo = util.getInt(request.getParameter("newsNo"));
String newsType = util.nullCheck(request.getParameter("newsType"));



if(!"".equals(newsNo))
{
	if("DELETE".equals(action))
	{
		vnbAction.deleteNews(newsType, newsNo);

		if("NN".equals(newsType))
			response.sendRedirect("newsAndNoticeList.jsp?pageNum=" + pageNum);
		else if("IN".equals(newsType))
			response.sendRedirect("koreaIndustryNewsList.jsp?pageNum=" + pageNum);
		else if("WN".equals(newsType))
			response.sendRedirect("koreanWaveNewsList.jsp?pageNum=" + pageNum);
		else
			response.sendRedirect("newsAndNoticeList.jsp?pageNum=" + pageNum);
	}
}
else
{
	response.sendError(response.SC_NOT_FOUND);
	return;
}
%>