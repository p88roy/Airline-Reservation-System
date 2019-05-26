public class AvailableAirlineQueryBean
{
 private String airlineCode;
 private String airlineName;
 private String routeCode;
 private String seatCapacityPremium;
 private String seatCapacityEconomy;
 private String flightDays;


 public AvailableAirlineQueryBean() {
 }
 
 public void setAirlineCode(String aAirlineCode) {
   airlineCode= aAirlineCode;
}
 public String getAirlineCode() {
   return airlineCode;
}


public void setAirlineName(String aAirlineName) {
   airlineName= aAirlineName;
}
 public String getAirlineName() {
   return airlineName;
}


public void setRouteCode(String aRouteCode) {
   routeCode= aRouteCode;
}
 public String getRouteCode() {
   return routeCode;
}


public void setSeatCapacityPremium(String aSeatCapacityPremium) {
   seatCapacityPremium= aSeatCapacityPremium;
}
 public String getSeatCapacityPremium() {
   return seatCapacityPremium;
}


 public void setSeatCapacityEconomy(String aSeatCapacityEconomy) {
   seatCapacityEconomy= aSeatCapacityEconomy;
}
 public String getSeatCapacityEconomy() {
   return seatCapacityEconomy;
}


 public void setFlightDays(String aFlightDays) {
   flightDays= aFlightDays;
}
 public String getFlightDays() {
   return flightDays;
}



}
