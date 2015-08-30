package com.ec21.board;

import java.sql.Connection;
import java.util.HashMap;

import com.ec21.connection.PoolManager;
import com.ec21.common.Dao;
//import com.ec21.common.QueryData;

import com.ec21.util.Utility;

public class VnNewsBoardAction
{
	private static final VnNewsBoardAction instance = new VnNewsBoardAction();
	private static final String dsName = "GOBIZ";

	private PoolManager pool = null;
	private VnNewsBoardDao vnbDao = null;
	private Utility util = null;

	public static VnNewsBoardAction getInstance()
	{
		return instance;
	}

	public VnNewsBoardAction()
	{
		pool = PoolManager.getInstance();
		vnbDao  = VnNewsBoardDao.getInstance();
		util = Utility.getInstance();
	}

	/**
	 * 시퀀스 생성
	 */
	public int getNewsNoSeq() throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();
		int iRe = 0;

		try
		{
			con = pool.getConnection(dsName);

			dao = vnbDao.selectNewsNoSeq(con);

			iRe = dao.getInt(0, "NEWS_NO");
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
	 * 게시판 검색 리스트 총 갯수
	 */
	public int getNewsListTotalCount(HashMap<String, String> searchMap) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();
		int iRe = 0;

		try
		{
			con = pool.getConnection(dsName);

			dao = vnbDao.selectNewsListTotalCount(con, searchMap);

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
	 * 게시판 검색 리스트
	 */
	public Dao getNewsList(int pageNum, int rowCnt, HashMap<String, String> searchMap) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();

		try
		{
			con = pool.getConnection(dsName);

			int startRow = rowCnt * (pageNum - 1) + 1;
			int endRow = rowCnt * pageNum;

			dao = vnbDao.selectNewsList(con, startRow, endRow, searchMap);
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
	 * 게시판의 글 상세 조회
	 */
	public Dao getNews(String newsType, int newsNo) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();

		try
		{
			con = pool.getConnection(dsName);

			dao = vnbDao.selectNews(con, newsType, newsNo);
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
	 * 게시판의 글  입력
	 */
	public void insertNews(HashMap<String, String> dataMap) throws Exception
	{
		Connection con = null;

		try
		{
			con = pool.getConnection(dsName);

			vnbDao.insertNews(con, dataMap);
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
	 * 게시판의 글  수정
	 */
	public void updateNews(HashMap<String, String> dataMap) throws Exception
	{
		Connection con = null;

		try
		{
			con = pool.getConnection(dsName);

			vnbDao.updateNews(con, dataMap);
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
	 * 게시판의 글  삭제
	 */
	public void deleteNews(String newsType, int newsNo) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();

		//newsAndNoticeEditSubmit.jsp 의 업로드 패스 참조.
		String imagePath = "/data/T1/product/upload/boards/";
		String filePath = "/data/T1/product/upload/files/";

		String listImage = "";
		String attFile = "";

		try
		{
			con = pool.getConnection(dsName);

			dao = vnbDao.selectImageAndAttFile(con, newsType, newsNo);

			listImage = util.nullCheck(dao.getString(0, "LIST_IMAGE"));
			attFile = util.nullCheck(dao.getString(0, "ATT_FILE"));

			//이미지 삭제
			if(!"".equals(listImage))
				util.deleteFile(imagePath, listImage);

			//첨부 파일 삭제
			if(!"".equals(attFile))
				util.deleteFile(filePath, attFile);

			//내용 삭제
			vnbDao.deleteNews(con, newsType, newsNo);
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
	 * 게시판의 이미지 또는 파일  삭제
	 */
	public void deleteFile(int newsNo, String newsType, String type) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();

		//newsAndNoticeEditSubmit.jsp 의 업로드 패스 참조.
		String imagePath = "/data/T1/product/upload/boards/";
		String filePath = "/data/T1/product/upload/files/";

		String listImage = "";
		String attFile = "";

		try
		{
			con = pool.getConnection(dsName);

			dao = vnbDao.selectImageAndAttFile(con, newsType, newsNo);

			listImage = util.nullCheck(dao.getString(0, "LIST_IMAGE"));
			attFile = util.nullCheck(dao.getString(0, "ATT_FILE"));

			if("IMAGE".equals(type) && !"".equals(listImage)) //이미지 삭제
				util.deleteFile(imagePath, listImage);
			else if("FILE".equals(type) && !"".equals(attFile)) //첨부 파일 삭제
				util.deleteFile(filePath, attFile);

			vnbDao.updateImageOrAttFile(con, newsNo, newsType, type);
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
	 * 게시판의 글 조회수 증가
	 */
	public void updateBoardReadCnt(String newsType, int newsNo) throws Exception
	{
		Connection con = null;

		try
		{
			con = pool.getConnection(dsName);

			vnbDao.updateBoardReadCnt(con, newsType, newsNo);
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