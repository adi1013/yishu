package com.gcu.yishu.util.Date;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
//import java.util.Date;

public class DateUtilImpl implements DateUtil{

	@Override
	public String getDateStr() {
		// TODO Auto-generated method stub
		System.out.println("Date get Test");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String dateString=df.format(System.currentTimeMillis());
		return dateString;
	}

	@Override
	public Date getNowDate() {
		// TODO Auto-generated method stub
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String dateString = formatter.format(currentTime);
		ParsePosition pos = new ParsePosition(8);
		Date currentTime2 = formatter.parse(dateString, pos);
		return currentTime2;
	}
	
}
