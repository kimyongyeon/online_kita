<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.HashMap,
			com.ec21.community.VnCommunityAction,
			com.ec21.common.Dao,
			com.ec21.util.Utility"
%><%
VnCommunityAction vncAction = VnCommunityAction.getInstance();
Utility util = Utility.getInstance();

Dao vncListDao = new Dao();
Dao vncPListDao = new Dao();

//
int pageNum = util.getPageNum(util.getInt(request.getParameter("pageNum")));
String searchType = util.nullCheck(request.getParameter("searchType"));
String searchData = util.nullCheck(request.getParameter("searchData"));

int comNo = util.getInt(request.getParameter("comNo"));

vncListDao = vncAction.getCommunityView(comNo); //리스트 detail
vncPListDao = vncAction.getCommunityReplyView(comNo); // reply 리스트 

%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<meta name="description" content="" >
<meta name="keywords" content="" >
<title>Gobizkorea.com Việt Nam</title>
<%@include file="/include/commonCss.jsp" %>
<%@include file="/include/commonJs.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
	
	$('a[name=insertReply]').click(insertReply);
	$('a[name=goList]').click(goList);
});
 

function goList()
{
	$('form[name=dataForm]').attr('action','CommunityList.jsp');
	formSubmit('dataForm');	
}

function insertReply()
{
	$('input[name=action]').val("REPLY_INSERT");
	$('form[name=dataForm]').attr('action','CommunityEditForm.jsp');
	formSubmit('dataForm');	
}

</script>
</head>
<body>
<form name="dataForm" action="CommunitySubmit.jsp" method="post">
<input type="hidden" name="searchType" value="<%=searchType%>" />
<input type="hidden" name="searchData" value="<%=searchData%>" />
<input type="hidden" name="pageNum" value="<%=pageNum%>" />
<input type="hidden" name="comNo" value="<%=comNo%>" />
<input type="hidden" name="action" value="" />
</form>	
<% 
String topAndLefMenu = "0505"; 
String topAndlefSecondMenu = "0000";
%>
	<!-- Wrapper -->
	<div id="wrapper">
		
		<!-- Head -->
		<% String action = "CommunityList.jsp"; %>
  		<%@include file="../include/topMenu.jsp" %>		
		<!-- //Head -->
		
		<!-- LNB -->
		<%@include file="../include/leftMenu.jsp" %>
		<!-- //LNB -->
		
		<!-- Contents -->
		<div id="contents">
			<div class="bannerIndex"><a href="#none"><img src="../images/banner/banner_index.gif" alt="Dịch vụ kết nối kinh doanh"></a></div>
			<div class="location">
				<em>Trang chủ </em> &#62;
				<em>Thông tin hữu ích </em> &#62; 
				<em class="on">Cộng đồng doanh nghiệp</em>
			</div>
			<h3 class="title">Cộng đồng doanh nghiệp</h3>
			
			<!-- viewBox -->
			<div class="viewBox">
				<div class="top">
					<strong><%=vncListDao.getString(0,"TITLE")%></strong>
					<span>by <%=vncListDao.getString(0,"WRITER") %>, <%=util.getDate(vncListDao.getString(0,"INPUT_DT"), "YYYY-MM-DD HH:MM")%></span>
					<div>
						<em class="vn"><u>Vietnam</u></em>
						<a href="#none" class="link">VINA Auto</a>
						<a href="#none" class="eblog">e-blog</a>
					</div>
				</div>
				<div class="bottom">
					<%=vncListDao.getString(0,"CONTENT") %>
				</div>
			</div>
			<div class="buttonLR">
				<span class="button btnColor5 btnSize5"><a href="#none" name="insertReply">Phản hồi</a></span>
				<span class="button btnColor6 btnSize5"><a href="#none" name="goList">Danh mục</a></span>
			</div>
			<!-- //viewBox -->
			
			<%				
			if(vncPListDao.getRowCnt() > 0)
			{			
				for(int i=0,j=vncPListDao.getRowCnt(); i<j; i++)
				{
			%>
			<div class="conLine"></div>			
			<div class="replyBox">
				<div class="top">
					<strong><%=vncPListDao.getString(i, "TITLE")%></strong>
					<span>by <%=vncPListDao.getString(i,"WRITER") %>, <%=util.getDate(vncPListDao.getString(i,"INPUT_DT"), "YYYY-MM-DD HH:MM")%></span>
					<div>
						<em class="vn"><u>Vietnam</u></em>
						<a href="#none" class="link">VINA Auto</a>
						<a href="#none" class="eblog">e-blog</a>
					</div>
				</div>
				<div class="bottom">
					<%=vncPListDao.getString(i, "CONTENT") %>
				</div>
			</div>
			<div class="buttonLR">
				<span class="button btnColor5 btnSize5"><a href="#none" name="insertReply">Phản hồi</a></span>
				<span class="button btnColor6 btnSize5"><a href="#none" name="goList">Danh mục</a></span>
			</div>
			
			<%
				}
			}
			%>		
			
			
		</div>
		<!-- //Contents -->
		
		<!-- Footer -->
		
		<!-- //Footer -->
		
	</div>
	<!-- //Wrapper -->

</body>
</html>