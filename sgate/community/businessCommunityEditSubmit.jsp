<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.io.*,
			java.util.*,
			org.apache.commons.fileupload.*,
			com.ec21.community.VnCommunityAction,
			com.ec21.common.Dao,
			com.ec21.upload.MultiPart,
			com.ec21.util.Utility"
%><%
Utility util = Utility.getInstance();

VnCommunityAction vncAction = VnCommunityAction.getInstance();

HashMap<String, String> dataMap = null;


//form parameter
String   action      = util.nullCheck(request.getParameter("action"));     //실행 분류
String   writer      = util.nullCheck(request.getParameter("writer"));     //작성자
int      comNo       = util.getInt(request.getParameter("comNo"));        //번호
String   title       = util.nullCheck(request.getParameter("title"));      //제목
String 	 inputDt     = util.nullCheck(request.getParameter("inputDt"));    //등록일
String 	 content     = util.nullCheck(request.getParameter("content"));   //내용
String[] comID       = request.getParameterValues("comID");

int 	 compNo      = util.getInt(request.getParameter("comNo"));        //번호
int 	 replyNo     = util.getInt(request.getParameter("replyNo"));        //번호
String 	 reply       = util.nullCheck(request.getParameter("reply"));   //내용


String nextUrl = ""; //완료 후 이동 할 페이지 설정

dataMap = new HashMap<String, String>();

if("INSERT".equals(action))
	comNo = vncAction.getCommunitySeq();

/*
System.out.println("action  : " + action  );
System.out.println("writer  : " + writer  );
System.out.println("comNo   : " + comNo   );
System.out.println("title   : " + title   );
System.out.println("inputDt : " + inputDt );
System.out.println("content : " + content );
System.out.println("comID   : " + comID   );
System.out.println("compNo  : " + compNo  );
System.out.println("replyNo : " + replyNo );
System.out.println("reply   : " + reply   );
*/

dataMap.put("comNo", comNo + "");
dataMap.put("compNo", compNo + "");
dataMap.put("replyNo", reply + "");
dataMap.put("writer", writer);
dataMap.put("title", title);
dataMap.put("inputDt", inputDt);
dataMap.put("content", content);

if("INSERT".equals(action))
{
	vncAction.communityInsert(dataMap);
	//nextUrl = "businessCommunityEdit.jsp?action=UPDATE&comNo=" + comNo;
	nextUrl = "businessCommunityView.jsp?comNo=" + comNo;
}
else if("REPLY_INSERT".equals(action))
{
	vncAction.communityReplyInsert(dataMap);
	//nextUrl = "businessCommunityEdit.jsp?action=UPDATE&comNo=" + comNo;
	nextUrl = "businessCommunityView.jsp?comNo=" + comNo;
}
else if("UPDATE".equals(action))
{
	vncAction.communityEdit(dataMap);
	//nextUrl = "businessCommunityEdit.jsp?action=UPDATE&comNo=" + comNo;
	nextUrl = "businessCommunityView.jsp?comNo=" + comNo;
}
else if("REPLY_UPDATE".equals(action))
{
	vncAction.communityReplyEdit(dataMap);
	//nextUrl = "businessCommunityEdit.jsp?action=UPDATE&comNo=" + comNo;
	nextUrl = "businessCommunityView.jsp?comNo=" + comNo;
}
else if("DELETE".equals(action))
{	
	if("N".equals(reply))
	{
		vncAction.communityDelete(comNo);
		nextUrl = "businessCommunityList.jsp";
	}
	else
	{
		vncAction.communityReplyDelete(comNo, replyNo);
		nextUrl = "businessCommunityView.jsp?comNo=" + comNo;
	}
}
else if("MULTI_DELETE".equals(action))
{						
	vncAction.communityDeleteMulti(comID);
	nextUrl = "businessCommunityList.jsp";
}
else
{
	response.sendError(response.SC_NOT_FOUND);
	return;
}

if(!"".equals(nextUrl))
	response.sendRedirect(nextUrl);
else
	response.sendError(response.SC_NOT_FOUND);


%>