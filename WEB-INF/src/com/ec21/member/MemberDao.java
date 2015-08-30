package com.ec21.member

import java.sql.Connection;
import java.util.HashMap;

import com.ec21.common.Dao;
import com.ec21.common.QueryData;

public class MemberDao
{
	private static final MemberDao instance = new MemberDao();

	public static MemberDao getInstance()
	{
		return instance;
	}

	public MemberDao()
	{
	}

	/**
	 * 게시판 상세 조회
	 */
	public Dao selectLoginInfo(Connection con, String userId) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" SELECT * \n");
		query.append("   FROM MP_MEM \n");
		query.append("  WHERE USERID = ? \n");
		query.append("    AND USE_YN IN ('Y','S') \n");

		qd = new QueryData(query.toString());
		qd.addValue(userId);
		dao.exeSql(con, qd, 1, 1);

		return dao;
	}
}