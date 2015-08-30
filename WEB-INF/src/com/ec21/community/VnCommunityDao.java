package com.ec21.community;

import java.sql.Connection;
import java.util.HashMap;

import com.ec21.common.Dao;
import com.ec21.common.QueryData;

public class VnCommunityDao
{
	private static final VnCommunityDao instance = new VnCommunityDao();

	public static VnCommunityDao getInstance()
	{
		return instance;
	}

	public VnCommunityDao() {}

	//커뮤니티 리스트 총 갯수
	public Dao getCommunityListTotalCount(Connection con, HashMap<String, String> searchMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" SELECT COUNT(1) CNT \n");
		query.append("   FROM VN_COMMUNITY \n");

		if(!"".equals(searchMap.get("searchType")) && !"".equals(searchMap.get("searchData")))
			query.append("    WHERE ").append(searchMap.get("searchType")).append(" LIKE '%'||?||'%' \n");

		qd = new QueryData(query.toString());

		if(!"".equals(searchMap.get("searchType")) && !"".equals(searchMap.get("searchData")))
			qd.addValue(searchMap.get("searchData"));

		dao.exeSql(con, qd, 1, 1);

		return dao;
	}

	//커뮤니티 리스트 총 갯수
	public Dao getCommunityListTotalCount(Connection con, String searchData) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" SELECT COUNT(1) CNT \n");
		query.append("   FROM VN_COMMUNITY \n");
		query.append("    WHERE TITLE||CONTENT LIKE '%'||?||'%' \n");

		qd = new QueryData(query.toString());


		qd.addValue(searchData);

		dao.exeSql(con, qd, 1, 1);

		return dao;
	}

	//커뮤니티 리스트
	public Dao getCommunityList(Connection con, int startRow, int endRow, HashMap<String, String> searchMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" SELECT * \n");
		query.append("   FROM ( \n");
		query.append("         SELECT ROWNUM RM, A.* \n");
		query.append("           FROM ( SELECT COM_NO, TITLE, WRITER, CONTENT, \n");
		query.append("                         INPUT_DT, UPDATE_DT, READ_CNT, \n");
		query.append("                         (SELECT COUNT(1) FROM VN_COMMUNITY_REPLY WHERE COMP_NO = COM_NO ) REPLY  \n");
		query.append("                    FROM VN_COMMUNITY \n");

		if(!"".equals(searchMap.get("searchType")) && !"".equals(searchMap.get("searchData")))
			query.append("                     WHERE ").append(searchMap.get("searchType")).append(" LIKE '%'||?||'%' \n");
		query.append("                  ORDER BY INPUT_DT DESC     \n");
		query.append("                ) A \n");
		query.append("          WHERE ROWNUM <= ?    \n");
		query.append("          )   \n");
		query.append("   WHERE RM >= ? \n");

		qd = new QueryData(query.toString());

		if(!"".equals(searchMap.get("searchType")) && !"".equals(searchMap.get("searchData")))
			qd.addValue(searchMap.get("searchData"));

		qd.addValue(endRow);
		qd.addValue(startRow);
		dao.exeSql(con, qd, 1, 0);

		return dao;

	}

	//커뮤니티 리스트
	public Dao getCommunityList(Connection con, int startRow, int endRow, String searchData) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" SELECT * \n");
		query.append("   FROM ( \n");
		query.append("         SELECT ROWNUM RM, A.* \n");
		query.append("           FROM ( SELECT COM_NO, TITLE, WRITER, CONTENT, \n");
		query.append("                         INPUT_DT, UPDATE_DT, READ_CNT, \n");
		query.append("                         (SELECT COUNT(1) FROM VN_COMMUNITY_REPLY WHERE COMP_NO = COM_NO ) REPLY  \n");
		query.append("                    FROM VN_COMMUNITY \n");
		query.append("                    WHERE TITLE||CONTENT LIKE '%'||?||'%' \n");
		query.append("                  ORDER BY INPUT_DT DESC     \n");
		query.append("                ) A \n");
		query.append("          WHERE ROWNUM <= ?    \n");
		query.append("          )   \n");
		query.append("   WHERE RM >= ? \n");

		qd = new QueryData(query.toString());

		qd.addValue(searchData);

		qd.addValue(endRow);
		qd.addValue(startRow);
		dao.exeSql(con, qd, 1, 0);

		return dao;

	}

	//커뮤니티 상세 보기
	public Dao getCommunityView(Connection con, int comNo) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();

		query.append(" SELECT *  \n");
		query.append(" 	FROM VN_COMMUNITY \n");
		query.append(" 		WHERE  COM_NO = ? \n");

		qd = new QueryData(query.toString());
		qd.addValue(comNo);
		dao.exeSql(con, qd, 1, 0);

		return dao;
	}

	//커뮤니티 등록
	public void communityInsert(Connection con, HashMap<String, String> dataMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" INSERT INTO VN_COMMUNITY (COM_NO, TITLE, WRITER, CONTENT, INPUT_DT, UPDATE_DT, READ_CNT) \n");
		query.append("                    VALUES (?, ?, ?, ?, TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS'), TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS'), 0) \n");

		qd = new QueryData(query.toString());
		qd.addValue(dataMap.get("comNo"));
		qd.addValue(dataMap.get("title"));
		qd.addValue(dataMap.get("writer"));
		qd.addValue(dataMap.get("content"));

		dao.exeSql(con, qd);
	}

	//커뮤니티 수정
	public void communityEdit(Connection con, HashMap<String , String> dataMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();

		query.append(" UPDATE VN_COMMUNITY  \n");
		query.append(" 	SET TITLE = ?, \n");
		query.append(" 		CONTENT = ?, \n");
		query.append(" 		UPDATE_DT = TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS') \n");
		query.append(" 	WHERE COM_NO = ? \n");


		qd = new QueryData(query.toString());
		qd.addValue(dataMap.get("title"));
		qd.addValue(dataMap.get("content"));
		qd.addValue(dataMap.get("comNo"));

		dao.exeSql(con, qd);
	}

	//커뮤니티 삭제
	public void communityDelete(Connection con, int comNo) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" DELETE FROM VN_COMMUNITY \n");
		query.append(" WHERE COM_NO = ? \n");

		qd = new QueryData(query.toString());
		qd.addValue(comNo);
		dao.exeSql(con, qd);
	}

	//커뮤니티 댓글 수정
	public void communityReplyEdit(Connection con, HashMap<String, String> dataMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" UPDATE VN_COMMUNITY_REPLY  \n");
		query.append(" 	SET TITLE = ?, \n");
		query.append(" 		CONTENT = ?, \n");
		query.append(" 		UPDATE_DT = TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS') \n");
		query.append(" 	WHERE COMP_NO = ? \n");
		query.append(" 	AND REPLY_NO = ? \n");


		qd = new QueryData(query.toString());
		qd.addValue(dataMap.get("title"));
		qd.addValue(dataMap.get("content"));
		qd.addValue(dataMap.get("compNo"));
		qd.addValue(dataMap.get("replyNo"));

		dao.exeSql(con, qd);
	}

	//커뮤니티 댓글 등록
	public void communityReplyInsert(Connection con, HashMap<String, String> dataMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" INSERT INTO VN_COMMUNITY_REPLY (COMP_NO, REPLY_NO, TITLE, WRITER, CONTENT, INPUT_DT, UPDATE_DT) \n");
		query.append("                    VALUES (?, (SELECT NVL(MAX(REPLY_NO),0)+1 FROM VN_COMMUNITY_REPLY WHERE COMP_NO = ?), ?, ?, ?, TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS'), TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')) \n");

		qd = new QueryData(query.toString());
		qd.addValue(dataMap.get("comNo"));
		qd.addValue(dataMap.get("comNo"));
		qd.addValue(dataMap.get("title"));
		qd.addValue(dataMap.get("writer"));
		qd.addValue(dataMap.get("content"));

		dao.exeSql(con, qd);
	}

	//커뮤니티 댓글 상세 보기
	public Dao getCommunityReplyView(Connection con, int comNo) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();

		query.append(" SELECT * \n");
		query.append(" 	FROM VN_COMMUNITY_REPLY \n");
		query.append(" 		WHERE COMP_NO =  ? \n");
		query.append(" 		ORDER BY REPLY_NO DESC \n");

		qd = new QueryData(query.toString());
		qd.addValue(comNo);
		dao.exeSql(con, qd, 1, 0);

		return dao;
	}

	//커뮤니티 댓글 삭제
	public void communityReplyDelete(Connection con, int compNo, int replyNo) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" DELETE FROM VN_COMMUNITY_REPLY \n");
		query.append(" WHERE COMP_NO = ? \n");

		if(replyNo > 0)
			query.append(" AND REPLY_NO = ? \n");

		qd = new QueryData(query.toString());
		qd.addValue(compNo);

		if(replyNo > 0)
			qd.addValue(replyNo);

		dao.exeSql(con, qd);
	}

	//조회수 증가
	public void communityReadCnt(Connection con,int comNo) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" UPDATE VN_COMMUNITY  \n");
		query.append(" 	SET REPLY = REPLY + 1 \n");
		query.append(" 	WHERE COM_NO = ? \n");

		qd = new QueryData(query.toString());
		qd.addValue(comNo);

		dao.exeSql(con, qd);
	}

	//시퀀스 생성
	public Dao getCommunitySeq(Connection con) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" SELECT VN_COMMUNITY_SEQ.NEXTVAL COM_NO FROM DUAL \n");
		dao.exeSql(con, query.toString(), 1, 1);

		return dao;
	}

}