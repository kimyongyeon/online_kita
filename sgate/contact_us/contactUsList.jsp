<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.HashMap,
			com.ec21.contact_us.VnContactUsAction,
			com.ec21.common.Dao,
			com.ec21.util.Utility"
%>
<%
	VnContactUsAction vcuAction = VnContactUsAction.getInstance();
	Utility util = Utility.getInstance();
	
	Dao vcuListDao = new Dao();
	HashMap<String, String> searchMap = new HashMap<String, String>();
	
	int pageNum = util.getPageNum(util.getInt(request.getParameter("pageNum")));
	int totalCount = 0;
	int rowCnt = 10;
	
	String searchType = util.nullCheck(request.getParameter("searchType"));
	String searchData = util.nullCheck(request.getParameter("searchData"));
	if("".equals(searchType)) searchType = "writer";
	
	searchMap.put("searchType", searchType);
	searchMap.put("searchData", searchData);
	
	totalCount = vcuAction.getContactUsListTotalCount(searchMap); //리스트 총 갯수
	vcuListDao = vcuAction.getContactUsList(pageNum, rowCnt, searchMap); // 리스트 정보
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<title>Gobiz Country Channel</title>
	<%@include file="../include/commonCss.jsp" %>
	<%@include file="../include/commonJs.jsp" %>
	
	<script type="text/javascript">
		
		function search()
		{
			formSubmit('searchForm');
		}
		
		function goPage(pageNum)
		{
			$('input[name=pageNum]').val(pageNum);
			formSubmit('searchForm');
		}
		
		function excelDownBtn()
		{
 			var ckb = document.getElementsByName('selectCheck');
	        var j=0;
	        var contactNo="";
	        var url="";

	        for(var i=0; i<ckb.length; i++){
    			if(ckb[i].checked == true){
    				contactNo += ckb[i].value + ",";
    				j++;
    			}
    		}
	        if(j==0){
				alert("엑셀저장을 원할시 체크박스에 체크해 주시기 바랍니다.");
                return;
			}
	        contactNo = contactNo.substr(0,contactNo.length - 1);
			//alert(contactNo);
			$('input[name=contactNo]').val(contactNo);
			document.dataForm.action = "contactUsExcelDown.jsp";
			formSubmit('dataForm');
		}
		
		function updateBtn(contactNo)
		{
			$('input[name=action]').val("UPDATE");
			$('input[name=contactNo]').val(contactNo);
			formSubmit('dataForm');
		}

		function deleteBtn(contactNo)
		{
			$('input[name=action]').val("DELETE");
			$('input[name=contactNo]').val(contactNo);
			document.dataForm.action = "contactUsDeleteProc.jsp";
			formSubmit('dataForm');
		}
	</script>
</head>
<body>

<!-- conteiner -->
	<div class="conainer">
		
		<!-- LNB -->
		<% String leftMenu = "0207"; %>
  		<%@include file="../include/sgateLeftMenu.jsp" %>
		<!-- //LNB -->
		
		<!-- contents -->
		<div class="contents">
			<div class="contentsDetail">	
			
				<!-- Location-->
				<div class="location">
					<h2>게시판 관리</h2>
					<img src="../images/text/textTitle02.gif" alt="게시판관리"/>
					<span>
						<em>Main</em>&#62;
						<em>게시판 관리</em>&#62;
						<em class="on">Contact Us 목록</em>
					</span>
				</div>
				<!-- //Location-->
				
				<h4 class="title">Contact Us 목록</h4>
				<div class="searchBox">
					<form name="searchForm" action="contactUsList.jsp" method="post">
						<input type="hidden" name="pageNum" value="<%=pageNum%>"/>
						<div class="designSelecter">
							<select name="searchType">
								<option value="writer" <%if("writer".equals(searchType)){%>selected="selected"<%}%>>등록자</option>
								<option value="email" <%if("email".equals(searchType)){%>selected="selected"<%}%>>이메일</option>
								<option value="title" <%if("title".equals(searchType)){%>selected="selected"<%}%>>제목</option>
							</select>
						</div>
						<span class="searchArea">
							<input type="text" name="searchData" value="<%=searchData%>"/>
							<a href="javascript:search()"><img src="../images/btn/btn_search.gif" alt="검색"/></a>
						</span>
					</form>
				</div>
				<p class="searchResult">총 <em><%=totalCount%></em> 건 / 페이지 <em><%=pageNum%></em> / <em><% if(totalCount <= rowCnt) out.print("1"); else if(totalCount % rowCnt == 0) out.println(totalCount / rowCnt); else out.print(totalCount / rowCnt + 1);%></em></p>
				
				
				<div class="buttonR">
					<span class="button btnColor1 buttonSize2"><a href="javascript:excelDownBtn();">EXCEL</a><em></em></span>
				</div>
				<div class="tableType1">
					<form name="dataForm" action="contactUsDetailView.jsp" method="post">
					<input type="hidden" name="searchType" value="<%=searchType%>"/>
					<input type="hidden" name="searchData" value="<%=searchData%>"/>
					<input type="hidden" name="pageNum" value="<%=pageNum%>"/>
					<input type="hidden" name="action" value=""/>
					<input type="hidden" name="contactNo" value=""/>
					<table summary="Contact Us">
						<caption>Contact Us</caption>
						<colgroup>
							<col width="7%"/>
							<col width="7%"/>
							<col width="*"/>
							<col width="13%"/>
							<col width="14%"/>
							<col width="12%"/>
							<col width="14%"/>
						</colgroup>
						<thead>
							<tr>
								<th>선택</th>
								<th>번호</th>
								<th>제목</th>
								<th>등록자명</th>
								<th>등록일</th>
								<th>상태</th>
								<th>관리</th>
							</tr>
						</thead>

						<tbody>
						<%
						if(vcuListDao.getRowCnt() < 1)
						{
						%>
							<tr>
								<td colspan="5">No Data.</td>
							</tr>
						<%
						}
						else
						{
							for(int i=0,j=vcuListDao.getRowCnt(); i<j; i++)
							{
								int num = totalCount + rowCnt - (rowCnt * pageNum + i); 						  // 순번
								int contactNo = vcuListDao.getInt(i, "CONTACT_NO"); 					          // contact 번호
								String writer = vcuListDao.getString(i, "WRITER"); 								  // 글쓴이
								String title = vcuListDao.getString(i, "TITLE"); 								  // 제목
								String inputDt = util.getDate(vcuListDao.getString(i, "INPUT_DT"), "YYYY-MM-DD"); // 등록일자
								String status = vcuListDao.getString(i, "STATUS"); 								  // 상태
								title = (title.length() > 30) ? title = title.substring(0,20) + "..." : title;
								
							%>
							<tr>
								<td><input type="checkbox" class="check" name="selectCheck" id="selectCheck" value="<%=contactNo%>" /></td>
								<td><%=num%></td>
								<td class="left"><a href="contactUsDetailView.jsp?action=UPDATE&contactNo=<%=contactNo%>"><%=title%></a></td>
								<td><%=writer%></td>
								<td><%=inputDt%></td>
								<td><%=status%></td>
								<td>
									<span class="button btnColor2 buttonSize1"><a href="javascript:updateBtn(<%=contactNo%>);">수정</a><em></em></span>
									<span class="button btnColor2 buttonSize1"><a href="javascript:deleteBtn(<%=contactNo%>);">삭제</a><em></em></span>
								</td>
							</tr>
							<%
							}
						}
						%>
						</tbody>
					</table>
					</form>
				</div>
				
				<!-- Paging -->
				<%@include file="../include/pageNavi.jsp" %>
				<!-- //paging -->
				
			</div>
		</div>
		<!-- //contents -->
		
	</div>
	<!-- //conteiner -->

</body>
</html>