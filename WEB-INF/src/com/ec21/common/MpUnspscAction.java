package com.ec21.common;

import java.sql.Connection;
import java.util.HashMap;

import com.ec21.connection.PoolManager;
import com.ec21.common.Dao;

import com.ec21.util.Utility;

public class MpUnspscAction
{
	private static final MpUnspscAction instance = new MpUnspscAction();
	private static final String dsName = "GOBIZ";

	private PoolManager pool = null;
	private MpUnspscDao nuDao = null;
	private Utility util = null;

	public static MpUnspscAction getInstance()
	{
		return instance;
	}

	public MpUnspscAction()
	{
		pool = PoolManager.getInstance();
		nuDao  = MpUnspscDao.getInstance();
		util = Utility.getInstance();
	}


	/**
	 * 카테고리 조회
	 */
	public Dao getMpUnspsc() throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();

		try
		{
			con = pool.getConnection(dsName);

			dao = nuDao.selectMpUnspsc(con);
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