package com.ec21.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Utility
{
	private static final Utility instance = new Utility();

	private DecimalFormat df = null;

	private String stripHtmlRegex = "<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>";

	public static Utility getInstance()
	{
		return instance;
	}

	public Utility()
	{
		df = new DecimalFormat("###,###,###,###,###,###,###");
	}

	public String nullCheck(String sTar)
	{
		if(sTar == null)
			sTar = "";

		return sTar;
	}

	public String nullCheckObjectRetunString(Object obj)
	{
		String reStr = "";

		if(obj == null)
			reStr = "";
		else
			reStr = obj + "";

		return reStr;
	}

	public int getInt(String sTar)
	{
		int reI = 0;

		if(sTar == null)
			reI = 0;
		else if("".equals(sTar))
			reI = 0;
		else
		{
			try
			{
				reI = Integer.parseInt(sTar);
			}
			catch(NumberFormatException nfe)
			{
				nfe.printStackTrace();
			}
		}

		return reI;
	}

	public int getPageNum(int pageNum)
	{
		if(pageNum < 1)
			pageNum = 1;

		return pageNum;
	}

	public Long getLong(String sTar)
	{
		long reI = 0;

		if(sTar == null)
			reI = 0;
		else if("".equals(sTar))
			reI = 0;
		else
		{
			try
			{
				reI = Long.parseLong(sTar);
			}
			catch(NumberFormatException nfe)
			{
				nfe.printStackTrace();
			}
		}

		return reI;
	}

	public int nullCheckForPageNum(String sTar)
	{
		int reI = 1;

		if(sTar == null)
			reI = 1;
		else if("".equals(sTar))
			reI = 1;
		else
		{
			try
			{
				reI = Integer.parseInt(sTar);

				if(reI == 0)
					reI = 1;
			}
			catch(NumberFormatException nfe)
			{
				nfe.printStackTrace();
			}
		}

		return reI;
	}

	/*****************************************************************
	 * Desc       : Parameter1을 Parameter2형식으로 전환
	 * Parameter1 : String : "YYYYMMDD"
	 * Parameter2 : String : "YYYY/MM/DD"
	 * Exam       : ["ABCDEFGH", "YYYY/MM/DD"]
	 * Return     : ["20000919", "2001/09/17"]
	 *****************************************************************/
	public String getDate(String src, String type)
	{
		if (src == null || src.equals("")) return "";
		if (type == null || type.equals("")) return "";

		StringBuffer retVal = new StringBuffer();
		String yyyy = null, MM = null, dd = null;
		String hh = null, mm = null, ss = null, SSS = null;
		String div1, div2, div3;
		int len = src.length();

		if (len == 8)
		{
			yyyy = src.substring(0, 4);
			MM   = src.substring(4, 6);
			dd   = src.substring(6);
		}
		else if (len == 10)
		{
			yyyy = src.substring(0, 4);
			MM   = src.substring(4, 6);
			dd   = src.substring(6, 8);
			hh   = src.substring(8);
		}
		else if (len == 12)
		{
			yyyy = src.substring(0, 4);
			MM   = src.substring(4, 6);
			dd   = src.substring(6, 8);
			hh   = src.substring(8, 10);
			mm   = src.substring(10);
		}
		else if (len == 14)
		{
			yyyy = src.substring(0, 4);
			MM   = src.substring(4, 6);
			dd   = src.substring(6, 8);
			hh   = src.substring(8, 10);
			mm   = src.substring(10, 12);
			ss   = src.substring(12);
		}
		else if (len == 17)
		{
			yyyy = src.substring(0, 4);
			MM   = src.substring(4, 6);
			dd   = src.substring(6, 8);
			hh   = src.substring(8, 10);
			mm   = src.substring(10, 12);
			ss   = src.substring(12, 14);
			SSS  = src.substring(14);
		}
		else
		{
			return retVal.toString();
		}

		if (type.equals("YYYY/MM/DD"))
		{
			div1 = "/";
			retVal.append(yyyy);
			retVal.append(div1);
			retVal.append(MM);
			retVal.append(div1);
			retVal.append(dd);
		}
		else if (type.equals("YYYY-MM-DD"))
		{
			div1 = "-";
			retVal.append(yyyy);
			retVal.append(div1);
			retVal.append(MM);
			retVal.append(div1);
			retVal.append(dd);
		}
		else if (type.equals("YYYY.MM.DD"))
		{
			div1 = ".";
			retVal.append(yyyy);
			retVal.append(div1);
			retVal.append(MM);
			retVal.append(div1);
			retVal.append(dd);
		}
		else if (type.equals("YYYY/MM/DD HH:MM:SS"))
		{
			div1 = "/";
			div2 = ":";
			retVal.append(yyyy);
			retVal.append(div1);
			retVal.append(MM);
			retVal.append(div1);
			retVal.append(dd);
			retVal.append(" ");
			retVal.append(hh);
			retVal.append(div2);
			retVal.append(mm);
			retVal.append(div2);
			retVal.append(ss);
		}
		else if (type.equals("YYYY-MM-DD HH:MM"))
		{
			div1 = "/";
			div2 = ":";
			retVal.append(yyyy);
			retVal.append(div1);
			retVal.append(MM);
			retVal.append(div1);
			retVal.append(dd);
			retVal.append(" ");
			retVal.append(hh);
			retVal.append(div2);
			retVal.append(mm);			
		}
		else if (type.equals("YYYY/MM/DD HH:MM:SS SSS"))
		{
			div1 = "/";
			div2 = ":";
			retVal.append(yyyy);
			retVal.append(div1);
			retVal.append(MM);
			retVal.append(div1);
			retVal.append(dd);
			retVal.append(" ");
			retVal.append(hh);
			retVal.append(div2);
			retVal.append(mm);
			retVal.append(div2);
			retVal.append(ss);
			retVal.append(" ");
			retVal.append(SSS);
		}

		return retVal.toString();
	}

	public String getToday(String format)
	{
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat(format);

		return sdf.format(cal.getTime());
	}

	public void copyFile(String tempPath, String localPath, String localName)
	{
		File f = new File(tempPath + localName);
		File f1 = new File(localPath);

		if(f.exists())
		{
			if(!f1.exists())
				f1.mkdirs();

			FileInputStream fis = null;
			FileOutputStream fos = null;

			try
			{
				fis = new FileInputStream(f);
				fos = new FileOutputStream(f1 + "/" + localName);

				byte[] buffer = new byte[ 1024 * 10 ];

				int data = 0;

				while((data = fis.read(buffer))!=-1)
				{
					fos.write(buffer, 0, data);
				}
			}
			catch (IOException e)
			{
				e.printStackTrace();
			}
			finally
			{
				try { if(fis != null) fis.close(); } catch(IOException e){e.printStackTrace();}
				try { if(fis != null) fos.close(); } catch(IOException e){e.printStackTrace();}
			}
		}
	}

	public String renameFile(String path, String fromFile, String realFile)
	{
		File src = new File(path+ "/"+ realFile);

		if (fromFile.lastIndexOf(".") > -1)
			fromFile =  getToday("yyyyMMddhhmmsssss") + fromFile.substring(fromFile.lastIndexOf("."));

		File dest = new File(path+"/"+ fromFile);

		src.renameTo(dest);

		return fromFile;
	}

	public void deleteFile(String path, String fileNm)
	{
		File f = new File(path+"/"+ fileNm);

		if(f.exists())
			f.delete();
	}
	
    public String strSubLen(String strTarget, int strLen)
    {
        String strResult = null;
        if(strTarget != null)
        {
            if(strTarget.length() > strLen)
                strResult = strTarget.substring(0, strLen - 2) + "...";
            else
                strResult = strTarget;
        } else
        {
            strResult = "";
        }
        return strResult;
    }
    
    public String strSubLen(String strTarget, int strLen, String format){
        String strResult = null;
        
        if(strTarget != null){
            if(strTarget.length() > strLen)
                strResult = strTarget.substring(0, strLen) + format;
            else
                strResult = strTarget;
        } else {
            strResult = "";
        }
        return strResult;
    }
}