
/***
- 각종 Tools 모음

	@author EC21
	@version 1.0
	@since 2006.06
	@LastUpdate 2006.10.
***/

package com.ec21.util;


import java.io.*;
import java.text.*;
import java.util.*;
import java.util.regex.*;
import java.net.*;

public class Tools
{

	// Constructor
	public Tools ( )
	{	}


	static String CLASS = "Tools.java-";
	String ModuleName = "";

	FileOutputStream FileStream; 




	/***
		입력된 문자열이 날짜형식에 맞는지 체크한다. 

	* @param String Day - 날짜 문자열
	* @return boolean
	* @throws 
	***/

	public static boolean checkDayFormat ( String Day )
	{
		if (Day == null) return false;

		Pattern p = Pattern.compile("((20|19)([0-9]{2}))(/|\\.|-| )?(0?[1-9]|10|11|12)(/|\\.|-| )?(0?[1-9]|(1[0-9])|(2[0-9])|(3[0-1]))");
		Matcher m = p.matcher(Day);
		return m.matches();
	}

	/***
		입력된 문자열이 날짜형식에 맞는지 체크한다. 

	* @param String Day - 날짜 문자열
	* @return boolean
	* @throws 
	***/

	public static String getDayString ( String Day )
	{
		if (Day == null) return Day;

		String DayStr = "";
		Pattern p = Pattern.compile("((20|19)([0-9]{2}))(/|\\.|-| )?(0?[1-9]|10|11|12)(/|\\.|-| )?(0?[1-9]|(1[0-9])|(2[0-9])|(3[0-1]))");
		Matcher m = p.matcher(Day);
		if (m.matches())
		{
			Day =m.group(1)+""+m.group(5)+""+m.group(7);
			if (Day.length() == 8)
				return Day;
			else
			{
				DayStr = m.group(1);
				if (m.group(5).length() ==1) DayStr +="0"+m.group(5); else DayStr += m.group(5);
				if (m.group(7).length() ==1) DayStr +="0"+m.group(7); else DayStr += m.group(7);
				return DayStr;
			}
		}
		return DayStr;
	}

	/*********************************************************************************************
		현재 date를 구한다. 

			@param void
			@return Calendar
			@throws 
	**********************************************************************************************/
	public static Calendar getNowDate ( )
	{
		TimeZone tz = TimeZone.getDefault();
		tz.setRawOffset((60*60*1000) * 9);
		TimeZone.setDefault(tz);
		return Calendar.getInstance(tz);
	}

	/*********************************************************************************************
<pre>
		Date를 format에 맞게 String으로 표현한다.
		다음은 그 format를 설명한다.

		 Symbol	Meaning						Presentation			Example
		 ------	-------						------------			-------
		 G			era designator			 (Text)					AD
		 y			year							(Number)				1996
		 M			month in year				(Text & Number)		July & 07
		 d			day in month				(Number)				10
		 h			hour in am/pm (1~12)	 (Number)				12
		 H			hour in day (0~23)		(Number)				0
		 m			minute in hour			 (Number)				30
		 s			second in minute			(Number)				55
		 S			millisecond				 (Number)				978
		 E			day in week				 (Text)					Tuesday
		 D			day in year				 (Number)				189
		 F			day of week in month	 (Number)				2 (2nd Wed in July)
		 w			week in year				(Number)				27
		 W			week in month				(Number)				2
		 a			am/pm marker				(Text)					PM
		 k			hour in day (1~24)		(Number)				24
		 K			hour in am/pm (0~11)	 (Number)				0
		 z			time zone					(Text)					Pacific Standard Time
		 '			escape for text			(Delimiter)
		 ''		 single quote				(Literal)				'
</pre>
			@param date, format 날짜포맷
			@return Calendar
			@throws 
	**********************************************************************************************/
	public static String getDateStringWithFormat ( Calendar cal, String format )
	{
		Date date = cal.getTime();
		SimpleDateFormat formater = new SimpleDateFormat(format);
		return formater.format(date);
	}

	/*********************************************************************************************
		현재 년월시를 구한다.

			@param fomat 날짜포맷
			@return String
			@throws 
	**********************************************************************************************/
	public static String getTime(String format)
	{
		if ( format == "" )
		{
			return getTime ("yyyyMMddHHmmss");
		}
		return getDateStringWithFormat ( getNowDate ( ), format );
	}

	/*********************************************************************************************
		현재 시간 년월일시분초 까지.

			@param void
			@return String
			@throws 
	**********************************************************************************************/
	public static String getTime()
	{
		return getTime("yyyyMMddHHmmss");
	}
	public static String getTimeStamp()
	{
		return getTime("yyyyMMddHHmmssSSS");
	}
	/*********************************************************************************************
		현재 년월일 을 얻는다.

			@param void
			@return String
			@throws 
	**********************************************************************************************/
	public static String getDate ()
	{
		return getTime("yyyyMMdd");
	}

	/*********************************************************************************************
		현재 년월일보다 이전일을 얻는다.

			@param days 며칠전에 해당하는 숫자
			@return String
			@throws 
	**********************************************************************************************/
	public static String getBeforeDate ( int days )
	{
		String format = "yyyyMMdd";
		return getBeforeDate ( format, days );
	}


	/*********************************************************************************************
		현재 년월일보다 이전일을 얻는다.

			@param format 날짜포맷, days 며칠전에 해당하는 숫자
			@return String
			@throws 
	**********************************************************************************************/
	public static String getBeforeDate ( String format, int days )
	{
		Calendar cal = getNowDate();
		cal.add(Calendar.DATE, days);

		return getDateStringWithFormat ( cal, format );
	}

	/*********************************************************************************************
		특정 년월일의 이전 며칠을 계산한다..

			@param format 날짜포맷, year 년도, month 월, day 일, days 이전 며칠
			@return String
			@throws 
	**********************************************************************************************/
	public static String getBeforeDateWhen ( String format, int year, int month, int day, int days )
	{
		Calendar cal = getNowDate();
		cal.set ( year, month-1, day );
		
		cal.add(Calendar.DATE, days);

		return getDateStringWithFormat ( cal, format );
	}

	/*********************************************************************************************
		특정일이 속한 월의 마지막 날을 계산한다..

			@param format 날짜포맷, year 년도, month 월
			@return String
			@throws 
	**********************************************************************************************/
	public static String getLastDayinMonth ( String format, int year, int month )
	{
		// 특정월의 마지막 날을 구한다.
		Calendar cal = getNowDate();
		cal.set ( year, month-1, 1 ); // 12월은 실제 코드는 11이다
		cal.add(Calendar.MONTH, 1); // 다음달
		cal.add(Calendar.DATE, -1);
		return getDateStringWithFormat ( cal, format );
	}

	/*********************************************************************************************
		현재 월의 마지막 날을 계산한다..

			@param format 날짜포맷
			@return String
			@throws 
	**********************************************************************************************/
	public static String getLastDayinMonth ( String format )
	{
		// 특정월의 마지막 날을 구한다.
		Calendar cal = getNowDate();
		cal.add(Calendar.MONTH, 1); // 다음달
		cal.set ( Calendar.DATE, 1 ); // 다음달 1일에서 그 전날을 구한다.
		cal.add(Calendar.DATE, -1);
		return getDateStringWithFormat ( cal, format );
	}

	/***
		단순하게, 빈문자열, NULL 을 체크한다.
	* @param format 날짜포맷, year 년도, month 월, day 일, days 이전 며칠
	* @return boolean true - 문자열이 NULL 이거나, ""(빈문자열) 이다 , false - 그렇지 않고 내용이 있다.
	* @throws 
	***/

	public static boolean isNullString ( String str )
	{
		if ( str == null || "".equals(str) || "null".equals(str) )
			return true;
		else
			return false;
	}

	public static boolean isNull ( Object obj )
	{
		if ( obj == null )
			return true;
		else
			return false;
	}

	public static boolean isNull ( String str )
	{
		if ( str == null || "".equals(str) || "null".equals(str) )
			return true;
		else
			return false;
	}

	/***
		단순하게, 빈문자열이나, 문자열이 "null"인 문자열을 빈 문자열로 만들어 준다.
	* @param String
	* @return String 만약 NULL 이거나, "null" 이면 빈 문자열을 	그렇지 않으면 입력된 문자열을 리턴한다. 
	* @throws 
	***/
	public static String NulltoEmptyString ( String str )
	{
		if (str == null || "null".equals(str) )
			return "" ;
		else
			return str;
	}
	public static String NulltoEmptyString ( Object obj )
	{
		if (obj == null)
			return "" ;
		else
			return obj+"";
	}

    public static String checkNull(String str)
    {
        return NulltoEmptyString(str);
    }
    public static String checkNull(Object obj)
    {
        return NulltoEmptyString(obj);
    }

    public static String nullSetOne(String str)
    {
        if(str == null || "".equals(str))
        {
            str = "1";
        }

        return str;
    }

	/***
	<pre>
		시스템 명령어를 실행하고, 그 결과를 리턴하도록 한다.
		※ 자바로 가능한 것들은 프로그램으로 처리하고 -
			 예를 들면 file handling -,
			 자바로 처리하기가 힘든 것들만 사용하도록 하고,
			가급적이면 사용을 자제한다.
		</pre>
	* @param String 명령어
	* @return String - 시스템 명령 실행 결과 문자열 .
	* @throws 
	***/
	public static String Exec ( String Command )
	{
		if ( isNullString(Command) )
			return "";

		String OutputString = "";
		try 
		{
			Process p	= Runtime.getRuntime().exec(Command);
			InputStreamReader reader = new InputStreamReader (p.getInputStream ());
			BufferedReader commandResult = new BufferedReader (reader);
			try 
			{
				int i = 0;
				String tmp = new String ();
				while ((tmp = commandResult.readLine()) != null)
				{
					OutputString += tmp + "\n";
				}
				commandResult.close();
			}
			catch (Exception e)
			{
				return "Raise Exception - 1 :["+ e.getMessage()+"]";
			}
		}
		catch (Exception e) 
		{
			return "Raise Exception - 2 :[" + e.getMessage() + "]";
		} 		
		return OutputString;
	}

	
	/***
		문자셋을 변환한다. 8859_1 ==> KSC5601
	* @param String
	* @return String 변환된 문자열. 
	* @throws 
	***/
	public static String toKorean(String str) throws Exception
	{
		if ( isNullString(str) )
			return str;

		return	new String( str.getBytes("8859_1"), "KSC5601" ); 
	}		

	/***
		문자셋을 변환한다. KSC5601 ==> 8859_1
	* @param String
	* @return String 변환된 문자열. 
	* @throws 
	***/
	public static String toUnKorean(String str) throws Exception
	{
		if ( isNullString(str) )
			return str;

		return new String( str.getBytes("KSC5601"), "8859_1" );
	}


	/***
		숫자로된 문자열에 문자가 있는지 검사
	* @param String
	* @return true 있다, false 없다. 
	* @throws 
	***/
	public static boolean isThereChar ( String Src, char Chr )
	{
		if ( isNullString(Src) )
			return false;

		for ( int i=0; i < Src.length(); ++i)
		{
			if ( Src.charAt(i) == Chr )
				return true;
		}
		return false;
	}

	/**
	* 숫자 문자인지 체크
	* @param ch 체크할 문자
	* @return 전부 숫자 문자이면 true, 그렇지 않으면 false
	*/
	public static boolean isNumeric(String src)
	{
 		char ch;
		for(int i = 0; i < src.length(); ++i)
		{
			ch = src.charAt(i);
			if( ch >= '0' && ch <= '9')
				continue;
			else 
				return false;
		}
		return true;
	}
	/**
	* 숫자 문자인지 체크
	* @param ch 체크할 문자
	* @return 전부 숫자 문자이면 true, 그렇지 않으면 false
	*/
	public static boolean isNumericAndHyphen(String src)
	{
 		char ch;
		for(int i = 0; i < src.length(); ++i)
		{
			ch = src.charAt(i);
			if( (ch >= '0' && ch <= '9') || ch == '-')
				continue;
			else 
				return false;
		}
		return true;
	}


	/***
		문자열에서 특정 문자열을 다른 문자열로 치환
	* @param OrgStr 원문자열, Source 변환하고자하는 문자열, Target 변환문자열
	* @return String 치환된 문자열. 
	* @throws 
	***/
	public static String ReplaceText (String OrgStr, String Source, String Target )
	{
		String ModuleName = "ReplaceText()";

		if ( isNullString(OrgStr) || isNullString(Source) )
			return "";

		String tmp = "";

		for ( int i = 0; i < (OrgStr.length()); ++i )
		{
			if ( OrgStr.startsWith(Source, i ) == true )
			{
				i += Source.length()-1;
				tmp += Target;
			}
			else
			{
				tmp += OrgStr.charAt(i) + "";
			}

		} // end of 'for' loop

		return tmp;
	}


	/***
		문자열에서 HTML 태그를 삭제한다.
	* @param OrgStr 원문자열
	* @return String 치환된 문자열. 
	* @throws 
	***/
	public static String RemoveHtmlTag ( String OrgStr, int Length )
	{
		String ModuleName = "RemoveHtmlTag()";

		if ( isNullString(OrgStr) )
			return "";

		String [] SkipWord = {"<SCRIPT", "<APPLET", "<OBJECT", "<EMBED", "<FRAMESET", "<MAP", "<FIG", "<!--"};
		String [] SkipWordPair = {"/SCRIPT>", "/APPLET>", "/OBJECT>", "/EMBED>", "/FRAMESET>", "/MAP>", "/FIG>", "-->"};

		String [] RemoveWord = {"PRE", "!DOCTYPE", "!ENTITY", "BLOCKQUOTE", "COL", "FONT", "STRONG", "TBODY", "EM", "U", "B", "H1", "H2", "H3", "H4", "H5", "H6","?XML", "I", "O:P", "A", "PLAINTEXT","TEXTAREA","LISTING","ADDRESS","CAPTION","NOEMBED","BGSOUND","NOFRAME","SELECT","OPTION","IFRAME","ILAYER","INPUT","LABEL","LAYER","TITLE","TABLE","SPAN","CITE","MENU","AREA","FORM","BODY","HEAD","PRE","XMP","DIV","DFN","DIR","IMG","BR","HR","OL","LI","UL","DL","DT","DD","TR","TH","TD","P"};

		String TempString = "";
			
		int TempOffset =0;
		boolean FindWord = false;
		int i=0, j=0, k=0;

		while ( i < OrgStr.length() )
		{
			FindWord = false;
			// pair 로 되어 있고, 삭제해야 하는 태그들 검색. SkipWord 배열에 정의되어 있는 것들을 SKIP하도록 한다.
			for ( j=0; j < SkipWord.length; ++j)
			{
				if ( OrgStr.regionMatches(true, i, SkipWord[j], 0, SkipWord[j].length()) == true )
				{
					// SkipWordPair 문자가 나올때가지 SKIP 한다.
					for ( k=i; k < OrgStr.length(); ++k)
					{
						if ( OrgStr.regionMatches(true, k, SkipWordPair[j],0, SkipWordPair[j].length()) == true )
						{
							i=k+SkipWordPair[j].length();
							FindWord = true;
							break;
						}
					}
					if (FindWord) break;
				}
			}
			if (FindWord) continue;

			FindWord = false;
			// 일반 태그들은 skip 한다.
			if (OrgStr.charAt(i) == '<' || OrgStr.startsWith("</", i))
			{
				for ( j=0; j < RemoveWord.length; ++j )
				{
					if ( OrgStr.regionMatches(true, (OrgStr.startsWith("</", i) ? i+2 : i+1), RemoveWord[j], 0, RemoveWord[j].length()) == true)
					{
						i = OrgStr.indexOf(">", i) +1;
						FindWord = true;
						break;
					}
				}
			}
			if (FindWord) continue;

			// &nbsp; 등 &로 시작하는 문자들을 모두 뺀다.
			if ( OrgStr.startsWith("&", i) )
			{
				if ( OrgStr.indexOf(";",i) > 0 && OrgStr.indexOf(";",i) - i <= 10 )
				{
					i = OrgStr.indexOf(";", i);
					continue;
				}
			}
			if ( OrgStr.startsWith("\n", i) || OrgStr.startsWith("\r", i) )
			{
				i += 1;
				continue;
			}

			if ( OrgStr.charAt(i) == ' ' && TempString.length()>0 )
			{
				if ( TempString.charAt( TempString.length()-1 ) == ' ')
				{
					i += 1;
					continue;
				}
			}

			TempString = TempString + OrgStr.charAt(i);
			if ( TempString.length() > Length )
			{
				return	TempString.substring(0,TempString.lastIndexOf(" "))+"...";
			}
			++i;
		}

		return TempString;
	}

	/***
		특정파일에 메세지 (문자열)를 저장한다. 
		파일이 없으면 생성시키고, 존재하면 append된다.

	* @param FilePath 저잘파일명, Messages 저장할려는 메세지(문자열)
	* @return void 
	* @throws 
	***/
/*
	public static	synchronized void logError(String METHOD, String Message )
	{
		String FilePath = "/home2/texweb/WebAppLogs/Error";
		writeFile(FilePath, METHOD+" : " + Message);
	}

	public static	synchronized void logDebug(String METHOD, String Message )
	{
		String FilePath = "/home2/texweb/WebAppLogs/Debug";
		writeFile(FilePath, METHOD+" : " + Message);
	}

	public static	synchronized void logInfo(String METHOD, String Message )
	{
		String FilePath = "/home2/texweb/WebAppLogs/Info";
		writeFile(FilePath, METHOD+" : " + Message);
	}
*/
//	public static synchronized void writeFile(String FilePath, String Message )
// writeFile 호출함수가 synchronized 로 선언되어서 writeFile에서는 뺐다.
	/**
	* 특정 URL을 읽어온다.
	* @param ReadURL-읽어들일 URL
	* @return URL출력내용
	*/

	public static String readURL ( String Host, String URI )
	{
		// 접속 시간을 60초로 설정해서 읽어온다.
		return readURL ( Host, URI, 60 );
	}
	/**
	* 특정 URL을 읽어온다.
	* @param ReadURL-읽어들일 URL, TimeOut-접속시간 (sec)
	* @return URL출력내용
	*/
	public static String readURL ( String Host, String URI, int TimeOut )
	{
		Socket		 socket	= null;
		OutputStream to_file = null;
		InputStreamReader reader = null;
		StringWriter returnString = new StringWriter(1024*8);

		try
		{
			URL Url = new URL("http://"+Host+URI);
			socket = new Socket(Host, 80);
			socket.setSoTimeout(TimeOut*1000);

//대상 소켓의 InputStream으로 뭔가를 보낼려면 
//소켓을 맺은쪽에서는 OutputStream으로 뭔가를 보내야 한다.
			PrintWriter to_server = new PrintWriter(socket.getOutputStream());

			to_server.print("GET "+URI+" HTTP/1.1\r\n");
//			to_server.print("Accept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, application/vnd.ms-powerpoint, application/vnd.ms-excel, application/msword, */*\r\n");
//			to_server.print("Referer: http://www.atnworld.com/ftl.htm\r\n");
//			to_server.print("Accept-Language: ko\r\n");
//			to_server.print("Content-Type: application/x-www-form-Urlencoded\r\n");
//			to_server.print("Accept-Encoding: gzip, deflate\r\n");
			to_server.print("User-Agent: Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0; Q312461)\r\n");
			to_server.print("Host: "+Host+"\r\n");
			to_server.print("Connection: Keep-Alive\r\n");
			to_server.print("Cache-Control: no-cache\r\n");
			to_server.print("\r\n");
			to_server.print("\r\n");
			to_server.print("\r\n");
			to_server.flush();

//			InputStream from_server = socket.getInputStream();
			char [] 	readBuf = new char [1024*8];
			reader = new InputStreamReader(socket.getInputStream());
			int length=0;

			while ((length = reader.read(readBuf,0, 1024*8)) != -1)
			{
				returnString.write(readBuf, 0, length);	
			}
		}
		catch (InterruptedIOException iiox) { return iiox.toString(); }
		catch (IOException iox) { return iox.toString(); }
		finally
		{
			try
			{
				 if (socket != null) socket.close();
				 if (reader != null) reader.close();
				 {	 ;	 }
			}
			catch (IOException e) { ; }
		}
		return returnString.toString();
	}



	public static String readURL(String strURL ) 
	{
		HttpURLConnection oURLConnection = null;
		String strMethod = "readURL";

		int responseCode;
		String line;
		StringBuffer buffer ;
		InputStream input;
		BufferedReader bfrInput;
		URL url ;
		String urlConnection = null;

		try
		{
			url= new URL(strURL);
			oURLConnection = (HttpURLConnection)url.openConnection();
			oURLConnection.setFollowRedirects(false);

			oURLConnection.connect();
			responseCode = oURLConnection.getResponseCode();

			if (responseCode == HttpURLConnection.HTTP_OK)
			{
				buffer = new StringBuffer();
				input = oURLConnection.getInputStream();
				bfrInput = new BufferedReader(new InputStreamReader(input));
				while ((line = bfrInput.readLine()) != null) {
				buffer.append(line);
			}
			bfrInput.close();
			return buffer.toString();
			//System.out.println("strBody : " + buffer.toString());
			}
		}
		catch(Exception e)
		{
			return e.toString();
		}
		finally
		{
			if(oURLConnection != null)
			oURLConnection.disconnect();
		}
		return "";
	}


	public static String HighlightText (String OrgStr, String TargetStr, String StartTag, String EndTag) throws Exception
	{
		StringTokenizer st = new StringTokenizer ( TargetStr );
		
		String [] TargetArray = new String [st.countTokens()] ;
		for (int i=0; st.hasMoreTokens(); ++i)
		{
			TargetArray[i] = st.nextToken();
		}
		return HighlightText (OrgStr, TargetArray,  StartTag, EndTag);
	}

	public static String HighlightText (String OrgStr, String[] TargetStrArray, String StartTag, String EndTag) throws Exception
	{
		String ModuleName = "ReplaceText()";

//	OrgStr = "The device controlling the on/off  of high-beam      headlights: high-beam";

		if ( "".equals(OrgStr) || "".equals(TargetStrArray) || "".equals(StartTag) )
			return "";

		String Temp = OrgStr;

		int i, j,pos=0;
		boolean Finder = false;

		// change to lower case
		OrgStr=OrgStr.toLowerCase();
		for ( i=0; i<TargetStrArray.length; ++i)
		{
			TargetStrArray[i] = TargetStrArray[i].toLowerCase();
		}

		StringBuffer tmp = new StringBuffer(OrgStr.length()*2);

		for ( i = 0; i < (OrgStr.length()); ++i )
		{
			// check token starts with TargetString
			if ( ( i == 0 || OrgStr.charAt(i-1) == ' ') && OrgStr.charAt(i) != ' ' )
			{
				Finder = false;

				for ( j=0; j < TargetStrArray.length; j++ )
				{
					if ( OrgStr.startsWith(TargetStrArray[j], i) )
					{
						tmp.append(StartTag).append( Temp.substring(i, i+TargetStrArray[j].length())).append(EndTag); 
						i += TargetStrArray[j].length()-1;
						Finder = true;
						break;
					}
				}

				if (Finder == false)
				{
					pos = OrgStr.indexOf(' ', i);
					if (pos >0)
					{
						tmp.append( Temp.substring(i, pos) ); 
						i += (pos-1-i);
					}
					else
					{
						tmp.append( Temp.substring(i) );
						i = Temp.length();
					}

				}
			}
			else if ( i != 0 && OrgStr.charAt(i) == ' ' && OrgStr.charAt(i-1) == ' ' )
			{
				// skip this character because this is whitespace.
			}
			else
			{
				tmp.append(Temp.charAt(i));
			}
//System.out.println("tmp:"+tmp.toString());
		} // end of 'for' loop

		return tmp.toString();
	}

	   /***
    XSS(Cross Site Script) avoid method.
    * @param str - String
    * @return str - String
    * @throws
    ***/

	public static String avoidXSS ( String str )
	{
		if ( str == null )
            ;
		else
		{
            str = str.replaceAll("(?i)javascript", "x-javascript");
            str = str.replaceAll("(?i)script", "x-script");
            str = str.replaceAll("(?i)iframe", "x-iframe");
            str = str.replaceAll("(?i)document", "x-document");
            str = str.replaceAll("(?i)vbscript", "x-vbscript");
            str = str.replaceAll("(?i)applet", "x-applet");
            str = str.replaceAll("(?i)embed", "x-embed");
            str = str.replaceAll("(?i)object", "x-object");
            str = str.replaceAll("(?i)frame", "x-frame");
            str = str.replaceAll("(?i)grameset", "x-grameset");
            str = str.replaceAll("(?i)layer", "x-layer");
            str = str.replaceAll("(?i)bgsound", "x-bgsound");
            str = str.replaceAll("(?i)alert", "x-alert");
            str = str.replaceAll("(?i)onblur", "x-onblur");
            str = str.replaceAll("(?i)onchange", "x-onchange");
            str = str.replaceAll("(?i)onclick", "x-onclick");
            str = str.replaceAll("(?i)ondblclick","x-ondblclick");
            str = str.replaceAll("(?i)enerror", "x-enerror");
            str = str.replaceAll("(?i)onfocus", "x-onfocus");
            str = str.replaceAll("(?i)onload", "x-onload");
            str = str.replaceAll("(?i)onmouse", "x-onmouse");
            str = str.replaceAll("(?i)onscroll", "x-onscroll");
            str = str.replaceAll("(?i)onsubmit", "x-onsubmit");
            str = str.replaceAll("(?i)onunload", "x-onunload");
		}
		return str;
	}
}
