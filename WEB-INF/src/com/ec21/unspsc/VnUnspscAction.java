package com.ec21.unspsc;

import java.sql.Connection;
import java.util.HashMap;

import com.ec21.connection.PoolManager;
import com.ec21.common.Dao;

import com.ec21.util.Utility;

public class VnUnspscAction
{
	private static final VnUnspscAction instance = new VnUnspscAction();
	private static final String dsName = "GOBIZ";

	private PoolManager pool = null;
	private VnUnspscDao nuDao = null;
	private Utility util = null;

	public static VnUnspscAction getInstance()
	{
		return instance;
	}

	public VnUnspscAction()
	{
		pool = PoolManager.getInstance();
		nuDao  = VnUnspscDao.getInstance();
		util = Utility.getInstance();
	}


	/**
	 * 해당 레벨까지의 카테고리 조회
	 */
	public Dao getVnUnspscList(int limitLevel) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();

		try
		{
			con = pool.getConnection(dsName);

			dao = nuDao.selectVnUnspscList(con, limitLevel);
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