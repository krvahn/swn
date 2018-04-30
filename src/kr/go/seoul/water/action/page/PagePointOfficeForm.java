package kr.go.seoul.water.action.page;

import java.util.Map;

import kr.go.seoul.water.action.BaseActionImp;
import kr.go.seoul.water.sql.dao.PageSystemDao;

public class PagePointOfficeForm extends BaseActionImp {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -5522287928650482538L;
	
	private String MODE;
	
	private String WW_TYPE;
	private String WW_CODE;
	private String POINT_CODE;
	private String PLANT_FACTORY_CODE;
	private String PLANT_POINT_CLASS_CODE;
	private String PLANT_POINT_NAME;
	private String WATER_PATH_CODE;
	private String WATER_POINT_CLASS_CODE;
	private String WATER_POINT_NAME;
	
	public PagePointOfficeForm()
	{
		MODE = "";
		WW_CODE = "";
		POINT_CODE = "";
		PLANT_FACTORY_CODE = "";
		PLANT_POINT_CLASS_CODE = "";
		PLANT_POINT_NAME = "";
		WATER_PATH_CODE = "";
		WATER_POINT_CLASS_CODE = "";
		WATER_POINT_NAME = "";
	}

	public String getMODE() {
		return MODE;
	}

	public void setMODE(String mODE) {
		MODE = mODE;
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

	public String getPOINT_CODE() {
		return POINT_CODE;
	}

	public void setPOINT_CODE(String pOINT_CODE) {
		POINT_CODE = pOINT_CODE;
	}

	public String getPLANT_FACTORY_CODE() {
		return PLANT_FACTORY_CODE;
	}

	public void setPLANT_FACTORY_CODE(String pLANT_FACTORY_CODE) {
		PLANT_FACTORY_CODE = pLANT_FACTORY_CODE;
	}

	public String getPLANT_POINT_CLASS_CODE() {
		return PLANT_POINT_CLASS_CODE;
	}

	public void setPLANT_POINT_CLASS_CODE(String pLANT_POINT_CLASS_CODE) {
		PLANT_POINT_CLASS_CODE = pLANT_POINT_CLASS_CODE;
	}

	public String getPLANT_POINT_NAME() {
		return PLANT_POINT_NAME;
	}

	public void setPLANT_POINT_NAME(String pLANT_POINT_NAME) {
		PLANT_POINT_NAME = pLANT_POINT_NAME;
	}

	public String getWATER_PATH_CODE() {
		return WATER_PATH_CODE;
	}

	public void setWATER_PATH_CODE(String wATER_PATH_CODE) {
		WATER_PATH_CODE = wATER_PATH_CODE;
	}

	public String getWATER_POINT_CLASS_CODE() {
		return WATER_POINT_CLASS_CODE;
	}

	public void setWATER_POINT_CLASS_CODE(String wATER_POINT_CLASS_CODE) {
		WATER_POINT_CLASS_CODE = wATER_POINT_CLASS_CODE;
	}

	public String getWATER_POINT_NAME() {
		return WATER_POINT_NAME;
	}

	public void setWATER_POINT_NAME(String wATER_POINT_NAME) {
		WATER_POINT_NAME = wATER_POINT_NAME;
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
		if( getMODE().equals("") || getMODE().equals("add") ) {
			setMODE("save");
			ret = "view";
		} else if( getMODE().equals("select") ) {
			setMODE("update");
			ret = "view";
			
			item = dao.seletOnePointOfficeData(params);
			
			if( item != null && item.size() > 0 ) {
				setWW_TYPE(String.valueOf(item.get("WW_TYPE")));
				setWW_CODE(String.valueOf(item.get("WW_CODE")));
				setPOINT_CODE(String.valueOf(item.get("POINT_CODE")));
				setPLANT_FACTORY_CODE(String.valueOf(item.get("PLANT_FACTORY_CODE")));
				setPLANT_POINT_CLASS_CODE(String.valueOf(item.get("PLANT_POINT_CLASS_CODE")));
				setPLANT_POINT_NAME(String.valueOf(item.get("PLANT_POINT_NAME")));
				setWATER_PATH_CODE(String.valueOf(item.get("WATER_PATH_CODE")));
				setWATER_POINT_CLASS_CODE(String.valueOf(item.get("WATER_POINT_CLASS_CODE")));
				setWATER_POINT_NAME(String.valueOf(item.get("WATER_POINT_NAME")));
			} else {				
				// 메세지 출력
				this.addFieldError("message", "해당 데이터가 존재 하지 않습니다.");				
				ret = "list";
			}
		} else if( getMODE().equals("delete") ) {
			ret = "list";
			
			if( dao.updatePointOfficeDataForDelete(params) <= 0 ) {
				// 메세지 출력
				this.addFieldError("message", "해당 데이터를 삭제 할 수 없습니다.");
			}
		} else if( getMODE().equals("update") ) {
			ret = "list";
			
			if( dao.updatePointOfficeData(params) <= 0 ) {
				// 메세지 출력
				this.addFieldError("message", "해당 데이터를 수정 할 수 없습니다.");
				
				ret = "view";
			}
		} else if( getMODE().equals("save") ) {
			ret = "list";
						
			if( dao.insertPointOfficeData(params) <= 0 ) {
				// 메세지 출력
				this.addFieldError("message", "해당 데이터를 추가 할 수 없습니다.");
				
				ret = "view";
			}
		}
		
		return ret;
	}
}
