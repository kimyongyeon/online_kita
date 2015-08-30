/*
 * @(#)QueryData.java   1.2.0   2004/03/17
 *
 * Copyright(c) 2004 EC21, Inc. All Right Reserved.
 *
 * This software is the proprietary information of EC21, Inc.
 * Use is subject to license terms.
 */

package com.ec21.common;

import java.sql.Types;
import java.util.Vector;

/**
 * PreparedStatement를 위한 SQL과 설정값을 포장한 객체
 * SQL과 대응할 값들을 저장시켜 pstmt에 대한 접근을 최소화하기 위함이다.
 *
 * @author powerbox
 * @version 1.2.0   2004-03-17
 * @since EC21 Common Environment Library 1.1.1
 */
public class QueryData
{
    // 실행할 SQL 문
    private String query;
    // 실행에 필요한 값
    private Vector values;

    private Vector types;

    /**
     * 기본 생성자
     */
    public QueryData()
    {
        this.query = null;
        values = new Vector();
        types = new Vector();
    }

    /**
     * 생성자
     *
     * @param query 실행할 SQL문
     */
    public QueryData(String query)
    {
        this.query = query;
        values = new Vector();
        types = new Vector();
    }

    /**
     * 현재 객체내의 내용을 모두 삭제한다.
     *
     * @return 초기화된 인스턴스
     */
    public QueryData clear()
    {
        this.query = null;
        this.values = new Vector();
        this.types = new Vector();

        return this;
    }

    /**
     * 현재 설정된 Query를 반환한다.
     *
     * @return  sql query string
     */
    public String getQuery()
    {
        return this.query;
    }

    public QueryData setQuery(String query)
    {
        this.query = query;

        return this;
    }

    /**
     * 대체할 값을 추가한다.
     *
     * @param   value
     * @return
     */
    public QueryData addValue(int value)
    {
        return addValue( Integer.toString(value) );
    }

    public QueryData addValue(long value)
    {
        return addValue( Long.toString(value) );
    }

    /**
     * 대체할 값을 추가한다.
     *
     * @param   value   추가할 객체
     * @return  QueryData 인스턴스
     * @exception   IndexOutOfBoundsException   추가개수가 허용범위를 넘는경우
     */
    public QueryData addValue(Object value)
    {
        if (getQueryValueCount() == getValueCount() )
            throw new IndexOutOfBoundsException();

        values.addElement(value);
        types.addElement( new Integer(Types.VARCHAR) );

        return this;
    }

    public QueryData addValueLong(Object value)
    {
        if (getQueryValueCount() == getValueCount() )
            throw new IndexOutOfBoundsException();

        values.addElement(value);
        types.addElement( new Integer(Types.LONGVARCHAR) );

        return this;
    }

    public QueryData addValue(Object value, int type)
    {
        if (getQueryValueCount() == getValueCount() )
            throw new IndexOutOfBoundsException();

        values.addElement(value);
        types.addElement( new Integer(type) );

        return this;
    }

    public QueryData setValue(int seq, int value)
    {
        return setValue(seq, Integer.toString(value) );
    }

    public QueryData setValue(int seq, long value)
    {
        return setValue(seq, Long.toString(value) );
    }

    /**
     * 지정한 위치의 대체할 값을 넣는다.
     *
     * @param   seq 위치(1~n)
     * @param   value   저장할 객체
     * @return  QueryData 인스턴스
     * @exception   IndexOutOfBoundsException   위치가 허용범위를 넘는경우
     */
    public QueryData setValue(int seq, Object value)
    {
        if (seq > getQueryValueCount() || seq==0 )
            throw new IndexOutOfBoundsException();

        if (seq>values.size())
            values.add( value );
        else
            values.setElementAt( value, seq-1 );

        types.add( seq-1, new Integer(Types.VARCHAR));

        return this;
    }

    public QueryData setValueLong(int seq, Object value)
    {
        if (seq > getQueryValueCount() || seq==0 )
            throw new IndexOutOfBoundsException();

        if (seq>values.size())
            values.add( value );
        else
            values.setElementAt( value, seq-1 );

        types.add( seq-1, new Integer(Types.LONGVARCHAR));

        return this;
    }

    public Object getValue(int seq)
    {
        return values.elementAt(seq-1);
    }

    public int getType(int seq)
    {
        return ((Integer)types.elementAt(seq-1)).intValue();
    }
    
    public int getValueCount()
    {
        return values.size();
    }

    public int getQueryValueCount()
    {
        int ret = 0;

        if (query!=null && !"".equals(query))
        {
            ret = getDupleCount(query, "?");
        }

        return ret;
    }

    private int getDupleCount(String str, String check)
    {
        boolean isDo = true;
        int count = 0;
        int pos = 0;

        while(isDo)
        {
            if ( (pos = str.indexOf(check, pos))==-1)
                isDo = false;
            else
            {
                count++;
                pos++;
            }
        }

        return count;
    }

    public String toString()
    {
        return "query=" + query + ";value=" + values.toString();
    }

}
