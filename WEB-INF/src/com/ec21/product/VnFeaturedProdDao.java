package com.ec21.product;

import java.sql.Connection;
import java.util.HashMap;

import com.ec21.common.Dao;
import com.ec21.common.QueryData;

public class VnFeaturedProdDao
{
	private static final VnFeaturedProdDao instance = new VnFeaturedProdDao();

	public static VnFeaturedProdDao getInstance()
	{
		return instance;
	}

	public VnFeaturedProdDao()
	{

	}

	/**
	 * 시퀀스 생성
	 */
	public Dao selectGesiNoSeq(Connection con) throws Exception
	{
		Dao dao = new Dao();

		StringBuilder query = new StringBuilder();
		query.append(" SELECT VN_FEATURED_PROD_SEQ.NEXTVAL GESI_NO FROM DUAL \n");
		dao.exeSql(con, query.toString(), 1, 0);

		return dao;
	}

	/**
	 * Featured Products 리스트 총 갯수
	 */
	public Dao selectNewsListTotalCount(Connection con) throws Exception
	{
		Dao dao = new Dao();

		StringBuilder query = new StringBuilder();
		query.append(" SELECT COUNT(1) CNT \n");
		query.append("   FROM VN_FEATURED_PROD \n");

		dao.exeSql(con, query.toString(), 1, 1);

		return dao;
	}

	/**
	 * Featured Products 리스트
	 */
	public Dao selectNewsList(Connection con, int startRow, int endRow) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" SELECT * \n");
		query.append("   FROM ( \n");
		query.append("         SELECT ROWNUM RM, A.* \n");
		query.append("           FROM ( SELECT /*+ INDEX_DESC(VN_FEATURED_PROD VN_FEATURED_PROD_PK) */ GESI_NO, GESI_SDAY, GESI_EDAY, INPUT_DT, UPDATE_DT \n");
		query.append("                    FROM VN_FEATURED_PROD \n");
		query.append("                ) A \n");
		query.append("          WHERE ROWNUM <= ?  )   \n");
		query.append("   WHERE RM >= ? \n");

		qd = new QueryData(query.toString());
		qd.addValue(endRow);
		qd.addValue(startRow);
		dao.exeSql(con, qd, 1, 0);

		return dao;
	}

	/**
	 * Featured Products 상세 조회
	 */
	public Dao selectFeaturedProducts(Connection con, int gesiNo) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" SELECT GESI_NO, GESI_SDAY, GESI_EDAY, INPUT_DT, UPDATE_DT \n");
		query.append("   FROM VN_FEATURED_PROD \n");
		query.append("  WHERE GESI_NO = ? \n");

		qd = new QueryData(query.toString());
		qd.addValue(gesiNo);
		dao.exeSql(con, qd, 1, 1);

		return dao;
	}

	/**
	 * Featured Products IMAGE 조회
	 */
	public Dao selectFeaturedProductsImage(Connection con, int gesiNo) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" SELECT GESI_NO, NO, PROD_NM, URL, IMAGE, ORG_IMAGE, INPUT_DT, UPDATE_DT \n");
		query.append("   FROM VN_FEATURED_PROD_IMAGE \n");
		query.append("  WHERE GESI_NO = ? \n");

		qd = new QueryData(query.toString());
		qd.addValue(gesiNo);
		dao.exeSql(con, qd, 1, 0);

		return dao;
	}

	/**
	 * Featured Products IMAGE 조회
	 */
	public Dao selectFeaturedProductsImageIsNotNull(Connection con, int gesiNo) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" SELECT GESI_NO, NO, PROD_NM, URL, IMAGE, ORG_IMAGE, INPUT_DT, UPDATE_DT \n");
		query.append("   FROM VN_FEATURED_PROD_IMAGE \n");
		query.append("  WHERE GESI_NO = ? \n");
		query.append("    AND IMAGE IS NOT NULL \n");

		qd = new QueryData(query.toString());
		qd.addValue(gesiNo);
		dao.exeSql(con, qd, 1, 0);

		return dao;
	}

	/**
	 * Featured Products  입력
	 */
	public void insertFeaturedProduct(Connection con, HashMap<String, String> dataMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" INSERT INTO VN_FEATURED_PROD (GESI_NO, GESI_SDAY, GESI_EDAY, INPUT_DT, UPDATE_DT) \n");
		query.append(" VALUES (?, ?, ?, TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS'), TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')) \n");

		qd = new QueryData(query.toString());
		qd.addValue(dataMap.get("gesiNo"));
		qd.addValue(dataMap.get("gesiSday"));
		qd.addValue(dataMap.get("gesiEday"));
		dao.exeSql(con, qd);
	}

	/**
	 * Featured Products Image 입력
	 */
	public void insertFeaturedProductImage(Connection con, HashMap<String, String> dataMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" INSERT INTO VN_FEATURED_PROD_IMAGE (GESI_NO, NO, PROD_NM, URL, IMAGE, ORG_IMAGE, INPUT_DT, UPDATE_DT) \n");
		query.append(" VALUES (?, ?, ?, ?, ?, ?, TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS'), TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')) \n");

		qd = new QueryData(query.toString());
		qd.addValue(dataMap.get("gesiNo"));
		qd.addValue(dataMap.get("no"));
		qd.addValue(dataMap.get("prodNm"));
		qd.addValue(dataMap.get("url"));
		qd.addValue(dataMap.get("image"));
		qd.addValue(dataMap.get("orgImage"));
		dao.exeSql(con, qd);
	}

	/**
	 * Featured Products  수정
	 */
	public void updateFeaturedProduct(Connection con, HashMap<String, String> dataMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" UPDATE VN_FEATURED_PROD \n");
		query.append("    SET GESI_SDAY = ?, \n");
		query.append("        GESI_EDAY = ?, \n");
		query.append("        UPDATE_DT = TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS') \n");
		query.append("  WHERE GESI_NO = ? \n");

		qd = new QueryData(query.toString());
		qd.addValue(dataMap.get("gesiSday"));
		qd.addValue(dataMap.get("gesiEday"));
		qd.addValue(dataMap.get("gesiNo"));
		dao.exeSql(con, qd);
	}

	/**
	 * Featured Products  삭제
	 */
	public void deleteFeaturedProduct(Connection con, int gesiNo) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" DELETE VN_FEATURED_PROD \n");
		query.append("  WHERE GESI_NO = ? \n");

		qd = new QueryData(query.toString());
		qd.addValue(gesiNo);
		dao.exeSql(con, qd);
	}

	/**
	 * Featured Products Image 조회
	 */
	public Dao selectFeatureProductImage(Connection con, int gesiNo) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" SELECT GESI_NO, NO, PROD_NM, URL, IMAGE, ORG_IMAGE \n");
		query.append("   FROM VN_FEATURED_PROD_IMAGE \n");
		query.append("  WHERE GESI_NO = ? \n");

		qd = new QueryData(query.toString());
		qd.addValue(gesiNo);
		dao.exeSql(con, qd, 1, 0);

		return dao;
	}

	/**
	 * Featured Products Image 조회
	 */
	public Dao selectFeatureProductImage(Connection con, HashMap<String, String> dataMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" SELECT GESI_NO, NO, PROD_NM, URL, IMAGE, ORG_IMAGE, INPUT_DT, UPDATE_DT \n");
		query.append("   FROM VN_FEATURED_PROD_IMAGE \n");
		query.append("  WHERE GESI_NO = ? \n");
		query.append("    AND NO = ? \n");

		qd = new QueryData(query.toString());
		qd.addValue(dataMap.get("gesiNo"));
		qd.addValue(dataMap.get("no"));
		dao.exeSql(con, qd, 1, 0);

		return dao;
	}

	/**
	 * Featured Products Image 수정
	 */
	public void updateFeaturedProductImage(Connection con, HashMap<String, String> dataMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" UPDATE VN_FEATURED_PROD_IMAGE \n");
		query.append("    SET PROD_NM = ?, \n");
		query.append("        URL = ?, \n");

		if("Y".equals(dataMap.get("imageChangeFlag")))
		{
			query.append("        IMAGE = ?, \n");
			query.append("        ORG_IMAGE = ?, \n");
		}

		query.append("        UPDATE_DT = TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS') \n");
		query.append("  WHERE GESI_NO = ? \n");
		query.append("    AND NO = ? \n");

		qd = new QueryData(query.toString());
		qd.addValue(dataMap.get("prodNm"));
		qd.addValue(dataMap.get("url"));

		if("Y".equals(dataMap.get("imageChangeFlag")))
		{
			qd.addValue(dataMap.get("image"));
			qd.addValue(dataMap.get("orgImage"));
		}

		qd.addValue(dataMap.get("gesiNo"));
		qd.addValue(dataMap.get("no"));
		dao.exeSql(con, qd);
	}

	/**
	 * Featured Products Image 삭제
	 */
	public void deleteFeaturedProductImage(Connection con, HashMap<String, String> dataMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" DELETE VN_FEATURED_PROD_IMAGE  \n");
		query.append("  WHERE GESI_NO = ? \n");
		query.append("    AND NO = ? \n");

		qd = new QueryData(query.toString());
		qd.addValue(dataMap.get("gesiNo"));
		qd.addValue(dataMap.get("no"));
		dao.exeSql(con, qd);
	}

	/**
	 * Featured Products Image 삭제
	 */
	public void deleteFeaturedProductImage(Connection con, int gesiNo) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" DELETE VN_FEATURED_PROD_IMAGE  \n");
		query.append("  WHERE GESI_NO = ? \n");

		qd = new QueryData(query.toString());
		qd.addValue(gesiNo);
		dao.exeSql(con, qd);
	}

	/**
	 * 메인 Featured Products 리스트
	 */
	public Dao selectMainFeaturedProdList(Connection con) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" SELECT  \n");
		query.append("   F.GESI_NO, P.NO, P.PROD_NM, P.URL, P.IMAGE, P.ORG_IMAGE, P.INPUT_DT, P.UPDATE_DT \n");
		query.append(" FROM ( \n");
		query.append("   SELECT MAX(GESI_NO) GESI_NO FROM VN_FEATURED_PROD \n");
		query.append("   WHERE TO_CHAR(SYSDATE, 'YYYYMMDD')||'000000' BETWEEN GESI_SDAY AND GESI_EDAY  \n");
		query.append(" ) F, VN_FEATURED_PROD_IMAGE P \n");
		query.append(" WHERE F.GESI_NO = P.GESI_NO \n");

		qd = new QueryData(query.toString());
		dao.exeSql(con, qd, 1, 0);

		// 게시 기간이 없을시엔 최근 등록 Featured Products 리스트를 가져옴
		if(dao.getRowCnt() == 0){
		  query.append(" SELECT  \n");
		  query.append("   F.GESI_NO, P.NO, P.PROD_NM, P.URL, P.IMAGE, P.ORG_IMAGE, P.INPUT_DT, P.UPDATE_DT \n");
		  query.append(" FROM ( \n");
		  query.append("   SELECT MAX(GESI_NO) GESI_NO FROM VN_FEATURED_PROD \n");
		  query.append(" ) F, VN_FEATURED_PROD_IMAGE P \n");
		  query.append(" WHERE F.GESI_NO = P.GESI_NO \n");
		  qd = new QueryData(query.toString());
		  dao.exeSql(con, qd, 1, 0);
		}

		return dao;
	}
}