package kr.go.seoul.water.action.page;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import kr.go.seoul.water.action.BaseActionImp;
import kr.go.seoul.water.comm.WebUtils;
import kr.go.seoul.water.sql.dao.PageSystemDao;

public class PageUserManagerForm extends BaseActionImp {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 3984324507202150280L;
	
	private String MODE;
	private String GROUP_CODE;
	private String USER_ID;
	private String USER_NAME;
	private String PWD;
	private String TEL_NUM1;
	private String TEL_NUM2;
	private String TEL_NUM3;
	private String CELL_NUM1;
	private String CELL_NUM2;
	private String CELL_NUM3;
	private String WW_TYPE;
	private String WW_CODE;
	private String ALARM_TYPE1;
	private String ALARM_TYPE2;
	private String ALARM_TYPE3;
	private String SMS_WD;
	private String SMS_WN;
	private String SMS_HD;
	private String SMS_HN;
	private int USER_LEVEL;
	private String EXPIRE_FLAG;
	private String USER_AUTH;
	private String ITEMS;
	
	public PageUserManagerForm()
	{
		MODE = "";
		GROUP_CODE = "";
		USER_ID = "";
		USER_NAME = "";
		PWD = "";
		TEL_NUM1 = "";
		TEL_NUM2 = "";
		TEL_NUM3 = "";
		CELL_NUM1 = "";
		CELL_NUM2 = "";
		CELL_NUM3 = "";
		WW_TYPE = "";
		WW_CODE = "";
		ALARM_TYPE1 = "";
		ALARM_TYPE2 = "";
		ALARM_TYPE3 = "";
		SMS_WD = "";
		SMS_WN = "";
		SMS_HD = "";
		SMS_HN = "";
		USER_LEVEL = 1;
		EXPIRE_FLAG = "";
		USER_AUTH = "";
		ITEMS = "";
	}	

	public String getMODE() {
		return MODE;
	}



	public void setMODE(String mODE) {
		MODE = mODE;
	}



	public String getGROUP_CODE() {
		return GROUP_CODE;
	}



	public void setGROUP_CODE(String gROUP_CODE) {
		GROUP_CODE = gROUP_CODE;
	}



	public String getUSER_ID() {
		return USER_ID;
	}



	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}



	public String getUSER_NAME() {
		return USER_NAME;
	}



	public void setUSER_NAME(String uSER_NAME) {
		USER_NAME = uSER_NAME;
	}



	public String getPWD() {
		return PWD;
	}



	public void setPWD(String pWD) {
		PWD = pWD;
	}



	public String getTEL_NUM1() {
		return TEL_NUM1;
	}



	public void setTEL_NUM1(String tEL_NUM1) {
		TEL_NUM1 = tEL_NUM1;
	}



	public String getTEL_NUM2() {
		return TEL_NUM2;
	}



	public void setTEL_NUM2(String tEL_NUM2) {
		TEL_NUM2 = tEL_NUM2;
	}



	public String getTEL_NUM3() {
		return TEL_NUM3;
	}



	public void setTEL_NUM3(String tEL_NUM3) {
		TEL_NUM3 = tEL_NUM3;
	}



	public String getCELL_NUM1() {
		return CELL_NUM1;
	}



	public void setCELL_NUM1(String cELL_NUM1) {
		CELL_NUM1 = cELL_NUM1;
	}



	public String getCELL_NUM2() {
		return CELL_NUM2;
	}



	public void setCELL_NUM2(String cELL_NUM2) {
		CELL_NUM2 = cELL_NUM2;
	}



	public String getCELL_NUM3() {
		return CELL_NUM3;
	}



	public void setCELL_NUM3(String cELL_NUM3) {
		CELL_NUM3 = cELL_NUM3;
	}



	public String getWW_TYPE() {
		return WW_TYPE;
	}



	public void setWW_TYPE(String wW_TYPE) {
		WW_TYPE = wW_TYPE;
	}



	public String getWW_CODE() {
		return WW_CODE;
	}



	public void setWW_CODE(String wW_CODE) {
		WW_CODE = wW_CODE;
	}



	public String getALARM_TYPE1() {
		return ALARM_TYPE1;
	}



	public void setALARM_TYPE1(String aLARM_TYPE1) {
		ALARM_TYPE1 = aLARM_TYPE1;
	}



	public String getALARM_TYPE2() {
		return ALARM_TYPE2;
	}



	public void setALARM_TYPE2(String aLARM_TYPE2) {
		ALARM_TYPE2 = aLARM_TYPE2;
	}



	public String getALARM_TYPE3() {
		return ALARM_TYPE3;
	}



	public void setALARM_TYPE3(String aLARM_TYPE3) {
		ALARM_TYPE3 = aLARM_TYPE3;
	}



	public String getSMS_WD() {
		return SMS_WD;
	}



	public void setSMS_WD(String sMS_WD) {
		SMS_WD = sMS_WD;
	}



	public String getSMS_WN() {
		return SMS_WN;
	}



	public void setSMS_WN(String sMS_WN) {
		SMS_WN = sMS_WN;
	}



	public String getSMS_HD() {
		return SMS_HD;
	}



	public void setSMS_HD(String sMS_HD) {
		SMS_HD = sMS_HD;
	}



	public String getSMS_HN() {
		return SMS_HN;
	}



	public void setSMS_HN(String sMS_HN) {
		SMS_HN = sMS_HN;
	}



	public int getUSER_LEVEL() {
		return USER_LEVEL;
	}



	public void setUSER_LEVEL(int uSER_LEVEL) {
		USER_LEVEL = uSER_LEVEL;
	}



	public String getEXPIRE_FLAG() {
		return EXPIRE_FLAG;
	}



	public void setEXPIRE_FLAG(String eXPIRE_FLAG) {
		EXPIRE_FLAG = eXPIRE_FLAG;
	}



	public String getUSER_AUTH() {
		return USER_AUTH;
	}



	public void setUSER_AUTH(String uSER_AUTH) {
		USER_AUTH = uSER_AUTH;
	}

	public String getITEMS() {
		return ITEMS;
	}

	public void setITEMS(String iTEMS) {
		ITEMS = iTEMS;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		String ret;		
		PageSystemDao dao = new PageSystemDao();
		Map<String, Object> item = null;
		
		Map<String, Object> params = null;
		params = _getParamMap();
		
		List<String> datas;
		
		ret = "list";
		
		// MODE 검사
		if( getMODE().equals("") || getMODE().equals("add") ) {
			setMODE("save");
			ret = "view";
		} else if( getMODE().equals("select") ) {
			setMODE("update");
			ret = "view";

			item = dao.seletOneUserManagerData(params);			
			if( item != null && item.size() > 0 ) {
				setGROUP_CODE(WebUtils.CheckNull(item.get("GROUP_CODE"), ""));
				setUSER_ID(WebUtils.CheckNull(item.get("USER_ID"), ""));
				setUSER_NAME(WebUtils.CheckNull(item.get("USER_NAME"), ""));
				
				setWW_TYPE(WebUtils.CheckNull(item.get("WW_TYPE"), ""));
				setWW_CODE(WebUtils.CheckNull(item.get("WW_CODE"), ""));
				setALARM_TYPE1(WebUtils.CheckNull(item.get("ALARM_TYPE1"), "N"));
				setALARM_TYPE2(WebUtils.CheckNull(item.get("ALARM_TYPE2"), "N"));
				setALARM_TYPE3(WebUtils.CheckNull(item.get("ALARM_TYPE3"), "N"));
				setSMS_WD(WebUtils.CheckNull(item.get("SMS_WD"), "N"));
				setSMS_WN(WebUtils.CheckNull(item.get("SMS_WN"), "N"));
				setSMS_HD(WebUtils.CheckNull(item.get("SMS_HD"), "N"));
				setSMS_HN(WebUtils.CheckNull(item.get("SMS_HN"), "N"));
				setUSER_LEVEL(WebUtils.String2Integer(WebUtils.CheckNull(item.get("USER_LEVEL"), "")));
				setEXPIRE_FLAG(WebUtils.CheckNull(item.get("EXPIRE_FLAG"), ""));
				setUSER_AUTH(WebUtils.CheckNull(item.get("USER_AUTH"), ""));
				
				// 전화번호 만들기
				datas = new ArrayList<String>();
				{
					StringTokenizer st = new StringTokenizer(WebUtils.CheckNull((item.get("TEL_NUM")),""), "-");
					while(st.hasMoreTokens()) {
						datas.add(st.nextToken().trim());
					}
				}
				if( datas.size() > 0 ) {setTEL_NUM1(datas.get(0));} else {setTEL_NUM1("");}
				if( datas.size() > 1 ) {setTEL_NUM2(datas.get(1));} else {setTEL_NUM2("");}
				if( datas.size() > 2 ) {setTEL_NUM3(datas.get(2));} else {setTEL_NUM3("");}
				
				// 핸드폰 번호 만들기
				datas = new ArrayList<String>();
				{
					StringTokenizer st = new StringTokenizer(WebUtils.CheckNull((item.get("CELL_NUM")),""), "-");
					while(st.hasMoreTokens()) {
						datas.add(st.nextToken().trim());
					}
				}
				if( datas.size() > 0 ) {setCELL_NUM1(datas.get(0));} else {setCELL_NUM1("");}
				if( datas.size() > 1 ) {setCELL_NUM2(datas.get(1));} else {setCELL_NUM2("");}
				if( datas.size() > 2 ) {setCELL_NUM3(datas.get(2));} else {setCELL_NUM3("");}
			} else {				
				// 메세지 출력
				this.addFieldError("message", "해당 데이터가 존재 하지 않습니다.");				
				ret = "view";
			}
		} else if( getMODE().equals("delete") ) {
			ret = "list";

			if( dao.deleteUserManagerData(params) > 0 ) {
				this.addFieldError("message", "해당 자료를 삭제하였습니다.");
			} else {
				// 메세지 출력
				this.addFieldError("message", "해당 자료를 삭제 할 수 없습니다.");
			}
		} else if( getMODE().equals("update") ) {
			ret = "list";

			// 전화번호 넣기
			params.put("TEL_NUM", getTEL_NUM1() + "-" + getTEL_NUM2() + "-" + getTEL_NUM3() );
			
			// 핸드폰번호 넣기
			params.put("CELL_NUM", getCELL_NUM1() + "-" + getCELL_NUM2() + "-" + getCELL_NUM3() );
			
			// SMS 수신 사업소 넣기 
			datas = new ArrayList<String>();
			{
				StringTokenizer st = new StringTokenizer(getITEMS(), ",");
				while(st.hasMoreTokens()) {
					datas.add(st.nextToken().trim());
				}
			}
			params.put("ITEMS", datas);
			
			if( dao.updateUserManagerData(params) <= 0 ) {
				// 메세지 출력
				this.addFieldError("message", "해당 데이터를 수정 할 수 없습니다.");				
				ret = "view";
			}
		} else if( getMODE().equals("save") ) {
			ret = "list";
			
			// 전화번호 넣기
			params.put("TEL_NUM", getTEL_NUM1() + "-" + getTEL_NUM2() + "-" + getTEL_NUM3() );
			
			// 핸드폰번호 넣기
			params.put("CELL_NUM", getCELL_NUM1() + "-" + getCELL_NUM2() + "-" + getCELL_NUM3() );
			
			// SMS 수신 사업소 넣기 
			datas = new ArrayList<String>();
			{
				StringTokenizer st = new StringTokenizer(getITEMS(), ",");
				while(st.hasMoreTokens()) {
					datas.add(st.nextToken().trim());
				}
			}
			params.put("ITEMS", datas);

			item = dao.seletOneUserManagerData(params);			
			if( item != null && item.size() > 0 ) {
				// 메세지 출력
				this.addFieldError("message", "사용자 ID가 중복되었습니다.\\n\\n확인후 다시 시도해주세요.");
				ret = "view";
			} else {
				if( dao.insertUserManagerData(params) <= 0 ) {
					// 메세지 출력
					this.addFieldError("message", "해당 데이터를 추가 할 수 없습니다.");					
					ret = "view";
				}
			}
		}
		
		return ret;
	}
}
