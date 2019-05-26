//Available_Airline_Query 
import javax.servlet.http.*;  
import javax.servlet.*;  
import java.io.*;  
import java.util.*;

import javax.sql.DataSource;
import java.sql.*;
import javax.naming.*;		// Context  InitialContext

public class AvailableAirlineQueryServlet extends HttpServlet
{  
	public void doGet(HttpServletRequest request,HttpServletResponse response)  
			throws ServletException,IOException  
	{  		  
		String routeCode, airlineCode, airlineName;

		ArrayList list = new ArrayList();
		ArrayList<AvailableAirlineQueryBean> avAirlineQueryList = new ArrayList<AvailableAirlineQueryBean>();

 		try
		{			
			routeCode = request.getParameter("routeCode"); 
			airlineCode  = request.getParameter("airlineCode"); 
			airlineName    = request.getParameter("airlineName"); 

			list.add(" Entered routeCode    " + routeCode + "  airlineCode " + airlineCode + "  airlineName " + airlineName);
			System.out.println(" Entered routeCode    " + routeCode + "  airlineCode " + airlineCode + "  airlineName " + airlineName);

			Context     initCtx = new InitialContext();
			DataSource  ds 	    = (DataSource)  initCtx.lookup("java:comp/env/jdbc/ultraairlinesDB");
			Connection  conn 	= ds.getConnection();			
			Statement stmt = conn.createStatement();
		
			String   query = "select * from airline_flights ";

			int where = 0;
			if (routeCode != null && ! routeCode.equals("") && ! routeCode.equals("null"))	{
				query += " where route_code = '" + routeCode + "' ";
			}
			else {
				if (airlineCode != null && ! airlineCode.equals("") && ! airlineCode.equals("null"))	{
					query += " where airline_code = '" + airlineCode + "' ";
					where = 1;
				}
				if (airlineName != null && ! airlineName.equals("") && ! airlineName.equals("null"))		{
					query += (where==0 ? " where " : " and ");
					query += " airline_name = '" + airlineName + "' ";
				}
			}
			list.add(" select query " + query);
			System.out.println(" select query " + query);

			ResultSet rs   = stmt.executeQuery(query);

			AvailableAirlineQueryBean avAirlineQueryBean = null;
			while(rs.next())  	{				
				avAirlineQueryBean = new AvailableAirlineQueryBean();
				avAirlineQueryBean.setAirlineCode(rs.getString(1));
				avAirlineQueryBean.setAirlineName(rs.getString(2));
				avAirlineQueryBean.setRouteCode(rs.getString(3));
				avAirlineQueryBean.setSeatCapacityPremium(rs.getString(4));
				avAirlineQueryBean.setSeatCapacityEconomy(rs.getString(5));
				avAirlineQueryBean.setFlightDays(rs.getString(6));


				avAirlineQueryList.add(avAirlineQueryBean);

			}
			
			if(conn!=null)	{
				conn.close();
			}
		}
		catch(Exception ex)	{
			list.add("<br> Exception : " + ex + "<br>");
			System.out.println("Exception : " + ex);

		}

		list.add("avAirlineQueryList size : " + avAirlineQueryList.size());
		System.out.println("avAirlineQueryList size : " + avAirlineQueryList.size());

		request.setAttribute("listData",     list);
		request.setAttribute("beanListData", avAirlineQueryList);

        RequestDispatcher rd = request.getRequestDispatcher("/Available_Airline_Query.jsp");
        rd.forward(request, response);
	}
}  
