<%@page language="java" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>
  function checkInputs()
  {
     var bookingId   = document.airBooking.bookingId.value;
	var airlineCode = document.airBooking.airlineCode.value;
	var airDate     = document.airBooking.airDate.value;
	var name        = document.airBooking.name.value;
	var gender 	= document.airBooking.gender.value;
	var dob         = document.airBooking.dob.value;
	var fare         = document.airBooking.fare.value;
	var departureTime   = document.airBooking.departureTime.value;
	var seatClass       = document.airBooking.seatClass.value;
	var mobileNo    = document.airBooking.mobileNo.value;	
	var notes       = document.airBooking.notes.value;
	var paymentOption = document.airBooking.paymentOption.value;

 // alert("Submitted airlineCode " + airlineCode + " airDate " + airDate + " name " + name + " gender " + gender + " dob " + dob + " bookingId " + bookingId + " notes " + notes);

	var msg = "Please enter";
     if (airlineCode == "")		{
     		msg += "  Airline Code";
	}
     if (airDate == "")		{
     		msg += "  Date";
	}
     if (name == "")		{
     		msg += "  Name";
	}
     if (gender == "")		{
     		msg += "  Gender";
	}
     if (dob == "")		{
     		msg += "  DOB";
	}
     if (mobileNo == "")		{
     		msg += "  Mobile Number";
	}

	if (msg == "Please enter") {
     		alert("Processing Booking.");
           return true;  	
	}

	document.airBooking.prompt.value = msg;
      return false;       
  }

</script>

<html>
<head> <Title> ULTRA Airways </Title></head> 
<body background="bg_img.png">
<center>
<h1 style="color:white;"> ULTRA Airlines </h1>
<h2 style="color:orange;"> Flight Booking System </h2>
</center>

<font color="pink">

<form  name="airBooking"  ACTION="/UltraAirlines/booking"  METHOD="get"  onsubmit="return checkInputs()">


  <table height='52'>

     <tr>
       <td>
         	Airline Code
       </td>
       <td>
<select name="airlineCode">
  <option value="">Select Airline Code </option>
  <option value="BD-01">Bengaluru to Delhi Flight [BD]</option>
  <option value="DB-01">Delhi to Bengaluru Flight [DB]</option>
  <option value="CD-01">Chennai to Delhi Flight [CD]</option>
  <option value="DC-01">Delhi to Chennai Flight [DC]</option>
  <option value="MD-01">Mumbai to Delhi Flight [MD]</option>
  <option value="DM-01">Delhi to Mumbai Flight [DM]</option>
</select>
       </td>
     </tr>
	<tr><td></td> <td></td> </tr>


     <tr>
		<td>Date </td>
		<td style="color: yellow;"><input type="text" name="airDate"> DD-MM-YY </td>
	</tr>
     <tr><td></td> <td></td> </tr>


<tr>
  	<td>Name </td>
  	<td><input type="text" name="name"></td>
</tr>
     <tr><td></td> <td></td> </tr>

     <tr>
	<td> Gender </td>
 	<td>
  	<input type="radio" name="gender" value="male" checked> Male<br>
  	<input type="radio" name="gender" value="female"> Female<br>
  	<input type="radio" name="gender" value="other"> Other
     </td>
	</tr>
  	<tr><td></td> <td></td> </tr>


   	<tr>
  		<td> Booking ID </td> 
		<td> <input type="text" name="bookingId" disabled="disabled" > </td> 
	</tr>
     <tr><td></td> <td></td> </tr>  


   	<tr>
  		<td> D.O.B.  </td>  
		<td style="color: yellow;"><input type="text" name="dob"> DD-MM-YY </td>
   	</tr>
	<tr><td></td> <td></td> </tr>	


     <tr>
       <td>
         	Departure Time
       </td>
       <td>
<select name="departureTime">
  <option value="6 AM">	6 AM 	</option>
  <option value="9 AM">	9 AM	</option>
  <option value="12 PM">	12 PM	</option>
  <option value="3 PM">	3 PM	</option>
  <option value="6 PM">	6 PM	</option>
  <option value="9 PM">	9 PM	</option>
  <option value="12 AM">	12 AM	</option>
  <option value="3 AM">	3 AM	</option>
</select>
       </td>
	</tr>
	<tr><td></td> <td></td> </tr>

     <tr>
	<td> Seat Class </td>
 	<td>
  	<input type="radio" name="seatClass" value="economy" onchange="handleClassChange();" checked> Economy<br>
  	<input type="radio" name="seatClass" value="premium" onchange="handleClassChange();" > Premium<br>
     </td>
	</tr>  	
	<tr><td></td> <td></td>
   
	<tr>
       <td>Fare</td>
       <td><input type="text" name="fare" style="color: blue;" value="6000" readonly="readonly" ></td>
	</tr>
	<tr><td></td> <td></td> </tr>

	<tr>
       <td>Mobile Number</td>
       <td><input type="text" name="mobileNo"></td>
	</tr>
	<tr><td></td> <td></td> </tr>

     <tr>
	<td> Pay Via: </td>
	<td>
  	<input type="radio" name="paymentOption" value="card"    onchange="handlePayViaChange();" > Credit/Debit Card<br>
	<input type="radio" name="paymentOption" value="cash"    onchange="handlePayViaChange();" > Cash<br>
	<input type="radio" name="paymentOption" value="cheque"  onchange="handlePayViaChange();" > Cheque<br>
     </td>
	</tr>

	<tr>
	<td></td>
	<td>
		<div id="cardInput" style="display:none;">
   			Input Card Number <input type="password" name="cardNo" >
			Input CVV Number <input type="password" name="cvvNo" >
    		</div>

		<div id="cashInput" style="display:none;">
   			Input Address  <textarea name="address" rows="4" cols="50"></textarea> 
    		</div>

		<div id="chequeInput" style="display:none;">
   			Input Cheque Number <input type="password" name="chequeNo" >
    		</div>
	</td> 
	</tr>


   	<tr>
		<td> Notes </td>
		<td> <textarea name="notes" rows="4" cols="50"></textarea> </td>
	</tr>

  </table>

  <br>

   <input type="submit" value="Save Booking">		
   <input type="text" name="prompt" disabled="disabled"  size="80">
   <a href="http://localhost:8088/UltraAirlines/AirwaysMenu.jsp">Go back to Main page</a> 
   <c:if test="${! empty rowsInserted}">
   	${rowsInserted} Booking Done. <br>
   </c:if> 

   </font>
	
</form>


</body>
</html>
