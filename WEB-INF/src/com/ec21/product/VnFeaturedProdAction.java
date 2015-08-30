package com.ec21.product;

import java.sql.Connection;
import java.util.HashMap;
import java.util.ArrayList;

import com.ec21.connection.PoolManager;
import com.ec21.common.Dao;

import com.ec21.util.Utility;

public class VnFeaturedProdAction
{
	private static final VnFeaturedProdAction instance = new VnFeaturedProdAction();
	private static final String dsName = "GOBIZ";

	private PoolManager pool = null;
	private VnFeaturedProdDao vfpDao = null;
	private Utility util = null;

	public static VnFeaturedProdAction getInstance()
	{
		return instance;
	}

	public VnFeaturedProdAction()
	{
		pool = PoolManager.getInstance();
		vfpDao  = VnFeaturedProdDao.getInstance();
		util = Utility.getInstance();
	}

	/**
	 * 시퀀스 생성
	 */
	public int getGesiNoSeq() throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();
		int iRe = 0;

		try
		{
			con = pool.getConnection(dsName);

			dao = vfpDao.selectGesiNoSeq(con);

			iRe = dao.getInt(0, "GESI_NO");
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
	 * Featured Products 리스트 총 갯수
	 */
	public int getFeaturedProdListTotalCount() throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();
		int iRe = 0;

		try
		{
			con = pool.getConnection(dsName);

			dao = vfpDao.selectNewsListTotalCount(con);

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
	 * Featured Products 리스트
	 */
	public Dao getFeaturedProdList(int pageNum, int rowCnt) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();

		try
		{
			con = pool.getConnection(dsName);

			int startRow = rowCnt * (pageNum - 1) + 1;
			int endRow = rowCnt * pageNum;

			dao = vfpDao.selectNewsList(con, startRow, endRow);
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
	 * Featured Products 상세 조회
	 */
	public Dao getFeaturedProducts(int gesiNo) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();

		try
		{
			con = pool.getConnection(dsName);

			dao = vfpDao.selectFeaturedProducts(con, gesiNo);
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
	 * Featured Products Image 조회
	 */
	public Dao getFeaturedProductsImage(int gesiNo) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();

		try
		{
			con = pool.getConnection(dsName);

			dao = vfpDao.selectFeaturedProductsImage(con, gesiNo);
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
	 * Featured Products Image 조회
	 */
	public Dao getFeaturedProductsImageIsNotNull(int gesiNo) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();

		try
		{
			con = pool.getConnection(dsName);

			dao = vfpDao.selectFeaturedProductsImageIsNotNull(con, gesiNo);
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
	 * Featured Products 입력
	 */
	public void insertFeaturedProducts(HashMap<String, String> dataMap1, ArrayList<HashMap<String, String>> dataList) throws Exception
	{
		Connection con = null;
		HashMap<String, String> dataMap2 = null;

		try
		{
			con = pool.getConnection(dsName);

			con.setAutoCommit(false);

			vfpDao.insertFeaturedProduct(con, dataMap1);

			for(int i=0,j=dataList.size(); i<j; i++)
			{
				dataMap2 = dataList.get(i);

				if(!"".equals(util.nullCheck(dataMap2.get("prodNm"))) || !"".equals(util.nullCheck(dataMap2.get("url"))) || !"".equals(util.nullCheck(dataMap2.get("orgImage"))))
					vfpDao.insertFeaturedProductImage(con, dataMap2);
			}

			con.commit();
		}
		catch (Exception e)
		{
			con.rollback();
			e.printStackTrace();
			throw e;
		}
		finally
		{
			con.setAutoCommit(true);
			pool.releaseConnection(con);
		}
	}

	/**
	 * Featured Products 수정
	 */

	public void updateFeaturedProducts(HashMap<String, String> dataMap1, ArrayList<HashMap<String, String>> dataList) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();
		HashMap<String, String> dataMap2 = null;

		try
		{
			con = pool.getConnection(dsName);

			con.setAutoCommit(false);

			vfpDao.updateFeaturedProduct(con, dataMap1);

			for(int i=0,j=dataList.size(); i<j; i++)
			{
				dataMap2 = dataList.get(i);

				if(!"".equals(util.nullCheck(dataMap2.get("prodNm"))) || !"".equals(util.nullCheck(dataMap2.get("url"))) || !"".equals(util.nullCheck(dataMap2.get("orgImage"))))
				{
					dao = vfpDao.selectFeatureProductImage(con, dataMap2);

					if(dao.getRowCnt() > 0) //기존에 정보가 하나라도 존재하는 경우
						vfpDao.updateFeaturedProductImage(con, dataMap2);
					else
						vfpDao.insertFeaturedProductImage(con, dataMap2);
				}
				else // 기존 정보(상품명, URL, 이미지)가 모두 삭제 되는 경우
				{
					if("Y".equals(dataMap2.get("imageChangeFlag")))
						vfpDao.deleteFeaturedProductImage(con, dataMap2);
				}
			}

			con.commit();
		}
		catch (Exception e)
		{
			con.rollback();
			e.printStackTrace();
			throw e;
		}
		finally
		{
			con.setAutoCommit(true);
			pool.releaseConnection(con);
		}
	}

	/**
	 * Featured Products 삭제
	 */
	public void deleteFeaturedProducts(int gesiNo) throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();

		//featureProducctsEditSubmit.jsp 의 업로드 패스 참조.
		String imagePath = "/data/T1/product/upload/products/";
		String image = "";

		try
		{
			con = pool.getConnection(dsName);
			con.setAutoCommit(false);

			dao = vfpDao.selectFeatureProductImage(con, gesiNo);

			for(int i=0,j=dao.getRowCnt(); i<j; i++)
			{
				image = util.nullCheck(dao.getString(i, "IMAGE"));

				//이미지 삭제
				if(!"".equals(image))
				{
					util.deleteFile(imagePath + gesiNo + "/", image);
					util.deleteFile(imagePath + gesiNo + "/", "");
				}
			}

			//내용 삭제
			vfpDao.deleteFeaturedProduct(con, gesiNo);
			vfpDao.deleteFeaturedProductImage(con, gesiNo);

			con.commit();
		}
		catch (Exception e)
		{
			con.rollback();
			e.printStackTrace();
			throw e;
		}
		finally
		{
			con.setAutoCommit(true);
			pool.releaseConnection(con);
		}
	}
	/**
	 * 메인 Featured Products 리스트
	 */
	public Dao getMainFeaturedProdList() throws Exception
	{
		Connection con = null;
		Dao dao = new Dao();

		try
		{
			con = pool.getConnection(dsName);

			dao = vfpDao.selectMainFeaturedProdList(con);
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