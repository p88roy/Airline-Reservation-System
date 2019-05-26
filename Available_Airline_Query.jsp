<%@page language="java" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head> <Title> ULTRA Airways </Title></head> 
<body background="bg_img6.png">
<br>
<center>
<h1 style="color:black;"> ULTRA Airlines </h1>
<h2 style="color:yellow;"> Flight Information System </h1></center><br><br></center>
<font color="pink">

<form name=form1 ACTION="/UltraAirlines/flight" METHOD="get">
  	<table style="color: pink;">
  <tr>
    <td>   <b>Select Route : </b>    </td>
	<td>
	  <select name="routeCode">
		<option value="">Select Route </option>
	  	<option value="DM">Delhi to Mumbai Flight </option>
	  	<option value="DC">Delhi to Chennai Flight</option>
	  	<option value="DB">Delhi to Bengaluru Flight</option>
		<option value="MD">Mumbai to Delhi Flight </option>
		<option value="CD">Chennai to Delhi Flight</option>
		<option value="BD">Bengaluru to Delhi Flight</option>
	  </select>
      </td>
  </tr>
  <tr><td></td> <td></td> </tr>

  <tr>
	<td> Airline Code: </td> 
	<td><input type="text" name="airlineCode"></td>
  </tr>
  <tr><td></td> <td></td> </tr>

  <tr>
	<td>Airline Name: </td> 
	<td><input type="text" name="airlineName"></td>
  </tr>
</table>
<br>
  	<input type="submit" value="Submit">

</form>
<br>

<a href="http://localhost:8088/UltraAirlines/AirwaysMenu.jsp" style="color:pink;">Go to Main page</a>
<br><br>

<table width="1200" border="1" align="left" bgcolor="cyan">
    <!-- Printing Table Headers -->
    <th>AirlineCode</th>
    <th>AirlineName</th>
    <th>RouteCode</th>
    <th>SeatCapacityPremium</th>
    <th>SeatCapacityEconomy</th>
    <th>FlightDays</th>
</table>

</font>
</body>
</html>
