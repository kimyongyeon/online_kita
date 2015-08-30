<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.HashMap,
			com.ec21.common.Dao,
			com.ec21.product.VnFeaturedProdAction,
			com.ec21.util.Utility"
%><%
VnFeaturedProdAction vfpAction = VnFeaturedProdAction.getInstance();
Utility util = Utility.getInstance();

Dao vfpDao = new Dao();
Dao vfpiDao = new Dao();

String action = util.nullCheck(request.getParameter("action"));
int gesiNo = util.getInt(request.getParameter("gesiNo"));

if("INSERT".equals(action) && gesiNo == 0)
	gesiNo = vfpAction.getGesiNoSeq();
else if("UPDATE".equals(action))
{
	vfpDao = vfpAction.getFeaturedProducts(gesiNo);
	vfpiDao = vfpAction.getFeaturedProductsImage(gesiNo);
}

%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>Gobiz Country Channel</title>
<%@include file="../include/commonCss.jsp" %>
<link href="../../sgate/css/jquery-ui-1.8.18.datepicker.custom.css" rel="stylesheet" type="text/css"/>
<%@include file="../include/commonJs.jsp" %>
<script type="text/javascript" src="../../sgate/js/datepicker/jquery-ui.datepicker.min.js"></script>
<script type="text/javascript" src="../../sgate/js/datepicker/jquery.ui.datepicker-ko.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.datepicker').datepicker({
		showOn: "button",
		buttonImage: "../../sgate/images/icon/icon_cal.gif",
		buttonImageOnly: true,
		showAnim : 'slideDown',
		showOtherMonths: true,
		selectOtherMonths: true,
		showButtonPanel: true,
		beforeShowDay: minDateSetting
	});

	$('input[name^=orgImage] ').hover(mouserOverCursor, mouserOutCursor).click(orgFileNameDisplayChange);
});

function minDateSetting(date)
{
	if($(this).attr('name') == 'gesiEday')
	{
		var dateArr = $('input[name=gesiSday]').val().split('-');

		var year = dateArr[0];
		var month = dateArr[1];
		var day = dateArr[2];

		var dateFR = new Date(year, month - 1, day);

		if(dateFR > date)
			return [false];
		else
			return [true];
	}
	else
		return [true];
}

function submitBtn()
{
	if(formCheck())
		formSubmit('dataForm');
}

function formCheck()
{
	if($('input[name=gesiSday]').val() == '' || $('input[name=gesiEday]').val() == '')
	{
		alert('등록기간을 입력하세요.');
		return false;
	}
	else
		return true;
}

function preview()
{
	window.open('preview.jsp?gesiNo=' + <%=gesiNo%>, 'preview', 'toolbar=0, location=0, directories=0, status=0, menubar=0, scrollbars=yes, resizable=0, width=785, height=400, top=100, left=100');
}

function deleteBtn(gesiNo)
{
	if(confirm('삭제 후에는 복원이 불가합니다. 그대로 삭제하시겠습니까?'))
		location.href = "deleteFeaturedProd.jsp?action=DELETE&gesiNo=" + gesiNo;
}

function imageChangeFlag(idx)
{
	$('input[name=imageChangeFlag' + idx + ']').val('Y');
}

function orgFileNameDisplayChange()
{
	if($(this).siblings('.orgFileName').css('display') != undefined)
	{
		if($(this).siblings('.orgFileName').css('display') != 'none')
		{
			if(confirm('업로드 된 파일을 지우고 새로운 파일을 입력하시겠습니까?'))
				$(this).siblings('.orgFileName').css('display', 'none');
			else
				return false;
		}
	}
}
</script>
</head>
<body>
	<!-- conteiner -->
	<div class="conainer" style="font-weight: normal">
		<!-- LNB -->
		<% String leftMenu = "01"; %>
		<%@include file="../include/sgateLeftMenu.jsp" %>
		<!-- //LNB -->
		<!-- contents -->
		<div class="contents">
			<div class="contentsDetail">
				<!-- Location-->
				<div class="location">
					<h2>메인컨텐츠 관리</h2>
					<img src="../../sgate/images/text/textTitle01.gif" alt="메인컨텐츠관리"/>
					<span>
						<em>Main</em>&#62;
						<em>메인컨텐츠 관리</em>&#62;
						<em class="on">Featured Products 등록 및 수정</em>
					</span>
				</div>
				<!-- //Location-->
				<h4 class="title">Featured Products 등록 및 수정</h4>
				<div class="tableType2">
					<form name="dataForm" action="featuredProductsEditSubmit.jsp" method="post" enctype="multipart/form-data">
					<input type="hidden" name="action" value="<%=action%>"/>
					<input type="hidden" name="gesiNo" value="<%=gesiNo%>"/>
					<table summary="Featured Products">
						<caption>Featured Products관리</caption>
						<colgroup>
							<col width="16%"/>
							<col width="24%"/>
							<col width="30%"/>
							<col width="30%"/>
						</colgroup>
						<tbody>
							<tr>
								<th>등록차수</th>
								<td>
									FP <%=gesiNo%>차
								</td>
								<th>등록기간</th>
								<td  class="calender" colspan="2">
									<span>
										<input name="gesiSday" type="text" size="10" value="<%=util.getDate(vfpDao.getString(0, "GESI_SDAY"), "YYYY-MM-DD")%>" class="datepicker" readonly="readonly"/>
									</span>
									<em>~</em>
									<span>
										<input name="gesiEday" type="text" size="10" value="<%=util.getDate(vfpDao.getString(0, "GESI_EDAY"), "YYYY-MM-DD")%>" class="datepicker" readonly="readonly"/>
									</span>
								</td>
							</tr>
							<tr>
								<th>구분</th>
								<th>상품명</th>
								<th>링크 URL</th>
								<th>이미지(85 x 85)</th>
							</tr>
							<%
							boolean dataCheck = false;

							for(int i=0, j=20; i<j; i++)
							{
								dataCheck = false;

								for(int n=0,m=vfpiDao.getRowCnt(); n<m; n++)
								{
									if(i + 1 == util.getInt(vfpiDao.getString(n, "NO")))
									{
							%>
							<tr>
								<th class="boldN">
									상품<%=i + 1%>
									<input type="hidden" name="no" value="<%=i + 1%>"/>
								</th>
								<td>
									<input type="text" name="prodNm<%=i + 1%>" value="<%=vfpiDao.getString(n, "PROD_NM")%>" style="width: 193px;"/>
								</td>
								<td >
									<input type="text" name="url<%=i + 1%>" value="<%=vfpiDao.getString(n, "URL")%>" size="40"/>
								</td>
								<td style="padding:2px;">
									<input type="file" name="orgImage<%=i + 1%>" style="width: 255px; height: 22px;" size="12" onclick="imageChangeFlag(<%=i + 1%>);"/>
									<input type="hidden" name="imageChangeFlag<%=i + 1%>" value="N"/>
									<%
									if(!"".equals(vfpiDao.getString(n, "IMAGE")) && !"".equals(vfpiDao.getString(n, "ORG_IMAGE")))
									{
									%>
									<div class="orgFileName" style="margin-top:2px;padding-left:10px;">
										<a href="javascript:fileDownload('<%=vfpiDao.getString(n, "ORG_IMAGE")%>', '/products/<%=vfpDao.getInt(0, "GESI_NO")%>/<%=vfpiDao.getString(n, "IMAGE")%>');"><%=vfpiDao.getString(n, "ORG_IMAGE")%></a>
									</div>
									<%
									}
									%>
								</td>
							</tr>
							<%
										dataCheck = true;
										break;
									}
								}

								if(!dataCheck)
								{
							%>
							<tr>
								<th class="boldN">
									상품<%=i + 1%>
									<input type="hidden" name="no" value="<%=i + 1%>"/>
								</th>
								<td>
									<input type="text" name="prodNm<%=i + 1%>" value="" style="width: 193px;"/>
								</td>
								<td >
									<input type="text" name="url<%=i + 1%>" value="" size="40"/>
								</td>
								<td style="padding:2px;">
									<input type="file" name="orgImage<%=i + 1%>" style="width: 255px; height: 20px;" size="12" onclick="imageChangeFlag(<%=i + 1%>);"/>
									<input type="hidden" name="imageChangeFlag<%=i + 1%>" value="N"/>
								</td>
							</tr>
							<%
								}
							}
							%>
						</tbody>
					</table>
					</form>
				</div>
				<div class="buttonC">
					<span class="button btnColor1 buttonSize2"><a href="javascript:preview();">미리보기</a><em></em></span>
					<%
					String btnName = "등 록";

					if("UPDATE".equals(action))
						btnName = "수 정";
					%>
					<span id="insertBtn" class="button btnColor1 buttonSize2"><a href="javascript:submitBtn();"><%=btnName%></a><em></em></span>
					<!-- span class="button btnColor1 buttonSize2"><a href="#none">취소</a><em></em></span -->
					<span class="button btnColor1 buttonSize2"><a href="featuredProductsList.jsp">목 록</a><em></em></span>
				</div>
			</div>
		</div>
		<!-- //contents -->
	</div>
	<!-- //conteiner -->
</body>
</html>