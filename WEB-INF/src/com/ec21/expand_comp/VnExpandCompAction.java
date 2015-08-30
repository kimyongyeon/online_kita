package com.ec21.expand_comp;

import java.sql.Connection;
import java.util.HashMap;

import com.ec21.connection.PoolManager;
import com.ec21.common.Dao;

import com.ec21.util.Utility;

public class VnExpandCompAction
{
	private static final VnExpandCompAction instance = new VnExpandCompAction();
	private static final String dsName = "GOBIZ";

	private PoolManager pool = null;
	private VnExpandCompDao vecDao = null;
	private Utility util = null;

	public static VnExpandCompAction getInstance()
	{
		return instance;
	}

	public VnExpandCompAction()
	{
		pool = PoolManager.getInstance();
		vecDao  = VnExpandCompDao.getInstance();
		util = Utility.getInstance();
	}

	/**
	 * 시퀀스 생성
	 */
	public int getExpandCompNoSeq() throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();
		int iSeq = 0;

		try
		{
			con = pool.getConnection(dsName);

			dao = vecDao.selectExpNoSeq(con);

			iSeq = dao.getInt(0, "EXP_NO");
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

		return iSeq;
	}

	/**
	 * Korean Companies in VN 검색 리스트 총 갯수
	 */
	public int getExpandCompListTotalCount(HashMap<String, String> searchMap) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();
		int iCnt = 0;

		try
		{
			con = pool.getConnection(dsName);

			dao = vecDao.selectExpandCompListTotalCount(con, searchMap);

			iCnt = dao.getInt(0, "CNT");
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

		return iCnt;
	}

	/**
	 * Korean Companies in VN 검색 리스트
	 */
	public Dao getExpandCompList(int pageNum, int rowCnt, HashMap<String, String> searchMap) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();

		try
		{
			con = pool.getConnection(dsName);

			int startRow = rowCnt * (pageNum - 1) + 1;
			int endRow = rowCnt * pageNum;

			dao = vecDao.selectExpandCompList(con, startRow, endRow, searchMap);
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

	/**
	 * Korean Companies in VN 상세 조회
	 */
	public Dao getExpandComp(int expNo) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();

		try
		{
			con = pool.getConnection(dsName);

			dao = vecDao.selectExpandComp(con, expNo);
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


  /**
	 * Korean Companies in VN 중 GOBIZKOREA ID 조회
	 */
	public Dao getGobizId(String gobizId) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();

		try
		{
			con = pool.getConnection(dsName);

			dao = vecDao.selectGobizId(con, gobizId);
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

	/**
	 * Korean Companies in VN  입력
	 */
	public void insertExpandComp(HashMap<String, String> dataMap) throws Exception
	{
		Connection con = null;

		try
		{
			con = pool.getConnection(dsName);

			vecDao.insertExpandComp(con, dataMap);
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
	}

	/**
	 * Korean Companies in VN  수정
	 */
	public void updateExpandComp(HashMap<String, String> dataMap) throws Exception
	{
		Connection con = null;

		try
		{
			con = pool.getConnection(dsName);

			vecDao.updateExpandComp(con, dataMap);
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
	}

	/**
	 * Korean Companies in VN  삭제
	 */
	public void deleteExpandComp(int expNo) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();

		try
		{
			con = pool.getConnection(dsName);

			//내용 삭제
			vecDao.deleteExpandComp(con, expNo);
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
	}
}