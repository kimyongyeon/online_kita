package com.ec21.common;

import java.sql.Connection;
import java.util.HashMap;

import com.ec21.common.Dao;
import com.ec21.common.QueryData;

public class MpCtrCd2Dao
{
	private static final MpCtrCd2Dao instance = new MpCtrCd2Dao();

	public static MpCtrCd2Dao getInstance()
	{
		return instance;
	}

	public MpCtrCd2Dao()
	{

	}

	/**
	 * 국가 코드 조회
	 */
	public Dao selectMpCtrCd2List(Connection con) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" SELECT CODE as CTR_CD , NAME_KR as CTR_CD_KR , NAME_EN as CTR_CD_EN \n");
		query.append("   FROM MP_CTR_CD2 \n");

		qd = new QueryData(query.toString());
		dao.exeSql(con, qd, 1, 0);

		return dao;
	}


}