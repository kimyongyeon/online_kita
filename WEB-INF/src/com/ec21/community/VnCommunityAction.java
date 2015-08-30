package com.ec21.community;

import java.sql.Connection;
import java.util.HashMap;

import com.ec21.connection.PoolManager;
import com.ec21.common.Dao;
import com.ec21.util.Utility;


public class VnCommunityAction
{
	private static final VnCommunityAction instance = new VnCommunityAction();
	private static final String dsName = "GOBIZ";
	
	private PoolManager pool = null;	
	private VnCommunityDao vncDao = null;
	private Utility util = null;
	
	public static VnCommunityAction getInstance()
	{
		return instance;
	}
	
	public VnCommunityAction()
	{ 
		pool = PoolManager.getInstance();
		vncDao = VnCommunityDao.getInstance();
		util = Utility.getInstance();
	}
	
	//커뮤니티 리스트 총 갯수
	public int getCommunityListTotalCount(HashMap<String, String> hMap) throws Exception
	{
		Connection con = null;
		
		Dao dao = new Dao();		

		int totalCnt = 0;

		try 
		{
			con = pool.getConnection(dsName);
			
			if("ALL".equals(hMap.get("searchType")))
				dao = vncDao.getCommunityListTotalCount(con, hMap.get("searchData"));
			else
				dao = vncDao.getCommunityListTotalCount(con, hMap);
			
			totalCnt = dao.getInt(0, "CNT");
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			throw e;
		}
		finally 
		{
			if (con != null)
				pool.releaseConnection(con);
		}

		return totalCnt;
	}
	
	//커뮤니티 리스트	 
	public Dao getCommunityList(int pageNum, int rowCnt, HashMap<String, String> hMap) throws Exception
	{
		Connection con = null;

		Dao dao = new Dao();

		try 
		{
			con = pool.getConnection(dsName);
			
			int startRow = rowCnt * (pageNum - 1) + 1;
			int endRow = rowCnt * pageNum;
		
			if("ALL".equals(hMap.get("searchType")))				
				dao = vncDao.getCommunityList(con, startRow, endRow, hMap.get("searchData"));	
			else
				dao = vncDao.getCommunityList(con, startRow, endRow, hMap);			
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			throw e;
		}
		finally 
		{
			if (con != null)
				pool.releaseConnection(con);
		}

		return dao;
	}	
	
	
	//커뮤니티 상세 보기
	public Dao getCommunityView(int comNo) throws Exception
	{
		Connection con = null;		

		Dao dao = new Dao();
		
		try 
		{
			con = pool.getConnection(dsName);
			
			dao = vncDao.getCommunityView(con, comNo);			
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			throw e;
		}
		finally 
		{
			if (con != null)
				pool.releaseConnection(con);
		}		
		
		return dao;
	}
	
	//커뮤니티 등록
	public void communityInsert(HashMap<String, String> hMap) throws Exception
	{
		Connection con = null;		

		try 
		{
			con = pool.getConnection(dsName);
			
			vncDao.communityInsert(con, hMap);			
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			throw e;
		}
		finally 
		{
			if (con != null)
				pool.releaseConnection(con);
		}		
	}
	
	//커뮤니티 수정 
	public void communityEdit(HashMap<String, String> hMap) throws Exception
	{
		Connection con = null;		

		try 
		{
			con = pool.getConnection(dsName);
			
			vncDao.communityEdit(con, hMap);			
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			throw e;
		}
		finally 
		{
			if (con != null)
				pool.releaseConnection(con);
		}		
	}
	
	//커뮤니티 삭제 
	public void communityDelete(int comNo) throws Exception
	{
		Connection con = null;		

		try 
		{
			con = pool.getConnection(dsName);
			
			vncDao.communityDelete(con, comNo);			
			vncDao.communityReplyDelete(con, comNo, 0); 
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			throw e;
		}
		finally 
		{
			if (con != null)
				pool.releaseConnection(con);
		}			
	}	 
	
	//커뮤니티 다중 삭제 
	public void communityDeleteMulti(String[] comID) throws Exception
	{
		Connection con = null;		

		try 
		{
			con = pool.getConnection(dsName);
			
			for(String ID : comID)
			{
				vncDao.communityDelete(con, Integer.parseInt(ID));			
				vncDao.communityReplyDelete(con, Integer.parseInt(ID), 0);
			}
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			throw e;
		}
		finally 
		{
			if (con != null)
				pool.releaseConnection(con);
		}			
	}	 
	 
	//댓글 수정	 
	public void communityReplyEdit(HashMap<String, String> hMap) throws Exception
	{
		Connection con = null;		

		try 
		{
			con = pool.getConnection(dsName);
			
			vncDao.communityReplyEdit(con, hMap);			
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			throw e;
		}
		finally 
		{
			if (con != null)
				pool.releaseConnection(con);
		}		
	} 
	 
	//댓글 등록	 
	public void communityReplyInsert(HashMap<String, String> hMap) throws Exception
	{
		Connection con = null;		

		try 
		{
			con = pool.getConnection(dsName);
			
			vncDao.communityReplyInsert(con, hMap);			
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			throw e;
		}
		finally 
		{
			if (con != null)
				pool.releaseConnection(con);
		}		
	}	
	
	// 보기
	public Dao getCommunityReplyView(int comNo) throws Exception
	{
		Connection con = null;		

		Dao dao = new Dao();
		
		try 
		{
			con = pool.getConnection(dsName);
			
			dao = vncDao.getCommunityReplyView(con, comNo);			
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			throw e;
		}
		finally 
		{
			if (con != null)
				pool.releaseConnection(con);
		}		
		
		return dao;
	}
	
	//댓글 삭제	 
	public void communityReplyDelete(int compNo, int replyNo) throws Exception
	{
		Connection con = null;		

		try 
		{
			con = pool.getConnection(dsName);		
			
			vncDao.communityReplyDelete(con, compNo, replyNo); 
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			throw e;
		}
		finally 
		{
			if (con != null)
				pool.releaseConnection(con);
		}			
	}	
	
	//조회수 증가 
	public void communityReadCnt(int comNo) throws Exception
	{
		Connection con = null;		

		try 
		{
			con = pool.getConnection(dsName);		
			
			vncDao.communityReadCnt(con, comNo); 
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			throw e;
		}
		finally 
		{
			if (con != null)
				pool.releaseConnection(con);
		}			
	}
	
	//커뮤니티 시퀀스 생성
	public int getCommunitySeq() throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();
		int iRe = 0;

		try
		{
			con = pool.getConnection(dsName);

			dao = vncDao.getCommunitySeq(con);

			iRe = dao.getInt(0, "COM_NO");
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

	
}