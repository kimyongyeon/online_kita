package com.ec21.BusinessMatching;

import java.sql.Connection;
import java.util.HashMap;

import com.ec21.common.Dao;
import com.ec21.common.QueryData;

public class BusinessMatchingDao
{
	private static final BusinessMatchingDao instance = new BusinessMatchingDao();

	public static BusinessMatchingDao getInstance()
	{
		return instance;
	}

	public BusinessMatchingDao()
	{

	}
	/**
	 * BusinessMatching SuccessStories 검색 리스트 총 갯수
	 */
	public Dao selectBusinessMatchingListTotalCount(Connection con, HashMap<String, String> searchMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" SELECT COUNT(*) AS CNT \n");
		query.append("   FROM TBL_VT_COREPORT \n");
		query.append("  WHERE 1 = 1 \n");

		qd = new QueryData(query.toString());

		dao.exeSql(con, qd, 1, 1);

		return dao;
	}

	/**
	 * BusinessMatching SuccessStories 검색 리스트
	 */
	public Dao selectBusinessMatchingList(Connection con, int startRow, int endRow, HashMap<String, String> searchMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;
	    
        StringBuilder query = new StringBuilder();
		query.append(" SELECT * \n");
		query.append("   FROM ( \n");
		query.append("         SELECT ROWNUM RM, A.* \n");
		query.append("           FROM ( SELECT ID, ORG_CO_NAME, TITLE \n");
		query.append("                  FROM TBL_VT_COREPORT A\n");
		query.append("                  WHERE 1 = 1 \n");
		query.append("                ) A \n");
		query.append("          WHERE ROWNUM <= ?  )   \n");
		query.append("   WHERE RM >= ? \n");
		
		query.append(" ORDER BY ID DESC ");
		
		System.out.println("query : " + query.toString());

		qd = new QueryData(query.toString());

		qd.addValue(endRow);
		qd.addValue(startRow);
		dao.exeSql(con, qd, 1, 0);

		return dao;
	}
	/**
	 * BusinessMatching SuccessStories 상세 조회
	 */
	public Dao selectBusinessMatching(Connection con, String contactNo) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" SELECT ID, ORG_CO_NAME, TITLE, REPORTER_NAME, CONTENT \n");
		query.append("   FROM TBL_VT_COREPORT \n");
		query.append("  WHERE ID = ? \n");

		qd = new QueryData(query.toString());
		qd.addValue(contactNo);
		dao.exeSql(con, qd, 1, 1);

		return dao;
	}
	/**
	 * BMS 사용자 회원정보 조회
	 */
	public Dao selectMpMem(Connection con, HashMap<String, String> dataMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;
	    
        StringBuilder query = new StringBuilder();
		query.append(" SELECT * \n");
		query.append(" FROM MP_MEM \n");
		query.append(" WHERE 1 = 1 \n");
		query.append(" AND USERID = ? \n");
		query.append(" AND GBN = ? \n");
		
		qd = new QueryData(query.toString());
		
		qd.addValue(dataMap.get("userid"));
		qd.addValue(dataMap.get("gbn"));
		dao.exeSql(con, qd, 1, 0);

		return dao;
	}
	/**
	 * BMS Business Type, job Title 정보 리스트
	 */
	public Dao selectBZTPorBMJT(Connection con, HashMap<String, String> dataMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;
		
		StringBuilder query = new StringBuilder();
		query.append(" SELECT * \n");
		query.append(" FROM MP_CD \n");
		query.append(" WHERE 1 = 1 \n");
		query.append(" AND CAT_CD = ? \n");
		
		qd = new QueryData(query.toString());
		
		qd.addValue(dataMap.get("cat_cd"));
		dao.exeSql(con, qd, 1, 0);
		
		return dao;
	}
	/**
	 * BMS Country 정보 리스트
	 */
	public Dao selectCountry(Connection con) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;
		
		StringBuilder query = new StringBuilder();
		query.append(" SELECT * \n");
		query.append(" FROM MP_CTR_CD \n");
		query.append(" WHERE 1 = 1 \n");
		qd = new QueryData(query.toString());
		dao.exeSql(con, qd, 1, 0);
		
		return dao;
	}

	/**
	 * BMS MP_MAT_APPLY SEQ 구하기
	 */
	public Dao selectMpMatApplySeq(Connection con) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;
		
		StringBuilder query = new StringBuilder();
		query.append(" SELECT NVL(MAX(SEQ),0)+1 AS SEQ \n");
		query.append(" FROM MP_MAT_APPLY \n");
		query.append(" WHERE 1 = 1 \n");
		qd = new QueryData(query.toString());
		dao.exeSql(con, qd, 1, 1);
		
		return dao;
	}
	/**
	 * BMS 검색 리스트 총 갯수
	 */
	public Dao selectBmsListTotalCount(Connection con, HashMap<String, String> searchMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;
		
		System.out.println(" searchType : " + searchMap.get("searchType"));
		System.out.println(" searchData : " + searchMap.get("searchData"));

		StringBuilder query = new StringBuilder();
		query.append(" SELECT COUNT(*) AS CNT \n");
		query.append("   FROM MP_MAT_APPLY \n");
		query.append("  WHERE 1 = 1 \n");
		
		if(!"".equals(searchMap.get("searchType")) && !"".equals(searchMap.get("searchData"))){
			String state = searchMap.get("searchData");
			if(state.equals("com")){
				query.append("    AND ").append(searchMap.get("searchType")).append(" LIKE '%'||?||'%' \n");
				query.append("    OR ").append(searchMap.get("searchType")).append(" LIKE '%'||?||'%' \n");
				query.append("    OR ").append(searchMap.get("searchType")).append(" LIKE '%'||?||'%' \n");
				query.append("    OR ").append(searchMap.get("searchType")).append(" LIKE '%'||?||'%' \n");
				query.append("    OR ").append(searchMap.get("searchType")).append(" LIKE '%'||?||'%' \n");	
			}else{
				query.append("    AND ").append(searchMap.get("searchType")).append(" LIKE '%'||?||'%' \n");
			}
		}

		qd = new QueryData(query.toString());
		
		if(!"".equals(searchMap.get("searchType")) && !"".equals(searchMap.get("searchData"))){
			String state = searchMap.get("searchData");
			if(state.equals("app")){
				qd.addValue("1");
			}else if(state.equals("pro")){
				qd.addValue("3");
			}else if(state.equals("com")){
				qd.addValue("4");
				qd.addValue("5");
				qd.addValue("6");
				qd.addValue("7");
				qd.addValue("8");
			}
		}
		
		System.out.println(" MP_MAT_APPLY query count : " + query.toString());

		dao.exeSql(con, qd, 1, 1);

		return dao;
	}

	/**
	 * BMS 검색 리스트
	 */
	public Dao selectBmsList(Connection con, int startRow, int endRow, HashMap<String, String> searchMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;
		
		System.out.println(" searchType : " + searchMap.get("searchType"));
		System.out.println(" searchData : " + searchMap.get("searchData"));
	    
        StringBuilder query = new StringBuilder();
		query.append(" SELECT * \n");
		query.append("   FROM ( \n");
		query.append("         SELECT ROWNUM RM, A.* \n");
		query.append("           FROM ( SELECT A.*, to_char(INPUT_DATE, 'YYYY-MM-DD') as indate \n");
		query.append("                  FROM MP_MAT_APPLY A\n");
		query.append("                  WHERE 1 = 1 \n");
		
		if(!"".equals(searchMap.get("searchType")) && !"".equals(searchMap.get("searchData"))){
			String state = searchMap.get("searchData");
			if(state.equals("com")){
				query.append("    AND ").append(searchMap.get("searchType")).append(" LIKE '%'||?||'%' \n");
				query.append("    OR ").append(searchMap.get("searchType")).append(" LIKE '%'||?||'%' \n");
				query.append("    OR ").append(searchMap.get("searchType")).append(" LIKE '%'||?||'%' \n");
				query.append("    OR ").append(searchMap.get("searchType")).append(" LIKE '%'||?||'%' \n");
				query.append("    OR ").append(searchMap.get("searchType")).append(" LIKE '%'||?||'%' \n");	
			}else{
				query.append("    AND ").append(searchMap.get("searchType")).append(" LIKE '%'||?||'%' \n");
			}
		}
		
		query.append("                ) A \n");
		query.append("          WHERE ROWNUM <= ?  )   \n");
		query.append("   WHERE RM >= ? \n");
		
		query.append(" ORDER BY INPUT_DATE DESC ");
		
		qd = new QueryData(query.toString());
		
		if(!"".equals(searchMap.get("searchType")) && !"".equals(searchMap.get("searchData"))){
			String state = searchMap.get("searchData");
			if(state.equals("app")){
				qd.addValue("1");
			}else if(state.equals("pro")){
				qd.addValue("3");
			}else if(state.equals("com")){
				qd.addValue("4");
				qd.addValue("5");
				qd.addValue("6");
				qd.addValue("7");
				qd.addValue("8");
			}
		}
		qd.addValue(endRow);
		qd.addValue(startRow);
		
		System.out.println(" MP_MAT_APPLY query : " + query.toString());
		System.out.println(" searchData : " + searchMap.get("searchData"));
		
		dao.exeSql(con, qd, 1, 0);

		return dao;
	}
	
	/**
	 * BMS 상세 조회
	 */
	public Dao selectBms(Connection con, HashMap<String, String> dataMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" SELECT * \n");
		query.append("   FROM MP_MAT_APPLY \n");
		query.append("  WHERE APPLY_SEQ = ? \n");
		query.append("  AND SEQ = ? \n");

		qd = new QueryData(query.toString());
		qd.addValue(dataMap.get("apply_seq"));
		qd.addValue(dataMap.get("seq"));
		dao.exeSql(con, qd, 1, 1);

		return dao;
	}
	
	/**
	 * BMS 사용자 등록
	 */
	public Dao insertBMS(Connection con, HashMap<String, String> dataMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" INSERT INTO MP_MAT_APPLY (" +
				"  USERID" +
				", SEQ" +
				", CORP_NM" +
				", BIZ_TYPE" +
				", CTR_CD" +
				", ADDR" +
				", ZIP_CODE" +
				", REP_NM" +
				", MEM_NM" +
				", MEM_JOB_CD" +
				", TEL" +
				", EMAIL" +
				", ALTER_EMAIL" +
				", URL" +
				", CORP_DESC" +
				", DUNS_CODE" +
				", KEYWD1" +
				", KEYWD2" +
				", KEYWD3" +
				", PDT_DESC" +
				", MODEL_NO" +
				", VOLUME" +
				", SPEC_REQ" +
				", NEED_CORP_NM1" +
				", NEED_PROD1" +
				", NEED_DESC1" +
				", NEED_CORP_NM2" +
				", NEED_PROD2" +
				", NEED_DESC2" +
				", STATE" +
				", CORP_TRUST" +
				", INPUT_ID" +
				", INPUT_DATE" +
				", MOD_ID" +
				", MOD_DATE" +
				", S_FILE_NAME" +
				", O_FILE_NAME" +
				", AP_MOD_ID" +
				", AP_MOD_DATE" +
				", T_SPEC" +
				", USAGE" +
				", DIMENSION" +
				", STATE_REASON" +
				", BMS_GBN" +
				", BMS_CONTAC" +
				", BMS_CONTAC_ETC" +
				" ) \n");
		query.append(" VALUES (" +
				"	  ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, SYSDATE 	"	+
				"	, ? 	"	+
				"	, SYSDATE 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, SYSDATE 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+	
				"	, ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				" ) \n");

		qd = new QueryData(query.toString());
		
		qd.addValue(dataMap.get("userid"));
		qd.addValue(dataMap.get("seq"));
		qd.addValue(dataMap.get("company_name"));
		qd.addValue(dataMap.get("business_type"));
		qd.addValue(dataMap.get("country"));
		qd.addValue(dataMap.get("address"));
		qd.addValue(dataMap.get("zip_code"));
		qd.addValue(dataMap.get("president_name"));
		qd.addValue(dataMap.get("contact_name"));
		qd.addValue(dataMap.get("job_title"));
		qd.addValue(dataMap.get("phone"));
		qd.addValue(dataMap.get("email"));
		qd.addValue(dataMap.get("alternative_email"));
		qd.addValue(dataMap.get("url"));
		qd.addValue(dataMap.get("company_introduction"));
		qd.addValue(dataMap.get("duns_number"));
		qd.addValue(dataMap.get("buying_product"));
		qd.addValue(dataMap.get("keywd2"));
		qd.addValue(dataMap.get("keywd3"));
		qd.addValue(dataMap.get("pdt_desc"));
		qd.addValue(dataMap.get("model_name"));
		qd.addValue(dataMap.get("order_volume"));
		qd.addValue(dataMap.get("spec_req"));
		qd.addValue(dataMap.get("company_1"));
		qd.addValue(dataMap.get("product_1"));
		qd.addValue(dataMap.get("etc_1"));
		qd.addValue(dataMap.get("company_2"));
		qd.addValue(dataMap.get("product_2"));
		qd.addValue(dataMap.get("etc_2"));
		qd.addValue(dataMap.get("state"));
		qd.addValue(dataMap.get("corp_trust"));
		qd.addValue(dataMap.get("userid"));
		qd.addValue(dataMap.get("userid"));
		qd.addValue(dataMap.get("att_file_nm1"));
		qd.addValue(dataMap.get("ofileName1"));
		qd.addValue(dataMap.get("userid"));
		qd.addValue(dataMap.get("technical_specification"));
		qd.addValue(dataMap.get("usage"));
		qd.addValue(dataMap.get("dimension"));
		qd.addValue(dataMap.get("state"));
		qd.addValue(dataMap.get("bms_gbn"));
		qd.addValue(dataMap.get("bms_contac"));
		qd.addValue(dataMap.get("bms_contac_etc"));
		
		System.out.println(" MP_MAT_APPLY query : " + query.toString());
		
		dao.exeSql(con, qd);
		
		return dao;
	}
	
	/**
	 * BMS STATE 등록
	 */
	public Dao insertBmsState(Connection con, HashMap<String, String> dataMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" INSERT INTO MP_MAT_STATE (" +
				"  APPLY_SEQ" +
				", SEQ" +
				", STATE" +
				", STATE_DESC" +
				", INPUT_ID" +
				", INPUT_DATE" +
				", STATE_REASON" +
				" ) \n");
		query.append(" VALUES (" +
				"	  ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, SYSDATE 	"	+
				"	, ? 	"	+
				" ) \n");

		qd = new QueryData(query.toString());
		
		qd.addValue(dataMap.get("apply_seq"));
		qd.addValue(dataMap.get("seq"));
		qd.addValue(dataMap.get("state"));
		qd.addValue(dataMap.get("state_desc"));
		qd.addValue(dataMap.get("input_id"));
		qd.addValue(dataMap.get("state_reason"));
		
		System.out.println(" MP_MAT_STATE query : " + query.toString());
		
		dao.exeSql(con, qd);
		
		return dao;
	}
	/**
	 * BMS 사용자 수정
	 */
	public Dao updateBMS(Connection con, HashMap<String, String> dataMap) throws Exception
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
	 * VAP SEQ 구하기
	 */
	public Dao selectGsIspSeq(Connection con) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;
		
		StringBuilder query = new StringBuilder();
		query.append(" SELECT NVL(MAX(SEQ),0)+1 AS SEQ \n");
		query.append(" FROM GS_IBP \n");
		query.append(" WHERE 1 = 1 \n");
		qd = new QueryData(query.toString());
		dao.exeSql(con, qd, 1, 1);
		
		return dao;
	}
	/**
	 * VAP 사용자 등록
	 */
	public Dao insertVAP(Connection con, HashMap<String, String> dataMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;
		
		StringBuilder query = new StringBuilder();
		query.append(" INSERT INTO GS_IBP (" +
				"	USERID,	"	+
				"	SEQ,	"	+
				"	CORP_NM,	"	+
				"	BIZ_TYPE,	"	+
				"	CTR_CD,	"	+
				"	ADDR,	"	+
				"	ZIP_CODE,	"	+
				"	REP_NM,	"	+
				"	MEM_NM,	"	+
				"	MEM_JOB_CD,	"	+
				"	TEL,	"	+
				"	FAX,	"	+
				"	EMAIL,	"	+
				"	ALTER_EMAIL,	"	+
				"	URL,	"	+
				"	CORP_DESC,	"	+
				"	DUNS_CODE,	"	+
				"	KEYWD1,	"	+
				"	KEYWD2,	"	+
				"	KEYWD3,	"	+
				"	PDT_DESC,	"	+
				"	MODEL_NO,	"	+
				"	VOLUME,	"	+
				"	SPEC_REQ,	"	+
				"	NEED_CORP_NM1,	"	+
				"	NEED_PROD1,	"	+
				"	NEED_DESC1,	"	+
				"	NEED_CORP_NM2,	"	+
				"	NEED_PROD2,	"	+
				"	NEED_DESC2,	"	+
				"	STATE,	"	+
				"	CORP_TRUST,	"	+
				"	INPUT_ID,	"	+
				"	INPUT_DATE,	"	+
				"	MOD_ID,	"	+
				"	MOD_DATE,	"	+
				"	FLIGHT_TO_KOREA,	"	+
				"	FTK_FROM_CITY,	"	+
				"	FTK_FROM_DATE,	"	+
				"	FTK_FROM_TIME,	"	+
				"	FTK_TO_CITY,	"	+
				"	FTK_TO_DATE,	"	+
				"	FTK_TO_TIME,	"	+
				"	FLIGHT_FROM_KOREA,	"	+
				"	FFK_FROM_CITY,	"	+
				"	FFK_FROM_DATE,	"	+
				"	FFK_FROM_TIME,	"	+
				"	FFK_TO_CITY,	"	+
				"	FFK_TO_DATE,	"	+
				"	FFK_TO_TIME,	"	+
				"	VISITING_SCHEDULE,	"	+
				"	S_FILE_NAME,	"	+
				"	O_FILE_NAME,	"	+
				"	T_SPEC,	"	+
				"	USAGE,	"	+
				"	DIMENSION	"	+
				" ) \n");
		query.append(" VALUES (" +
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	SYSDATE,	"	+
				"	?,	"	+
				"	SYSDATE,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?,	"	+
				"	?	"	+
				" ) \n");

		qd = new QueryData(query.toString());
		
		qd.addValue(dataMap.get("userid"));
		qd.addValue(dataMap.get("seq"));
		qd.addValue(dataMap.get("company_name"));
		qd.addValue(dataMap.get("business_type"));
		qd.addValue(dataMap.get("country"));
		qd.addValue(dataMap.get("address"));
		qd.addValue(dataMap.get("zip_code"));
		qd.addValue(dataMap.get("president_name"));
		qd.addValue(dataMap.get("contact_name"));
		qd.addValue(dataMap.get("job_title"));
		qd.addValue(dataMap.get("phone"));
		qd.addValue(dataMap.get("fax"));
		qd.addValue(dataMap.get("email"));
		qd.addValue(dataMap.get("alternative_email"));
		qd.addValue(dataMap.get("url"));
		qd.addValue(dataMap.get("company_introduction"));
		qd.addValue(dataMap.get("duns_number"));
		qd.addValue(dataMap.get("buying_product"));
		qd.addValue(dataMap.get("keywd2"));
		qd.addValue(dataMap.get("keywd3"));
		qd.addValue(dataMap.get("pdt_desc"));
		qd.addValue(dataMap.get("model_name"));
		qd.addValue(dataMap.get("order_volume"));
		qd.addValue(dataMap.get("spec_req"));
		qd.addValue(dataMap.get("company_1"));
		qd.addValue(dataMap.get("product_1"));
		qd.addValue(dataMap.get("etc_1"));
		qd.addValue(dataMap.get("company_2"));
		qd.addValue(dataMap.get("product_2"));
		qd.addValue(dataMap.get("etc_2"));
		qd.addValue(dataMap.get("state"));
		qd.addValue(dataMap.get("corp_trust"));
		qd.addValue(dataMap.get("userid"));
		// qd.addValue(dataMap.get("sysdate"));
		qd.addValue(dataMap.get("userid"));
		// qd.addValue(dataMap.get("sysdate"));
		qd.addValue(dataMap.get("flight_to_korea"));
		qd.addValue(dataMap.get("ftk_from_city"));
		qd.addValue(dataMap.get("ftk_from_date"));
		qd.addValue(dataMap.get("ftk_from_time"));
		qd.addValue(dataMap.get("ftk_to_city"));
		qd.addValue(dataMap.get("ftk_to_date"));
		qd.addValue(dataMap.get("ftk_to_time"));
		qd.addValue(dataMap.get("flight_from_korea"));
		qd.addValue(dataMap.get("ffk_from_city"));
		qd.addValue(dataMap.get("ffk_from_date"));
		qd.addValue(dataMap.get("ffk_from_time"));
		qd.addValue(dataMap.get("ffk_to_city"));
		qd.addValue(dataMap.get("ffk_to_date"));
		qd.addValue(dataMap.get("ffk_to_time"));
		qd.addValue(dataMap.get("visition_schedule"));
		qd.addValue(dataMap.get("s_file_name"));
		qd.addValue(dataMap.get("o_file_name"));
		qd.addValue(dataMap.get("technical_specification"));
		qd.addValue(dataMap.get("usage"));
		qd.addValue(dataMap.get("dimension"));

		System.out.println(" GS_IBP query : " + query.toString());
		
		dao.exeSql(con, qd);
		
		return dao;
	}
	/**
	 * VAP STATE 등록
	 */
	public Dao insertVapState(Connection con, HashMap<String, String> dataMap) throws Exception
	{
		Dao dao = new Dao();
		QueryData qd = null;

		StringBuilder query = new StringBuilder();
		query.append(" INSERT INTO GS_IBP_STATE (" +
				"  APPLY_SEQ" +
				", SEQ" +
				", STATE" +
				", STATE_DESC" +
				", INPUT_ID" +
				", INPUT_DATE" +
				" ) \n");
		query.append(" VALUES (" +
				"	  ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, ? 	"	+
				"	, SYSDATE 	"	+
				" ) \n");

		qd = new QueryData(query.toString());
		
		qd.addValue(dataMap.get("apply_seq"));
		qd.addValue(dataMap.get("seq"));
		qd.addValue(dataMap.get("state"));
		qd.addValue(dataMap.get("state_desc"));
		qd.addValue(dataMap.get("input_id"));
		
		System.out.println(" GS_IBP_STATE query : " + query.toString());
		
		dao.exeSql(con, qd);
		
		return dao;
	}
	/**
	 * VAP 사용자 수정
	 */
	public Dao updateVAP(Connection con, HashMap<String, String> dataMap) throws Exception
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
}