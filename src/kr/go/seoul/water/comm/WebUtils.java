package kr.go.seoul.water.comm;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

public class WebUtils {
	
	/**
	 * 포맷 변환 함수
	 * @param number : 숫자
	 * @param fmt : 포맷
	 * @return 변환 문자열
	 */
	public static final String FormatNumber(Double number, String fmt) {
		Double digit = null;
		
		if( number == null )
		{
			digit = new Double(0.0);
		} else {
			digit = number;
		}
		
		NumberFormat nf = NumberFormat.getInstance();
		
		((DecimalFormat) nf).applyPattern(fmt);
		
		return nf.format(digit);
	}
	
	public static final double String2Double(String number)
	{
		double ret = 0;
		
		if( number != null && number.equals("") == false ) {
			try {
				ret = Double.valueOf(number);
			} catch(Exception e) {
				ret = 0;
			}
			
		}
		
		return ret;
	}
	
	public static final int String2Integer(String number)
	{
		int ret = 0;
		
		if( number != null && number.equals("") == false ) {
			try {
				ret = Integer.valueOf(number);
			} catch(Exception e) {
				ret = 0;
			}
			
		}
		
		return ret;
	}
	
	/**
	 * 포맷 변환 함수
	 * @param number : 숫자
	 * @param fmt : 포맷
	 * @return 변환 문자열
	 */
	public static final String FormatNumber(double number, String fmt) {
		NumberFormat nf = NumberFormat.getInstance();
		
		((DecimalFormat) nf).applyPattern(fmt);
		
		return nf.format(number);
	}
	
	/**
	 * 포맷 변환 함수
	 * @param number : 숫자
	 * @param fmt : 포맷
	 * @return 변환 문자열
	 */
	public static final String FormatNumber(Integer number, String fmt) {
		Integer digit = null;
		
		if( number == null )
		{
			digit = new Integer(0);
		} else {
			digit = number;
		}
		
		NumberFormat nf = NumberFormat.getInstance();
		
		((DecimalFormat) nf).applyPattern(fmt);
		
		return nf.format(digit);
	}
	
	/**
	 * 포맷 변환 함수
	 * @param number : 숫자
	 * @param fmt : 포맷
	 * @return 변환 문자열
	 */
	public static final String FormatNumber(int number, String fmt) {
		NumberFormat nf = NumberFormat.getInstance();
		
		((DecimalFormat) nf).applyPattern(fmt);
		
		return nf.format(number);
	}
	
	/**
	 * 현재 날짜 리턴 함수
	 * @param fmt : 날짜 포맷
	 * @return 변환 문자열
	 */
	public static String GetCurrentDateTimeFormat(String fmt) {
		DateFormat parser =  new SimpleDateFormat(fmt, Locale.KOREA);
		Calendar cal = Calendar.getInstance();
		
		// 테스틀 위해 2011년으로 셋팅 한다.
		//cal.set(Calendar.YEAR, 2011);
		
		return parser.format(cal.getTime());
	}
	
	public static String GetDiffCurrentDateTimeFormat(String fmt, String unit, int diff)
	{
		String curDate;
		
		curDate = WebUtils.GetCurrentDateTimeFormat(fmt);
		return WebUtils.DateTimeDiff(curDate, fmt, unit, diff);
	}
	
	/**
	 * 문자열을 날짜 변환 함수
	 * @param date : 날짜
	 * @param fromFmt : 입력 포맷
	 * @param toFmt : 출력 포맷
	 * @return 변환 문자열
	 */
	public static String String2DateTimeFormat(String date, String fromFmt, String toFmt) {
		SimpleDateFormat transFormat = new SimpleDateFormat(fromFmt);
		Date dt = null;
		
		try {
			dt = transFormat.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat(toFmt);
		return (dt == null ? date : sdf.format(dt));
	}
	
	/**
	 * 날짜 계산 함수
	 * @param dt : 날짜
	 * @param fromFmt : 날짜 포맷
	 * @param unit : 계산하고자 하는 단위
	 * @param diff : 계산 값
	 * @return 문자열
	 */
	public static String DateTimeDiff(String dt, String fromFmt, String unit, int diff) {
		String retDt = dt;
		DateFormat parser = new SimpleDateFormat(fromFmt, Locale.KOREA);
		Date d = null;
		Calendar cal = Calendar.getInstance();
		
		try {
			d = parser.parse(dt);
			cal.setTime(d);
			
			if( unit.equals("Y") || unit.equals("y")) {
				cal.add(Calendar.YEAR, diff);
			} else if( unit.equals("M") ) {
				cal.add(Calendar.MONTH, diff);
			} else if( unit.equals("D") || unit.equals("d") ) {
				cal.add(Calendar.DATE, diff);
			} else if( unit.equals("H") || unit.equals("h")) {
				cal.add(Calendar.HOUR, diff);
			} else if( unit.equals("m") ) {
				cal.add(Calendar.MINUTE, diff);
			} else if( unit.equals("S") || unit.equals("s") ) {
				cal.add(Calendar.SECOND, diff);
			}
			
			retDt = parser.format(cal.getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return retDt;
	}
	
	/**
	 * 월단위의 말일 구하기
	 * @param dt : 날짜
	 * @param fromFmt : 포맷 문자열
	 * @return 문자열
	 */
	public static String LastDayOfMonth(String dt, String fromFmt) {
		String retDt = dt;
		DateFormat parser = new SimpleDateFormat(fromFmt, Locale.KOREA);
		Date d = null;
		Calendar cal = Calendar.getInstance();
		
		try {
			d = parser.parse(dt);
			
			cal.setTime(d);			
			cal.add(Calendar.MONTH, 1);
			cal.set(Calendar.DATE, 1);
			cal.add(Calendar.DATE, -1);
			
			retDt = parser.format(cal.getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return retDt;
	}
	
	/**
	 * 날짜 문자열에서 각종 문자 지우기
	 * @param dt : 날짜
	 * @return 문자열
	 */
	public static String DateTrim(String dt)
	{
		String retDt = dt;
		
		retDt = retDt.replaceAll("-", "");
		retDt = retDt.replaceAll(":", "");
		retDt = retDt.replaceAll(" ", "");
		
		return retDt;
	}
	
	public static String CheckNull(Object obj, String defValue)
	{
		if( obj == null ) {
			return defValue;
		}
		
		return String.valueOf(obj).trim();
	}
}
