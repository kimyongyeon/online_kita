package com.ec21.directory;

import java.sql.Connection;
import java.util.HashMap;

import com.ec21.common.Dao;
import com.ec21.common.QueryData;

public class VnExpDirectoryDao
{
	private static final VnExpDirectoryDao instance = new VnExpDirectoryDao();

	public static VnExpDirectoryDao getInstance()
	{
		return instance;
	}

	public VnExpDirectoryDao()
	{

	}

	/**
	 * 시퀀스 생성
	 */
	public Dao selectDirNoSeq(Connection con) throws Exception
	{
		Dao dao = new Dao();

		StringBuilder query = new StringBuilder();
		query.append(" SELECT VN_EXP_DIRECTORY_SEQ.NEXTVAL DIR_NO FROM DUAL \n");
		dao.exeSql(con, query.toString(), 1, 1);

		return dao;
	}

	/**
	 * Korean Exporters 검색 리스트 총 갯수
	 */
	public Dao selectExpDirectoryListTotalCount(Connection con, HashMap<String, String> searchMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" SELECT COUNT(1) CNT \n");
		query.append("   FROM VN_EXP_DIRECTORY \n");
		query.append("  WHERE 1 = 1 \n");

		if(!"".equals(searchMap.get("searchType")) && !"".equals(searchMap.get("searchData")))
			query.append("    AND ").append(searchMap.get("searchType")).append(" LIKE '%'||?||'%' \n");

		if(!"".equals(searchMap.get("searchCate")))
			query.append("    AND CATEGORY_ID = ? \n");

		qd = new QueryData(query.toString());

		if(!"".equals(searchMap.get("searchType")) && !"".equals(searchMap.get("searchData")))
			qd.addValue(searchMap.get("searchData"));

		if(!"".equals(searchMap.get("searchCate")))
		  qd.addValue(searchMap.get("searchCate"));

		dao.exeSql(con, qd, 1, 1);

		return dao;
	}

	/**
	 * Korean Exporters 검색 리스트
	 */
	public Dao selectExpDirectoryList(Connection con, int startRow, int endRow, HashMap<String, String> searchMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" SELECT * \n");
		query.append("   FROM ( \n");
		query.append("         SELECT ROWNUM RM, A.* \n");
		query.append("           FROM ( SELECT DIR_NO, COMP_NM, ADDR, CEO, TEL_NO, FAX_NO, WEB_SITE, GOBIZ_ID, \n");
		query.append("                         CATEGORY_ID, getUnspscEName(CATEGORY_ID) CATEGORY_NM, \n");
		query.append("                         INPUT_DT, UPDATE_DT \n");
		query.append("                    FROM VN_EXP_DIRECTORY A\n");
		query.append("                   WHERE 1 = 1 \n");

		if(!"".equals(searchMap.get("searchType")) && !"".equals(searchMap.get("searchData")))
			query.append("                     AND ").append(searchMap.get("searchType")).append(" LIKE '%'||?||'%' \n");
		if(!"".equals(searchMap.get("searchCate")))
			query.append("                     AND CATEGORY_ID = ? \n");

		query.append("                  ORDER BY INPUT_DT DESC \n");
		query.append("                ) A \n");
		query.append("          WHERE ROWNUM <= ?  )   \n");
		query.append("   WHERE RM >= ? \n");

		qd = new QueryData(query.toString());

		if(!"".equals(searchMap.get("searchType")) && !"".equals(searchMap.get("searchData")))
			qd.addValue(searchMap.get("searchData"));

		if(!"".equals(searchMap.get("searchCate")))
		  qd.addValue(searchMap.get("searchCate"));

		qd.addValue(endRow);
		qd.addValue(startRow);
		dao.exeSql(con, qd, 1, 0);

		return dao;
	}

	/**
	 * Korean Exporters 상세 조회
	 */
	public Dao selectExpDirectory(Connection con, int dirNo) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" SELECT DIR_NO, COMP_NM, ADDR, CEO, TEL_NO, FAX_NO, WEB_SITE, GOBIZ_ID, \n");
		query.append("        CATEGORY_ID, getUnspscEName(CATEGORY_ID) CATEGORY_NM, \n");
		query.append("        INPUT_DT, UPDATE_DT \n");
		query.append("   FROM VN_EXP_DIRECTORY \n");
		query.append("  WHERE DIR_NO = ? \n");

		qd = new QueryData(query.toString());
		qd.addValue(dirNo);
		dao.exeSql(con, qd, 1, 1);

		return dao;
	}

	/**
	 * Korean Exporters 중 GOBIZKOREA ID 조회
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
	 * Korean Exporters 입력
	 */
	public void insertExpDirectory(Connection con, HashMap<String, String> dataMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" INSERT INTO VN_EXP_DIRECTORY (DIR_NO, COMP_NM, ADDR, CEO, TEL_NO, FAX_NO, WEB_SITE, GOBIZ_ID, CATEGORY_ID, INPUT_DT, UPDATE_DT) \n");
		query.append("                    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS'), TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')) \n");

		qd = new QueryData(query.toString());
		qd.addValue(dataMap.get("dir_no"));
		qd.addValue(dataMap.get("comp_nm"));
		qd.addValue(dataMap.get("addr"));
		qd.addValue(dataMap.get("ceo"));
		qd.addValue(dataMap.get("tel_no"));
		qd.addValue(dataMap.get("fax_no"));
		qd.addValue(dataMap.get("web_site"));
		qd.addValue(dataMap.get("gobiz_id"));
		qd.addValue(dataMap.get("category_id"));
		dao.exeSql(con, qd);
	}

	/**
	 * Korean Exporters 수정
	 */
	public void updateExpDirectory(Connection con, HashMap<String, String> dataMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" UPDATE VN_EXP_DIRECTORY  \n");
		query.append("    SET COMP_NM = ?, \n");
		query.append("        ADDR = ?, \n");
		query.append("        CEO = ?, \n");
		query.append("        FAX_NO = ?, \n");
		query.append("        TEL_NO = ?, \n");
		query.append("        WEB_SITE = ?, \n");
		query.append("        GOBIZ_ID = ?, \n");
		query.append("        CATEGORY_ID = ?, \n");
		query.append("        UPDATE_DT = TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS') \n");
		query.append("  WHERE DIR_NO = ? \n");

		qd = new QueryData(query.toString());
		qd.addValue(dataMap.get("comp_nm"));
		qd.addValue(dataMap.get("addr"));
		qd.addValue(dataMap.get("ceo"));
		qd.addValue(dataMap.get("tel_no"));
		qd.addValue(dataMap.get("fax_no"));
		qd.addValue(dataMap.get("web_site"));
		qd.addValue(dataMap.get("gobiz_id"));
		qd.addValue(dataMap.get("category_id"));
		qd.addValue(dataMap.get("dir_no"));
		dao.exeSql(con, qd);
	}

	/**
	 * Korean Exporters 삭제
	 */
	public void deleteExpDirectory(Connection con, int dirNo) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" DELETE FROM VN_EXP_DIRECTORY  \n");
		query.append("  WHERE DIR_NO = ? \n");

		qd = new QueryData(query.toString());
		qd.addValue(dirNo);
		dao.exeSql(con, qd);
	}


}