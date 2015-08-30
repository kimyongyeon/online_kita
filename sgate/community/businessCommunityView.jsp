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

%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>Gobiz Country Channel</title>
<%@include file="../include/commonCss.jsp" %>
<%@include file="../include/commonJs.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
	
	$('a[name=insertReply]').click(insertReply);
	$('a[name=goList]').click(goList);
});
 

function goList()
{
	$('form[name=dataForm]').attr('action','businessCommunityList.jsp');
	formSubmit('dataForm');	
}

function insertReply()
{
	$('form[name=dataForm]').attr('action','businessCommunityREdit.jsp');
	formSubmit('dataForm');	
}

function deleteBtn(comNo)
{ 
	if(confirm('삭제후에는 복원이 불가하며\n해당 댓글도 함께 삭제 됩니다.\n그대로 삭제하시겠습니까?'))
	{
		$('form[name=dataForm]').attr('action','businessCommunityEditSubmit.jsp');
		$('input[name=action]').val("DELETE");
		$('input[name=replyNo]').val("");
		$('input[name=reply]').val("N");
		formSubmit('dataForm');	
	}		
} 

function deleteBtnR(comNo, replyNo)
{
	if(confirm('삭제후에는 복원이 불가합니다. 그대로 삭제하시겠습니까?'))
	{
		$('form[name=dataForm]').attr('action','businessCommunityEditSubmit.jsp');
		$('input[name=action]').val("DELETE");
		$('input[name=replyNo]').val(replyNo);
		$('input[name=reply]').val("Y");
		formSubmit('dataForm');	
	}		
}
function postEdit(actionNm, comNo, replyNo)
{	
	if(confirm('변경시 이젠 데이터로 복구할 수 없습니다.\n변경하시겠습니까?'))
	{
		jQuery.ajax({
			url: 'http://vn.gobizkorea.com/sgate/community/businessCommunityEditAjx.jsp',
			type: "GET",
			dataType: "text",
			timeout: 30000,
			data: { "action" : actionNm, "comNo" : comNo, "replyNo" : replyNo, "title" : $('#title'+replyNo).val(), "content" : $('#content'+replyNo).val() },		
			success: function (data) {
				if("SUCCESS" == data)
					alert("게시물이 수정되었습니다.");	
				else
					alert("오류가 발생하여 게시물이 수정되지 못하였습니다.\n 다시 시도해 주세요");	
			},
			error : function() {				
				alert("오류가 발생하여 게시물이 수정되지 못하였습니다.\n 다시 시도해 주세요");
			}
		});
	}
}

</script>
</head>
<body>
<form name="dataForm" action="businessCommunityEditSubmit.jsp" method="post">
<input type="hidden" name="searchType" value="<%=searchType%>" />
<input type="hidden" name="searchData" value="<%=searchData%>" />
<input type="hidden" name="pageNum" value="<%=pageNum%>" />
<input type="hidden" name="comNo" value="<%=comNo%>" />
<input type="hidden" name="replyNo" value="" />
<input type="hidden" name="reply" value="" />
<input type="hidden" name="action" value="" />
</form>	
	<!-- conteiner -->
	<div class="conainer">
		
		<!-- LNB -->
		<% String leftMenu = "0205"; %>
		<%@include file="../include/sgateLeftMenu.jsp" %>
		<!-- //LNB -->
		
		<!-- contents -->
		<div class="contents">
			<div class="contentsDetail">	
			
				<!-- Location-->
				<div class="location">
					<h2>게시판 관리</h2>
					<img src="../../sgate/images/text/textTitle02.gif" alt="게시판관리"/>
					<span>
						<em>Main</em>&#62;
						<em>게시판 관리</em>&#62;
						<em class="on">Business Community 게시물 상세정보</em>
					</span>
				</div>
				<!-- //Location-->
				
				<h4 class="title">Business Community 게시물 상세정보</h4>
				
				
				<h5 class="title">
					[게시물 상세 정보]
					<em class="sub">
						<span class="button btnColor1 buttonSize2"><a href="#none" name="insertReply">댓글 등록</a><em></em></span>
					    <span class="button btnColor1 buttonSize2"><a href="#none" name="goList">목록</a><em></em></span>
					</em>
				</h5>
				
				<!-- 게시물 상세정보 -->
				
				<div class="noticeBox">
					<ul>
						<li>
							<input type="text" class="text" size="139" value="<%=vncListDao.getString(0,"TITLE")%>" id="title0"/>
							<br/><em class="sub">by <%=vncListDao.getString(0,"WRITER") %>, <%=util.getDate(vncListDao.getString(0,"INPUT_DT"), "YYYY-MM-DD")%></em>
						</li>						
						<li class="currentInfo">
							<span><img src="../../sgate/images/icon/icon_vn.gif" alt="Vietnam"/></span>
							<a href="#none" class="currentLink">VINA Auto</a>
							<a href="#none" class="eBlog">e-Blog</a>
							<div class="buttonR">
								<span class="button btnColor2 buttonSize1"><a href="javascript:postEdit('UPDATE','<%=comNo%>',0)">수정</a><em></em></span>
								<span class="button btnColor2 buttonSize1"><a href="javascript:deleteBtn('<%=vncListDao.getInt(0,"COM_NO")%>')">삭제</a><em></em></span>
							</div>
						</li>
						<li>
							<textarea cols="50" rows="4" id="content0"><%=vncListDao.getString(0,"CONTENT") %></textarea>
						</li>
					</ul>
				</div>
				<!-- //게시물 상세정보 -->
						
				
				<%				
				if(vncPListDao.getRowCnt() > 0)
				{
				%>
				<div class="contentLine">절취선입니다.</div>
				
				<h5 class="titleReply">[리플 상세 정보]</h5>
				<%
					for(int i=0,j=vncPListDao.getRowCnt(); i<j; i++)
					{
				%>
					<!-- 리플 상세정보 -->
					<div class="replyBox">
						<ul>
							<li>
								<input type="text" class="text" size="139" value="<%=vncPListDao.getString(i,"TITLE")%>" id="title<%=vncPListDao.getInt(i, "REPLY_NO")%>"/>
								<!-- <span class="text"><%//=vncPListDao.getString(i, "TITLE") %></span> -->
								<br/><em class="sub">by <%=vncPListDao.getString(i, "WRITER") %>, <%=util.getDate(vncPListDao.getString(i, "INPUT_DT"), "YYYY-MM-DD") %></em>
							</li>
							<li class="currentInfo">
								<span><img src="../../sgate/images/icon/icon_ko.gif" alt="korea"/></span>
								<a href="#none" class="currentLink"><%=vncPListDao.getString(i, "WRITER")%></a>
								<div class="buttonR">
									<span class="button btnColor2 buttonSize1"><a href="javascript:postEdit('REPLY_UPDATE','<%=comNo%>','<%=vncPListDao.getInt(i, "REPLY_NO")%>')">수정</a><em></em></span>
									<span class="button btnColor2 buttonSize1"><a href="javascript:deleteBtnR('<%=vncPListDao.getInt(i, "COMP_NO")%>','<%=vncPListDao.getInt(i, "REPLY_NO")%>')">삭제</a><em></em></span>
								</div>
							</li>
							<li>
								<textarea cols="50" rows="4" id="content<%=vncPListDao.getInt(i, "REPLY_NO")%>"><%=vncPListDao.getString(i, "CONTENT") %></textarea>
								<!-- <p class="textReply">
									<%//=vncPListDao.getString(i, "CONTENT") %>
								</p> //-->
							</li>
						</ul>
					</div>
					<!-- //리플 상세정보 -->
										
				<%
					}
				}
				%>
								
			</div>
		</div>
		<!-- //contents -->
		
	</div>
	<!-- //conteiner -->
	
</body>
</html>