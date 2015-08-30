package com.ec21.expand_comp;

import java.sql.Connection;
import java.util.HashMap;

import com.ec21.common.Dao;
import com.ec21.common.QueryData;

public class VnExpandCompDao
{
	private static final VnExpandCompDao instance = new VnExpandCompDao();

	public static VnExpandCompDao getInstance()
	{
		return instance;
	}

	public VnExpandCompDao()
	{

	}

	/**
	 * 시퀀스 생성
	 */
	public Dao selectExpNoSeq(Connection con) throws Exception
	{
		Dao dao = new Dao();

		StringBuilder query = new StringBuilder();
		query.append(" SELECT VN_EXPAND_COMP_SEQ.NEXTVAL EXP_NO FROM DUAL \n");
		dao.exeSql(con, query.toString(), 1, 1);

		return dao;
	}

	/**
	 * Korean Companies in VN 검색 리스트 총 갯수
	 */
	public Dao selectExpandCompListTotalCount(Connection con, HashMap<String, String> searchMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" SELECT COUNT(1) CNT \n");
		query.append("   FROM VN_EXPAND_COMP \n");
		query.append("  WHERE 1 = 1 \n");

		if(!"".equals(searchMap.get("searchType")) && !"".equals(searchMap.get("searchData")))
			query.append("    AND ").append(searchMap.get("searchType")).append(" LIKE '%'||?||'%' \n");

		if(!"".equals(searchMap.get("searchType2")) && !"".equals(searchMap.get("searchData2")))
			query.append("    AND ").append(searchMap.get("searchType2")).append(" LIKE '%'||?||'%' \n");

		if(!"".equals(searchMap.get("searchCate")))
			query.append("    AND CATEGORY_ID = ? \n");

		qd = new QueryData(query.toString());

		if(!"".equals(searchMap.get("searchType")) && !"".equals(searchMap.get("searchData")))
			qd.addValue(searchMap.get("searchData"));

		if(!"".equals(searchMap.get("searchType2")) && !"".equals(searchMap.get("searchData2")))
			qd.addValue(searchMap.get("searchData2"));

		if(!"".equals(searchMap.get("searchCate")))
		  qd.addValue(searchMap.get("searchCate"));

		dao.exeSql(con, qd, 1, 1);

		return dao;
	}

	/**
	 * Korean Companies in VN 검색 리스트
	 */
	public Dao selectExpandCompList(Connection con, int startRow, int endRow, HashMap<String, String> searchMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" SELECT * \n");
		query.append("   FROM ( \n");
		query.append("         SELECT ROWNUM RM, A.* \n");
		query.append("           FROM ( SELECT EXP_NO, COMP_NM, LOCAL_AREA, TEL_NO, FAX_NO, WEB_SITE, GOBIZ_ID, \n");
		query.append("                         CATEGORY_ID, getUnspscEName(CATEGORY_ID) CATEGORY_NM, \n");
		query.append("                         INPUT_DT, UPDATE_DT \n");
		query.append("                    FROM VN_EXPAND_COMP A\n");
		query.append("                   WHERE 1 = 1 \n");

		if(!"".equals(searchMap.get("searchType")) && !"".equals(searchMap.get("searchData")))
			query.append("                     AND ").append(searchMap.get("searchType")).append(" LIKE '%'||?||'%' \n");
		if(!"".equals(searchMap.get("searchType2")) && !"".equals(searchMap.get("searchData2")))
			query.append("                     AND ").append(searchMap.get("searchType2")).append(" LIKE '%'||?||'%' \n");
		if(!"".equals(searchMap.get("searchCate")))
			query.append("                     AND CATEGORY_ID = ? \n");

		query.append("                  ORDER BY INPUT_DT DESC \n");
		query.append("                ) A \n");
		query.append("          WHERE ROWNUM <= ?  )   \n");
		query.append("   WHERE RM >= ? \n");

		qd = new QueryData(query.toString());

		if(!"".equals(searchMap.get("searchType")) && !"".equals(searchMap.get("searchData")))
			qd.addValue(searchMap.get("searchData"));

		if(!"".equals(searchMap.get("searchType2")) && !"".equals(searchMap.get("searchData2")))
			qd.addValue(searchMap.get("searchData2"));

		if(!"".equals(searchMap.get("searchCate")))
		  qd.addValue(searchMap.get("searchCate"));

		qd.addValue(endRow);
		qd.addValue(startRow);
		dao.exeSql(con, qd, 1, 0);

		return dao;
	}

	/**
	 * Korean Companies in VN 상세 조회
	 */
	public Dao selectExpandComp(Connection con, int expNo) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" SELECT EXP_NO, COMP_NM, LOCAL_ADDR, COUNTRY_CD, LOCAL_AREA, \n");
		query.append("        TEL_NO, FAX_NO, EMAIL, WEB_SITE, EXPAND_YEAR, EMPLOYEE, SALES_AMOUNT, INVEST_AMOUNT, GOBIZ_ID, \n");
		query.append("        CATEGORY_ID, getUnspscEName(CATEGORY_ID) CATEGORY_NM, \n");
		query.append("        INPUT_DT, UPDATE_DT \n");
		query.append("   FROM VN_EXPAND_COMP \n");
		query.append("  WHERE EXP_NO = ? \n");

		qd = new QueryData(query.toString());
		qd.addValue(expNo);
		dao.exeSql(con, qd, 1, 1);

		return dao;
	}

	/**
	 * Korean Companies in VN 중 GOBIZKOREA ID 조회
	 */
	public Dao selectGobizId(Connection con, String gobizId) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" SELECT USERID, GBN  \n");
		query.append("   FROM MP_MEM  \n");
		query.append("  WHERE USERID = ? \n");

		qd = new QueryData(query.toString());
		qd.addValue(gobizId);
		dao.exeSql(con, qd, 1, 1);

		return dao;
	}

	/**
	 * Korean Companies in VN 입력
	 */
	public void insertExpandComp(Connection con, HashMap<String, String> dataMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" INSERT INTO VN_EXPAND_COMP (EXP_NO, COMP_NM, LOCAL_ADDR, COUNTRY_CD, LOCAL_AREA, TEL_NO, FAX_NO, EMAIL, WEB_SITE, EXPAND_YEAR, EMPLOYEE, SALES_AMOUNT, INVEST_AMOUNT, GOBIZ_ID, CATEGORY_ID, INPUT_DT, UPDATE_DT) \n");
		query.append("                    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS'), TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')) \n");

		qd = new QueryData(query.toString());
		qd.addValue(dataMap.get("exp_no"));
		qd.addValue(dataMap.get("comp_nm"));
		qd.addValue(dataMap.get("local_addr"));
		qd.addValue(dataMap.get("country_cd"));
		qd.addValue(dataMap.get("local_area"));
		qd.addValue(dataMap.get("tel_no"));
		qd.addValue(dataMap.get("fax_no"));
		qd.addValue(dataMap.get("email"));
		qd.addValue(dataMap.get("web_site"));
		qd.addValue(dataMap.get("expand_year"));
		qd.addValue(dataMap.get("employee"));
		qd.addValue(dataMap.get("sales_amount"));
		qd.addValue(dataMap.get("invest_amount"));
		qd.addValue(dataMap.get("gobiz_id"));
		qd.addValue(dataMap.get("category_id"));
		dao.exeSql(con, qd);
	}

	/**
	 * Korean Companies in VN 수정
	 */
	public void updateExpandComp(Connection con, HashMap<String, String> dataMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" UPDATE VN_EXPAND_COMP  \n");
		query.append("    SET COMP_NM = ?, \n");
		query.append("        LOCAL_ADDR = ?, \n");
		query.append("        COUNTRY_CD = ?, \n");
		query.append("        LOCAL_AREA = ?, \n");
		query.append("        TEL_NO = ?, \n");
		query.append("        FAX_NO = ?, \n");
		query.append("        EMAIL = ?, \n");
		query.append("        WEB_SITE = ?, \n");
		query.append("        EXPAND_YEAR = ?, \n");
		query.append("        EMPLOYEE = ?, \n");
		query.append("        SALES_AMOUNT = ?, \n");
		query.append("        INVEST_AMOUNT = ?, \n");
		query.append("        GOBIZ_ID = ?, \n");
		query.append("        CATEGORY_ID = ?, \n");
		query.append("        UPDATE_DT = TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS') \n");
		query.append("  WHERE EXP_NO = ? \n");

		qd = new QueryData(query.toString());
		qd.addValue(dataMap.get("comp_nm"));
		qd.addValue(dataMap.get("local_addr"));
		qd.addValue(dataMap.get("country_cd"));
		qd.addValue(dataMap.get("local_area"));
		qd.addValue(dataMap.get("tel_no"));
		qd.addValue(dataMap.get("fax_no"));
		qd.addValue(dataMap.get("email"));
		qd.addValue(dataMap.get("web_site"));
		qd.addValue(dataMap.get("expand_year"));
		qd.addValue(dataMap.get("employee"));
		qd.addValue(dataMap.get("sales_amount"));
		qd.addValue(dataMap.get("invest_amount"));
		qd.addValue(dataMap.get("gobiz_id"));
		qd.addValue(dataMap.get("category_id"));
		qd.addValue(dataMap.get("exp_no"));
		dao.exeSql(con, qd);

	}

	/**
	 * Korean Companies in VN 삭제
	 */
	public void deleteExpandComp(Connection con, int expNo) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" DELETE FROM VN_EXPAND_COMP  \n");
		query.append("  WHERE EXP_NO = ? \n");

		qd = new QueryData(query.toString());
		qd.addValue(expNo);
		dao.exeSql(con, qd);
	}


}