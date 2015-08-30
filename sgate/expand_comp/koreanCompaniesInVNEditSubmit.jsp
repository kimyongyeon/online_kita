<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.HashMap,
			com.ec21.expand_comp.VnExpandCompAction,
			com.ec21.common.Dao,
			com.ec21.util.Utility,
			com.ec21.util.UtilBox"
%><%
VnExpandCompAction vedAction = VnExpandCompAction.getInstance();
Utility util = Utility.getInstance();
UtilBox utilBox = new UtilBox();

HashMap<String, String> dataMap = null;

Dao vecDao = new Dao();
Dao gobizDao = new Dao();

int pageNum = util.getPageNum(util.getInt(request.getParameter("pageNum")));
String searchType = util.nullCheck(request.getParameter("searchType"));
String searchData = util.nullCheck(request.getParameter("searchData"));
String searchType2 = util.nullCheck(request.getParameter("searchType2"));
String searchData2 = util.nullCheck(request.getParameter("searchData2"));
String searchCate = util.nullCheck(request.getParameter("searchCate"));


String action = util.nullCheck(request.getParameter("action"));
int exp_no = util.getInt(request.getParameter("exp_no"));
String comp_nm      = util.nullCheck(request.getParameter("comp_nm"));
String local_addr   = util.nullCheck(request.getParameter("local_addr"));
String country_cd   = util.nullCheck(request.getParameter("country_cd"));
String local_area   = util.nullCheck(request.getParameter("local_area"));
String tel_no       = util.nullCheck(request.getParameter("tel_no"));
String fax_no       = util.nullCheck(request.getParameter("fax_no"));
String email        = util.nullCheck(request.getParameter("email"));
String web_site     = util.nullCheck(request.getParameter("web_site"));
String expand_year  = util.nullCheck(request.getParameter("expand_year"));
String employee     = util.nullCheck(request.getParameter("employee"));
String sales_amount = util.nullCheck(request.getParameter("sales_amount"));
String invest_amount= util.nullCheck(request.getParameter("invest_amount"));
String gobiz_id     = util.nullCheck(request.getParameter("gobiz_id"));
String category_id  = util.nullCheck(request.getParameter("category_id"));

sales_amount = utilBox.getReplace(sales_amount, ",", "");
invest_amount = utilBox.getReplace(invest_amount, ",", "");

String nextUrl = "";

dataMap = new HashMap<String, String>();

dataMap.put("comp_nm"      , comp_nm      );
dataMap.put("local_addr"   , local_addr   );
dataMap.put("country_cd"   , country_cd   );
dataMap.put("local_area"   , local_area   );
dataMap.put("tel_no"       , tel_no       );
dataMap.put("fax_no"       , fax_no       );
dataMap.put("email"        , email        );
dataMap.put("web_site"     , web_site     );
dataMap.put("expand_year"  , expand_year  );
dataMap.put("employee"     , employee     );
dataMap.put("sales_amount" , sales_amount );
dataMap.put("invest_amount", invest_amount);
dataMap.put("gobiz_id"     , gobiz_id     );
dataMap.put("category_id"  , category_id  );


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

  exp_no = vedAction.getExpandCompNoSeq();
  dataMap.put("exp_no", exp_no + "");

  vedAction.insertExpandComp(dataMap);

  action = "UPDATE";
  nextUrl = "koreanCompaniesInVNEdit.jsp";


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

  dataMap.put("exp_no", exp_no + "");

  vedAction.updateExpandComp(dataMap);

  action = "UPDATE";
  nextUrl = "koreanCompaniesInVNEdit.jsp";

} else if("DELETE".equals(action)) {

  vedAction.deleteExpandComp(exp_no);

  pageNum = 1;
  action = "";
  nextUrl = "koreanCompaniesInVNList.jsp";

} else if("CHK_DELETE".equals(action)) {
  String[] vChkNo       = request.getParameterValues("chkNo");

  if(vChkNo!= null && vChkNo.length > 0){
    for(int i=0; i<vChkNo.length; i++) {
      if(!"".equals(vChkNo[i]) ){
        vedAction.deleteExpandComp(util.getPageNum(util.getInt(vChkNo[i])));
      }
    }
  }

  pageNum = 1;
  action = "";
  nextUrl = "koreanCompaniesInVNList.jsp";
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
	<input type="hidden" name="exp_no" value="<%=exp_no%>"/>
	<input type="hidden" name="pageNum" value="<%=pageNum%>"/>
	<input type="hidden" name="searchCate" value="<%= searchCate %>"/>
	<input type="hidden" name="searchType" value="<%= searchType %>"/>
	<input type="hidden" name="searchData" value="<%= searchData %>"/>
	<input type="hidden" name="searchType2" value="<%= searchType2 %>"/>
	<input type="hidden" name="searchData2" value="<%= searchData2 %>"/>
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