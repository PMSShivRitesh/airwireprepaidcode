package com.airwire.util;

import java.util.StringTokenizer;

public class DateUtil {

	
	public static String converdate(String cdate){
		//String cdate="07/22/2015"; 
		StringTokenizer t = new StringTokenizer(cdate);
			String month = t.nextToken("/");
			String date = t.nextToken("/");
			String year = t.nextToken("/");
			
			String newDate=year+"/"+month+"/"+date;
			return newDate;
		
	}
}
