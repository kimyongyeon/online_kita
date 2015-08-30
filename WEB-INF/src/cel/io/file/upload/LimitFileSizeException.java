/*
 * @(#)LimitFileSizeException.java   1.0.0   2002/05/23
 * 
 * Copyright(c) 2004 EC21, Inc. All Right Reserved.
 * 
 * This software is the proprietary information of Soft-Tech Global, Inc.
 * Use is subject to license terms.
 */


package cel.io.file.upload;

/**
 * 업로드한 파일들의 크기의 총합이 제한 크기보다 클 때 발생한다.
 * 
 * @author  powerbox
 * @version 1.0.0   2002/05/23
 * @since   JDK 1.2
 */

public class LimitFileSizeException extends Throwable
{

    public LimitFileSizeException(String s)
    {
        super(s);
    }
}