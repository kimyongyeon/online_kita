package com.ec21.common;

import java.sql.Connection;
import java.util.HashMap;

import com.ec21.common.Dao;
import com.ec21.common.QueryData;

public class MpUnspscDao
{
	private static final MpUnspscDao instance = new MpUnspscDao();

	public static MpUnspscDao getInstance()
	{
		return instance;
	}

	public MpUnspscDao()
	{

	}

	/**
	 * 카테고리 조회
	 */
	public Dao selectMpUnspsc(Connection con) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		//query.append(" SELECT UNSPSC, ETITLE FROM MP_UNSPSC WHERE LEV = '1' ORDER BY ETITLE \n");
		query.append(" SELECT UNSPSC, ETITLE, VN_TITLE FROM VN_UNSPSC WHERE LEV = '1' ORDER BY ETITLE \n");

		qd = new QueryData(query.toString());
		dao.exeSql(con, qd, 1, 0);

		return dao;
	}


}