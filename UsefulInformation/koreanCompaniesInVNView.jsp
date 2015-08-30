<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.HashMap,
	java.text.DecimalFormat,
			com.ec21.expand_comp.VnExpandCompAction,
			com.ec21.common.Dao,
			com.ec21.util.Utility"
%><%!
public String getStringNumberFormat(String sAmt)
{
String ret = "";
double d = 0;

if(sAmt == null) ret = "0";
else if("".equals(sAmt)) ret = "0";
else ret = sAmt;

d = Double.parseDouble(ret);

DecimalFormat df =  new DecimalFormat("###,###,###,###,###,##0");

return df.format(d);
}
%><%
VnExpandCompAction vecAction = VnExpandCompAction.getInstance();
Utility util = Utility.getInstance();

Dao vecDao = new Dao();

int pageNum = util.getPageNum(util.getInt(request.getParameter("pageNum")));
String searchType = util.nullCheck(request.getParameter("searchType"));
String searchData = util.nullCheck(request.getParameter("searchData"));
String searchType2 = util.nullCheck(request.getParameter("searchType2"));
String searchData2 = util.nullCheck(request.getParameter("searchData2"));
String searchCate = util.nullCheck(request.getParameter("searchCate"));


String action = util.nullCheck(request.getParameter("action"));
int exp_no = util.getInt(request.getParameter("exp_no"));

if(!"".equals(exp_no))
	vecDao = vecAction.getExpandComp(exp_no);

exp_no      = util.getInt(util.nullCheck(vecDao.getString(0, "EXP_NO")));
String comp_nm      = util.nullCheck(vecDao.getString(0, "comp_nm"));
String local_addr   = util.nullCheck(vecDao.getString(0, "local_addr"));
String country_cd   = util.nullCheck(vecDao.getString(0, "country_cd"));
String local_area   = util.nullCheck(vecDao.getString(0, "local_area"));
String tel_no       = util.nullCheck(vecDao.getString(0, "tel_no"));
String fax_no       = util.nullCheck(vecDao.getString(0, "fax_no"));
String email        = util.nullCheck(vecDao.getString(0, "email"));
String web_site     = util.nullCheck(vecDao.getString(0, "web_site"));
String expand_year  = util.nullCheck(vecDao.getString(0, "expand_year"));
String employee     = util.nullCheck(vecDao.getString(0, "employee"));
String sales_amount = util.nullCheck(vecDao.getString(0, "sales_amount"));
String invest_amount= util.nullCheck(vecDao.getString(0, "invest_amount"));
String gobiz_id     = util.nullCheck(vecDao.getString(0, "gobiz_id"));
String category_nm  = util.nullCheck(vecDao.getString(0, "CATEGORY_NM"));



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

function goList()
{
	formSubmit('listForm');
}

</script>
</head>
<body>
	<% String topAndLefMenu = "0504"; %>
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Head -->
		<%// String action = ""; //Duplicate local variable action 발생 topMenu Search 부분 수정예정 %>
		<%@include file="../include/topMenu.jsp" %>
		<!-- //Head -->
		<!-- LNB -->
		<%@include file="../include/leftMenu.jsp" %>
		<!-- //LNB -->

		<!-- Contents -->
		<div id="contents">
			<div class="bannerIndex"><a href="#none"><img src="../images/banner/banner_index.gif" alt="Dịch vụ kết nối kinh doanh"></a></div>
			<div class="location">
				<em>Trang chủ  </em> &#62;
				<em>Thông tin hữu ích  </em> &#62;
				<em class="on">Các công ty Hàn Quốc tại Việt  Nam</em>
			</div>
			<h3 class="title">Các công ty Hàn Quốc tại Việt  Nam</h3>



			<div class="tableTopInfo Type2">
<form name="listForm" action="koreanCompaniesInVNList.jsp" method="post" >
<input type="hidden" name="action" value="<%=action%>"/>
	<input type="hidden" name="pageNum" value="<%=pageNum%>"/>
	<input type="hidden" name="searchCate" value="<%= searchCate %>"/>
	<input type="hidden" name="searchType" value="<%= searchType %>"/>
	<input type="hidden" name="searchData" value="<%= searchData %>"/>
	<input type="hidden" name="searchType2" value="<%= searchType2 %>"/>
	<input type="hidden" name="searchData2" value="<%= searchData2 %>"/>
</form>
				<span class="info"><%= comp_nm %></span>
			</div>

			<div class="TableTopSearch Type2">
				<em class="red">*</em> Source:  www.globalwindow.org
			</div>

			<div class="tableType4">
				<table summary="Korean Companies in Vietnam">
					<caption>Korean Companies in Vietnam</caption>
					<colgroup>
						<col width="23%">
						<col width="*">
						<col width="23%">
						<col width="30%">
					</colgroup>
					<tbody>
						<tr>
							<th>Địa chỉ</th>
							<td colspan="3"><%= local_addr %></td>
						</tr>
						<tr>
							<th>Quốc gia</th>
							<td>Việt Nam</td>
							<th>Địa điểm</th>
							<td><%= local_area %></td>
						</tr>
						<tr>
							<th>TEL</th>
							<td><%= tel_no %> </td>
							<th>FAX</th>
							<td><%= fax_no %> </td>
						</tr>
						<tr>
							<th>E-mail</th>
							<td><a href="mailto:<%= email %>"><%= email %></a></td>
							<th>Website</th>
							<td><a href="<%= web_site.indexOf("://") > 0? web_site : "http://"+web_site  %>" target="_blank"><%= web_site %></a></td>
						</tr>
						<tr>
							<th>Loại hình</th>
							<td colspan="3"><%= category_nm %></td>
						</tr>
						<tr>
							<th>Bắt đầu hoạt động tại<br>Việt Nam từ năm</th>
							<td><%= expand_year %></td>
							<th>Quy mô<br>(Hàn Quốc: Việt Nam)</th>
							<td><%= employee %></td>
						</tr>
						<tr class="last">
							<th>Doanh thu hàng năm</th>
							<td><%= "".equals(sales_amount)? "": getStringNumberFormat(""+sales_amount) %></td>
							<th>Khoản đầu tư (USD)</th>
							<td><%= "".equals(invest_amount)? "": getStringNumberFormat(""+invest_amount) %></td>
						</tr>

					</tbody>
				</table>
			</div>

			<div class="buttonLR">
				<% if(!"".equals(gobiz_id)){ %><span class="button btnColor5 btnSize5"><a href="http://eblog.gobizkorea.com/<%= gobiz_id %>" target="_blank">Truy cập e-Blog của công ty này</a></span><% } %>
				<span class="button btnColor6 btnSize5"><a href="javascript:goList();">Danh mục</a></span>
			</div>


		</div>
		<!-- //Contents -->

		<!-- Footer -->
		<%@include file="../include/footerMenu.jsp" %>
		<!-- //Footer -->

	</div>
	<!-- //Wrapper -->

</body>
</html>