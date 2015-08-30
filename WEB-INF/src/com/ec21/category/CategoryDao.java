package com.ec21.board;

import java.sql.Connection;
import java.util.HashMap;

import com.ec21.common.Dao;
import com.ec21.common.QueryData;

public class CategoryDao
{
	private static final CategoryDao instance = new CategoryDao();

	public static CategoryDao getInstance()
	{
		return instance;
	}

	public CategoryDao()
	{
	}

	/**
	 * 게시판 검색 리스트 총 갯수
	 */
	public Dao selectProductListTotalCount(Connection con, HashMap<String, String> searchMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		/*
		query.append(" SELECT COUNT(1) CNT \n");
		query.append("   FROM VN_NEWS_BOARD \n");
		query.append("  WHERE NEWS_TYPE = ? \n");

		if(!"".equals(searchMap.get("searchType")) && !"".equals(searchMap.get("searchData")))
			query.append("    AND ").append(searchMap.get("searchType")).append(" LIKE '%'||?||'%' \n");

		qd = new QueryData(query.toString());
		qd.addValue(searchMap.get("newsType"));

		if(!"".equals(searchMap.get("searchType")) && !"".equals(searchMap.get("searchData")))
			qd.addValue(searchMap.get("searchData"));
		*/
		dao.exeSql(con, qd, 1, 1);

		return dao;
	}

	/**
	 * 게시판 검색 리스트
	 */
	public Dao selectProductList(Connection con, int startRow, int endRow, HashMap<String, String> searchMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		/*
		query.append(" SELECT * \n");
		query.append("   FROM ( \n");
		query.append("         SELECT ROWNUM RM, A.* \n");
		query.append("           FROM ( SELECT NEWS_TYPE, NEWS_NO, WRITER, TITLE, CONTENTS, SUMMARY, LIST_IMAGE, ORG_LIST_IMAGE, ATT_FILE, ORG_ATT_FILE,\n");
		query.append("                         READ_CNT, DISPLAY, INPUT_DT, UPDATE_DT \n");
		query.append("                    FROM VN_NEWS_BOARD \n");
		query.append("                   WHERE NEWS_TYPE = ? \n");

		if(!"".equals(searchMap.get("searchType")) && !"".equals(searchMap.get("searchData")))
			query.append("                     AND ").append(searchMap.get("searchType")).append(" LIKE '%'||?||'%' \n");

		query.append("                   ORDER BY INPUT_DT DESC\n");
		query.append("                ) A \n");
		query.append("          WHERE ROWNUM <= ?  )   \n");
		query.append("   WHERE RM >= ? \n");

		qd = new QueryData(query.toString());
		qd.addValue(searchMap.get("newsType"));

		if(!"".equals(searchMap.get("searchType")) && !"".equals(searchMap.get("searchData")))
			qd.addValue(searchMap.get("searchData"));
		*/

		qd.addValue(endRow);
		qd.addValue(startRow);
		dao.exeSql(con, qd, 1, 0);

		return dao;
	}
}