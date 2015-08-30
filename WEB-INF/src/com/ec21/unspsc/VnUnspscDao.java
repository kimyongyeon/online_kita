package com.ec21.unspsc;

import java.sql.Connection;
import java.util.HashMap;

import com.ec21.common.Dao;
import com.ec21.common.QueryData;

public class VnUnspscDao
{
	private static final VnUnspscDao instance = new VnUnspscDao();

	public static VnUnspscDao getInstance()
	{
		return instance;
	}

	public VnUnspscDao()
	{

	}

	/**
	 * 해당 레벨까지의 카테고리 조회
	 */
	public Dao selectVnUnspscList(Connection con, int limitLevel) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" SELECT UNSPSC, ETITLE, VN_TITLE, LEV \n");
		query.append("   FROM VN_UNSPSC \n");
		query.append("  WHERE LEV <= ? \n");

		qd = new QueryData(query.toString());
		qd.addValue(limitLevel);
		dao.exeSql(con, qd, 1, 0);

		return dao;
	}


}