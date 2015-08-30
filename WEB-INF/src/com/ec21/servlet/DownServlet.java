/**
 * DownServlet.java created on 2009. 02. 10.
 */
package com.ec21.servlet;

import java.io.*;

import java.net.URLEncoder;
import javax.servlet.http.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ec21.util.Tools;

/**
 * parameter
 * file_nm : DB에저장된 파일의 원명 (예를 들면  "한국 경제 동향.pdf" )
 * file_path : DB에 저장된 파일명 (/etc/20081223214732032.hwp )
 * static_url : 모듈명 파일저장 경로를 저장한 ceis.resource.Static클래스의 상수명
 *
 * @author Hyewon Suh
 *
 */
public class DownServlet extends HttpServlet {

	/**
	 * 파일 다운로드 요청 처리
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException
	{
		String DataPath = "/data/T1/product/upload";

		String file_nm = request.getParameter("file_nm");
	if("GET".equalsIgnoreCase(request.getMethod()))
		file_nm = new String( file_nm.getBytes("8859_1"), "UTF-8" );
		String file_path = request.getParameter("file_path");
		String SystemFilePath = "";

//System.out.println("Download File Parameter file_nm ["+file_nm+"] file_path ["+file_path+"]");

		if( Tools.isNullString(file_nm) || Tools.isNullString(file_path))
		{
			System.out.println("Download File Parameter empty error!!");
			String rURL ="/common/message.jsp?ecode=R0_100";
			response.sendRedirect(rURL);
			return;
		}//end if

		if (file_nm.indexOf("jsp") > 0 || file_nm.indexOf("java") > 0 || file_nm.indexOf("js")>0 )
		{
			System.out.println("Download File Extend Error !!");
			String rURL ="/common/message.jsp?ecode=R0_100";
			response.sendRedirect(rURL);
			return;
		}

		SystemFilePath = DataPath + file_path;

//System.out.println("Download File ["+SystemFilePath+"]");
		BufferedInputStream bi = null;
		javax.servlet.ServletOutputStream so	=null;
		File file = new File(SystemFilePath);

		if(! file.isFile()) {
			System.out.println("File Not Found!! [" +SystemFilePath+"]");
			String rURL ="/common/message.jsp?ecode=R0_101&epath=";
			response.sendRedirect(rURL);
			return;
		}

		int count = 0;
		byte[] buffer = new byte[1024];
//file_nm = "test.hwp";
		try
		{
			so= response.getOutputStream();
			bi = new BufferedInputStream(new FileInputStream(file) );
			response.setContentType("application/octet-stream;");
//			response.setHeader("Content-Disposition", "attachment;filename="+new String(file_nm.getBytes("euc-kr"), "8859_1")+";");
			response.setHeader("Content-Disposition", "attachment;filename="+file_nm+";");

			while((count = bi.read(buffer)) != -1){
				so.write(buffer, 0, count);
			}//end while
			so.flush();

		}catch(Exception e){
			System.out.println("DownServlet.java: "+e.toString());
		}finally{
			bi.close();
			so.close();
		}//try

	}

}
