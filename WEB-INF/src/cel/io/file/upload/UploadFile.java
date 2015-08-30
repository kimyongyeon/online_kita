/*
 * @(#)UploadFile.java   1.1.0   2002/07/30
 * 
 * Copyright(c) 2004 EC21, Inc. All Right Reserved.
 * 
 * This software is the proprietary information of Soft-Tech Global, Inc.
 * Use is subject to license terms.
 */


package cel.io.file.upload;

/**
 * 업로드한 파일의 저장위치, 파일명, 절대 경로, 메모리에 저장된 byte 데이터를 내부에 저장하는 객체
 * 
 * @author  powerbox
 * @version 1.1.0   2002/07/30
 * @since   JDK 1.4
 */

public class UploadFile
{
    /**
     * 기본 디렉토리에 저장
     */
    public static final int BASE_DIRECTORY = 1;
    /**
     * 지정한 경로에 저장
     */
    public static final int SPECIFIED_PATH = 2;
    /**
     * 메모리에 저장
     */
    public static final int MEMORY = 4;

    
    // 설정된 저장 타입
    private int type;
    // HTML Form 필드명
    private String fieldName;
    // 업로드 파일 이름
    private String fileName;
    // 업로드 파일 확장자
    private String fileExt;
    // 업로드 파일의 위치
    private java.lang.String filePath;
    // 파일의 실제 이름
    private String realFileName;
    // 파일의 실제 확장자
    private String realFileExt;
    // 파일의 저장된 절대경로
    private String absoluteFilePath;
    // 파일 데이터를 저장하는 바이트 배열
    private byte memoryFile[];
    // 파일 사이즈
    private int fileSize;
    // 컨텐츠 타입
    private String contentType;
    // Content Diposition
    private String contentDisposition;
    // Contetn String
    private String contentString;
    // MIME 타입
    private String typeMIME;
    // 서브 MIME 타입
    private String subTypeMIME;
    // 저장된 파일이 존재하는지 유무
    private boolean isMissing;
    

	/**
	 * 생성자
	 * 
	 * @param	type	파일이 저장된 장소
	 * @param	fileName	파일명
	 * @param	fileAbsolutePath	파일의 절대 경로. 메모리에 저장될 경우 null
	 * @param	memoryFile	메모리에 저장된 데이터. 메모리에 저장되지 않았을 경우 null
	 * @param	fileSize	
	 */
    public UploadFile(int type, String fileName, String fileAbsolutePath, byte memoryFile[], int fileSize)
    {
        if(type != 1 && type != 2 && type != 4)
        {
            throw new IllegalArgumentException("type has a invalid value!");
        }
        
        this.type = type;
        this.fileName = fileName;
        absoluteFilePath = fileAbsolutePath;
        
        if(fileAbsolutePath != null)
        {
            if(type == 1)
            {
                realFileName = fileName;
            }
            else
            if(type == 2 && fileAbsolutePath != null)
            {
                int j = fileAbsolutePath.lastIndexOf("\\");
                
                if(j == -1)
                {
                    j = fileAbsolutePath.lastIndexOf("/");
                }
                
                if(j != -1)
                {
                    realFileName = fileAbsolutePath.substring(j + 1);
                }
                else
                {
                    realFileName = fileAbsolutePath;
                }
            }
        }
        this.memoryFile = memoryFile;
        this.fileSize = fileSize;
    }

    public UploadFile(int type, String fileName, String realFileName, String fileAbsolutePath, byte memoryFile[], int fileSize)
    {
        if(type != 1 && type != 2 && type != 4)
        {
            throw new IllegalArgumentException("type has a invalid value!");
        }
        
        this.type = type;
        this.fileName = fileName;
		this.realFileName = realFileName;
        this.memoryFile = memoryFile;
        this.fileSize = fileSize;
    }

	/**
	 * 저장 타입을 구한다.
	 * 
	 * @return	int - type 저장 위치
	 */
    public int getType()
    {
        return type;
    }
    
    /**
     * HTML Form에서 정의한 필드 이름
     *
     * @return java.lang.String 폼 필드명
     */
    public java.lang.String getFieldName()
    {
        return fieldName;
    }

	/**
	 * 업로드된 파일명을 구한다
	 * 
	 * @return	java.lang.String - 파일명
	 */
    public java.lang.String getFileName()
    {
        return fileName;
    }
    
    /**
     * 업로드된 파일 확장자를 구한다.
     *
     * @return  java.lang.String    업로드된 파일의 확장자
     */
    public java.lang.String getFileExt()
    {
        return fileExt;
    }
    
    /**
     * 업로드된 파일이 로컬에서의 위치
     *
     * @return  java.lang.String    파일이 존재했던 로컬 위치
     */
    public java.lang.String getFilePath()
    {
        return filePath;
    }

	/**
	 * 실제 파일시스템에 저장된 파일명을 리턴한다. 절대 경로로부터 추출된다.
	 * 
	 * @return	java.lang.String - 실제 파일명
	 */
    public java.lang.String getRealFileName()
    {
        return realFileName;
    }
    
    /**
     * 실제 파일시스템에 저장된 파일 확장자를 구한다.
     *
     * @return  java.lang.String    실제 파일 확장자
     */
    public java.lang.String getRealFileExt()
    {
        return realFileExt;
    }

	/**
	 * 저장된 파일의 절대 경로를 구한다.
	 * 
	 * @return	java.lang.String - 파일의 절대 경로. 메모리에 저장되어 있을 경우 null 리턴.
	 */
    public String getAbsoluteFilePath()
    {
        return absoluteFilePath;
    }

	/**
	 * 메모리에 저장된 데이터를 구함.
	 * 
	 * @return	byte[] - 업로드한 파일의 byte[] 데이터. 파일시스템에 저장될 경우 null 리턴.
	 */
    public byte[] getMemoryFile()
    {
        return memoryFile;
    }
    
    /**
     * 업로드된 파일의 크기를 구한다.
     *
     * @return  int 파일의 크기
     */
    public int getFileSize()
    {
        return fileSize;
    }
    
    /**
     * Content Type을 반환한다.
     *
     * @return  java.lang.String    Content-Type
     */
    public java.lang.String getContentType()
    {
        return contentType;
    }
    
    /**
     * Content Disposition을 반환한다.
     *
     * @return  java.lang.String    Content-Disposition
     */
    public java.lang.String getContentDisposition()
    {
        return contentDisposition;
    }
    
    /**
     * Content String을 반환한다.
     *
     * @return  java.lang.String    Content String
     */
    public java.lang.String getContentString()
    {
        return contentString;
    }
    
    /**
     * 파일의 MIME Type을 반환한다.
     *
     * @return  java.lang.String    파일의 MIME Type
     */
    public java.lang.String getTypeMIME()
    {
        return typeMIME;
    }
    
    /**
     * 파일의 Sub MIME Type을 반환한다.
     *
     * @return  java.lang.String    파일의 Sub MIME Type
     */
    public java.lang.String getSubTypeMIME()
    {
        return subTypeMIME;
    }
    
    /**
     * 업로드되어 저장된 파일이 존재하는지에 대한 유무 확인
     *
     * @return  boolean true이면 존재하지 않음.
     */
    public boolean isMissing()
    {
        return isMissing;
    }
    
    

}