package com.ec21.category;

import java.sql.Connection;
import java.util.HashMap;

import com.ec21.connection.PoolManager;
import com.ec21.common.Dao;

import com.ec21.util.Utility;

public class CategoryAction
{
	private static final CategoryAction instance = new CategoryAction();
	private static final String dsName = "GOBIZ";

	private PoolManager pool = null;
	private CategoryDao cDao = null;
	private Utility util = null;

	public static CategoryAction getInstance()
	{
		return instance;
	}

	public CategoryAction()
	{
		pool = PoolManager.getInstance();
		cDao  = CategoryDao.getInstance();
		util = Utility.getInstance();
	}

	/**
	 * product 리스트 총 갯수
	 */
	public int getProductListTotalCount(HashMap<String, String> searchMap) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();
		int iRe = 0;

		try
		{
			con = pool.getConnection(dsName);

			dao = cDao.selectProductListTotalCount(con, searchMap);

			iRe = dao.getInt(0, "CNT");
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

		return iRe;
	}

	/**
	 * product 리스트
	 */
	public Dao getProductList(int pageNum, int rowCnt, HashMap<String, String> searchMap) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();

		try
		{
			con = pool.getConnection(dsName);

			int startRow = rowCnt * (pageNum - 1) + 1;
			int endRow = rowCnt * pageNum;

			dao = cDao.selectProductList(con, startRow, endRow, searchMap);
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