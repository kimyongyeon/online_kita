<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.io.*,
			java.util.*,
			com.ec21.contact_us.VnContactUsAction,
			com.ec21.common.Dao,
			com.ec21.util.Utility"
%>
<%
 response.setHeader("Content-Disposition", "attachment; filename=contactUs_" +new java.sql.Date(System.currentTimeMillis()) + ".xls");   
 response.setHeader("Content-Description", "JSP Generated Data");
%>
<%
	VnContactUsAction vcuAction = VnContactUsAction.getInstance();
	Utility util = Utility.getInstance();
	Dao vcuListDao = new Dao();
	HashMap<String, String> searchMap = new HashMap<String, String>();
	
	String contactNo = request.getParameter("contactNo");
	// 엑셀 데이터를 불러온다.
	vcuListDao = vcuAction.getContactUsExcelDown(contactNo);
%>

<meta http-equiv="Content-Type" content="application/vnd.ms-excel;charset=UTF-8">
<table id="tbContent" border="1">
	<tr>
		<td>등록자</td>
		<td>이메일</td>
		<td>회사명</td>
		<td>제목</td>
		<td>내용</td>
		<td>답변제목</td>
		<td>답변</td>
		<td>답변자</td>
		<td>처리일</td>
	</tr>
<%
for(int i=0,j=vcuListDao.getRowCnt(); i<j; i++)
{
%>
	<tr>
		<td><%=vcuListDao.getString(i, "WRITER")%></td>
		<td><%=vcuListDao.getString(i, "EMAIL")%></td>
		<td><%=vcuListDao.getString(i, "COMP_NM")%></td>
		<td><%=util.getDate(vcuListDao.getString(i, "INPUT_DT"), "YYYY-MM-DD")%></td>
		<td><%=vcuListDao.getString(i, "TITLE")%></td>
		<td><%=vcuListDao.getString(i, "CONTENT")%></td>
		<td><%=vcuListDao.getString(i, "REPLY_CONTENT")%></td>
		<td><%=vcuListDao.getString(i, "ADMIN_ID")%></td>
		<td><%=util.getDate(vcuListDao.getString(i, "REPLY_DT"), "YYYY-MM-DD")%></td>
	</tr>
<%
}
%>
</table>
