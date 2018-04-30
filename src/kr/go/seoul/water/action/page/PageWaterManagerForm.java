package kr.go.seoul.water.action.page;

import java.util.Map;

import kr.go.seoul.water.action.BaseActionImp;
import kr.go.seoul.water.sql.dao.PageSystemDao;

public class PageWaterManagerForm extends BaseActionImp {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -5522287928650482538L;
	
	private String MODE;	
	private String WW_CODE;
	private String WW_NAME;
	private String MANAGER_NAME;	
	private String TELNUM;
	
	public PageWaterManagerForm()
	{
		MODE = "";
		WW_CODE = "";
		WW_NAME = "";
		MANAGER_NAME = "";
		TELNUM = "";
	}

	public String getMODE() {
		return MODE;
	}

	public void setMODE(String mODE) {
		MODE = mODE;
	}	
	
	public String getWW_CODE() {
		return WW_CODE;
	}

	public void setWW_CODE(String wW_CODE) {
		WW_CODE = wW_CODE;
	}

	public String getWW_NAME() {
		return WW_NAME;
	}

	public void setWW_NAME(String wW_NAME) {
		WW_NAME = wW_NAME;
	}

	public String getMANAGER_NAME() {
		return MANAGER_NAME;
	}

	public void setMANAGER_NAME(String mANAGER_NAME) {
		MANAGER_NAME = mANAGER_NAME;
	}

	public String getTELNUM() {
		return TELNUM;
	}

	public void setTELNUM(String tELNUM) {
		TELNUM = tELNUM;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		String ret;		
		PageSystemDao dao = new PageSystemDao();
		Map<String, Object> item = null;
		
		Map<String, Object> params = null;
		params = _getParamMap();
		
		ret = "list";
		
		// MODE 검사
		if( getMODE().equals("") || getMODE().equals("view") ) {
			setMODE("update");
			ret = "view";
			
			item = dao.seletOneWaterManagerData(params);
			
			if( item != null && item.size() > 0 ) {
				setWW_CODE(String.valueOf(item.get("WW_CODE")));
				setWW_NAME(String.valueOf(item.get("WW_NAME")));
				setMANAGER_NAME(String.valueOf(item.get("MANAGER_NAME")));
				setTELNUM(String.valueOf(item.get("TELNUM")));
			} else {				
				// 메세지 출력
				this.addFieldError("message", "해당 데이터가 존재 하지 않습니다.");
				
				ret = "list";
			}
		} else if( getMODE().equals("update") ) {
			ret = "list";
			
			if( dao.updateWaterManagerData(params) <= 0 ) {
				// 메세지 출력
				this.addFieldError("message", "해당 데이터를 수정 할 수 없습니다.");
				
				ret = "view";
			}
		}
		
		return ret;
	}
}
