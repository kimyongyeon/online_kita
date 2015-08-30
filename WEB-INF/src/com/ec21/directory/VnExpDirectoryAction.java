package com.ec21.directory;

import java.sql.Connection;
import java.util.HashMap;

import com.ec21.connection.PoolManager;
import com.ec21.common.Dao;

import com.ec21.util.Utility;

public class VnExpDirectoryAction
{
	private static final VnExpDirectoryAction instance = new VnExpDirectoryAction();
	private static final String dsName = "GOBIZ";

	private PoolManager pool = null;
	private VnExpDirectoryDao vedDao = null;
	private Utility util = null;

	public static VnExpDirectoryAction getInstance()
	{
		return instance;
	}

	public VnExpDirectoryAction()
	{
		pool = PoolManager.getInstance();
		vedDao  = VnExpDirectoryDao.getInstance();
		util = Utility.getInstance();
	}

	/**
	 * 시퀀스 생성
	 */
	public int getExpDirectoryNoSeq() throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();
		int iSeq = 0;

		try
		{
			con = pool.getConnection(dsName);

			dao = vedDao.selectDirNoSeq(con);

			iSeq = dao.getInt(0, "DIR_NO");
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
	 * Korean Exporters 검색 리스트 총 갯수
	 */
	public int getExpDirectoryListTotalCount(HashMap<String, String> searchMap) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();
		int iCnt = 0;

		try
		{
			con = pool.getConnection(dsName);

			dao = vedDao.selectExpDirectoryListTotalCount(con, searchMap);

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
	 * Korean Exporters 검색 리스트
	 */
	public Dao getExpDirectoryList(int pageNum, int rowCnt, HashMap<String, String> searchMap) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();

		try
		{
			con = pool.getConnection(dsName);

			int startRow = rowCnt * (pageNum - 1) + 1;
			int endRow = rowCnt * pageNum;

			dao = vedDao.selectExpDirectoryList(con, startRow, endRow, searchMap);
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
	 * Korean Exporters 상세 조회
	 */
	public Dao getExpDirectory(int dirNo) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();

		try
		{
			con = pool.getConnection(dsName);

			dao = vedDao.selectExpDirectory(con, dirNo);
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
	 * Korean Exporters 중 GOBIZKOREA ID 조회
	 */
	public Dao getGobizId(String gobizId) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();

		try
		{
			con = pool.getConnection(dsName);

			dao = vedDao.selectGobizId(con, gobizId);
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
	 * Korean Exporters  입력
	 */
	public void insertExpDirectory(HashMap<String, String> dataMap) throws Exception
	{
		Connection con = null;

		try
		{
			con = pool.getConnection(dsName);

			vedDao.insertExpDirectory(con, dataMap);
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
	 * Korean Exporters  수정
	 */
	public void updateExpDirectory(HashMap<String, String> dataMap) throws Exception
	{
		Connection con = null;

		try
		{
			con = pool.getConnection(dsName);

			vedDao.updateExpDirectory(con, dataMap);
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
	 * Korean Exporters  삭제
	 */
	public void deleteExpDirectory(int dirNo) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();

		try
		{
			con = pool.getConnection(dsName);

			//내용 삭제
			vedDao.deleteExpDirectory(con, dirNo);
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