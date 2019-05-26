import javax.servlet.http.*;  
import javax.servlet.*;  
import java.io.*;  
import java.util.*;

import javax.sql.DataSource;
import java.sql.*;
import javax.naming.*;		// Context  InitialContext

public class AirlineRouteServlet extends HttpServlet
{  
	public void doGet(HttpServletRequest request,HttpServletResponse response)  
			throws ServletException,IOException  
	{  		  
		String route, from, to;

		ArrayList list = new ArrayList();
		ArrayList<AirlineRouteBean> routeList = new ArrayList<AirlineRouteBean>();

 		try
		{			
			route = request.getParameter("route"); 
			from  = request.getParameter("From"); 
			to    = request.getParameter("To"); 

			list.add(" Entered route    " + route + "  from " + from + "  to " + to);
			
			Context     initCtx = new InitialContext();
			DataSource  ds 	    = (DataSource)  initCtx.lookup("java:comp/env/jdbc/airlinesDB");
			Connection  conn 	= ds.getConnection();			
			Statement stmt = conn.createStatement();
							
			String   query = "select * from airline_routes ";
			int where = 0;
			if (route != null && ! route.equals("") && ! route.equals("null"))	{
				query += " where route_code = '" + route + "' ";
			}
			else {
				if (from != null && ! from.equals("") && ! from.equals("null"))	{
					query += " where flight_from = '" + from + "' ";
					where = 1;
				}
				if (to != null && ! to.equals("") && ! to.equals("null"))		{
					query += (where==0 ? " where " : " and ");
					query += " flight_to = '" + to + "' ";
				}
			}
			list.add(" select query " + query);
			ResultSet rs   = stmt.executeQuery(query);
		
			AirlineRouteBean routeBean = null;
			while(rs.next())  	{				
				routeBean = new AirlineRouteBean();
				routeBean.setRouteCode(rs.getString(1));
				routeBean.setFlightFrom(rs.getString(2));
				routeBean.setFlightTo(rs.getString(3));
				routeBean.setFrequency(rs.getString(4));
				routeList.add(routeBean);
			}
			
			if(conn!=null)	{
				conn.close();
			}
		}
		catch(Exception ex)	{
			list.add("<br> Exception : " + ex + "<br>");
		}

		list.add("routeList size : " + routeList.size());

		request.setAttribute("listData",     list);
		request.setAttribute("beanListData", routeList);

        RequestDispatcher rd = request.getRequestDispatcher("/Airway_Routes_Query.jsp");
        rd.forward(request, response);
	}
}  
