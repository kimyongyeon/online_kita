/*
 * @(#)MultiPartInputStreamHandler.java   1.0.0   2002/05/23
 * 
 * Copyright(c) 2004 EC21, Inc. All Right Reserved.
 * 
 * This software is the proprietary information of Soft-Tech Global, Inc.
 * Use is subject to license terms.
 */


package cel.io.file.upload;

import java.io.IOException;
import javax.servlet.ServletInputStream;

/**
 * ServletInputStream으로부터 데이터를 추출해주는 스트림 핸들러 
 * 
 * @author  powerbox
 * @version 1.0.0   2002/05/23
 * @since   JDK 1.2
 */

public class MultiPartInputStreamHandler
{

    private ServletInputStream in;
    private String boundary;
    private String encoding;
    private byte buffer[];
    private StringBuffer sBuf;
    
    

    /**
     * 서블릿 스트림을 처리하는 핸들러를 생성한다.
     * 
     * @param	in	서블릿 입력 스트림
     * @param	boundary	바운더리 문자열
     * @param	encoding	읽어온 데이터를 저장할 캐릭터셋
     */
    public MultiPartInputStreamHandler(ServletInputStream in, String boundary, String encoding, int read_line_block)
    {
        buffer = new byte[read_line_block];
        sBuf = new StringBuffer(buffer.length);
        this.in = in;
        this.boundary = boundary;
        this.encoding = encoding;
    }

	/**
	 * ServletInputStream으로부터 한 줄을 읽기 위해 사용된다. \r\n을 기준으로 읽어오며, 마지막의 \r\n은 포함되지 않는다.
	 * 
	 * @return	java.lang.String - ServletInputStream으로 부터 읽어온 1 Line
	 * 
	 * @exception	IOException
	 */
    public String readLine()
        throws IOException
    {
        if(sBuf.length() > 0)
            sBuf.delete(0, sBuf.length());
        int i;
        do
        {
            i = readLine(buffer, 0, buffer.length);
            if(i != -1)
            {
            	sBuf.append(new String(buffer, 0, i, encoding));
            }	
        }
        while(i == buffer.length);
        
        if(sBuf.length() == 0)
        {
            return null;
        } else
        {
            sBuf.delete(sBuf.length() - 2, sBuf.length());
            return sBuf.toString();
        }
    }

	/**
	 * ServletInputStram의 readLine()을 사용하여 byte 데이터를 읽어온다.
	 * 
	 * @param	b	읽어온 바이트 데이터를 저장할 byte 배열
	 * @param	off	배열에서 데이터를 저장할 위치
	 * @param	len	읽어올 바이트 수
	 * @return	int - 실제로 읽어온 바이트 수
	 * 
	 * @exception	IOException
	 */
    public int readLine(byte b[], int off, int len)
        throws IOException
    {
    	return in.readLine(b, off, len);
    }

}