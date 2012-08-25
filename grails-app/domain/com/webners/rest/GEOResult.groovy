package com.webners.rest

class GEOResult {

	 String latitude;
     String longitude;
     String type;
     String state;
     String postcode;
     String country;
	 String city;
	 int zoom = 9;
	 
	 def getXAxis(){
		 double lon = Double.parseDouble(longitude);
		 int xtile = (int) Math.floor((lon + 180) / 360 * (1 << zoom));
	 	 return xtile;
	}
	 
	 def getYAxis(){
		 double lat = Double.parseDouble(latitude);
		 int ytile = (int) Math
		 .floor((1 - Math.log(Math.tan(Math.toRadians(lat)) + 1
				 / Math.cos(Math.toRadians(lat)))
				 / Math.PI)
				 / 2 * (1 << zoom));
		return ytile;	 
	 }
	 
	 def getMapLink(){
		 return 'https://api.tomtom.com/lbs/map/3/basic/1/'+zoom+'/'+getXAxis()+'/'+getYAxis()+'.png?key=e36mysqn9xvgrj5z2m52rjvu';
	 }
	 
}
