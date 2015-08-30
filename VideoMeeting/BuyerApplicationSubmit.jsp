<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.HashMap,
			com.ec21.common.Dao,
			com.ec21.videoMeeting.VideoMeetingAction,
			com.ec21.util.Utility"
%><%
Utility util = Utility.getInstance();
VideoMeetingAction vmAction = VideoMeetingAction.getInstance();

HashMap<String, String> dataMap = new HashMap<String, String>();

String companyNm = util.nullCheck(request.getParameter("companyNm"));
String buyerNm   = util.nullCheck(request.getParameter("buyerNm"));
String ctrCd     = util.nullCheck(request.getParameter("ctrCd"));
String gmt       = util.nullCheck(request.getParameter("gmt"));
String email     = util.nullCheck(request.getParameter("email"));
String address   = util.nullCheck(request.getParameter("address"));
String phone     = util.nullCheck(request.getParameter("phone"));
String fax       = util.nullCheck(request.getParameter("fax"));
String website   = util.nullCheck(request.getParameter("website"));
String talkDate  = util.nullCheck(request.getParameter("talkDate"));
String talkTime  = util.nullCheck(request.getParameter("talkTime"));
String talkDate2 = util.nullCheck(request.getParameter("talkDate2"));
String talkTime2 = util.nullCheck(request.getParameter("talkTime2"));
String talkDate3 = util.nullCheck(request.getParameter("talkDate3"));
String talkTime3 = util.nullCheck(request.getParameter("talkTime3"));
String talkDate4 = util.nullCheck(request.getParameter("talkDate4"));
String talkTime4 = util.nullCheck(request.getParameter("talkTime4"));
int meetNum      = util.getInt(request.getParameter("meetNum"));
String unspsc    = util.nullCheck(request.getParameter("unspsc"));
String blogId    = util.nullCheck(request.getParameter("blogId"));
int objId        = util.getInt(request.getParameter("objId"));
String ememo     = util.nullCheck(request.getParameter("ememo"));
String pwd       = util.nullCheck(request.getParameter("pwd"));
//String countryNm = util.nullCheck(request.getParameter("countryNm"));
//String unspsc_name = util.nullCheck(request.getParameter("unspsc_name"));

dataMap.put("companyNm", companyNm);
dataMap.put("buyerNm", buyerNm);
dataMap.put("email", email);
dataMap.put("address", address);
dataMap.put("phone", phone);
dataMap.put("fax", fax);
dataMap.put("website", website);
dataMap.put("ctrCd", ctrCd);
dataMap.put("talkDate", talkDate);
dataMap.put("talkTime", talkTime);
dataMap.put("talkDate2", talkDate2);
dataMap.put("talkTime2", talkTime2);
dataMap.put("talkDate3", talkDate3);
dataMap.put("talkTime3", talkTime3);
dataMap.put("talkDate4", talkDate4);
dataMap.put("talkTime4", talkTime4);
dataMap.put("meetNum", meetNum + "");
dataMap.put("unspsc", unspsc);
dataMap.put("blogId", blogId);
dataMap.put("objId", objId + "");
dataMap.put("pwd", pwd);
dataMap.put("gmt", gmt);
dataMap.put("ememo", ememo);

//바이어 정보 입력
vmAction.insertBuyer(dataMap);

//리턴
response.sendRedirect("./BuyerApplicationSuccess.jsp");
%>