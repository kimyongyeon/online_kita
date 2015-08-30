/******************************************
 * Prog   Name : UtilBox.java             *
 * Prog   Desc : 각종 Method              *
 * Auth   Name : Kim Ju Eok               *
 * Update Date : 2001.7.13                *
*******************************************/
package com.ec21.util;

import java.io.*;
import java.lang.*;
import java.util.*;
import java.text.*;
import javax.servlet.http.*; //Cookie

public class UtilBox
{

    public UtilBox( ) { }

    public Cookie setCookie(String name, String value, String domain, String path)
    {
        Cookie c = new Cookie(name, value);
        c.setDomain(domain);
        c.setPath(path);
        //c.setMaxAge(ageDay * 24 * 60 * 60);
        return c;
    }

    public String getToken(String str, String div, int idx)
    {
        if (str == null) return "";
        if (str.indexOf(div) == -1) return "";

        int rnd = 0;
        String tk = "";
        String retVal = "";
        for (StringTokenizer st = new StringTokenizer(str, div); st.hasMoreTokens();)
        {
            tk = st.nextToken().trim();
            if (rnd == idx)
            {
                retVal = tk;
                break;
            }
            else rnd++;
        }
        return retVal;
    }

    /*****************************************************************
     * Desc       : String코드체계  전환                             *
     * Parameter1 : String : "???"                                   *
     * Exam       : "???"                                            *
     * Return     : "한글"                                           *
     *****************************************************************/
    public String getKSC5601(String str)
    {
        String retVal;

        if (str == null)
            return "";
        else if (str.equals(""))
            return "";
        else
        {
            try
            {
                retVal = new String(str.getBytes("8859_1"), "KSC5601");
            }
            catch (UnsupportedEncodingException e)
            {
                return "UnsupportedEncodingException";
            }
            return retVal;
        }
    }

    /*****************************************************************
     * Desc       : String코드체계  전환(Char Code Convert)          *
     * Parameter1 : String : "???"                                   *
     * Exam       : "???"                                            *
     * Return     : "한글"                                           *
     *****************************************************************/
    public String getCCC(String str)
    {
        String retVal;

        if (str == null)
            return "";
        else if (str.equals(""))
            return "";
        else
        {
            try
            {
                retVal = new String(str.getBytes("8859_1"), "KSC5601");
            }
            catch (UnsupportedEncodingException e)
            {
                return "UnsupportedEncodingException";
            }
            return retVal;
        }
    }

    /*****************************************************************
     * Desc       : String코드체계  전환(Char Code Convert)          *
     * Parameter1 : String : "???"                                   *
     * Exam       : "???"                                            *
     * Return     : "한글"                                           *
     *****************************************************************/
    public String getCCC2(String str)
    {
        String retVal;

        if (str == null)
            return "";
        else if (str.equals(""))
            return "";
        else
        {
            try
            {
                retVal = new String(str.getBytes("KSC5601"), "8859_1");
            }
            catch (UnsupportedEncodingException e)
            {
                return "UnsupportedEncodingException";
            }
            return retVal;
        }
    }

    /*****************************************************************
     * Desc       : String코드체계  전환(Char Code Convert)          *
     * Parameter1 : String : "???"                                   *
     * Parameter2 : String : "KSC5601"                               *
     * Exam       : "???"                                            *
     * Return     : "한글"                                           *
     *****************************************************************/
    public String getCCC(String str, String charSet)
    {
        String retVal;

        if (str == null)
            return "";
        else if (str.equals(""))
            return "";
        else
        {
            try
            {
                retVal = new String(str.getBytes("8859_1"), charSet);
            }
            catch (UnsupportedEncodingException e)
            {
                return "UnsupportedEncodingException";
            }
            return retVal;
        }
    }

    /*****************************************************************
     * Desc       : String코드체계  전환(Char Code Convert)          *
     * Parameter1 : String : "???"                                   *
     * Exam       : "???"                                            *
     * Return     : "한글"                                           *
     *****************************************************************/
    public String getCCC2(String str, String charSet)
    {
        String retVal;

        if (str == null)
            return "";
        else if (str.equals(""))
            return "";
        else
        {
            try
            {
                retVal = new String(str.getBytes(charSet), "8859_1");
            }
            catch (UnsupportedEncodingException e)
            {
                return "UnsupportedEncodingException";
            }
            return retVal;
        }
    }

    /*****************************************************************
     * Desc       : 오늘 날짜를 parameter 형으로 전환하여 반환
     * Parameter1 : String : "YYYY/MM/DD", "YYYY/MM/DD HH:MM:SS", ...
     * Exam       : ["YYYY/MM/DD"]
     * Return     : ["2000/09/19"]
     *****************************************************************/
    public String getToday(String type)
    {
        SimpleDateFormat formatter = new SimpleDateFormat ("yyyyMMddHHmmssSSS");
        Date currentTime = new Date();
        String dateString = formatter.format(currentTime);

        StringBuffer retVal = new StringBuffer();
        String div1, div2, div3;

        String yyyy = dateString.substring(0, 4);
        String MM   = dateString.substring(4, 6);
        String dd   = dateString.substring(6, 8);
        String hh   = dateString.substring(8, 10);
        String mm   = dateString.substring(10, 12);
        String ss   = dateString.substring(12, 14);
        String SSS  = dateString.substring(14);

        if (type.equals("YYYYMMDD"))
        {
            retVal.append(yyyy);
            retVal.append(MM);
            retVal.append(dd);
        }
        else if (type.equals("YYYYMMDDHHMMSS"))
        {
            retVal.append(yyyy);
            retVal.append(MM);
            retVal.append(dd);
            retVal.append(hh);
            retVal.append(mm);
            retVal.append(ss);
        }
        else if (type.equals("YYYYMMDDHHMMSSSSS"))
        {
            retVal.append(yyyy);
            retVal.append(MM);
            retVal.append(dd);
            retVal.append(hh);
            retVal.append(mm);
            retVal.append(ss);
            retVal.append(SSS);
        }
        else if (type.equals("YYYY/MM/DD"))
        {
            div1 = "/";

            retVal.append(yyyy);
            retVal.append(div1);
            retVal.append(MM);
            retVal.append(div1);
            retVal.append(dd);
        }
        else if (type.equals("YYYY/MM/DD HH:MM:SS"))
        {
            div1 = "/";
            div2 = " ";
            div3 = ":";

            retVal.append(yyyy);
            retVal.append(div1);
            retVal.append(MM);
            retVal.append(div1);
            retVal.append(dd);
            retVal.append(div2);
            retVal.append(hh);
            retVal.append(div3);
            retVal.append(mm);
            retVal.append(div3);
            retVal.append(ss);
        }
        else if (type.equals("YYYY/MM/DD HH:MM:SS SSS"))
        {
            div1 = "/";
            div2 = " ";
            div3 = ":";

            retVal.append(yyyy);
            retVal.append(div1);
            retVal.append(MM);
            retVal.append(div1);
            retVal.append(dd);
            retVal.append(div2);
            retVal.append(hh);
            retVal.append(div3);
            retVal.append(mm);
            retVal.append(div3);
            retVal.append(ss);
            retVal.append(" ");
            retVal.append(SSS);
        }

        return retVal.toString();
    }
    /*****************************************************************
     * Desc: 기준일로부터 X일 후(전) 일자
     * Parameter1 : String : "20020912"
     * Parameter2 : String : "+"
     * Parameter2 : String : "3"
     * Exam: ["20020912", "+", "3"]
     * Return     : ["20020915"]
     *****************************************************************/
    public String getSomeDay(String postDay, String beforeOrAfter, String term)
    {
        Calendar calendar = null;
        if (postDay == null || postDay.length() < 8)
            calendar = new GregorianCalendar();
        else
        {
            String yyyyS = postDay.substring(0, 4);
            String MMS = postDay.substring(4, 6);
            String ddS = null;

            if (postDay.length() == 8)
                ddS = postDay.substring(6);
            else
                ddS = postDay.substring(6, 8);

            calendar = new GregorianCalendar();
            calendar.set(Integer.parseInt(yyyyS), Integer.parseInt(MMS) - 1, Integer.parseInt(ddS));
        }

        if (term == null || term.length() == 0)
            term = "0";
        if (beforeOrAfter == null || beforeOrAfter.length() == 0)
            term = "+";

        Date someTime = calendar.getTime();
        long someTimeLong = someTime.getTime();
        long termTimeLong = Long.parseLong(term) * 24L * 60L * 60L * 1000L;

        if (beforeOrAfter.equals("+"))
            someTime.setTime(someTimeLong + termTimeLong);
        else
            someTime.setTime(someTimeLong - termTimeLong);

        calendar.setTime(someTime);

        int yyyy = calendar.get(Calendar.YEAR);
        int MM = calendar.get(Calendar.MONTH) + 1;
        int dd = calendar.get(Calendar.DATE);

        String dateStr = "" + yyyy;

        if (MM < 10)
            dateStr += "0" + MM;
        else
            dateStr += MM;
        if (dd < 10)
            dateStr += "0" + dd;
        else
            dateStr += dd;

        return dateStr;
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

    /*****************************************************************
     * Desc       : Parameter1의 문자중 Parameter2 문자를 Parameter3로 전환
     * Parameter1 : String : "aaaabccc"
     * Parameter2 : String : "b"
     * Parameter2 : String : "x"
     * Exam       : ["aaaabccc", "b", "x"]
     * Return     : ["aaaaxccc"]
     *****************************************************************/
    public String getReplace(String s, String old, String new2)
    {
        int len = s.length();
        int ll = 200000;
        int i = len /ll;
        int nt = len % ll;
        int j=0;
        String q="";
        String qq="";
        int k=0;

        if(old == null || new2==null) return "";

        for (j = 0; j<i; j++)
        {
            if (j==0)
            {
                qq = replace2(s.substring(0,ll),old,new2);
                q = q + qq;
            }
            else
            {
                qq = replace2(s.substring(j*ll,(j+1)*ll),old,new2);
                q = q + qq;
            }
        }

        k = j;

        if (k > 0) qq = replace2(s.substring(k*ll,k*ll+nt),old,new2);
        else qq = replace2(s.substring(0,nt),old,new2);

        q = q + qq;

        return q;
    }

    public String replace2(String s, String old, String new2)
    {
        if ( s == null ) return s;

        String r="";
        int i;
        i = s.indexOf(old);
        if (i < 0) return s;

        r += s.substring(0,i) + new2;

        if (old == null || new2==null) return "";
        if (i + old.length() < s.length())
            r += getReplace(s.substring(i + old.length(), s.length()), old, new2);

        return r;
    }
    public String replace3(String line, String oldString, String newString)
    {
        if (line == null || line.equals("")) return "";
        int index = 0;
        while ((index = line.indexOf(oldString, index)) >= 0)
        {
            line = line.substring(0, index)
                 + newString
                 + line.substring(index + oldString.length());
            index += newString.length();
        }
        return line;
    }

    /*****************************************************************
     * Desc       : Parameter1의 문자열중 Enter 문자 Count
     * Parameter1 : String : "aaa\nbbb\nccc"
     * Exam       : ["aaa\nbbb\nccc"]
     * Return     : [2]
     *****************************************************************/
    public int getEnterCnt(String str)
    {
        char CR = 0x0d;
        char LF = 0x0a;
        int  cnt = 0;

        if (str == null || str.equals("")) return 0;

        for (int i = 0; i < str.length( ); i++)
        {
            if (CR == str.charAt(i)) cnt++;
        }

        return cnt;
    }

    /*****************************************************************
     * Desc       : Property 파일의 key에 행당되는 Data return
     * Parameter1 : String : "/usr/local/tomcat/aaa.txt"
     * Parameter2 : String : "name"
     * Exam       : ["/usr/local/tomcat/aaa.txt", "name"]
     * Return     : [kje]
     *****************************************************************/
    public String getPropertyVal(String fileName, String key)
    {
        Properties prop;
        FileInputStream fis;

        try
        {
            fis = new FileInputStream(fileName);
            prop = new Properties();
            prop.load(fis);
        }
        catch (IOException IOExp)
        {
            return "";
        }

        if (prop.getProperty(key) == null ) return "";
        else return prop.getProperty(key);
    }

	/***
		단순하게, 빈문자열이나, 문자열이 "null"인 문자열을 빈 문자열로 만들어 준다.
	* @param String
	* @return String 만약 NULL 이거나, "null" 이면 빈 문자열을 	그렇지 않으면 입력된 문자열을 리턴한다.
	* @throws
	***/
	public String NulltoEmptyString ( String str )
	{
		if (str == null || "null".equals(str) )
			return "" ;
		else
			return str;
	}
}
