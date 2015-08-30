<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.HashMap,
			com.ec21.common.Dao,
			com.ec21.product.VnFeaturedProdAction,
			com.ec21.util.Utility"
%><%
VnFeaturedProdAction vfpAction = VnFeaturedProdAction.getInstance();
Utility util = Utility.getInstance();

Dao vfpiDao = new Dao();

int gesiNo = util.getInt(request.getParameter("gesiNo"));

vfpiDao = vfpAction.getFeaturedProductsImageIsNotNull(gesiNo);

%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>Gobiz Country Channel</title>
<%@include file="../include/commonCss.jsp" %>
<style type="text/css">
/*Product*/
div.featuredProduct { width: 757px; height: 344px; background: url('../../images/tmp/productTopListBg.gif') no-repeat left top; position: relative; }
div.featuredProduct a.left { position: absolute; left: 15px; top: 139px; z-index: 1000;}
div.featuredProduct a.right { position: absolute; right: 15px; top: 139px; z-index: 1000;}
div.featuredProduct ul.list { float: left; width: 712px;}
div.featuredProduct ul.list ol { width: 685px; overflow: hidden;}
div.featuredProduct ul.list ol li { float: left; margin-right: 15px;}
div.featuredProduct ul.list img, div.featuredProduct ul.list a { display: block;}
div.featuredProduct ul.list a { width: 119px; text-align: center; height: 41px; line-height: 16px;}
div.featuredProduct ul.list a:hover { font-weight: bold; letter-spacing: -1px;}
div.featuredProduct ul.list img  { border: 1px solid #e1e1e1;}

div.featuredProduct.Type2 {  width: 757px; height: 185px; background: url('../../images/tmp/productTopListBgType2.gif') no-repeat left top; position: relative; overflow: hidden; z-index: 200; *zoom: 1;}
div.featuredProduct.Type2 a.left { position: absolute; left: 15px; top: 59px; z-index: 1000;}
div.featuredProduct.Type2 a.right { position: absolute; right: 15px; top: 59px; z-index: 1000;}

/*=================================================================================
Rolling
=================================================================================*/
div.rollBox { width: 757px; height: 365px; background: url('../images/tmp/rollBoxBG.gif') no-repeat left top; overflow: hidden;}

div.rollBoxItem { width: 730px; height: 400px; overflow: hidden; padding: 14px 14px 14px 14px; position: relative; }
div.rollBoxItem ul { width: 680px; overflow: hidden; padding: 0 ; float: left; margin-left: 0px;}
div.rollBoxItem ul li { float: left; margin-right: 18px;}
div.rollBoxItem ul li a { display: block; }
div.rollBoxItem ul li a:hover em { font-weight: bold; letter-spacing: -1px;}
div.rollBoxItem ul li a img { display: block; border: 1px solid #e1e1e1;}
div.rollBoxItem ul li a em { display: block; text-align: center; line-height: 15px; margin-bottom: 10px; margin-top: 3px;}
div.rollBoxItem ul li.last { margin-right: 0;}

div.rollBoxItemDetail { width: 668px; height: 324px; overflow: hidden; position: relative; margin-left: 35px;}

div.viewBoxIndex { position: absolute; width: 1400px; height: 350px;}
div.viewBoxIndex ul li { width: 117px; height: 160px;}
</style>
<%@include file="../include/commonJs.jsp" %>
<script type="text/javascript" src="../../sgate/js/vietnamSgateCommon.js"></script>
<script type="text/javascript">
$(document).ready(function(){

})
</script>
</head>
<body style="background: none;padding:10px;">
	<div class="featuredProduct rollBoxItem">
		<div class="fpLeft"><a href="#none" class="left "><img src="../../images/btn/btn_product_L.gif" alt="left"/></a></div>
			<div  class="rollBoxItemDetail">
				<div class="viewBoxIndex">
				<%
				for(int i=0,j=vfpiDao.getRowCnt(); i<j; i++)
				{
					if(i == 0 || i + 1 == 11)
					{
				%><ul class="tab<%if(i + 1 == 11){%>2<%}else{%>1<%}%>">
				<%
					}
				%><li><a href="<%=vfpiDao.getString(i, "URL")%>" target="_product"><img width="117" height="117" src="../../images/products/<%=vfpiDao.getString(i, "GESI_NO")%>/<%=vfpiDao.getString(i, "IMAGE")%>" alt="<%=vfpiDao.getString(i, "PROD_NM")%>"/><em><%=vfpiDao.getString(i, "PROD_NM")%></em></a></li>
				<%
					if(i + 1 == 10 || i + 1 == j)
					{
				%></ul>
				<%
					}
				}
				%>
				</div>
			</div>
		<div class="fpRight"><a href="#none" class="right"><img src="../../images/btn/btn_product_R.gif" alt="right"/></a></div>
	</div>
	<script type="text/javascript" src="../../js/featuredProductsRolling.js"></script>
</body>
</html>