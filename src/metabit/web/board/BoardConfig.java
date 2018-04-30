package metabit.web.board;

import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class BoardConfig {
	private static BoardConfig _instance = null;
	
	private SqlSessionFactory _sqlSession = null;
	private Map<String, String> _propMap = null;
	
	private BoardConfig()
	{		
		// ������Ƽ ���� �б�
		_propMap = new HashMap<String, String>();
		
		InputStream is = null;
		Properties props = null;
		
		try {
			props = new Properties();
			
			is = getClass().getResourceAsStream("/metabit/web/board/config.properties");				
			props.load(is);
			
			// Ű�� �б�
			_propMap.put("TITLE", props.getProperty("title", "Metabit Board Ver 1.0"));
			_propMap.put("MYBATIS", props.getProperty("myBatis", ""));
			_propMap.put("USER_ID", props.getProperty("user_id", ""));
			_propMap.put("USER_NAME", props.getProperty("user_name", ""));
			_propMap.put("USER_GROUP_CODE", props.getProperty("user_group_code", ""));
			_propMap.put("USER_AUTH", props.getProperty("user_auth", ""));
			_propMap.put("GROUP_AUTH", props.getProperty("group_auth", ""));
			_propMap.put("UPLOAD_PATH", props.getProperty("upload_path", ""));
			_propMap.put("LOGIN_PAGE", props.getProperty("login_page", ""));
		} catch (IOException ioe) {				
			ioe.printStackTrace();
		} finally {
			try { is.close(); } catch(Exception e) {} finally { is = null; }
			props = null;
		}
		
		// Sql Session Manager ���
		String resource = _propMap.get("MYBATIS");
		Reader reader = null;
		
		try {
			reader = Resources.getResourceAsReader(resource);
			_sqlSession = new SqlSessionFactoryBuilder().build(reader);
		} catch(IOException e) {
			e.printStackTrace();
		} finally {
			try { reader.close(); } catch(IOException e) {} finally {reader = null;}
		}
	}
	
	private static BoardConfig _Instance()
	{
		synchronized( BoardConfig.class ) {
			if( BoardConfig._instance == null ) {
				BoardConfig._instance = new BoardConfig();
			}
		}
		
		return BoardConfig._instance;
	}
	
	public static SqlSessionFactory GetSqlSession()
	{
		BoardConfig obj = BoardConfig._Instance();
		
		return obj._sqlSession;
	}
	
	public static String PageTitle()
	{
		BoardConfig obj = BoardConfig._Instance();
		
		return obj._propMap.get("TITLE");
	}
	
	public static String UserID()
	{
		BoardConfig obj = BoardConfig._Instance();
		
		return obj._propMap.get("USER_ID");
	}
	
	public static String UserName()
	{
		BoardConfig obj = BoardConfig._Instance();
		
		return obj._propMap.get("USER_NAME");
	}
	
	public static String UserGroupCode()
	{
		BoardConfig obj = BoardConfig._Instance();
		
		return obj._propMap.get("USER_GROUP_CODE");
	}
	
	public static String UserAuth()
	{
		BoardConfig obj = BoardConfig._Instance();
		
		return obj._propMap.get("USER_AUTH");
	}
	
	public static String GroupAuth()
	{
		BoardConfig obj = BoardConfig._Instance();
		
		return obj._propMap.get("GROUP_AUTH");
	}
	
	public static String UploadPath()
	{
		BoardConfig obj = BoardConfig._Instance();
		
		return obj._propMap.get("UPLOAD_PATH");
	}
	
	public static String LoginPage()
	{
		BoardConfig obj = BoardConfig._Instance();
		
		return obj._propMap.get("LOGIN_PAGE");
	}
	
	public static Long ToLong(Object obj, long defValue)
	{
		if( obj == null ) {
			return defValue;
		}
		
		return Double.valueOf(String.valueOf(obj)).longValue();
	}
	
	public static Integer ToInt(Object obj, int defValue)
	{
		if( obj == null ) {
			return defValue;
		}
		
		return  Double.valueOf(String.valueOf(obj)).intValue();
	}
	
	public static String ToString(Object obj, String defValue)
	{
		if( obj == null ) {
			return defValue;
		}
		
		return String.valueOf(obj);
	}
	
	public static String ToString(Object obj, String fmt, long defValue)
	{
		Double val;
		
		if( obj == null ) {
			val = Double.valueOf(defValue);
		} else {
			val = Double.valueOf(String.valueOf(obj));
		}
		
		NumberFormat nf = NumberFormat.getInstance();
		
		((DecimalFormat) nf).applyPattern(fmt);
		
		return nf.format(val);
	}
	
	public static String ToCheckWord(String content)
	{
		content = content.replace("&", "&amp;");
		content = content.replace("<", "&lt;");
		content = content.replace(">", "&gt;");
		content = content.replace("'", "&#39;");
		content = content.replace("\n", "<br>");
		
		return content;
	}
	
	public static String ToReCheckWord(String content)
	{
		content = content.replace("&amp;", "&");
		content = content.replace("&lt;", "<");
		content = content.replace("&gt;", ">");
		content = content.replace("&#39;", "'");
		content = content.replace("''", "'");
		content = content.replace("<br>", "\n");
		
		return content;
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
		cal.set(Calendar.YEAR, 2011);
		
		return parser.format(cal.getTime());
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
	
	public static String GetTopImageURL(String boardID)
	{
		String sTopImage;
		
		// ���� �������� ���� �ϵ��ڵ� ��
		sTopImage = "";
		
		if( boardID.equals("open") ) {
			sTopImage = "/images/board/20081212_swn_stitle08.jpg";
		} else if( boardID.equals("notice") ) {
			sTopImage = "/images/board/20081212_swn_stitle08.jpg";
		} else if( boardID.equals("free") ) {
			sTopImage = "/images/board/20081212_swn_stitle09.jpg";
		} else if( boardID.equals("waterwatch") ) {
			sTopImage = "/images/board/20081212_swn_stitle10.jpg";
		} else if( boardID.equals("law") ) {
			sTopImage = "/images/board/20081212_swn_stitle11.jpg";
		} else if( boardID.equals("trend") ) {
			sTopImage = "/images/board/20081212_swn_stitle12.jpg";
		} else if( boardID.equals("equip") ) {
			sTopImage = "/images/board/20081212_swn_stitle13.jpg";
		} else if( boardID.equals("watermanage") ) {
			sTopImage = "/images/board/20081212_swn_stitle14.jpg";
		} else if( boardID.equals("study") ) {
			sTopImage = "/images/board/20081212_swn_stitle21.jpg";
		} else if( boardID.equals("instrument") ) {
			sTopImage = "/images/board/20090511_swn_stitle06.jpg";
		}
		
		return sTopImage;
	}
	
	public static String GetWPName(String wpCode)
	{
		String retName = "";
		
		if( wpCode.equals("WW0000") ) {
			retName = "������������";
		} else if( wpCode.equals("PR0000") ) {
			retName = "�����������";
		} else if( wpCode.equals("PR0055") ) {
			retName = "����";
		} else if(wpCode.equals("PR0065")) {
			retName = "����";
		} else if(wpCode.equals("PR0183")) {
			retName = "�ҵ�";
		} else if(wpCode.equals("PR0370")) {
			retName = "�ϻ�";
		} else if(wpCode.equals("PR0407")) {
			retName = "������";		
		} else if(wpCode.equals("PR0710")) {
			retName = "����";
		} else if(wpCode.equals("WW0001")) {
			retName = "�ߺ�";
		} else if(wpCode.equals("WW0002")) {
			retName = "����";
		} else if(wpCode.equals("WW0003")) {
			retName = "����";
		} else if(wpCode.equals("WW0004")) {
			retName = "����";
		} else if(wpCode.equals("WW0005")) {
			retName = "�Ϻ�";
		} else if(wpCode.equals("WW0006")) {
			retName = "����";
		} else if(wpCode.equals("WW0007")) {
			retName = "����";
		} else if(wpCode.equals("WW0008")) {
			retName = "������";
		} else if(wpCode.equals("WW0009")) {
			retName = "����";
		} else if(wpCode.equals("WW0010")) {
			retName = "����";
		} else if(wpCode.equals("WW0011")) {
			retName = "����";
		}
		
		return retName;
	}
	
}
