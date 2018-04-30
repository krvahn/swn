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
	 * ���� ��ȯ �Լ�
	 * @param number : ����
	 * @param fmt : ����
	 * @return ��ȯ ���ڿ�
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
	 * ���� ��ȯ �Լ�
	 * @param number : ����
	 * @param fmt : ����
	 * @return ��ȯ ���ڿ�
	 */
	public static final String FormatNumber(double number, String fmt) {
		NumberFormat nf = NumberFormat.getInstance();
		
		((DecimalFormat) nf).applyPattern(fmt);
		
		return nf.format(number);
	}
	
	/**
	 * ���� ��ȯ �Լ�
	 * @param number : ����
	 * @param fmt : ����
	 * @return ��ȯ ���ڿ�
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
	 * ���� ��ȯ �Լ�
	 * @param number : ����
	 * @param fmt : ����
	 * @return ��ȯ ���ڿ�
	 */
	public static final String FormatNumber(int number, String fmt) {
		NumberFormat nf = NumberFormat.getInstance();
		
		((DecimalFormat) nf).applyPattern(fmt);
		
		return nf.format(number);
	}
	
	/**
	 * ���� ��¥ ���� �Լ�
	 * @param fmt : ��¥ ����
	 * @return ��ȯ ���ڿ�
	 */
	public static String GetCurrentDateTimeFormat(String fmt) {
		DateFormat parser =  new SimpleDateFormat(fmt, Locale.KOREA);
		Calendar cal = Calendar.getInstance();
		
		// �׽�Ʋ ���� 2011������ ���� �Ѵ�.
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
	 * ���ڿ��� ��¥ ��ȯ �Լ�
	 * @param date : ��¥
	 * @param fromFmt : �Է� ����
	 * @param toFmt : ��� ����
	 * @return ��ȯ ���ڿ�
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
	 * ��¥ ��� �Լ�
	 * @param dt : ��¥
	 * @param fromFmt : ��¥ ����
	 * @param unit : ����ϰ��� �ϴ� ����
	 * @param diff : ��� ��
	 * @return ���ڿ�
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
	 * �������� ���� ���ϱ�
	 * @param dt : ��¥
	 * @param fromFmt : ���� ���ڿ�
	 * @return ���ڿ�
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
	 * ��¥ ���ڿ����� ���� ���� �����
	 * @param dt : ��¥
	 * @return ���ڿ�
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
