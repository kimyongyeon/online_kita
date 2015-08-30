<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%><%
/**
 * Top Menu List
 * 순번 : 메뉴명
 *-- 01 : Dịch vụ kết nối kinh doanh (Business Matching Service)
 *-- 02 : Sản phẩm (Products)
 *-- 03 : Hội thảo qua Video (Video Meeting)
 *-- 04 : Sự kiện (Local Event)
 *-- 05 : Đến Hàn Quốc (Useful Information)
 *-- 06 : Hướng dẫn (Guide)
 *-- 07 : Trang chủ (MyPage)

 *leftMenu
 *   순번 : 메뉴명
 *-- 0101 : (GoBizKorea Matching Service)
 *-- 0102 : (Business Matching Service)
 *-- 0103 : (Visitor Assistance Program)
 *-- 0104 : (Success stories)
 *-- 0105 : (FAQs)
 *
 *-- 0201 : Featured Categories
 *
 *-- 0301 : Hội thảo qua Video (About Video Meeting)
 *-- 0302 : Đơn của người mua (Buyer Application)
 *-- 0303 : Tình trạng người mua (Buyer Status)
 *
 *-- 0401 : (Trade Mission to Vietnam)
 *-- 0402 : (Trade Show in Vietnam)
 *
 *-- 0501 : Tin tức & Thông báo (News & Notice)
 *-- 0502 : Tin tức ngành nghề tại Hàn Quốc (Korea Industry News)
 *-- 0503 : Thư mục các nhà xuất khẩu Hàn  Quốc (Korean Exporters Directory)
 *-- 0504 : Các công ty Hàn Quốc tại Việt  Nam (Korean Companies in Vietnam)
 *-- 0505 : Cộng đồng doanh nghiệp (Business Community)
 *-- 0506 : Đến  Hàn Quốc (Biz Trip to Korea)
 *-- 0507 : Joyful Hallyu- Korean Wave (Joyful Hallyu- Korean Wave)
 *
 *-- 0601 : Overview
 *-- 0602 : FAQ
 *-- 0603 : About GobizKorea
 *-- 0604 : Greetings
 *-- 0605 : Brief History
 *-- 0606 : Contact us
 *
 *-- 0701 :
 *-- 0702 :
 *-- 0703 :
 *-- 0704 :
 *-- 0705 :
 */
String leftMenu = "";          // 최상위 메뉴
String secondLeftMenu = "";    // 상위 메뉴
// 부메뉴가 있는 경우
if(topAndLefMenu.length() > 5)
	secondLeftMenu = topAndLefMenu.substring(4, 6);
// 부메뉴가 없는 경우
leftMenu = topAndLefMenu.substring(2, 4);

if("01".equals(topMenu))
{
%>
<div class="LNBtype">
	<dl class="frist">
		<dt>Matching Service</dt>
		<dd class="frist <%if("01".equals(leftMenu)){%> on<%}%>"><a href="/BusinessMatching/MachingServiceInfo.jsp">GoBizKorea Matching Service</a></dd>
		<dd class="doble <%if("02".equals(leftMenu)){%> on<%}%>">
			<a href="../BusinessMatching/CompanyApplication.jsp">Business Matching Service</a>
			<ul class="Depth" <%if(!"02".equals(leftMenu)){%>style="display:none"<%}%>>
				<li <%if("01".equals(secondLeftMenu)){%>class="on"<%}%>><a href="/BusinessMatching/CompanyApplication.jsp">BMS application</a></li>
				<li <%if("02".equals(secondLeftMenu)){%>class="on"<%}%>><a href="/BusinessMatching/ApplicationStatus.jsp">BMS application status</a></li>
			</ul>
		</dd>
		<dd <%if("03".equals(leftMenu)){%>class="on"<%}%>><a href="/BusinessMatching/VisitorAssistanceCompany.jsp">Visitor Assistance Program</a></dd>
		<dd <%if("04".equals(leftMenu)){%>class="on"<%}%>><a href="/BusinessMatching/SuccessStoriesList.jsp">Success stories</a></dd>
		<dd class="last <%if("05".equals(leftMenu)){%> on<%}%>"><a href="/BusinessMatching/FAQList.jsp">FAQs</a></dd>
	</dl>

</div>

<%
}
else if("02".equals(topMenu))
{
%>

<%
}
else if("03".equals(topMenu))
{
%>
<div class="LNBtype">
	<dl class="frist">
		<dt>Hội thảo qua Video</dt>
		<dd class="frist<%if("01".equals(leftMenu)){%> on<%}%>" title="Hội thảo qua Video"><a href="/VideoMeeting/About.jsp">Hội thảo qua Video</a></dd>
		<dd <%if("02".equals(leftMenu)){%>class="on"<%}%> title="Đơn của người mua"><a href="/VideoMeeting/BuyerApplication.jsp">Đơn của người mua</a></dd>
		<dd class="last<%if("03".equals(leftMenu)){%> on<%}%>" title="Tình trạng người mua"><a href="/VideoMeeting/BuyerStatus.jsp">Tình trạng người mua</a></dd>
	</dl>
</div>
<%
}
else if("04".equals(topMenu))
{
%>
<div class="LNBtype">
	<dl class="frist">
		<dt>Local Events</dt>
		<dd class="frist<%if("01".equals(leftMenu)){%> on<%}%>"><a href="/LocalEvent/TradeMission.jsp">Trade Mission to Vietnam </a></dd>
		<dd class="last<%if("02".equals(leftMenu)){%> on<%}%>"><a href="/LocalEvent/TradeShow.jsp">Trade Show in Vietnam</a></dd>
	</dl>
</div>
<%
}
else if("05".equals(topMenu))
{
%>
<div class="LNBtype">
	<dl class="frist">
		<dt>Thông tin hữu ích</dt>
		<dd class="frist<%if("01".equals(leftMenu)){%> on<%}%>" title="Tin tức & Thông báo"><a href="/UsefulInformation/NewsAndNoticeList.jsp">Tin tức & Thông báo</a></dd>
		<dd <%if("02".equals(leftMenu)){%>class="on"<%}%> title="Tin tức ngành nghề tại Hàn Quốc"><a href="/UsefulInformation/IndustryNewsList.jsp">Tin tức ngành nghề tại Hàn Quốc</a></dd>
		<dd <%if("03".equals(leftMenu)){%>class="on"<%}%> title="Thư mục các nhà xuất khẩu Hàn  Quốc"><a href="/UsefulInformation/koreanExportersList.jsp">Thư mục các nhà xuất khẩu Hàn  Quốc</a></dd>
		<dd <%if("04".equals(leftMenu)){%>class="on"<%}%> title="Các công ty Hàn Quốc tại Việt  Nam"><a href="/UsefulInformation/koreanCompaniesInVNList.jsp">Các công ty Hàn Quốc tại Việt  Nam</a></dd>
		<dd <%if("05".equals(leftMenu)){%>class="on"<%}%> title="Cộng đồng doanh nghiệp"><a href="/UsefulInformation/CommunityList.jsp">Cộng đồng doanh nghiệp</a></dd>
		<dd <%if("06".equals(leftMenu)){%>class="on"<%}%> title="Đến  Hàn Quốc"><a href="/UsefulInformation/TripKoreaAbout.jsp">Đến  Hàn Quốc</a></dd>
		<dd class="last<%if("07".equals(leftMenu)){%> on<%}%>" title="Joyful Hallyu- Korean Wave"><a href="/UsefulInformation/KoreanWaveList.jsp">Joyful Hallyu- Korean Wave</a></dd>
	</dl>
</div>
<%
}
else if("06".equals(topMenu))
{
%>
<div class="LNBtype">
	<dl class="frist">
		<dt>Guide</dt>
		<dd class="frist <%if("01".equals(leftMenu)){%> on<%}%>"><a href="/Guide/OverView.jsp">Overview</a></dd>
		<dd <%if("02".equals(leftMenu)){%>class="on"<%}%>><a href="/Guide/FAQ.jsp">FAQ</a></dd>
		<dd <%if("03".equals(leftMenu)){%>class="on"<%}%>><a href="/Guide/AboutSBC.jsp">About GobizKorea</a></dd>
		<dd <%if("04".equals(leftMenu)){%>class="on"<%}%>><a href="/Guide/Greetings.jsp">Greetings</a></dd>
		<dd <%if("05".equals(leftMenu)){%>class="on"<%}%>><a href="/Guide/BriefHistory.jsp">Brief History</a></dd>
		<dd class="last <%if("06".equals(leftMenu)){%> on<%}%>"><a href="/Guide/ContactUs.jsp">Contact Us</a></dd>
	</dl>
</div>
<%
}
else if("07".equals(topMenu))
{
%>

<%
}
%>
