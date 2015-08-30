package com.ec21.contact_us;

import java.sql.Connection;
import java.util.HashMap;

import com.ec21.common.Dao;
import com.ec21.common.QueryData;

public class VnContactUsDao
{
	private static final VnContactUsDao instance = new VnContactUsDao();

	public static VnContactUsDao getInstance()
	{
		return instance;
	}

	public VnContactUsDao()
	{

	}

	/**
	 * 시퀀스 생성
	 */
	public Dao selectDirNoSeq(Connection con) throws Exception
	{
		Dao dao = new Dao();

		StringBuilder query = new StringBuilder();
		query.append(" SELECT VM_CONTACT_US_SEQ.NEXTVAL CONTACT_NO FROM DUAL \n");
		dao.exeSql(con, query.toString(), 1, 1);

		return dao;
	}

	/**
	 * Contact Us 검색 리스트 총 갯수
	 */
	public Dao selectContactUsListTotalCount(Connection con, HashMap<String, String> searchMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" SELECT COUNT(*) AS CNT \n");
		query.append("   FROM VN_CONTACT_US \n");
		query.append("  WHERE 1 = 1 \n");

		if(!"".equals(searchMap.get("searchType")) && !"".equals(searchMap.get("searchData")))
			query.append("    AND ").append(searchMap.get("searchType")).append(" LIKE '%'||?||'%' \n");

		qd = new QueryData(query.toString());

		if(!"".equals(searchMap.get("searchType")) && !"".equals(searchMap.get("searchData")))
			qd.addValue(searchMap.get("searchData"));

		dao.exeSql(con, qd, 1, 1);

		return dao;
	}

	/**
	 * Contact Us 검색 리스트
	 */
	public Dao selectContactUsList(Connection con, int startRow, int endRow, HashMap<String, String> searchMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;
	    
        StringBuilder query = new StringBuilder();
		query.append(" SELECT * \n");
		query.append("   FROM ( \n");
		query.append("         SELECT ROWNUM RM, A.* \n");
		query.append("           FROM ( SELECT CONTACT_NO, WRITER, EMAIL, TITLE, INPUT_DT, \n");
		query.append("           			CASE STATUS \n");
		query.append("           				WHEN '0' THEN '접수대기' \n");
		query.append("           				WHEN '1' THEN '완료' \n");
		query.append("           			END AS STATUS \n");
		query.append("                  FROM VN_CONTACT_US A\n");
		query.append("                  WHERE 1 = 1 \n");

		if(!"".equals(searchMap.get("searchType")) && !"".equals(searchMap.get("searchData")))
			query.append("                     AND ").append(searchMap.get("searchType")).append(" LIKE '%'||?||'%' \n");

		query.append("                ) A \n");
		query.append("          WHERE ROWNUM <= ?  )   \n");
		query.append("   WHERE RM >= ? \n");
		
		query.append(" ORDER BY CONTACT_NO DESC ");

		qd = new QueryData(query.toString());

		if(!"".equals(searchMap.get("searchType")) && !"".equals(searchMap.get("searchData")))
			qd.addValue(searchMap.get("searchData"));

		qd.addValue(endRow);
		qd.addValue(startRow);
		dao.exeSql(con, qd, 1, 0);

		return dao;
	}

	/**
	 * Contact Us 상세 조회
	 */
	public Dao selectContactUs(Connection con, String contactNo) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" SELECT CONTACT_NO, WRITER, EMAIL, COMP_NM, INPUT_DT, \n");
		query.append("        TITLE, CONTENT, REPLY_CONTENT, ADMIN_ID, REPLY_DT \n");
		query.append("   FROM VN_CONTACT_US \n");
		query.append("  WHERE CONTACT_NO = ? \n");

		qd = new QueryData(query.toString());
		qd.addValue(contactNo);
		dao.exeSql(con, qd, 1, 1);

		return dao;
	}
	/**
	 * Contact Us 엑셀저장
	 */
	public Dao selectContactUsExcelDown(Connection con, String contactNo) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;
		
		StringBuilder query = new StringBuilder();
		query.append(" SELECT CONTACT_NO, WRITER, EMAIL, COMP_NM, INPUT_DT, \n");
		query.append("        TITLE, CONTENT, REPLY_CONTENT, ADMIN_ID, REPLY_DT \n");
		query.append("   FROM VN_CONTACT_US \n");
		query.append("  WHERE CONTACT_NO IN ("+contactNo+") \n");
		query.append(" ORDER BY CONTACT_NO DESC ");
		qd = new QueryData(query.toString());
		dao.exeSql(con, qd, 1, 0);
		
		return dao;
	}

	/**
	 * Contact Us 사용자 입력
	 */
	public Dao insertContactUs(Connection con, HashMap<String, String> dataMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" INSERT INTO VN_CONTACT_US (CONTACT_NO, WRITER, GOBIZ_ID, COMP_NM, EMAIL, TITLE, CONTENT, STATUS, INPUT_DT) \n");
		query.append("                    VALUES (?, ?, ?, ?, ?, ?, ?, 0, TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')) \n");

		qd = new QueryData(query.toString());
		
		// gobiz_id를 이용하여 wrtier를 구하고 입력해야 함.
		// comp_nm 회사명은 테이블에서 가지고 와야 될것 같음.
		qd.addValue(dataMap.get("contact_no"));
		qd.addValue(dataMap.get("writer"));
		qd.addValue(dataMap.get("gobiz_id"));
		qd.addValue(dataMap.get("comp_nm"));
		qd.addValue(dataMap.get("email"));
		qd.addValue(dataMap.get("title"));
		qd.addValue(dataMap.get("content"));
		dao.exeSql(con, qd);
		
		return dao;
	}

	/**
	 * Contact Us 수정
	 */
	public Dao updateContactUs(Connection con, HashMap<String, String> dataMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" UPDATE VN_CONTACT_US  \n");
		query.append("    SET REPLY_CONTENT = ?, \n");
		query.append("        ADMIN_ID = ?, \n");
		query.append("        STATUS = 1, \n");
		query.append("        REPLY_DT = TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS') \n");
		query.append("  WHERE CONTACT_NO = ? \n");

		qd = new QueryData(query.toString());
		qd.addValue(dataMap.get("reply_content"));
		qd.addValue(dataMap.get("admin_id"));
		qd.addValue(dataMap.get("contact_no"));
		dao.exeSql(con, qd);
		
		return dao;
	}

	/**
	 * Contact Us 삭제
	 */
	public Dao deleteContactUs(Connection con, HashMap<String, String> dataMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" DELETE FROM VN_CONTACT_US  \n");
		query.append("  WHERE CONTACT_NO = ? \n");

		qd = new QueryData(query.toString());
		qd.addValue(dataMap.get("contact_no"));
		dao.exeSql(con, qd);
		
		return dao;
	}


}