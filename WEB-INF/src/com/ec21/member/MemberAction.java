package com.ec21.member;

import java.sql.Connection;
import java.util.HashMap;

import com.ec21.connection.PoolManager;
import com.ec21.common.Dao;

import com.ec21.util.Utility;

public class MemberAction
{
	private static final MemberAction instance = new MemberAction();
	private static final String dsName = "GOBIZ";

	private PoolManager pool = null;
	private MemberDao cDao = null;
	private Utility util = null;

	public static MemberAction getInstance()
	{
		return instance;
	}

	public MemberAction()
	{
		pool = PoolManager.getInstance();
		mDao  = MemberDao.getInstance();
		util = Utility.getInstance();
	}

	/**
	 * Member Login Info
	 */
	public Dao getLoginInfo(String userId) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();
		int iRe = 0;

		try
		{
			con = pool.getConnection(dsName);

			dao = mDao.selectLoginInfo(con, userId);
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