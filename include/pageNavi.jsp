<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%><%
//페이징 처리
int pageBundle = 10;
int startPage = 1;
int endPage = 1;
int totalPage = (totalCount - 1) / rowCnt  + 1;

if (pageNum % pageBundle == 0)
	startPage = (pageNum - 1) / pageBundle;
else
	startPage = pageNum / pageBundle;

startPage = startPage * pageBundle + 1;
endPage = startPage + pageBundle - 1;

if(endPage > totalPage)
	endPage = totalPage;
%><div class="pagingBox">
	<p class="paging">
		<%
		if(startPage != 1)
		{
		%>
			<a href="javascript:goPage(1);" class="pprev"><img src="../images/btn/btn_pagingpprev.gif" alt="frist" /></a>
		<%
		}

		if (startPage/10 > 0)
		{
		%>
			<a href="javascript:goPage(<%=startPage - pageBundle%>);" class="prev"><img src="../images/btn/btn_pagingprev.gif" alt="prev" /></a>
		<%
		}

		for(int i=startPage,j=endPage; i<=j; i++)
		{
		%>
			<a href="javascript:goPage(<%=i%>);" <%if(i==pageNum){%>class="on" <%}%><%if(i == j){%>style="background-image: none;"<%}%>><%=i%></a>
		<%
		}

		if(endPage < totalPage )
		{
		%>
			<a href="javascript:goPage(<%=startPage + pageBundle%>);" class="next"><img src="../images/btn/btn_pagingnext.gif" alt="next" /></a>
		<%
		}

		if (endPage != totalPage)
		{
		%>
			<a href="javascript:goPage(<%=totalPage%>);" class="nnext"><img src="../images/btn/btn_pagingnnext.gif" alt="last" /></a>
		<%
		}
		%>
	</p>
</div>