<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.HashMap,
      java.text.DecimalFormat,
			com.ec21.expand_comp.VnExpandCompAction,
			com.ec21.common.MpUnspscAction,
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
MpUnspscAction muAction = MpUnspscAction.getInstance();
Utility util = Utility.getInstance();

Dao vecDao = new Dao();
Dao muDao = new Dao();

int pageNum = util.getPageNum(util.getInt(request.getParameter("pageNum")));
String searchType = util.nullCheck(request.getParameter("searchType"));
String searchData = util.nullCheck(request.getParameter("searchData"));
String searchType2 = util.nullCheck(request.getParameter("searchType2"));
String searchData2 = util.nullCheck(request.getParameter("searchData2"));
String searchCate = util.nullCheck(request.getParameter("searchCate"));


String action = util.nullCheck(request.getParameter("action"));
int exp_no = util.getInt(request.getParameter("exp_no"));

muDao = muAction.getMpUnspsc(); // 카테고리 정보

if("UPDATE".equals(action))
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
String category_id  = util.nullCheck(vecDao.getString(0, "category_id"));

if(exp_no == 0) action = "INSERT";


%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>Gobiz Country Channel</title>
<%@include file="../include/commonCss.jsp" %>
<%@include file="../include/commonJs.jsp" %>
<script type="text/javascript" src="../../sgate/js/NumberUtil.js"></script>


<script type="text/javascript">

function submitBtn()
{
	$('input[name=action]').val("<%= action %>");
	if(formCheck())
		formSubmit('dataForm');
}


function formCheck()
{
  var num_pt = /^[0-9,]+$/;

	if(!$.trim($('input[name=comp_nm]').val()))
	{
		alert('업체명을 입력하세요.');
		$('input[name=comp_nm]').focus();
		return false;
	}
	else if($.trim($('input[name=sales_amount]').val()) && !($('input[name=sales_amount]').val()).match(num_pt))
	{
		alert('연간매출액은 숫자만 입력하세요.');
		$('input[name=sales_amount]').focus();
		return false;
	}
	else if($.trim($('input[name=invest_amount]').val()) && !($('input[name=invest_amount]').val()).match(num_pt))
	{
		alert('투자금액(단위: 천 USD)은 숫자만 입력하세요.');
		$('input[name=invest_amount]').focus();
		return false;
	}
	else

		return true;
}

function goDelete()
{
	if(confirm('삭제 후에는 복원이 불가합니다. 그대로 삭제하시겠습니까?')){
		$('input[name=action]').val("DELETE");
		formSubmit('dataForm');
	}
}

function goList()
{
	formSubmit('listForm');
}

function goGobizUrl(Id)
{
	if(!$.trim(Id))
	{
		alert('회원 ID을 입력하세요.');
		$('input[name=gobiz_id]').focus();
		return;
	}
	window.open("http://eblog.gobizkorea.com/"+Id, "_blank", "top=100,left=100,width=900 height=900, menubar=yes,directories=yes,resizable=yes,status=yes,scrollbars=yes");
}

</script>
</head>
<body>
	<!-- conteiner -->
	<div class="conainer">
		<!-- LNB -->
		<% String leftMenu = "0204"; %>
		<%@include file="../include/sgateLeftMenu.jsp" %>
		<!-- //LNB -->
		<!-- contents -->
		<div class="contents">
			<div class="contentsDetail">
				<!-- Location-->
				<div class="location">
					<h2>게시판 관리</h2>
					<img src="../../sgate/images/text/textTitle02.gif" alt="게시판관리"/>
					<span>
						<em>Main</em>&#62;
						<em>게시판 관리</em>&#62;
						<em class="on">Korean Companies in VN 상세정보 </em>
					</span>
				</div>
				<!-- //Location-->

				<h4 class="title">Korean Companies in VN 상세정보</h4>

				<div class="tableType1 tableLeft">
					<table summary="Korean Companies in Vietnam Table">
<form name="listForm" action="koreanCompaniesInVNList.jsp" method="post" >
  <input type="hidden" name="action" value="<%=action%>"/>
	<input type="hidden" name="pageNum" value="<%=pageNum%>"/>
	<input type="hidden" name="searchCate" value="<%= searchCate %>"/>
	<input type="hidden" name="searchType" value="<%= searchType %>"/>
	<input type="hidden" name="searchData" value="<%= searchData %>"/>
	<input type="hidden" name="searchType2" value="<%= searchType2 %>"/>
	<input type="hidden" name="searchData2" value="<%= searchData2 %>"/>
</form>
<form name="dataForm" action="koreanCompaniesInVNEditSubmit.jsp" method="post" >
  <input type="hidden" name="action" value="<%=action%>"/>
  <input type="hidden" name="exp_no" value="<%=exp_no%>"/>
	<input type="hidden" name="pageNum" value="<%=pageNum%>"/>
	<input type="hidden" name="searchCate" value="<%= searchCate %>"/>
	<input type="hidden" name="searchType" value="<%= searchType %>"/>
	<input type="hidden" name="searchData" value="<%= searchData %>"/>
	<input type="hidden" name="searchType2" value="<%= searchType2 %>"/>
	<input type="hidden" name="searchData2" value="<%= searchData2 %>"/>
						<caption>Korean Companies in Vietnam</caption>
						<colgroup>
							<col width="15%"/>
							<col width="*"/>
							<col width="15%"/>
							<col width="30%"/>
						</colgroup>
						<tbody>
							<tr>
								<th>업체명</th>
								<td colspan="3"><input type="text" name="comp_nm" maxlength="256" value="<%= comp_nm %>" size="74"/></td>
							</tr>
							<tr>
								<th>현지주소</th>
								<td colspan="3"><input type="text" name="local_addr" maxlength="256" value="<%= local_addr %>" size="74"/></td>
							</tr>
							<tr>
								<th>진출국가</th>
								<td>베트남<input type="hidden" name="country_cd" value="VM"/></td>
								<th>진출지역</th>
								<td><input type="text" name="local_area" maxlength="128" value="<%= local_area %>" /></td>
							</tr>
							<tr>
								<th>TEL</th>
								<td colspan="3"><input type="text" name="tel_no" maxlength="30" value="<%= tel_no %>" size="30"/></td>
							</tr>
							<tr>
								<th>FAX</th>
								<td colspan="3"><input type="text" name="fax_no" maxlength="30" value="<%= fax_no %>" size="30"/></td>
							</tr>
							<tr>
								<th>E-mail</th>
								<td><input type="text" name="email" maxlength="128" value="<%= email %>" size="50"/></td>
								<th>Website</th>
								<td><input type="text" name="web_site" maxlength="128" value="<%= web_site %>" size="38"/></td>
							</tr>
							<tr>
								<th>진출년도</th>
								<td><input type="text" name="expand_year" maxlength="4" value="<%= expand_year %>" size="5" onKeyDown="javascript:NUonlyNo(this);"/> 년도</td>
								<th>종업원현황<br/>(한국:현지)</th>
								<td><input type="text" name="employee" maxlength="10" value="<%= employee %>" size="10" /></td>
							</tr>
							<tr>
								<th>연간매출액</th>
								<td><input type="text" name="sales_amount" maxlength="20" value="<%= "".equals(sales_amount)? "": getStringNumberFormat(""+sales_amount) %>" size="20" style="ime-mode:inactive;text-align:right;" ONKEYUP="javascript:NUaddComma(this);" onKeyDown="javascript:NUkeyNo(this);"/> 원</td>
								<th>투자금액<br/>(단위: USD)</th>
								<td><input type="text" name="invest_amount" maxlength="20" value="<%= "".equals(invest_amount)? "": getStringNumberFormat(""+invest_amount) %>" size="23" style="ime-mode:inactive;text-align:right;" ONKEYUP="javascript:NUaddComma(this);" onKeyDown="javascript:NUkeyNo(this);" /></td>
							</tr>
							<tr><!--http://eblog.gobizkorea.com/ecobath-->
								<th>회원 ID<a href="javascript:goGobizUrl(this.gobiz_id.value);" class="eblog">e-Blog</a></th>
								<td colspan="3">
									<input type="text" name="gobiz_id" maxlength="32" value="<%= gobiz_id %>" size="30"/>
								</td>
							</tr>
							<tr>
								<th>취급분야</th>
								<td colspan="3">
									<p class="designSelecter2">
										<select name="category_id">
											<option value="">취급품목 선택하세요.</option>
											<option value="">-----------------------------------------</option>
											<% for(int i=0,j=muDao.getRowCnt(); i<j; i++) { %>
											<option value="<%= muDao.getString(i, "UNSPSC") %>" <%= category_id.equals(muDao.getString(i, "UNSPSC"))? "selected":""%>><%= muDao.getString(i, "ETITLE") %></option><% } %>
										</select>
							    </p>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="buttonC">
					<span class="button btnColor1 buttonSize2"><a href="javascript:submitBtn();"><%= (exp_no == 0)? "등 록":"수 정"%></a><em></em></span>
					<% if(exp_no > 0){ %><span class="button btnColor1 buttonSize2"><a href="javascript:goDelete();">삭 제</a><em></em></span><% } %>
					<span class="button btnColor1 buttonSize2"><a href="javascript:goList();">목 록</a><em></em></span>
</form>
				</div>

			</div>
		</div>
		<!-- //contents -->
	</div>
	<!-- //conteiner -->
</body>
</html>