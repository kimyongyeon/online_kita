<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.HashMap,
			com.ec21.directory.VnExpDirectoryAction,
			com.ec21.common.Dao,
			com.ec21.util.Utility"
%><%
VnExpDirectoryAction vedAction = VnExpDirectoryAction.getInstance();
Utility util = Utility.getInstance();

HashMap<String, String> dataMap = null;

Dao vedDao = new Dao();
Dao gobizDao = new Dao();

int pageNum = util.getPageNum(util.getInt(request.getParameter("pageNum")));
String searchType = util.nullCheck(request.getParameter("searchType"));
String searchData = util.nullCheck(request.getParameter("searchData"));
String searchCate = util.nullCheck(request.getParameter("searchCate"));


String action = util.nullCheck(request.getParameter("action"));
int dir_no = util.getInt(request.getParameter("dir_no"));
String comp_nm      = util.nullCheck(request.getParameter("comp_nm"));
String addr         = util.nullCheck(request.getParameter("addr"));
String ceo          = util.nullCheck(request.getParameter("ceo"));
String tel_no       = util.nullCheck(request.getParameter("tel_no"));
String fax_no       = util.nullCheck(request.getParameter("fax_no"));
String web_site     = util.nullCheck(request.getParameter("web_site"));
String gobiz_id     = util.nullCheck(request.getParameter("gobiz_id"));
String category_id  = util.nullCheck(request.getParameter("category_id"));


String nextUrl = "";

dataMap = new HashMap<String, String>();

dataMap.put("comp_nm"    , comp_nm    );
dataMap.put("addr"       , addr       );
dataMap.put("ceo"        , ceo        );
dataMap.put("tel_no"     , tel_no     );
dataMap.put("fax_no"     , fax_no     );
dataMap.put("web_site"   , web_site   );
dataMap.put("gobiz_id"   , gobiz_id   );
dataMap.put("category_id", category_id);


if("INSERT".equals(action)){
  if(!"".equals(gobiz_id)){
    gobizDao = vedAction.getGobizId(gobiz_id);
    if(!"1".equals(gobizDao.getString(0, "GBN")) && !"5".equals(gobizDao.getString(0, "GBN"))){
%>
<script type="text/javascript">
  alert("회원 ID를 다시 확인하세요.");
  history.back();
</script>
<%
    }
  }

  dir_no = vedAction.getExpDirectoryNoSeq();
  dataMap.put("dir_no", dir_no + "");

  vedAction.insertExpDirectory(dataMap);

  action = "UPDATE";
  nextUrl = "koreanExportersEdit.jsp";


} else if("UPDATE".equals(action)) {
  if(!"".equals(gobiz_id)){
    gobizDao = vedAction.getGobizId(gobiz_id);
    if(!"1".equals(gobizDao.getString(0, "GBN")) && !"5".equals(gobizDao.getString(0, "GBN"))){
%>
<script type="text/javascript">
  alert("회원 ID를 다시 확인하세요.");
  history.back();
</script>
<%
    }
  }

  dataMap.put("dir_no", dir_no + "");

  vedAction.updateExpDirectory(dataMap);

  action = "UPDATE";
  nextUrl = "koreanExportersEdit.jsp";

} else if("DELETE".equals(action)) {

  vedAction.deleteExpDirectory(dir_no);

  pageNum = 1;
  action = "";
  nextUrl = "koreanExportersList.jsp";

} else if("CHK_DELETE".equals(action)) {
  String[] vChkNo       = request.getParameterValues("chkNo");

  if(vChkNo!= null && vChkNo.length > 0){
    for(int i=0; i<vChkNo.length; i++) {
      if(!"".equals(vChkNo[i]) ){
        vedAction.deleteExpDirectory(util.getPageNum(util.getInt(vChkNo[i])));
      }
    }
  }

  pageNum = 1;
  action = "";
  nextUrl = "koreanExportersList.jsp";
}


if(!"".equals(nextUrl)) {
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>Gobiz Country Channel</title>
<%@include file="../include/commonJs.jsp" %>
</head>
<body>
<form name="listForm" action="<%= nextUrl %>" method="post" >
  <input type="hidden" name="action" value="<%=action%>"/>
	<input type="hidden" name="dir_no" value="<%=dir_no%>"/>
	<input type="hidden" name="pageNum" value="<%=pageNum%>"/>
	<input type="hidden" name="searchCate" value="<%= searchCate %>"/>
	<input type="hidden" name="searchType" value="<%= searchType %>"/>
	<input type="hidden" name="searchData" value="<%= searchData %>"/>
</form>
<script type="text/javascript">
  formSubmit('listForm');
</script>
</body>
</html>
<%
} else {
	response.sendError(response.SC_NOT_FOUND);
	return;
}
%>