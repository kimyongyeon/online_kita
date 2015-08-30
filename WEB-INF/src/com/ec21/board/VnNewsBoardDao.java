package com.ec21.board;

import java.sql.Connection;
import java.util.HashMap;

import com.ec21.common.Dao;
import com.ec21.common.QueryData;

public class VnNewsBoardDao
{
	private static final VnNewsBoardDao instance = new VnNewsBoardDao();

	public static VnNewsBoardDao getInstance()
	{
		return instance;
	}

	public VnNewsBoardDao()
	{
		/*
		 * 게시판 타입별 (NEWS_TYPE)
		 * NN = NEWS & NOTICE
		 * IN = KOREA INDUSTRY NEWS
		 * KW = KOREA WAVE NEWS
		 */
	}

	/**
	 * 시퀀스 생성
	 */
	public Dao selectNewsNoSeq(Connection con) throws Exception
	{
		Dao dao = new Dao();

		StringBuilder query = new StringBuilder();
		query.append(" SELECT VN_NEWS_BOARD_SEQ.NEXTVAL NEWS_NO FROM DUAL \n");
		dao.exeSql(con, query.toString(), 1, 0);

		return dao;
	}

	/**
	 * 게시판 검색 리스트 총 갯수
	 */
	public Dao selectNewsListTotalCount(Connection con, HashMap<String, String> searchMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" SELECT COUNT(1) CNT \n");
		query.append("   FROM VN_NEWS_BOARD \n");
		query.append("  WHERE NEWS_TYPE = ? \n");

		if(!"".equals(searchMap.get("searchType")) && !"".equals(searchMap.get("searchData")))
			query.append("    AND ").append(searchMap.get("searchType")).append(" LIKE '%'||?||'%' \n");

		qd = new QueryData(query.toString());
		qd.addValue(searchMap.get("newsType"));

		if(!"".equals(searchMap.get("searchType")) && !"".equals(searchMap.get("searchData")))
			qd.addValue(searchMap.get("searchData"));

		dao.exeSql(con, qd, 1, 1);

		return dao;
	}

	/**
	 * 게시판 검색 리스트
	 */
	public Dao selectNewsList(Connection con, int startRow, int endRow, HashMap<String, String> searchMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
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

		qd.addValue(endRow);
		qd.addValue(startRow);
		dao.exeSql(con, qd, 1, 0);

		return dao;
	}

	/**
	 * 게시판 상세 조회
	 */
	public Dao selectNews(Connection con, String newsType, int newsNo) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" SELECT NEWS_TYPE, NEWS_NO, WRITER, TITLE, CONTENTS, SUMMARY, LIST_IMAGE, ORG_LIST_IMAGE, ATT_FILE, ORG_ATT_FILE, \n");
		query.append("        READ_CNT, DISPLAY, INPUT_DT, UPDATE_DT \n");
		query.append("   FROM VN_NEWS_BOARD \n");
		query.append("  WHERE NEWS_TYPE = ? \n");
		query.append("    AND NEWS_NO = ? \n");

		qd = new QueryData(query.toString());
		qd.addValue(newsType);
		qd.addValue(newsNo);
		dao.exeSql(con, qd, 1, 0);

		return dao;
	}

	/**
	 * 게시판의 글 입력
	 */
	public void insertNews(Connection con, HashMap<String, String> dataMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" INSERT INTO VN_NEWS_BOARD (NEWS_TYPE, NEWS_NO, WRITER, TITLE, CONTENTS, SUMMARY, LIST_IMAGE, ORG_LIST_IMAGE, ATT_FILE, ORG_ATT_FILE, READ_CNT, DISPLAY, INPUT_DT, UPDATE_DT) \n");
		query.append("                    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0, 'Y', TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS'), TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')) \n");

		qd = new QueryData(query.toString());
		qd.addValue(dataMap.get("newsType"));
		qd.addValue(dataMap.get("newsNo"));
		qd.addValue(dataMap.get("writer"));
		qd.addValue(dataMap.get("title"));
		qd.addValue(dataMap.get("contents"));
		qd.addValue(dataMap.get("summary"));
		qd.addValue(dataMap.get("listImage"));
		qd.addValue(dataMap.get("orgListImage"));
		qd.addValue(dataMap.get("attFile"));
		qd.addValue(dataMap.get("orgAttFile"));
		dao.exeSql(con, qd);
	}

	/**
	 * 게시판의 글 수정
	 */
	public void updateNews(Connection con, HashMap<String, String> dataMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" UPDATE VN_NEWS_BOARD  \n");
		query.append("    SET TITLE = ?, \n");
		query.append("        CONTENTS = ?, \n");
		query.append("        SUMMARY = ?, \n");

		//수정의 경우 입력된 값이 없으면 기존 파일 유지.
		if(!"".equals(dataMap.get("listImage")) && !"".equals(dataMap.get("orgListImage")))
		{
			query.append("        LIST_IMAGE = ?, \n");
			query.append("        ORG_LIST_IMAGE = ?, \n");
		}

		//수정의 경우 입력된 값이 없으면 기존 파일 유지.
		if(!"".equals(dataMap.get("attFile")) && !"".equals(dataMap.get("orgAttFile")))
		{
			query.append("        ATT_FILE = ?, \n");
			query.append("        ORG_ATT_FILE = ?, \n");
		}

		query.append("        DISPLAY = ?, \n");
		query.append("        UPDATE_DT = TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS') \n");
		query.append("  WHERE NEWS_NO = ? \n");

		qd = new QueryData(query.toString());
		qd.addValue(dataMap.get("title"));
		qd.addValue(dataMap.get("contents"));
		qd.addValue(dataMap.get("summary"));

		if(!"".equals(dataMap.get("listImage")) && !"".equals(dataMap.get("orgListImage")))
		{
			qd.addValue(dataMap.get("listImage"));
			qd.addValue(dataMap.get("orgListImage"));
		}

		if(!"".equals(dataMap.get("attFile")) && !"".equals(dataMap.get("orgAttFile")))
		{
			qd.addValue(dataMap.get("attFile"));
			qd.addValue(dataMap.get("orgAttFile"));
		}

		qd.addValue(dataMap.get("display"));
		qd.addValue(dataMap.get("newsNo"));
		dao.exeSql(con, qd);
	}

	/**
	 * 게시판의 글 삭제
	 */
	public void deleteNews(Connection con, String newsType, int newsNo) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" DELETE FROM VN_NEWS_BOARD  \n");
		query.append("  WHERE NEWS_TYPE = ? \n");
		query.append("    AND NEWS_NO = ? \n");

		qd = new QueryData(query.toString());
		qd.addValue(newsType);
		qd.addValue(newsNo);
		dao.exeSql(con, qd);
	}

	/**
	 * 게시판의 글 이미지와 첨부 파일
	 */
	public Dao selectImageAndAttFile(Connection con, String newsType, int newsNo) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" SELECT NEWS_NO, LIST_IMAGE, ORG_LIST_IMAGE, ATT_FILE, ORG_ATT_FILE \n");
		query.append("   FROM VN_NEWS_BOARD \n");
		query.append("  WHERE NEWS_TYPE = ? \n");
		query.append("    AND NEWS_NO = ? \n");

		qd = new QueryData(query.toString());
		qd.addValue(newsType);
		qd.addValue(newsNo);
		dao.exeSql(con, qd, 1, 1);

		return dao;
	}

	/**
	 * 게시판의 글 이미지 또는 첨부 파일 삭제
	 */
	public void updateImageOrAttFile(Connection con, int newsNo, String newsType, String type) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" UPDATE VN_NEWS_BOARD \n");

		if("IMAGE".equals(type))
		{
			query.append("    SET LIST_IMAGE = '', \n");
			query.append("        ORG_LIST_IMAGE = '' \n");
		}
		else
		{
			query.append("    SET ATT_FILE = '', \n");
			query.append("        ORG_ATT_FILE = '' \n");
		}

		query.append("  WHERE NEWS_NO = ? \n");
		query.append("    AND NEWS_TYPE = ? \n");

		qd = new QueryData(query.toString());
		qd.addValue(newsNo);
		qd.addValue(newsType);
		dao.exeSql(con, qd);
	}

	/**
	 * 게시판의 글 수정
	 */
	public void updateBoardReadCnt(Connection con, String newsType, int newsNo) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" UPDATE VN_NEWS_BOARD  \n");
		query.append("    SET READ_CNT = READ_CNT + 1 \n");
		query.append("  WHERE NEWS_NO = ? \n");
		query.append("    AND NEWS_TYPE = ? \n");

		qd = new QueryData(query.toString());
		qd.addValue(newsNo);
		qd.addValue(newsType);
		dao.exeSql(con, qd);
	}
}