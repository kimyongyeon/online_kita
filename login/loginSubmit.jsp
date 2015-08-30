<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.ec21.util.Utility,
			com.ec21.common.Dao,
			com.ec21.member.MemberAction"
%><%
Utility util = Utility.getInstance();

MemberAction mAction = MemberAction.getInstance();

Dao mDao = new Dao();

String userId = util.nullCheck(request.getParameter("user_id"));
String userPw = util.nullCheck(request.getParameter("user_pw"));
String ip = util.nullCheck(request.getRemoteAddr());
String returnURL = util.nullCheck(request.getParameter("returnURL"));
boolean loginCheck = false;

//아이디 확인 로직 추가 해야됨
if(!"".equals(userId) && !"".equals(userPw))
{
	mDao = mAction.getLoginInfo(userId);
}



//세션에 저장
if(!loginCheck)
{
	out.print("<script type=\"text/javascript\">alert(\"아이디 또는 비밀번호가 틀렸습니다.\");history.back(-1);</script>");
	out.flush();
}
else
{
	session.setAttribute("memberId", memberId);

	if("".equals(returnURL))
		response.sendRedirect("/");
	else
		response.sendRedirect(returnURL);
}
%>