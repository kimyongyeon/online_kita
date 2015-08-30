package com.ec21.upload;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import cel.io.file.upload.LimitFileSizeException;
import cel.io.file.upload.MultiPartRequest;
import cel.io.file.upload.UploadFile;

/**
 * File Upload를 위한 클래스
 * 이 클래스는 기존의 업로드 클래스와의 호환성을 위해 수정되었음.
 * 
 * @author powerbox
 * @version 1.1.0   2004/02/26
 */
public class MultiPart
{
    
    private MultiPartRequest mpr = null;
    // 관리자 영역은 파일크기 제한이 없다. 일반은 307200L (300k)이다.
    private long limitFileSize = 307200L;
    
	public MultiPart(HttpServletRequest request, String baseSaveDirectory)
        throws IOException
	{
        try
        {
            mpr = new MultiPartRequest(request, baseSaveDirectory, limitFileSize);
        }
        catch(LimitFileSizeException lfse)
        {
            throw new IOException("LimitFileSizeException");
        }
        catch(IOException ioe)
        {
            throw ioe;
        }
	}

    public MultiPart(HttpServletRequest request, String baseSaveDirectory, int limitKillo)
        throws IOException
    {
        try
        {
            mpr = new MultiPartRequest(request, baseSaveDirectory, limitKillo);
        }
        catch(LimitFileSizeException lfse)
        {
            throw new IOException("LimitFileSizeException");
        }
        catch(IOException ioe)
        {
            throw ioe;
        }
    }

    public MultiPart(HttpServletRequest request, String baseSaveDirectory, int limitKillo, String defaultEncoding)
    throws IOException
   {
    try
    {
        mpr = new MultiPartRequest(request, baseSaveDirectory, limitKillo, defaultEncoding);
    }
    catch(LimitFileSizeException lfse)
    {
        throw new IOException("LimitFileSizeException");
    }
    catch(IOException ioe)
    {
        throw ioe;
    }
    }    
    
    public MultiPart(HttpServletRequest request, String baseSaveDirectory, String defaultEncoding)
        throws IOException
    {
        try
        {
            mpr = new MultiPartRequest(request, baseSaveDirectory, defaultEncoding );
        }
        catch(LimitFileSizeException lfse)
        {
            throw new IOException("LimitFileSizeException");
        }
        catch(IOException ioe)
        {
            throw ioe;
        }
    }
	
    public String getParameter(String name)
    {
        String ret = mpr.getParameter( name );
        
        if (ret==null)
        {
            UploadFile uf = mpr.getUploadFile( name );
            if (uf!=null)
            {
                ret = uf.getFileName();
            }
        }
        return ret;
    }
    
    public String[] getParameterValues(String name)
    {
        return mpr.getParameterValues(name);
    }    

    public String getRealFileName(String name)
    {
        String ret = mpr.getParameter( name );
        
        if (ret==null)
        {
            UploadFile uf = mpr.getUploadFile( name );
            if (uf!=null)
            {
                ret = uf.getRealFileName();
            }
        }
        return ret;
    }
    
    public long getUploadFileSize(String paramName)
    {
        UploadFile uf = mpr.getUploadFile( paramName );
        
        return (long)uf.getFileSize();
    }
    
    public long getFileSize(String uploadDir, String fileName)
    {
        if (uploadDir == null || uploadDir.equals("")) return -1L;

        int s = uploadDir.length();
        int e = uploadDir.lastIndexOf("/");

        if (e != s - 1) uploadDir += "/" + fileName;
        else uploadDir += fileName;

        return this.getFileSize(uploadDir);
    }

    public long getFileSize(String filePath)
    {
        File oneFile = new File(filePath); 

        if (!oneFile.exists()) return -1L;

        if (oneFile.isFile())
        {
            return oneFile.length();
        }
        else
        if (oneFile.isDirectory())
        {
            return -1L;
        }

        return -1L;
    }
}
