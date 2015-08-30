<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.ec21.product.VnFeaturedProdAction,
			com.ec21.util.Utility"
%><%
Utility util = Utility.getInstance();

VnFeaturedProdAction vfpAction = VnFeaturedProdAction.getInstance();

String action = util.nullCheck(request.getParameter("action"));
int pageNum = util.getPageNum(util.getInt(request.getParameter("pageNum")));
int gesiNo = util.getInt(request.getParameter("gesiNo"));

if(!"".equals(gesiNo))
{
	if("DELETE".equals(action))
	{
		vfpAction.deleteFeaturedProducts(gesiNo);

		response.sendRedirect("featuredProductsList.jsp?pageNum=" + pageNum);
	}
}
else
{
	response.sendError(response.SC_NOT_FOUND);
	return;
}
%>