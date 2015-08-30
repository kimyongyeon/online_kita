<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.HashMap,
			com.ec21.community.VnCommunityAction,
			com.ec21.common.Dao,
			com.ec21.util.Utility"
%><%
VnCommunityAction vncAction = VnCommunityAction.getInstance();
Utility util = Utility.getInstance();

Dao vncListDao = new Dao();

HashMap<String, String> searchMap = new HashMap<String, String>();

//ger Parameter
String actionType = util.nullCheck(request.getParameter("action"));
int comNo = util.getInt(request.getParameter("comNo"));
//String inputDt  = new java.text.SimpleDateFormat ("yyyyMMdd").format(new java.util.Date());

String title = "";

if("REPLY_INSERT".equals(actionType)) 
{
	vncListDao = vncAction.getCommunityView(comNo);
	title = "Trả lời : " + vncListDao.getString(0, "TITLE");	
}


%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<meta name="description" content="" >
<meta name="keywords" content="" >
<title>Gobizkorea.com Việt Nam</title>
<%@include file="/include/commonCss.jsp" %>
<%@include file="/include/commonJs.jsp" %>
<script type="text/javascript" src="/sgate/js/tinymce/jscripts/tiny_mce/jquery.tinymce.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	tinymceConfig();	
});

function submitBtn()
{		
	formSubmit('dataForm');
}

function cancel()
{		
	$('input[name=title]').val("");
	$('textarea[name=content]').val("");	
}

function goList()
{	
	$('form[name=dataForm]').attr('action','businessCommunityList.jsp');
	formSubmit('dataForm');	
}


function formCheck()
{	
	//tinyMCE.triggerSave();
	var content  = tinyMCE.get('content').getContent();	
	
	if(!$.trim($('input[name=title]').val()))
	{
		alert('제목을 입력하세요.');
		$('input[name=title]').focus();
		return false;
	}
	else if(!$.trim(content))
	{
		alert('내용을 입력하세요.');
		$('textarea[name=content]').focus();
		tinyMCE.get('content').focus();
		return false;
	}	
	else
		return true;
}


</script>
</head>
<body>
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
		<!-- //LNB -->
		
		<!-- Contents -->
		<div id="contents">
		<form name="dataForm" action="CommunitySubmit.jsp" method="post">
		<input type="hidden" name="action" value="<%=actionType%>"/>
		<input type="hidden" name="comNo" value="<%=comNo%>"/>			
			<div class="bannerIndex"><a href="#none"><img src="../images/banner/banner_index.gif" alt="Dịch vụ kết nối kinh doanh"></a></div>
			<div class="location">
				<em>Trang chủ </em> &#62;
				<em>Thông tin hữu ích </em> &#62; 
				<em class="on">Cộng đồng doanh nghiệp</em>
			</div>
			<h3 class="title">Đăng chủ đề mới</h3>
			
			<div class="MSGnew iconMSG">
				<div class="MSGnewDetail">
				Các tin nhắn được viết bằng <em class="red">tiếng Anh.</em><br>
				Vui lòng  <em class="red">KHÔNG</em>: gửi tin rác, đăng các link không liên quan và các nội dung xấu. 
				</div>
				<div class="bottom"></div>
			</div>
			
			<div class="tableType1">
				<table summary="Đăng chủ đề mới">
					<caption>Đăng chủ đề mới</caption>
					<colgroup>
						<col width="20%">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th><em class="red">*</em>Chủ đề</th>
							<td>
								<input type="text" size="100" name="title" value="<%=title%>">									
								<label class="red">* Bắt buộc</label>
							</td>
						</tr>
						<tr>
							<th class="VTop"><em class="red">*</em>Tin nhắn</th>
							<td  style="padding:1px;">
								<div class="tinymceTable">
									<textarea id="content" name="content" style="width:100%;" class="subTitleWrite tinymce"> </textarea>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="buttonC">
				<span class="button btnColor1 btnSize1"><a href="javascript:submitBtn()">Đăng</a></span>
				<span class="button btnColor3 btnSize1"><a href="javascript:cancel()">Hủy</a></span>
			</div>		
			
		</form>	
		</div>
		<!-- //Contents -->
		
		<!-- Footer -->
		<%//@ include file = "/include/footerMenu.jsp" %>
		<!-- //Footer -->
		
	</div>
	<!-- //Wrapper -->

</body>
</html>