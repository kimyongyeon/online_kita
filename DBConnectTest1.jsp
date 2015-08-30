<%
/**
 * DBConnectTest1.jsp
 * DB 연결 테스트
 *
 * @author EC21
 * @version 1.0
 * @since 2012.04.
 */
%><%@page
	contentType="text/html; charset=UTF-8"
	import="java.sql.Connection,
			com.ec21.connection.PoolManager,
			com.ec21.common.*,
			com.ec21.util.*,
			java.util.*"
%><%
String JSP = "DBConnectTest1.jsp";

Connection con = null;

StringBuffer dataSql = new StringBuffer(512);

QueryData qd =  null;

Dao dao = new Dao();

try
{   
  	con = PoolManager.getInstance().getConnection("GOBIZ");

   dataSql.setLength(0);
	dataSql.append("SELECT to_char(sysdate, 'yyyy/mm/dd hh:mi:ss') as to_day FROM dual");

	qd = new QueryData (dataSql.toString());
	dao.exeSql(con, qd, 1, 1);

   if(dao.getRowCnt()>0)
   {
      for(int i=0; i< dao.getRowCnt(); ++i)
      {
   		out.println("=========== ToDay : "+dao.getString(i, "to_day")+"===========");
      }
   }
   else
   {
   		out.println("=========== There is no Data ..===========");
   }

}
catch(Exception e)
{
System.out.println(JSP +"::Query["+dataSql.toString()+"]\nException["+e.toString()+"]");
    e.printStackTrace();
}
finally
{
    PoolManager.releaseConnection(con);
}
%>

