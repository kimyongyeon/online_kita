/*
 * @(#)MultiPartRequest.java   1.0.0   2002/05/23
 * 
 * Copyright(c) 2004 EC21, Inc. All Right Reserved.
 * 
 * This software is the proprietary information of Soft-Tech Global, Inc.
 * Use is subject to license terms.
 */

package cel.io.file.upload;

import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Properties;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;

/**
 * multipart/form-data 타입으로 전송되는 HTTP 요청 데이터를 분석하여 파라미터를 추출하고 클라이언트가 전송한 파일을 로컬 파일 또는 메모리에 저장한다.<BR>
 * 사용방법은 다음과 같다.<BR>
 * <BR>
 *   MultiPartRequest mpRequest = new MultiPartRequest(request, "/home/pds/temp/", "euc-kr", null, null, -1);<BR>
 *   String param1 = mpRequest.getParameter("param1");<BR>
 *   UploadFile upFile = mpRequest.getUploadFile("file1");<BR>
 *   String fileName = upFile.getFileName();<BR>
 * <BR>
 *  특징 : 서블릿2.2 기준/파라미터를 지정한 인코딩으로 변환/파일,메모리로 저장/크기 제한
 * 
 * @author  powerbox
 * @version 1.0.0   2002/05/23
 * @since   JDK 1.2
 */

public class MultiPartRequest
{

    // 기본 인코딩
    private String defaultEncoding;
    // 기준 저장경로
    private String baseSaveDirectory;
    // 파일크기 제한
    private long limitFileSize;
    // 저장된 파일 크기
    private long savedFilesSize;
    
    // 설정된 다른 경로
    private Properties otherPath;
    // 메모리에 저장된 파일 목록
    private Hashtable memoryFileParameterList;
    // 일반 파리메터 목록
    private Hashtable parameterList;
    // 파일 목록
    private Hashtable fileList;
    // 파라메터 바운더리
    private String boundary;
    
    // added by HSH 2011.06  
    // Defines the number of bytes to read per readLine call. 128K
    private static final int READ_LINE_BLOCK = 1024 * 128;
    
    /**
     * 읽어온 파라미터 값을 문자열로 생성할 때 기본적으로 사용되는 캐릭터셋. (ISO-8859-1)
     */
//    public static final String DEFAULT_ENCODING = "ISO-8859-1";
    public static final String DEFAULT_ENCODING = "UTF-8";

	/**
	 * 업로드 파일의 크기 제한이 없는 MultiPartRequest을 생성한다.
	 * 
	 * @param	httpservletrequest	클라이언트의 HTTP 요청
	 * @param	baseSaveDirectory	기본적으로 업로드한 파일을 저장할 디렉토리
	 * 
	 * @exception	IOException
	 * @exception	LimitFileSizeException
	 */
    public MultiPartRequest(HttpServletRequest request, String baseSaveDirectory)
        throws IOException, LimitFileSizeException
    {
        this(request, baseSaveDirectory, "UTF-8", null, null, -1L);
    }

    /**
     * 업로드 파일의 크기 제한이 없는 MultiPartRequest을 생성한다.
     * 
     * @param   httpservletrequest  클라이언트의 HTTP 요청
     * @param   baseSaveDirectory   기본적으로 업로드한 파일을 저장할 디렉토리
     * @param   defaultEncoding     기본 인코딩
     * 
     * @exception   IOException
     * @exception   LimitFileSizeException
     */
    public MultiPartRequest(HttpServletRequest request, String baseSaveDirectory, String defaultEncoding )
        throws IOException, LimitFileSizeException
    {
        this(request, baseSaveDirectory, defaultEncoding, null, null, -1L);
    }
    
    public MultiPartRequest(HttpServletRequest request, String baseSaveDirectory,  long limitFileSize, String defaultEncoding )
    throws IOException, LimitFileSizeException
    {
      this(request, baseSaveDirectory, defaultEncoding, null, null, limitFileSize);
    }    

	/**
	 * MultiPartRequest을 생성한다.
	 * 
	 * @param	httpservletrequest	클라이언트의 HTTP 요청
	 * @param	baseSaveDirectory	기본적으로 업로드한 파일을 저장할 디렉토리
	 * @param	limitFileSize	전체 업로드한 파일의 제한 크기. -1일 경우 크기 제한이 없다.
	 * 
	 * @exception	IOException
	 * @exception	LimitFileSizeException
	 */
    public MultiPartRequest(HttpServletRequest request, String baseSaveDirectory, long limitFileSize)
        throws IOException, LimitFileSizeException
    {
        this(request, baseSaveDirectory, "UTF-8", null, null, limitFileSize);
    }

	/**
	 * MultiPartRequest을 생성한다.
	 * @param	httpservletrequest	클라이언트의 HTTP 요청
	 * @param	baseSaveDirectory	기본적으로 업로드한 파일을 저장할 디렉토리
	 * @param	defaultEncoding		읽어온 파라미터값을 변경할 인코딩 타입
	 * @param	properties	업로드할 때 사용한 파일명이 아닌 지정한 경로명으로 저장할 업로드 파일의 (파라미터이름,경로) 쌍의 목록. 없을 경우 null
	 * @param	memorySave	메모리에 저장할 업로드 파일의 파라미터 이름 목록. 없을 경우 null
	 * @param	limitFileSize	전체 업로드한 파일의 제한 크기. -1일 경우 크기 제한이 없다.
	 * 
	 * @exception	IOException
	 * @exception	LimitFileSizeException
	 */
    
    public MultiPartRequest(HttpServletRequest request, String baseSaveDirectory, String defaultEncoding, Properties properties, String memorySave[], long limitFileSize)
        throws IOException, LimitFileSizeException
    {
        if(request == null)
        {
            throw new IllegalStateException("request is null");
        }
        if(baseSaveDirectory == null)
        {
            throw new IllegalArgumentException("saveDirectory cannot be null");
        }
        if(defaultEncoding == null)
        {
            throw new IllegalArgumentException("Character Encoding cannot be null");
        }
        
        String contentType = request.getContentType();
        
        if(contentType == null || !contentType.toLowerCase().startsWith("multipart/form-data"))
        {
            throw new IOException("Posted content type must be multipart/form-data");
        }
        
        // 바운더리 문자열을 얻는다.
        boundary = getBoundaryString(contentType);
        
        if(boundary == null)
        {
            throw new IOException("Separation boundary must be specified");
        }
        
        this.baseSaveDirectory = baseSaveDirectory;
        otherPath = properties;
        this.defaultEncoding = defaultEncoding;
        this.limitFileSize = limitFileSize;
        savedFilesSize = 0L;
        memoryFileParameterList = new Hashtable();

        int memorySaveLength = (memorySave!=null) ? memorySave.length : 0;
        
        if(memorySave != null && memorySaveLength > 0)
        {
            for(int i = 0; i < memorySaveLength; i++)
            {
                memoryFileParameterList.put(memorySave[i], memorySave[i]);
            }
        }
        
        parameterList = new Hashtable();
        fileList = new Hashtable();
        
        parse(request.getInputStream());
    }
    
    /**
     * Content Type에서 boundary 문자열을 찾아서 반환한다.
     * 
     * @param   contentType
     * @return  설정된 boundary 문자열
     */
    private String getBoundaryString(String contentType)
    {
        String boundary = null;
        int boundaryIndex = contentType.indexOf("boundary=");
        
        if(boundaryIndex > -1)
        {
            boundary = "--" + contentType.substring(boundaryIndex + 9);
        }
        
        return boundary;
    }

    /**
     * Request를 파싱한다.
     */
    private void parse(ServletInputStream sis)
        throws IOException, LimitFileSizeException
    {
        MultiPartInputStreamHandler multipartinputstreamhandler = new MultiPartInputStreamHandler(sis, boundary, defaultEncoding, READ_LINE_BLOCK);
        String line = multipartinputstreamhandler.readLine();
        
        if(line == null)
        {
            throw new IOException("Corrupt form data: premature ending");
        }
        
        if(!line.startsWith(boundary))
        {
            throw new IOException("Corrupt form data: no leading boundary");
        }
        
        for(boolean flag = false; !flag; flag = readNextPart(multipartinputstreamhandler, boundary));
    }

    /**
     * Request의 파라메터를 하나씩 읽어들인다.
     */
    private boolean readNextPart(MultiPartInputStreamHandler multipartinputstreamhandler, String boundary)
        throws IOException, LimitFileSizeException
    {
        String line = multipartinputstreamhandler.readLine();
        
        if(line == null)
        {
            return true;
        }
        
        String dispositionInfo[] = getDispositionInfo(line);
        
        String contentDisposition = dispositionInfo[0];
        String paramName = dispositionInfo[1];
        String fileName = dispositionInfo[2];
		// realFileName 입력 시작
		// 변경. fileName 은 system 날짜파일명으로 바꾸고, (yyyymmddhhmissSSS.ext )
		// realFilename 에 현재의 fileName을 입력한다.
		String ext = "";

		String realFileName = com.ec21.util.Tools.getTimeStamp();
		realFileName = realFileName.replaceAll("(-|:)", "" );
		// realFileName 입력 끝.

		line = multipartinputstreamhandler.readLine();
		
		if(line == null)
		{
			return true;
		}
		
		String contentType = getContentType(line);
		
		if(contentType != null)
		{
			String s2 = multipartinputstreamhandler.readLine();
			if(s2 == null || s2.length() > 0)
			{
				throw new IOException("Malformed line after content type: " + s2);
			}
		}
		else
		{
			contentType = "application/octet-stream";
		}
		
		// file name이 null인 경우
		if(fileName == null)
		{
			String paramValue = readParameter(multipartinputstreamhandler, boundary);
			
			if(parameterList.containsKey(paramName))
			{
				Object obj = parameterList.get(paramName);
				
				if(obj instanceof String)
				{
					ArrayList arraylist = new ArrayList(10);
					arraylist.add(obj);
					arraylist.add(paramValue);
					parameterList.put(paramName, arraylist);
				}
				else
				if(obj instanceof ArrayList)
				{
					((ArrayList)obj).add(paramValue);
				}
			}
			else
			{
				parameterList.put(paramName, paramValue);
			}
		}
		else    // file name이 있는경우
		if(!"".equals(fileName))
		{
			BufferedOutputStream bufferedoutputstream = null;
			ByteArrayOutputStream bytearrayoutputstream = null;
			FileOutputStream fileoutputstream = null;
			File file = null;

			byte saveType = 0;
			String fileAbsolutePath = null;
			byte abyte0[] = null;
			
			try
			{
				// 다른 경로로 저장하는 경우
				if(otherPath != null && otherPath.containsKey(paramName))
				{
					saveType = 2;
					file = new File( otherPath.getProperty(paramName) );
					fileAbsolutePath = file.getAbsolutePath();
					fileoutputstream = new FileOutputStream(file);
					bufferedoutputstream = new BufferedOutputStream(fileoutputstream);
				}
				else    // 메모리에 저장하는 경우
				if(memoryFileParameterList.containsKey(paramName))
				{
					saveType = 4;
					bytearrayoutputstream = new ByteArrayOutputStream(8224);
					bufferedoutputstream = new BufferedOutputStream(bytearrayoutputstream);
				}
				else    // 일반적인 경우
				{
					saveType = 1;
						
					// 변경 File file = new File(baseSaveDirectory, fileName);
					if ( fileName.lastIndexOf(".")>-1)
						realFileName += fileName.substring(fileName.lastIndexOf("."));

					file = new File(baseSaveDirectory, realFileName);
					fileAbsolutePath = file.getAbsolutePath();
					fileoutputstream = new FileOutputStream(file);
					bufferedoutputstream = new BufferedOutputStream(fileoutputstream);
				}
				
				int fileSize = 0;
				try
				{
					fileSize = write(multipartinputstreamhandler, boundary, bufferedoutputstream);
				}
				catch (LimitFileSizeException lfse)
				{
					if (file != null) file.delete();
					throw lfse;
				}

				savedFilesSize += fileSize;
				bufferedoutputstream.close();
				
				if(bytearrayoutputstream != null)
				{
					abyte0 = bytearrayoutputstream.toByteArray();
				}
				
				//UploadFile uploadfile = new UploadFile(saveType, fileName, fileAbsolutePath, abyte0, fileSize);
				UploadFile uploadfile = new UploadFile(saveType, fileName, realFileName, fileAbsolutePath, abyte0, fileSize);
				fileList.put(paramName, uploadfile);
				
				// 파일허용크기를 넘기면 Exception을 발생시킨다.
				if(limitFileSize != -1L && savedFilesSize > limitFileSize)
				{
					deleteAllUploadedFile();
					throw new LimitFileSizeException("Overflow!");
				}
			}
			catch (LimitFileSizeException lfse)
			{
				deleteAllUploadedFile();
				throw lfse;
			}
			catch (IOException ioe)
			{
				deleteAllUploadedFile();
				throw ioe;
			}
			finally
			{
				if (bufferedoutputstream != null) bufferedoutputstream.close();
				if (fileoutputstream != null) fileoutputstream.close();
				if (bytearrayoutputstream != null) bytearrayoutputstream.close();
			}
		}
		else    // 기타 file name이 ""인 경우 - 무시
		{
			multipartinputstreamhandler.readLine();
			multipartinputstreamhandler.readLine();
		}			
        
        return false;
    }

    /**
     * 파라메터의 컨텐츠 타입을 얻는다.
     */
    private String getContentType(String str)
        throws IOException
    {
        String contentType = null;
        String lowerStr = str.toLowerCase();
        
        if(lowerStr.startsWith("content-type"))
        {
            int blankIndex = lowerStr.indexOf(" ");
            
            if(blankIndex == -1)
            {
                throw new IOException("Content type corrupt: " + str);
            }
            contentType = lowerStr.substring(blankIndex + 1);
        }
        else
        if(lowerStr.length() != 0)
        {
            throw new IOException("Malformed line after disposition: " + str);
        }
        
        return contentType;
    }

    /**
     * 파라메터의 Content-Disposition 내용을 얻는다.
     */
    private String[] getDispositionInfo(String line)
        throws IOException
    {
        String ret[] = new String[3];
        String temp = line;
        line = temp.toLowerCase();
        int start = line.indexOf("content-disposition: ");
        int end = line.indexOf(";");
        
        if(start == -1 || end == -1)
        {
            throw new IOException("Content disposition corrupt: " + temp);
        }
        
        String contentDisposition = line.substring(start + 21, end);
        
        if(!contentDisposition.equals("form-data"))
        {
            throw new IOException("Invalid content disposition: " + contentDisposition);
        }
        
        start = line.indexOf("name=\"", start);
        end = line.indexOf("\"", start + 7);
        
        if(start == -1 || end == -1)
        {
            throw new IOException("Content disposition corrupt: " + temp);
        }
        
        String name = temp.substring(start + 6, end);
        String filename = null;
        
        start = line.indexOf("filename=\"", end + 2);
        end = line.indexOf("\"", start + 10);
        
        if(start != -1 && end != -1)
        {
            filename = temp.substring(start + 10, end);
            int dir = Math.max(filename.lastIndexOf('/'), filename.lastIndexOf('\\'));
            if(dir > -1)
            {
                filename = filename.substring(dir + 1);
            }
        }
        
        ret[0] = contentDisposition;
        ret[1] = name;
        ret[2] = filename;
        
        return ret;
    }

    /**
     * 파라미터의 값을 읽어온다.
     * 
     * @param	in        스트림핸들러
     * @param	boundary  바운더리
     * 
     * @return	파라미터의 값
     * 
	 * @exception  IOException
     */
    protected String readParameter(MultiPartInputStreamHandler in, String boundary)
        throws IOException
    {
        StringBuffer stringbuffer = new StringBuffer(128);
        String line;
        
        while((line = in.readLine()) != null) 
        {
            if(line.startsWith(boundary))
            {
                break;
            }
            stringbuffer.append(line + "\r\n");
        }
        
        if(stringbuffer.length() == 0)
        {
            return null;
        }
        else
        {
            stringbuffer.setLength(stringbuffer.length() - 2);
            return stringbuffer.toString();
        }
    }

    /**
     * 출력스트림으로 입력내용을 기록한다
     * 
     * @param   multipartinputstreamhandler
     * @param   boundary
     * @param   outputstream
     * @return  저장된 길이
     * @throws  IOException
     */
    private int write(MultiPartInputStreamHandler multipartinputstreamhandler, String boundary, OutputStream outputstream)
        throws IOException, LimitFileSizeException
    {
        int size = 0;
        byte buffer[] = new byte[READ_LINE_BLOCK];
        boolean flag = false;
        int lineflag;
        
        while((lineflag = multipartinputstreamhandler.readLine(buffer, 0, buffer.length)) != -1) 
        {
            if(lineflag > 2 && buffer[0] == 45 && buffer[1] == 45)
            {
                //String s1 = new String(buffer, 0, lineflag, "ISO-8859-1");
            	String s1 = new String(buffer, 0, lineflag, defaultEncoding);
                if(s1.startsWith(boundary))
                {
                    break;
                }
            }
            
            // CR 문자를 위한 처리
            if(flag)
            {
                outputstream.write(13);
                outputstream.write(10);
                size += 2;
                flag = false;
            }
            
            if(lineflag >= 2 && buffer[lineflag - 2] == 13 && buffer[lineflag - 1] == 10)
            {
                outputstream.write(buffer, 0, lineflag - 2);
                size += lineflag - 2;
                flag = true;
            }
            else
            {
                outputstream.write(buffer, 0, lineflag);
                size += lineflag;
            }

			if (size > limitFileSize)
			{
				outputstream.flush();
				throw new LimitFileSizeException("Overflow!");
			}
        }
        
        outputstream.flush();
        
        return size;
    }

	/**
	 * 파라미터의 이름에 대한 값을 구한다.
	 * 
	 * @param	name	파리미터 이름.
	 * 
	 * @return	java.lang.String - 파라미터의 값. 존재하지 않을 경우 null을 리턴한다.
	 */
    public String getParameter(String name)
    {
        // 파라미터 목록에서 해당하는 이름의 객체를 얻는다.
        Object obj = parameterList.get(name);
        
        // 꺼내온 객체가 null이면 바로 return 한다.
        if(obj == null)
        {
            return null;
        }
        
        // 꺼내온 객체가 ArrayList이면 String 배열로 변환하여 첫번째 요소를 return 한다.
        if(obj instanceof ArrayList)
        {
            String as[] = changeArrayListToArray(name, (ArrayList)obj);
            return as[0];
        }
        
        // 커내온 객체가 String 배열이면 배열의 첫번째 요소를 return 한다.
        if(obj instanceof String[])
        {
            return ((String[])obj)[0];
        }
        else	// String으로 cast해서 return한다.
        {
            return (String)obj;
        }
    }

	/**
	 * 파라미터의 이름에 대한 값을 배열로 구한다.
	 * 
	 * @param	name	파리미터 이름.
	 * 
	 * @return	java.lang.String[] - 파라미터의 값을 저장하고 있는 배열. 존재하지 않을 경우 null을 리턴한다.
	 */
    public String[] getParameterValues(String name)
    {
        // 파라미터 목록에서 해당하는 이름의 객체를 얻는다.
        Object obj = parameterList.get(name);
        
        // 꺼내온 객체가 null이면 바로 return 한다.
        if(obj == null)
        {
            return null;
        }
        
        // 꺼내온 객체가 ArrayList이면 String 배열로 변환하여 return 한다.
        if(obj instanceof ArrayList)
        {
            return changeArrayListToArray(name, (ArrayList)obj);
        }
        
        // 커내온 객체가 String 배열이면 return 한다.
        if(obj instanceof String[])
        {
            return (String[])obj;
        }
        else	// String으로 case해서 String 배열에 넣고 return 한다.
        {
            return (new String[] { (String)obj });
        }
    }

    /**
     * ArrayList의 내용을 String 배열로 변환시킨다.
     */
    private synchronized String[] changeArrayListToArray(String paramName, ArrayList arraylist)
    {
        String strArray[] = new String[arraylist.size()];
        
        arraylist.toArray(strArray);
        parameterList.put(paramName, strArray);
        
        return strArray;
    }

	/**
	 * (업로드한 파일을 제외한) 파라미터의 목록을 구한다.
	 * 
	 * @return	java.util.Enumeration - 파라미터 목록
	 */
    public Enumeration getParameterNames()
    {
        return parameterList.elements();
    }

	/**
	 * 파라미터 이름으로 UploadFile 객체를 구한다.
	 * 
	 * @param	name	파리미터 이름
	 * 
	 * @return	UploadFile - 파라미터 이름에 해당하는 UploadFile 객체. 존재하지 않을 경우 null을 리턴한다.
	 */
    public UploadFile getUploadFile(String name)
    {
        return (UploadFile)fileList.get(name);
    }

	/**
	 * 업로드한 파일의 목록을 구한다. 리턴되는 Enumeration 객체는 UploadFile 객체를 저장하고 있다.
	 * 
	 * @return	java.util.Enumeration - 업로드한 파일 목록
	 */
    public Enumeration getUploadFiles()
    {
        return fileList.elements();
    }

	/**
	 * 업로드한 파일 목록을 모두 삭제한다.
	 */
    private void deleteAllUploadedFile()
    {
        for(Enumeration enumeration = fileList.elements(); enumeration.hasMoreElements();)
        {
            UploadFile uploadfile = (UploadFile)enumeration.nextElement();
            switch(uploadfile.getType())
            {
            case 4:
                break;

            default:
                File file = new File(uploadfile.getAbsoluteFilePath());
                file.delete();
                break;
            }
        }

        fileList.clear();
    }

}
