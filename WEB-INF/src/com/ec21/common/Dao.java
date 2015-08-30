/*
 * @(#)Dao.java   1.1.0   2004/03/10
 * 
 * Copyright(c) 2004 EC21, Inc. All Right Reserved.
 * 
 * This software is the proprietary information of Soft-Tech Global, Inc.
 * Use is subject to license terms.
 */
package com.ec21.common;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;
import oracle.jdbc.*;
import oracle.jdbc.pool.*;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.DOMBuilder;

import java.sql.Clob;
import java.io.Reader;
import java.sql.Types;


/**
 * Data Access Object 클래스
 *  
 * @author  powerbox
 * @version 1.1.0   2004/03/10
 * @since   EC21 Common Library 1.0.0
 */
public class Dao 
{
    private ArrayList dataList;
    private int rowCnt = 0;
    private int columnCount = 0;
    private boolean result;

    private Element xmlRoot = null;

    /**
     * 기본 생성자
     */
    public Dao() 
    { 
        dataList = new ArrayList();
    }
    
    /**
     * XML 처리용 생성자
     * 
     * @param   docPath XML 파일 경로
     */
    public Dao(String docPath) 
    { 
        dataList = new ArrayList();

        try
        {
            DOMBuilder builder = new DOMBuilder("org.jdom.adapters.XercesDOMAdapter");
            Document doc = builder.build(new File(docPath));
            xmlRoot = doc.getRootElement();
        }
        catch (JDOMException e)
        {
            result = false;
            e.printStackTrace();
        }
    }

    /**
     * Insert, Update, Delete문을 수행
     * 
     * @param   con JDBC Connection
     * @param   sql SQL Query String
     * 
     * @exception   SQLException
     */
    public void exeSql(Connection con, String sql) throws SQLException
    {
        Statement stmt = null;
        rowCnt = 0;

        try
        {
            stmt = con.createStatement( );
            rowCnt = stmt.executeUpdate(sql);
            result = true; 
        }
        catch (SQLException e)
        {
            result = false;
            System.out.println("SQL:[" + sql + "]");
            throw new SQLException(e.getMessage());
        }
        finally
        {
            if (stmt != null) stmt.close( );
        }

    }

    /**
     * QueryData를 이용한 insert/update/delete 처리
     * 
     * @param conn
     * @param qd
     * @throws SQLException
     */
    public void exeSql(Connection conn, QueryData qd) throws SQLException
    {
        PreparedStatement pstmt = null;
        rowCnt = 0;
		String longStr = "";
		java.io.StringReader rdr = null;
		int len = 0;

        try
        {
            pstmt = conn.prepareStatement( qd.getQuery() );

            for(int q=1; q<=qd.getValueCount(); q++)
			{
				if ( (new Integer(Types.LONGVARCHAR)) == qd.getType(q) || (new Integer(Types.CLOB)) == qd.getType(q) )
				{
					longStr = (String)qd.getValue(q);
					rdr = new java.io.StringReader(longStr);
					len = longStr.length();
					pstmt.setCharacterStream(q, rdr, len);
				}
/*
				else if ((new Integer(Types.CLOB)) == qd.getType(q))
				{
					longStr = (String)qd.getValue(q);
					pstmt.setStringForClob(q, longStr);
				}
*/
				else
	                pstmt.setObject(q, qd.getValue(q));
			}

            rowCnt = pstmt.executeUpdate();
			if(rowCnt > 0)
	            result = true; 
			else
				result = false;
        }
        catch (SQLException e)
        {
            result = false;
            System.out.println("SQL:[" + qd.getQuery() + "]");
            throw new SQLException(e.toString());
        }
        finally
        {
            if (pstmt != null) pstmt.close( );
			if (rdr != null) rdr.close();
        }
    }
    
    /**
     * Long Type을 Insert, Update 수행
     * 
     * @param   con JDBC Connection
     * @param   sql SQL Query String
     * @param   longStr 입력할 문자열
     * 
     * @exception   SQLException
     */
    public void exeSql(Connection con, String sql, String longStr) throws SQLException
    {
        PreparedStatement pstmt = null;
        rowCnt = 0;
		java.io.StringReader rdr = null;
		int len = 0;

        if (longStr == null) longStr = "";

        try
        {
            pstmt = con.prepareStatement(sql);
            rdr = new java.io.StringReader(longStr);
            len = longStr.length();
            pstmt.setCharacterStream(1, rdr, len);
            rowCnt = pstmt.executeUpdate();
            result = true;
        }
        catch (SQLException e)
        {
            result = false;
            System.out.println("SQL:[" + sql + "]");
            throw new SQLException(e.getMessage());
        }
        finally
        {
            if (pstmt != null) pstmt.close( );
			if (rdr != null) rdr.close();
        }
    }

    /**
     * Long Type을 Insert, Update 수행 (Encoding 제어, MySQL등)
     * 
     * @param   con JDBC Connection
     * @param   sql SQL Query String
     * @param   longStr 입력할 문자열
     * @param   encoding    입력할 문자열의 인코딩
     * 
     * @exception   SQLException
     */
    public void exeSql(Connection con, String sql, String longStr, String encoding) throws SQLException
    {
        PreparedStatement pstmt = null;
        rowCnt = 0;
		ByteArrayInputStream bais = null;
		int len = 0;

        if (longStr == null) longStr = "";

        try
        {
            pstmt = con.prepareStatement(sql);
            bais = new ByteArrayInputStream(longStr.getBytes(encoding));
            len = bais.available();
            pstmt.setAsciiStream(1, bais, len);
            rowCnt = pstmt.executeUpdate();

            result = true;
        }
        catch (SQLException e)
        {
            result = false;
            System.out.println("SQL:[" + sql + "]");
            throw new SQLException(e.getMessage());
        }
        catch (UnsupportedEncodingException e)
        {
            result = false;
            System.out.println("UnsupportedEncodingException:[" + sql + "]");
            throw new SQLException(e.getMessage());
        }
        finally
        {
            if (pstmt != null) pstmt.close( );
			try	{if (bais != null) bais.close();}
			catch (IOException ioe)	{ }
        }

    }

    // For select
    /**
     * Select문을 수행
     * 
     * @param   con JDBC Connection
     * @param   sql SQL Query String
     * @param   page    읽어올 페이지
     * @param   rows    읽어올 줄수
     * 
     * @exception   SQLException
     */
    public void exeSql(Connection con, String sql, int page, int rows) throws SQLException
    {
        dataList = new ArrayList();
        rowCnt = 0;
        columnCount = 0;

        if (page <= 0) page = 1;
        if (rows <= 0) rows = 0;

        Statement  stmt = null;
        ResultSet  rs=null;
        ResultSetMetaData meta;

        try
        {
            /****** For Oracle, MSSQL *********/
            //stmt = con.createStatement();

            /****** For MySql *********/
            stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            if (stmt.execute(sql))
            {
                rs = stmt.getResultSet();

                /****** For Oracle, MSSQL *********/
                /*
                if ( rows != 1)
                {
                    boolean more = false;
                    for( int ii = 0; ii < ( ( page-1 ) * rows ); ii++ )
                    {
                        more = rs.next( );
                    }
                }
                */
                /****** For MySql *********/
                if ( page > 1 ) rs.absolute(((page-1)*rows));
 
                meta = rs.getMetaData();

                columnCount = meta.getColumnCount();

                while (rs.next()) 
                {
                    HashMap row = new HashMap(columnCount);
                    int i;
                    for (i=0; i<columnCount; i++)
                    {
                        Object ob = rs.getObject(i+1);
//System.out.println("---Cols ---");

                        if(rs.wasNull())
                        {
                            ob = null;
                            row.put(meta.getColumnLabel(i+1).toUpperCase(), ob);
                        }
                        else
                        {
//System.out.println("ColumnLabel ["+meta.getColumnLabel(i+1).toUpperCase()+"]");
                            if(ob instanceof Clob)
                            {
//System.out.println("-----CLOB~~~");
                                row.put(meta.getColumnLabel(i+1).toUpperCase(), readClobData(rs.getCharacterStream(i+1)));
                            }
                            else
                            {
//System.out.println("-----NO~~~");
                                row.put(meta.getColumnLabel(i+1).toUpperCase(), ob);
                            }
                        }
                    }

                    dataList.add(row);
                    rowCnt++;
                    if (rows!= 0 && rowCnt == rows) break;
                }
            }
            result = true;
        }
        catch(SQLException e)
        {
            result = false;
            System.out.println("SQL:[" + sql + "]");
            throw new SQLException(e.getMessage());
        }
        finally
        {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close( );
        }
    }

    /**
     * QueryData를 이용한 select 처리
     * 
     * @param conn  JDBC Connection
     * @param qd    QueryData
     * @param page  읽어올 페이지
     * @param rows  읽어올 줄
     * 
     * @throws SQLException
     */
    public void exeSql(Connection conn, QueryData qd, int page, int rows) throws SQLException
    {
        dataList = new ArrayList();
        rowCnt = 0;
        columnCount = 0;

        if (page <= 0) page = 1;
        if (rows <= 0) rows = 0;

        PreparedStatement  pstmt = null;
        ResultSet  rs = null;
        ResultSetMetaData meta = null;

        try
        {
            pstmt = conn.prepareStatement( qd.getQuery(), ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

            for(int q=1; q<=qd.getValueCount(); q++)
                pstmt.setObject(q, qd.getValue(q));

            rs = pstmt.executeQuery();

            if ( page > 1 ) rs.absolute(((page-1)*rows));
 
            meta = rs.getMetaData();

            columnCount = meta.getColumnCount();
//System.out.println("columnCount [" + columnCount + "]");            

			while (rs.next()) 
			{
				HashMap row = new HashMap(columnCount);
				int i;

				for (i=0; i<columnCount; i++)
				{
					Object ob = rs.getObject(i+1);//rs.getObject(i+1);
					if(rs.wasNull())
					{
						ob = null;
						row.put(meta.getColumnLabel(i+1).toUpperCase(), ob);
					}
					else
					{
//System.out.println("ColumnLabel ["+meta.getColumnLabel(i+1).toUpperCase()+"]");
						if(ob instanceof Clob)
						{
//System.out.println("-----CLOB~~~");
							row.put(meta.getColumnLabel(i+1).toUpperCase(), readClobData(rs.getCharacterStream(i+1)));
						}
						else
						{
//System.out.println("-----NO~~~");
							row.put(meta.getColumnLabel(i+1).toUpperCase(), ob);
						}
					}

				}
				dataList.add(row);
				rowCnt++;
				if (rows!= 0 && rowCnt == rows) break;
			}
            result = true;
        }
        catch(Exception e)
        {
            result = false;
            e.printStackTrace();
            System.out.println("SQL:[" + qd.getQuery() + "]");
            
            throw new SQLException(e.getMessage());
        }
        finally
        {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close( );
        }

    }
    
    /**
     * 최근 처리에 대한 결과확인
     * 
     * @return  true이면 성공, false이면 실패(에러)
     */
    public boolean getResult()
    {
        return result;
    }
    
    /**
     * 최근 수행한 Select 결과의 값을 Object로 반환한다.
     * 
     * @param   rowNum  줄번호
     * @param   column  컬럼명
     * @return  해당 위치의 결과값(객체)
     */
    public Object getObject(int rowNum, String column)
    {
        if (dataList.isEmpty()) return null;

        HashMap row = (HashMap)dataList.get(rowNum);
		Object obj = row.get(column);
		if (obj == null) obj = row.get(column.toUpperCase());
        return obj;
    }

    /**
     * 최근 수행한 Select 결과의 값을 String으로 반환한다.
     * 
     * @param   rowNum  줄번호
     * @param   column  컬럼명
     * @return  해당 위치의 결과값(String)
     */
    public String getString(int rowNum, String column)
    {
        Object obj = getObject(rowNum, column);
        
        if (obj != null)
        {
            String objStr = obj.toString();
            if( objStr == null || objStr.equals("")) return "";

            return objStr;
        }
        else
        {
            return "";
        }
    }

    /**
     * 최근 수행한 Select 결과의 값을 int로 반환한다.
     * 
     * @param   rowNum  줄번호
     * @param   column  컬럼명
     * @return  해당 위치의 결과값(int)
     */
    public int getInt(int rowNum, String column)
    {
        Object obj = getObject(rowNum, column);
        if (obj != null)
        {
            String objStr = obj.toString();
            if( objStr == null || objStr.equals("")) return 0;

            return Integer.parseInt(objStr);

        }
        else
        {
            return 0;
        }
    }

    /**
     * 최근 수행한 Select 결과의 값을 long으로 반환한다.
     * 
     * @param   rowNum  줄번호
     * @param   column  컬럼명
     * @return  해당 위치의 결과값(long)
     */
    public long getLong(int rowNum, String column)
    {
        if (dataList.isEmpty()) return 0L;

        HashMap row = (HashMap)dataList.get(rowNum);
        if (row == null) return 0L;

        Object obj = row.get(column);
        if (obj == null) return 0L;
        else
        {
            try
            {
                return Long.parseLong(obj.toString());
            }
            catch(NumberFormatException e)
            {
                return 0L;
            }
        }
    }
    
    /**
     * 최근 select 결과를 리셋한다.
     */
    public void reset()
    {
        dataList = new ArrayList();
        rowCnt = 0;
        columnCount = 0;
    }
    
    /**
     * 최근 select 결과에 값을 추가한다.
     * 
     * @param   index   줄번호
     * @param   column  컬럼명
     * @param   value   입력할 문자열
     */
    public void add(int index, String column, String value)
    {
        if (dataList == null) dataList = new ArrayList();
        if (index < 0) index = 0;

        int rowCntTmp = dataList.size();
        if (index >= rowCntTmp) {
            for (int i = 0; i <= index - rowCntTmp; i++) {
                HashMap tmpRow = new HashMap();
                dataList.add(tmpRow);
                rowCnt++;
            }
        }
        HashMap row = (HashMap)dataList.get(index);

        if (value == null) value = "";
        if (column != null) row.put(column, value);
    }

    /**
     * 최근 select 결과에 값을 수정한다.
     * 
     * @param   rowNum  줄번호
     * @param   column  컬럼명
     * @param   value   수정할 문자열
     */
    public void set(int rowNum, String column, String value)
    {
        HashMap row = new HashMap();
        if (dataList.isEmpty()) 
            dataList.add(row);
        else
        {
            HashMap isRow = (HashMap)dataList.get(rowNum);
            if (isRow == null) dataList.add(row);
            else row = isRow;
        }
        row.put(column, value);
        rowCnt = dataList.size(); 
    }
    
    /**
     * 최근 select 결과의 컬럼개수를 반환한다.
     * 
     * @return  컬럼수
     */
    public int getColumnCount()
    {
        return columnCount;
    }

    /**
     * 최근 select 결과의 개수를 반환한다.
     * 
     * @return  row 개수
     */
    public int getRowCnt()
    {
        return rowCnt;
    }
    
    private int getLastIndexNum()
    {
        if (dataList == null || dataList.isEmpty()) return -1;

        rowCnt = dataList.size(); 

        return rowCnt - 1;
    }

    public String readClobData(Reader reader)
    {
        try
        {
            StringBuffer data = new StringBuffer();
            char[] buf = new char[128*1024];
            int cnt = 0;
            if (null != reader) {
                while ( (cnt = reader.read(buf)) != -1) {
                    data.append(buf, 0, cnt);
//                    System.out.println(data.toString());
                }
            }
//System.out.println("-----CLOB 내용["+data.toString()+"]");

            return data.toString();
        }
        catch(Exception e)
        {
        	e.printStackTrace();
            return "";
        }
    }

    //================================= For XML Data ==============================================
    
    /**
     * XML에서 주어진 부분에 위치시킨다.
     */
    public void exeXql(String xql)
    {
        this.exeXql(xmlRoot, xql);
    }
    
    /**
     * XML에서 주어진 부분에 위치시킨다.
     * 
     * @param root  XML Element
     * @param xql   Element Tag
     */
    public void exeXql(Element root, String xql)
    {
        String[] token = new String[50];
        int cnt = 0;

        dataList = new ArrayList();

        for (StringTokenizer st = new StringTokenizer(xql, "/"); st.hasMoreTokens();)
        {
            String x = st.nextToken().trim();
            token[cnt++] = x;
        }
        if (cnt == 2) rowCnt = setData(root, token[0], token[1]);
        else if (cnt == 3) rowCnt = setData(root, token[0], token[1], token[2]);
        else if (cnt == 4) rowCnt = setData(root, token[0], token[1], token[2], token[3]);
        else result = false;
    }

    private int setData(Element root, String depth1, String depth2)
    {
        int cnt = 0;
        List aaa = root.getChildren(depth1);
        Iterator i = aaa.iterator();
        while (i.hasNext())
        {
            Element e = (Element)i.next();
            List bbb = e.getChildren();
            Iterator j = bbb.iterator();
            HashMap row = new HashMap();
            while (j.hasNext())
            {
                Element e2 = (Element)j.next();

                if (depth2.equals("*"))
                {
                    if(e2.hasChildren()) 
                    {
                        row.put(e2.getName(), e2.getText());
                    }
                    else 
                    {
                        row.put(e2.getName(), e2.getText());
                    }
                }
                else
                {
                    if (depth2.equals(e2.getName())) 
                    {
                        if(e2.hasChildren()) row.put(e2.getName(), e2.getText());
                        else row.put(e2.getName(), e2.getText());
                    }
                }
            }

            if (row != null) 
            {
                dataList.add(row);
                cnt++;
            }
        }
        return cnt;
    }

    private int setData(Element root, String depth1, String depth2, String depth3)
    {
        int cnt = 0;
        List aaa = root.getChildren(depth1);
        Iterator i = aaa.iterator();
        while (i.hasNext())
        {
            Element e = (Element)i.next();
            List bbb = e.getChildren(depth2);
            Iterator j = bbb.iterator();
            while (j.hasNext())
            {
                Element e2 = (Element)j.next();
                List ccc = e2.getChildren();
                Iterator k = ccc.iterator();

                HashMap row = new HashMap();

                while (k.hasNext())
                {
                    Element e3 = (Element)k.next();
                    if (depth3.equals("*"))
                    {
                        if(e3.hasChildren()) row.put(e3.getName(), e3.getText());
                        else row.put(e3.getName(), e3.getText());
                    }
                    else
                    {
                        if (depth3.equals(e3.getName()))
                        {
                            if(e3.hasChildren()) row.put(e3.getName(), e3.getText());
                            else row.put(e3.getName(), e3.getText());
                        }
                    }
                }
                if (row != null) 
                {
                    dataList.add(row);
                    cnt++;
                }
            }
        }
        return cnt;
    }

    private int setData(Element root, String depth1, String depth2, String depth3, String depth4)
    {
        int cnt = 0;

        List aaa = root.getChildren(depth1);
        Iterator i = aaa.iterator();
        while (i.hasNext())
        {
            Element e = (Element)i.next();
            List bbb = e.getChildren(depth2);
            Iterator j = bbb.iterator();
            while (j.hasNext())
            {
                Element e2 = (Element)j.next();
                List ccc = e2.getChildren(depth3);
                Iterator k = ccc.iterator();

                while (k.hasNext())
                {
                    Element e3 = (Element)k.next();
                    List ddd = e3.getChildren();
                    HashMap row = new HashMap();
                    Iterator l = ddd.iterator();
                    while (l.hasNext())
                    {
                        Element e4 = (Element)l.next();
                        if (depth4.equals("*"))
                        {
                            if(e4.hasChildren()) row.put(e4.getName(), e4.getText());
                            else row.put(e4.getName(), e4.getText());

                        }
                        else
                        {
                            if (depth4.equals(e4.getName()))
                            {
                                if(e4.hasChildren()) row.put(e4.getName(), e4.getText());
                                else row.put(e4.getName(), e4.getText());
                            }
                        }
                    }
                    if (row != null) 
                    {
                        dataList.add(row);
                        cnt++;
                    }
                }
            }
        }

        return cnt;
    }

}
