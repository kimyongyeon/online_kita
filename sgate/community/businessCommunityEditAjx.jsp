<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.io.*,
			java.util.*,			
			com.ec21.community.VnCommunityAction,
			com.ec21.common.Dao,			
			com.ec21.util.Utility"
%><%
Utility util = Utility.getInstance();

VnCommunityAction vncAction = VnCommunityAction.getInstance();

HashMap<String, String> dataMap = null;


//form parameter
String   action      = util.nullCheck(request.getParameter("action"));     //실행 분류
int      comNo       = util.getInt(request.getParameter("comNo"));        //번호
String   title       = util.nullCheck(request.getParameter("title"));      //제목
String 	 content     = util.nullCheck(request.getParameter("content"));   //내용

int 	 compNo      = util.getInt(request.getParameter("comNo"));        //번호
int 	 replyNo     = util.getInt(request.getParameter("replyNo"));        //번호


dataMap = new HashMap<String, String>();

/*
System.out.println("action  : " + action  );
System.out.println("comNo   : " + comNo   );
System.out.println("title   : " + title   );
System.out.println("content : " + content );
System.out.println("compNo  : " + compNo  );
System.out.println("replyNo : " + replyNo );
*/

dataMap.put("comNo", comNo + "");
dataMap.put("compNo", comNo + "");
dataMap.put("replyNo", replyNo + "");
dataMap.put("title", title);
dataMap.put("content", content);

String result = "FAILURE";


if("UPDATE".equals(action))
{
	vncAction.communityEdit(dataMap);	
	result = "SUCCESS";
	
}
else if("REPLY_UPDATE".equals(action))
{
	vncAction.communityReplyEdit(dataMap);
	result = "SUCCESS";
}

out.print(result);

%>