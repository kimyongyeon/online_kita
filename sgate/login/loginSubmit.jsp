<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.ec21.util.Utility"
%><%
Utility util = Utility.getInstance();

String adminId = util.nullCheck(request.getParameter("adminid"));
String password = util.nullCheck(request.getParameter("password"));
String returnURL = util.nullCheck(request.getParameter("returnURL"));
boolean loginCheck = false;

//테스트
adminId = "test";
loginCheck = true;

//아이디 확인 로직 추가 해야됨


//세션에 저장
if(!loginCheck)
{
	out.print("<script type=\"text/javascript\">alert(\"아이디 또는 비밀번호가 틀렸습니다.\");history.back(-1);</script>");
	out.flush();
}
else
{
	session.setAttribute("adminId", adminId);

	if("".equals(returnURL))
		response.sendRedirect("/sgate/products/featuredProductsList.jsp");
	else
		response.sendRedirect(returnURL);

}
%>