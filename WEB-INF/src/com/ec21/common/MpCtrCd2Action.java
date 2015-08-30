package com.ec21.common;

import java.sql.Connection;
import java.util.HashMap;

import com.ec21.connection.PoolManager;
import com.ec21.common.Dao;

import com.ec21.util.Utility;

public class MpCtrCd2Action
{
	private static final MpCtrCd2Action instance = new MpCtrCd2Action();
	private static final String dsName = "GOBIZ";

	private PoolManager pool = null;
	private MpCtrCd2Dao mpc2Dao = null;
	private Utility util = null;

	public static MpCtrCd2Action getInstance()
	{
		return instance;
	}

	public MpCtrCd2Action()
	{
		pool = PoolManager.getInstance();
		mpc2Dao  = MpCtrCd2Dao.getInstance();
		util = Utility.getInstance();
	}


	/**
	 * 국가 코드 리스트 조회
	 */
	public Dao getMpCtrCd2List() throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();

		try
		{
			con = pool.getConnection(dsName);

			dao = mpc2Dao.selectMpCtrCd2List(con);
		}
		catch (Exception e)
		{
			e.printStackTrace();
			throw e;
		}
		finally
		{
			pool.releaseConnection(con);
		}

		return dao;
	}

}