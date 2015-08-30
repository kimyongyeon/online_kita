<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.HashMap,
			com.ec21.BusinessMatching.BusinessMatchingAction,
			com.ec21.common.Dao,
			com.ec21.util.Utility"
%>
<%
	// 선언부
	Utility util = Utility.getInstance();
	BusinessMatchingAction bma = BusinessMatchingAction.getInstance();
	HashMap<String, String> dataMap = new HashMap<String, String>();
	
	// step - 1
	String company_name = request.getParameter("company_name");
	String company_introduction = request.getParameter("company_introduction");
	String country = request.getParameter("country");
	String business_type = request.getParameter("business_type");
	String zip_code = request.getParameter("zip_code");
	String address = request.getParameter("address");
	String president_name = request.getParameter("president_name");
	String contact_name = request.getParameter("contact_name");
	String job_title = request.getParameter("job_title");
	String phone = request.getParameter("phone");
	String fax = request.getParameter("fax");
	String email = request.getParameter("email");
	String alternative_email = request.getParameter("alternative_email");
	String url = request.getParameter("url");
	String duns_number = request.getParameter("duns_number");
	// step - 2
	String buying_product = request.getParameter("buying_product");
	String technical_specification = request.getParameter("technical_specification");
	String usage = request.getParameter("usage");
	String dimension = request.getParameter("dimension");
	String model_name = request.getParameter("model_name");
	String order_volume = request.getParameter("order_volume");
	String requirements = request.getParameter("requirements");
	String route_to_come = request.getParameter("route_to_come");
	String bmsContacEtc = request.getParameter("bmsContacEtc");
	String company_1 = request.getParameter("company_1");
	String product_1 = request.getParameter("product_1");
	String etc_1 = request.getParameter("etc_1");
	String company_2 = request.getParameter("company_2");
	String product_2 = request.getParameter("product_2");
	String etc_2 = request.getParameter("etc_2");
	String userid = "";
	String seq = "";
	String keywd2 = "";
	String keywd3 = "";
	String pdt_desc = "";
	String spec_req = requirements;
	String corp_trust = "";
	String bms_gbn = "2"; // default 개인으로....
	String bms_contact = route_to_come;
	String bms_contac_etc = "";
	String state = "1";
	
	bms_contac_etc = (bms_contact.equals("BC06")) ? bmsContacEtc : "";
	userid = (userid.equals("")) ? email : ""; // 쿠기정보에 값을 넣어준다.
	
	String apply_seq = "";
	String stateSeq = "1";
	String state_desc = "";
	String input_id = userid;
	String state_reason = "1";
	 
	Dao mpMatApplySeq = bma.selectMpMatApplySeq();
	if(mpMatApplySeq != null && mpMatApplySeq.getRowCnt() > 0){
		seq = mpMatApplySeq.getString(0, "SEQ");
		apply_seq = seq;
	}
	else{
		response.sendError(response.SC_NOT_FOUND);
		return;
	}
	
	dataMap.put("userid", userid);
	dataMap.put("seq", seq);
	dataMap.put("keywd2", keywd2);
	dataMap.put("keywd3", keywd3);
	dataMap.put("pdt_desc", pdt_desc);
	dataMap.put("spec_req", spec_req);
	dataMap.put("corp_trust", corp_trust);
	dataMap.put("bms_gbn", bms_gbn);
	dataMap.put("bms_contact", bms_contact);
	dataMap.put("bms_contac_etc", bms_contac_etc);
	dataMap.put("company_name", company_name);
	dataMap.put("company_introduction", company_introduction);
	dataMap.put("country", country);
	dataMap.put("business_type", business_type);
	dataMap.put("zip_code", zip_code);
	dataMap.put("address", address);
	dataMap.put("president_name", president_name);
	dataMap.put("contact_name", contact_name);
	dataMap.put("job_title", job_title);
	dataMap.put("phone", phone);
	dataMap.put("fax", fax);
	dataMap.put("email", email);
	dataMap.put("alternative_email", alternative_email);
	dataMap.put("url", url);
	dataMap.put("duns_number", duns_number);
	dataMap.put("buying_product", buying_product);
	dataMap.put("technical_specification", technical_specification);
	dataMap.put("usage", usage);
	dataMap.put("dimension", dimension);
	dataMap.put("model_name", model_name);
	dataMap.put("order_volume", order_volume);
	dataMap.put("requirements", requirements);
	dataMap.put("route_to_come", route_to_come);
	dataMap.put("company_1", company_1);
	dataMap.put("product_1", product_1);
	dataMap.put("etc_1", etc_1);
	dataMap.put("company_2", company_2);
	dataMap.put("product_2", product_2);
	dataMap.put("etc_2", etc_2);
	dataMap.put("state", state);
	
	Dao insertBmsDao = bma.insertBMS(dataMap);
	if(insertBmsDao.getResult()){
		dataMap = new HashMap<String, String>();
		dataMap.put("apply_seq", apply_seq);
		dataMap.put("seq", stateSeq);
		dataMap.put("state", state);
		dataMap.put("state_desc", state_desc);
		dataMap.put("input_id", input_id);
		dataMap.put("state_reason", state_reason);
		Dao insertBmsStateDao = bma.insertBmsState(dataMap);
	}
	
	String nextUrl = "";
	if(insertBmsDao.getResult()){
		nextUrl = "ApplicationResult.jsp";
	}
	
	if(!"".equals(nextUrl))
		response.sendRedirect(nextUrl);
	else
		response.sendError(response.SC_NOT_FOUND);

%>