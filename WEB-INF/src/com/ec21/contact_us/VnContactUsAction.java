package com.ec21.contact_us;

import java.sql.Connection;
import java.util.HashMap;

import com.ec21.connection.PoolManager;
import com.ec21.common.Dao;

import com.ec21.util.Utility;

public class VnContactUsAction
{
	private static final VnContactUsAction instance = new VnContactUsAction();
	private static final String dsName = "GOBIZ";

	private PoolManager pool = null;
	private VnContactUsDao vcuDao = null;
	private Utility util = null;

	public static VnContactUsAction getInstance()
	{
		return instance;
	}

	public VnContactUsAction()
	{
		pool = PoolManager.getInstance();
		vcuDao  = VnContactUsDao.getInstance();
		util = Utility.getInstance();
	}

	/**
	 * 시퀀스 생성
	 */
	public int getContactUsNoSeq() throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();
		int iSeq = 0;

		try
		{
			con = pool.getConnection(dsName);

			dao = vcuDao.selectDirNoSeq(con);

			iSeq = dao.getInt(0, "CONTACT_NO");
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
	 * Contact Us 검색 리스트 총 갯수
	 */
	public int getContactUsListTotalCount(HashMap<String, String> searchMap) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();
		int iCnt = 0;

		try
		{
			con = pool.getConnection(dsName);

			dao = vcuDao.selectContactUsListTotalCount(con, searchMap);

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
	 * Contact Us 검색 리스트
	 */
	public Dao getContactUsList(int pageNum, int rowCnt, HashMap<String, String> searchMap) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();

		try
		{
			con = pool.getConnection(dsName);

			int startRow = rowCnt * (pageNum - 1) + 1;
			int endRow = rowCnt * pageNum;

			dao = vcuDao.selectContactUsList(con, startRow, endRow, searchMap);
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
	 * Contact Us 상세 조회
	 */
	public Dao getContactUs(String contactNo) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();

		try
		{
			con = pool.getConnection(dsName);

			dao = vcuDao.selectContactUs(con, contactNo);
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
	 * Contact Us 엑셀저장
	 */
	public Dao getContactUsExcelDown(String contactNo) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();
		
		try
		{
			con = pool.getConnection(dsName);
			return dao = vcuDao.selectContactUsExcelDown(con, contactNo);
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
	 * Contact Us  사용자 입력
	 */
	public Dao insertContactUs(HashMap<String, String> dataMap) throws Exception
	{
		Connection con = null;

		try
		{
			con = pool.getConnection(dsName);

			return vcuDao.insertContactUs(con, dataMap);
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
	 * Contact Us  수정 - 관리자 답변
	 */
	public Dao updateContactUs(HashMap<String, String> dataMap) throws Exception
	{
		Connection con = null;

		try
		{
			con = pool.getConnection(dsName);

			return  vcuDao.updateContactUs(con, dataMap);
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
	 * Contact Us 삭제
	 */
	public Dao deleteContactUs(HashMap<String, String> dataMap) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();

		try
		{
			con = pool.getConnection(dsName);

			//내용 삭제
			return vcuDao.deleteContactUs(con, dataMap);
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