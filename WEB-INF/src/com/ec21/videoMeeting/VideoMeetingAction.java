package com.ec21.videoMeeting;

import java.sql.Connection;
import java.util.HashMap;

import com.ec21.connection.PoolManager;
import com.ec21.common.Dao;

import com.ec21.util.Utility;

public class VideoMeetingAction
{
	private static final VideoMeetingAction instance = new VideoMeetingAction();
	private static final String dsName = "GOBIZ";

	private PoolManager pool = null;
	private VideoMeetingDao vmDao = null;
	private Utility util = null;

	public static VideoMeetingAction getInstance()
	{
		return instance;
	}

	public VideoMeetingAction()
	{
		pool = PoolManager.getInstance();
		vmDao  = VideoMeetingDao.getInstance();
		util = Utility.getInstance();
	}


	/**
	 * 바이어 입력
	 */
	public void insertBuyer(HashMap<String, String> dataMap) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();

		String evmSeq = "";

		try
		{
			con = pool.getConnection(dsName);

			//seq setting
			dao = vmDao.selectEvmSeq(con);

			evmSeq = util.nullCheck(dao.getString(0, "SEQ"));

			//insert buyer
			vmDao.insertBuyer(con, evmSeq, dataMap);

			//GOBIZKOREA 로직에는 이메일을 발송한 뒤 테이블에 정보를 저장하는 로직이 추가로 있지만 메일을 발송하지 않도록 설정되어 추가하지 않음.
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
	 * Buyer Status 리스트 총 갯수
	 */
	public int getBuyerStatusTotalCount(HashMap<String, String> searchMap) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();
		int iRe = 0;

		try
		{
			con = pool.getConnection(dsName);

			dao = vmDao.selectBuyerStatusTotalCount(con, searchMap);

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
	 * Buyer Status 리스트
	 */
	public Dao getBuyerStatusList(int pageNum, int rowCnt, HashMap<String, String> searchMap) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();

		try
		{
			con = pool.getConnection(dsName);

			int startRow = rowCnt * (pageNum - 1) + 1;
			int endRow = rowCnt * pageNum;

			dao = vmDao.selectBuyerStatusList(con, startRow, endRow, searchMap);
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