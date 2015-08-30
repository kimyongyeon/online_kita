<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.io.*,
			java.util.*,
			com.ec21.board.VnNewsBoardAction,
			com.ec21.common.Dao,
			com.ec21.upload.MultiPart,
			com.ec21.util.Utility"
%><%
Utility util = Utility.getInstance();

VnNewsBoardAction vnbAction = VnNewsBoardAction.getInstance();

MultiPart multi = null;
HashMap<String, String> dataMap = null;

int sizeLimit = 5 * 1024 * 1024 ; // 최대 5M까지 업로드 가능

String nextUrl = ""; //완료 후 이동 할 페이지 설정
String uploadPath = "/data/T1/product/upload/";
String uploadTempPath = uploadPath  + "temporary/";
String uploadImagePath = uploadPath + "boards/";
String uploadFilePath = uploadPath + "files/";

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
String action       = util.nullCheck(multi.getParameter("action"));       //실행 분류
String newsType     = util.nullCheck(multi.getParameter("newsType"));     //게시판 종류
String writer       = util.nullCheck(multi.getParameter("writer"));       //작성자
int    newsNo       = util.getInt(multi.getParameter("newsNo"));          //번호
String title        = util.nullCheck(multi.getParameter("title"));        //제목
String inputDt      = util.nullCheck(multi.getParameter("inputDt"));      //등록일
String contents     = util.nullCheck(multi.getParameter("contents"));     //내용
String summary      = util.nullCheck(multi.getParameter("summary"));      //요약내용
String listImage    = util.nullCheck(multi.getRealFileName("orgListImage")); //서버에 저장 된 첨부 이미지명
String orgListImage = util.nullCheck(multi.getParameter("orgListImage")); //첨부 이미지명
String attFile      = util.nullCheck(multi.getRealFileName("orgAttFile"));   //서버에 저장 된 첨부 파일명
String orgAttFile   = util.nullCheck(multi.getParameter("orgAttFile"));   //첨부 파일명
String fileChangeFlag  = util.nullCheck(multi.getParameter("fileChangeFlag"));     //첨부 파일 변경 상태

if(!"DELETE".equals(action))
{
	if("UPDATE".equals(action) && "Y".equals(fileChangeFlag))
		vnbAction.deleteFile(newsNo, newsType, "FILE");

	//파일은 파일 폴더로 복사 후 삭제
	if(!"".equals(attFile))
	{
		util.copyFile(uploadTempPath, uploadFilePath, attFile);
		util.deleteFile(uploadTempPath, attFile);
	}
}

dataMap = new HashMap<String, String>();

if("INSERT".equals(action) && newsNo < 1)
	newsNo = vnbAction.getNewsNoSeq();

dataMap.put("newsNo", newsNo + "");
dataMap.put("newsType", newsType);
dataMap.put("writer", writer);
dataMap.put("title", title);
dataMap.put("inputDt", inputDt);
dataMap.put("contents", contents);
dataMap.put("summary", summary);
dataMap.put("listImage", listImage);
dataMap.put("orgListImage", orgListImage);
dataMap.put("attFile", attFile);
dataMap.put("orgAttFile", orgAttFile);
dataMap.put("display", "Y");

if(!"".equals(newsNo))
{
	if("INSERT".equals(action))
	{
		vnbAction.insertNews(dataMap);
		nextUrl = "koreaIndustryNewsEdit.jsp?action=UPDATE&newsNo=" + newsNo;
	}
	else if("UPDATE".equals(action))
	{
		vnbAction.updateNews(dataMap);
		nextUrl = "koreaIndustryNewsEdit.jsp?action=UPDATE&newsNo=" + newsNo;
	}
	else if("DELETE".equals(action))
	{
		vnbAction.deleteNews(newsType, newsNo);
		nextUrl = "koreaIndustryNewsList.jsp";
	}
	else
	{
		response.sendError(response.SC_NOT_FOUND);
		return;
	}

	if(!"".equals(nextUrl))
		response.sendRedirect(nextUrl);
	else
		response.sendError(response.SC_NOT_FOUND);
}
else
{
	response.sendError(response.SC_NOT_FOUND);
	return;
}
%>