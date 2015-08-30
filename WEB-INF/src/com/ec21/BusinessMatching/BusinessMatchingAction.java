package com.ec21.BusinessMatching;

import java.sql.Connection;
import java.util.HashMap;

import com.ec21.connection.PoolManager;
import com.ec21.common.Dao;

import com.ec21.util.Utility;

public class BusinessMatchingAction
{
	private static final BusinessMatchingAction instance = new BusinessMatchingAction();
	private static final String dsName = "GOBIZ";

	private PoolManager pool = null;
	private BusinessMatchingDao bmDao = null;
	private Utility util = null;

	public static BusinessMatchingAction getInstance()
	{
		return instance;
	}

	public BusinessMatchingAction()
	{
		pool = PoolManager.getInstance();
		bmDao  = BusinessMatchingDao.getInstance();
		util = Utility.getInstance();
	}
	
	/**
	 * BusinessMatching SuccessStories 검색 리스트 총 갯수
	 */
	public int getBusinessMatchingListTotalCount(HashMap<String, String> searchMap) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();
		int iCnt = 0;

		try
		{
			con = pool.getConnection(dsName);

			dao = bmDao.selectBusinessMatchingListTotalCount(con, searchMap);

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
	 * BusinessMatching SuccessStories 검색 리스트
	 */
	public Dao getBusinessMatchingList(int pageNum, int rowCnt, HashMap<String, String> searchMap) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();

		try
		{
			con = pool.getConnection(dsName);

			int startRow = rowCnt * (pageNum - 1) + 1;
			int endRow = rowCnt * pageNum;

			dao = bmDao.selectBusinessMatchingList(con, startRow, endRow, searchMap);
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
	 * BusinessMatching SuccessStories 상세 조회
	 */
	public Dao getBusinessMatching(String contactNo) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();

		try
		{
			con = pool.getConnection(dsName);

			dao = bmDao.selectBusinessMatching(con, contactNo);
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
	 * BMS 검색 리스트 총 갯수
	 */
	public int getBmsListTotalCount(HashMap<String, String> searchMap) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();
		int iCnt = 0;
		
		try
		{
			con = pool.getConnection(dsName);
			
			dao = bmDao.selectBmsListTotalCount(con, searchMap);
			
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
	 * BMS 검색 리스트
	 */
	public Dao getBmsList(int pageNum, int rowCnt, HashMap<String, String> searchMap) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();
		
		try
		{
			con = pool.getConnection(dsName);
			
			int startRow = rowCnt * (pageNum - 1) + 1;
			int endRow = rowCnt * pageNum;
			
			dao = bmDao.selectBmsList(con, startRow, endRow, searchMap);
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
	 * BMS 상세 조회
	 */
	public Dao getBms(HashMap<String, String> dataMap) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();
		
		try
		{
			con = pool.getConnection(dsName);
			
			dao = bmDao.selectBms(con, dataMap);
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
	 * BMS 사용자 회원정보 조회
	 */
	public Dao selectMpMem(HashMap<String, String> dataMap) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();

		try
		{
			con = pool.getConnection(dsName);

			dao = bmDao.selectMpMem(con, dataMap);
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
	 * BMS Business Type, job Title 정보 리스트
	 */
	public Dao selectBZTPorBMJT(HashMap<String, String> dataMap) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();

		try
		{
			con = pool.getConnection(dsName);

			dao = bmDao.selectBZTPorBMJT(con, dataMap);
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
	 * BMS Country 정보 리스트
	 */
	public Dao selectCountry() throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();
		
		try
		{
			con = pool.getConnection(dsName);
			
			dao = bmDao.selectCountry(con);
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
	 * BMS MP_MAT_APPLY SEQ 구하기
	 */
	public Dao selectMpMatApplySeq() throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();
		
		try
		{
			con = pool.getConnection(dsName);
			
			dao = bmDao.selectMpMatApplySeq(con);
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
	 * BMS 사용자 등록
	 */
	public Dao insertBMS(HashMap<String, String> dataMap) throws Exception
	{
		Connection con = null;

		try
		{
			con = pool.getConnection(dsName);

			return bmDao.insertBMS(con, dataMap);
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
	 * BMS STATE 등록
	 */
	public Dao insertBmsState(HashMap<String, String> dataMap) throws Exception
	{
		Connection con = null;

		try
		{
			con = pool.getConnection(dsName);

			return bmDao.insertBmsState(con, dataMap);
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
	 * BMS 사용자 수정
	 */
	public Dao updateBMS(HashMap<String, String> dataMap) throws Exception
	{
		Connection con = null;

		try
		{
			con = pool.getConnection(dsName);

			return  bmDao.updateBMS(con, dataMap);
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
	 * VAP SEQ 구하기
	 */
	public Dao selectGsIspSeq() throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();
		
		try
		{
			con = pool.getConnection(dsName);
			
			dao = bmDao.selectGsIspSeq(con);
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
	 * VAP 사용자 등록
	 */
	public Dao insertVAP(HashMap<String, String> dataMap) throws Exception
	{
		Connection con = null;
		
		try
		{
			con = pool.getConnection(dsName);
			
			return bmDao.insertVAP(con, dataMap);
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
	 * VAP STATE 등록
	 */
	public Dao insertVapState(HashMap<String, String> dataMap) throws Exception
	{
		Connection con = null;
		
		try
		{
			con = pool.getConnection(dsName);
			
			return bmDao.insertVapState(con, dataMap);
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
	 * VAP 사용자 수정
	 */
	public Dao updateVAP(HashMap<String, String> dataMap) throws Exception
	{
		Connection con = null;
		
		try
		{
			con = pool.getConnection(dsName);
			
			return  bmDao.updateVAP(con, dataMap);
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