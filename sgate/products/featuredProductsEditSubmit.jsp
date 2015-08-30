<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.io.*,
			java.util.*,
			com.ec21.common.Dao,
			com.ec21.product.VnFeaturedProdAction,
			com.ec21.upload.MultiPart,
			com.ec21.util.Utility"
%><%
Utility util = Utility.getInstance();

VnFeaturedProdAction vfpAction = VnFeaturedProdAction.getInstance();

MultiPart multi = null;
ArrayList<HashMap<String, String>> dataList = new ArrayList<HashMap<String, String>>();
HashMap<String, String> dataMap1 = null;
HashMap<String, String> dataMap2 = null;

int sizeLimit = 5 * 1024 * 1024 ; // 최대 5M까지 업로드 가능

String nextUrl = ""; //완료 후 이동 할 페이지 설정
String uploadPath = "/data/T1/product/upload/";
String uploadTempPath = uploadPath  + "temporary/";
String uploadProductsPath = uploadPath + "products/";

try
{
	multi = new MultiPart(request, uploadTempPath, sizeLimit);
}
catch(Exception e)
{
%>
<script type="text/javascript">
alert(" 파일은 5MB 이하 사이즈만 업로드 가능합니다.");
history.back();
</script>
<%
	return;
}

//form parameter
String action          = util.nullCheck(multi.getParameter("action"));   //실행 분류
String gesiNo          = util.nullCheck(multi.getParameter("gesiNo"));   //등록차수
String gesiSday        = util.nullCheck(multi.getParameter("gesiSday")); //시작일
String gesiEday        = util.nullCheck(multi.getParameter("gesiEday")); //종료일
String tempNo[]        = multi.getParameterValues("no");                 //상품 순번
String prodNm          = "";                                             //상품명
String url             = "";                                             //URL
String image           = "";                                             //서버에 저장 될 이미지명
String orgImage        = "";                                             //원본 이미지명
String imageChangeFlag = "";                                             //이미지 변경 상태

if(!"".equals(gesiNo))
{
	dataMap1 = new HashMap<String, String>();
	dataMap1.put("gesiNo" , gesiNo);
	dataMap1.put("gesiSday" , gesiSday.replaceAll("-", "") + "000000");
	dataMap1.put("gesiEday" , gesiEday.replaceAll("-", "") + "999999");

	for(int i=0,j=tempNo.length; i<j; i++)
	{
		dataMap2 = new HashMap<String, String>();

		prodNm          = util.nullCheck(multi.getParameter("prodNm" + tempNo[i]));
		url             = util.nullCheck(multi.getParameter("url" + tempNo[i]));
		image           = util.nullCheck(multi.getRealFileName("orgImage" + tempNo[i]));
		orgImage        = util.nullCheck(multi.getParameter("orgImage" + tempNo[i]));
		imageChangeFlag = util.nullCheck(multi.getParameter("imageChangeFlag" + tempNo[i]));

		if(!"DELETE".equals(action))
		{
			//이미지는 products 폴더로 복사 후 삭제
			if(!"".equals(image) && "Y".equals(imageChangeFlag))
			{
				util.copyFile(uploadTempPath, uploadProductsPath + gesiNo, image);
				util.deleteFile(uploadTempPath, image);
			}
		}

		dataMap2.put("gesiNo" , gesiNo);
		dataMap2.put("no" , tempNo[i]);
		dataMap2.put("prodNm" , prodNm);
		dataMap2.put("url" , url);
		dataMap2.put("image" , image);
		dataMap2.put("orgImage" , orgImage);
		dataMap2.put("imageChangeFlag" , imageChangeFlag);

		dataList.add(dataMap2);
	}

	try
	{
		if("INSERT".equals(action))
		{
			vfpAction.insertFeaturedProducts(dataMap1, dataList);
			nextUrl = "featuredProductsEdit.jsp?action=UPDATE&gesiNo=" + gesiNo;
		}
		else if("UPDATE".equals(action))
		{
			vfpAction.updateFeaturedProducts(dataMap1, dataList);
			nextUrl = "featuredProductsEdit.jsp?action=UPDATE&gesiNo=" + gesiNo;
		}
		else if("DELETE".equals(action))
		{
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	finally
	{
		if(!"".equals(nextUrl))
			response.sendRedirect(nextUrl);
		else
			response.sendError(response.SC_NOT_FOUND);
	}
}
else
{
	response.sendError(response.SC_NOT_FOUND);
	return;
}
%>