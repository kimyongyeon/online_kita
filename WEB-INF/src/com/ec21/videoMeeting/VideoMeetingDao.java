package com.ec21.videoMeeting;

import java.sql.Connection;
import java.util.HashMap;

import com.ec21.common.Dao;
import com.ec21.common.QueryData;

public class VideoMeetingDao
{
	private static final VideoMeetingDao instance = new VideoMeetingDao();

	public static VideoMeetingDao getInstance()
	{
		return instance;
	}

	public VideoMeetingDao()
	{

	}

	public Dao selectEvmSeq(Connection con) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" SELECT NVL(MAX(SEQ), 0) + 1 AS SEQ \n");
		query.append("   FROM EVM_BUYER \n");

		qd = new QueryData(query.toString());
		dao.exeSql(con, qd, 1, 1);

		return dao;
	}

	/**
	 * 바이어 입력
	 */
	public void insertBuyer(Connection con, String evmSeq, HashMap<String, String> dataMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" INSERT INTO EVM_BUYER(SEQ, COMPANY_NM, BUYER_NM, EMAIL, ADDRESS, PHONE, FAX, WEBSITE, CTR_CD, TALK_DATE, \n");
		query.append(" 						TALK_TIME, TALK_DATE2, TALK_TIME2, TALK_DATE3, TALK_TIME3, TALK_DATE4, TALK_TIME4, MEET_NUM, UNSPSC, BLOG_ID, \n");
		query.append(" 						OBJ_ID, PWD, STATUS, USE_YN, INPUT_DATE, SELECT_YN, GMT, EMEMO ) \n");
		query.append(" 				VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, SYSDATE, ?, ?, ?) \n");
		qd = new QueryData(query.toString());
		qd.addValue(evmSeq);
		qd.addValue(dataMap.get("companyNm"));
		qd.addValue(dataMap.get("buyerNm"));
		qd.addValue(dataMap.get("email"));
		qd.addValue(dataMap.get("address"));
		qd.addValue(dataMap.get("phone"));
		qd.addValue(dataMap.get("fax"));
		qd.addValue(dataMap.get("website"));
		qd.addValue(dataMap.get("ctrCd"));
		qd.addValue(dataMap.get("talkDate"));
		qd.addValue(dataMap.get("talkTime"));
		qd.addValue(dataMap.get("talkDate2"));
		qd.addValue(dataMap.get("talkTime2"));
		qd.addValue(dataMap.get("talkDate3"));
		qd.addValue(dataMap.get("talkTime3"));
		qd.addValue(dataMap.get("talkDate4"));
		qd.addValue(dataMap.get("talkTime4"));
		qd.addValue(dataMap.get("meetNum"));
		qd.addValue(dataMap.get("unspsc"));
		qd.addValue(dataMap.get("blogId"));
		qd.addValue(dataMap.get("objId"));
		qd.addValue(dataMap.get("pwd"));
		qd.addValue("1");
		qd.addValue("Y");
		qd.addValue("N");
		qd.addValue(dataMap.get("gmt"));
		qd.addValue(dataMap.get("ememo"));
		dao.exeSql(con, qd);
	}

	/**
	 * Buyer Status 리스트 총 갯수
	 */
	public Dao selectBuyerStatusTotalCount(Connection con, HashMap<String, String> searchMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;
		String searchType = searchMap.get("searchType");
		String searchData = searchMap.get("searchData");

		StringBuilder query = new StringBuilder();
		query.append(" SELECT COUNT(1) CNT \n");
		query.append("   FROM EVM_BUYER A , MP_UNSPSC B, MP_CTR_CD2 C \n");
		query.append("  WHERE A.USE_YN = 'Y' \n");
		query.append("    AND A.UNSPSC = B.UNSPSC \n");
		query.append("    AND A.CTR_CD = C.CODE \n");

		if(!"".equals(searchType) && !"".equals(searchData))
		{
			if("1".equals(searchType))
				query.append("    AND UPPER(A.COMPANY_NM) LIKE '%'||UPPER(?)||'%' \n");
			else if("2".equals(searchType))
				query.append("    AND ( C.NAME_KR LIKE '%'||?||'%'  OR UPPER(C.NAME_EN) LIKE '%'||UPPER(?)||'%') \n");
			else if("3".equals(searchType))
				query.append("    AND (A.KMEMO LIKE '%'||?||'%' OR UPPER(A.EMEMO) LIKE  '%'||UPPER(?)||'%') \n");
		}

		qd = new QueryData(query.toString());

		if(!"".equals(searchType) && !"".equals(searchData))
		{
			if("1".equals(searchType))
				qd.addValue(searchData);
			else if("2".equals(searchType) || "3".equals(searchType))
			{
				qd.addValue(searchData);
				qd.addValue(searchData);
			}
		}

		dao.exeSql(con, qd, 1, 1);

		return dao;
	}

	/**
	 * Buyer Status 리스트
	 */
	public Dao selectBuyerStatusList(Connection con, int startRow, int endRow, HashMap<String, String> searchMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		String searchType = searchMap.get("searchType");
		String searchData = searchMap.get("searchData");

		StringBuilder query = new StringBuilder();
		query.append(" SELECT * \n");
		query.append("   FROM ( \n");
		query.append("         SELECT ROWNUM RM, A.* \n");
		query.append("           FROM ( SELECT A.SEQ , A.COMPANY_NM, A.BUYER_NM, A.INPUT_DATE, A.STATUS,  \n");
		query.append("                         A.CTR_CD, A.TALK_DATE, A.EMEMO, A.TALK_TIME, B.KTITLE as UN_KTITLE,  \n");
		query.append("                         B.ETITLE as UN_ETITLE, C.NAME_EN as CTR_CD_EN, C.NAME_KR as CTR_CD_KR,  \n");
		query.append("                         (SELECT COUNT(*) FROM EVM_SUPPLIER WHERE EVM_BUYER_SEQ = A.SEQ AND MATCHING_YN = 'Y') CNT_SUPPLIER   \n");
		query.append("                    FROM EVM_BUYER A , MP_UNSPSC B, MP_CTR_CD2 C \n");
		query.append("                   WHERE A.USE_YN = 'Y' \n");
		query.append("                     AND A.UNSPSC = B.UNSPSC \n");
		query.append("                     AND A.CTR_CD = C.CODE \n");

		if(!"".equals(searchType) && !"".equals(searchData))
		{
			if("1".equals(searchType))
				query.append("                     AND UPPER(A.COMPANY_NM) LIKE '%'||UPPER(?)||'%' \n");
			else if("2".equals(searchType))
				query.append("                     AND ( C.NAME_KR LIKE '%'||?||'%'  OR UPPER(C.NAME_EN) LIKE '%'||UPPER(?)||'%') \n");
			else if("3".equals(searchType))
				query.append("                     AND (A.KMEMO LIKE '%'||?||'%' OR UPPER(A.EMEMO) LIKE  '%'||UPPER(?)||'%') \n");
		}

		query.append("                   ORDER BY A.SEQ DESC \n");
		query.append("                ) A \n");
		query.append("          WHERE ROWNUM <= ?  )   \n");
		query.append("   WHERE RM >= ? \n");

		qd = new QueryData(query.toString());

		if(!"".equals(searchType) && !"".equals(searchData))
		{
			if("1".equals(searchType))
				qd.addValue(searchData);
			else if("2".equals(searchType) || "3".equals(searchType))
			{
				qd.addValue(searchData);
				qd.addValue(searchData);
			}
		}
		qd.addValue(endRow);
		qd.addValue(startRow);
		dao.exeSql(con, qd, 1, 0);

		return dao;
	}
}