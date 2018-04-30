package kr.go.seoul.water.action.page;

import java.util.Map;

import kr.go.seoul.water.action.BaseActionImp;
import kr.go.seoul.water.comm.WebConst;
import kr.go.seoul.water.comm.WebUtils;
import kr.go.seoul.water.sql.dao.PageManualItemDao;

public class PageLabMeasureItemForm extends BaseActionImp {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 532518333828444636L;	
	
	private String MODE;
	
	private String ITEM_CODE;
	private String ITEM_KNAME;
	private String ITEM_ENAME;
	private String ITEM_UNIT;
	private String ENV_LOW;
	private String ENV_HIGH;
	private String EAT_LOW;
	private String EAT_HIGH;
	private String WATER_TYPE;
	private String WW_TYPE;
	private String REMARK;
	private String CHECK_CYCLE;
	private int OUTPUT_ORDER;
	private String ITEM_16;
	private String ITEM_23;
	private String ITEM_47;
	private String ITEM_55;

	
	public PageLabMeasureItemForm()
	{
		MODE = "";
		ITEM_CODE = "";
		ITEM_KNAME = "";
		ITEM_ENAME = "";
		ITEM_UNIT = "";
		ENV_LOW = "";
		ENV_HIGH = "";
		EAT_LOW = "";
		EAT_HIGH = "";
		WATER_TYPE = "";
		WW_TYPE = "";
		REMARK = "";
		CHECK_CYCLE = "";
		OUTPUT_ORDER = 0;
		ITEM_16 = "";
		ITEM_23 = "";
		ITEM_47 = "";
		ITEM_55 = "";
	}

	public String getMODE() {
		return MODE;
	}

	public void setMODE(String mODE) {
		MODE = mODE;
	}

	public String getITEM_CODE() {
		return ITEM_CODE;
	}

	public void setITEM_CODE(String iTEM_CODE) {
		ITEM_CODE = iTEM_CODE;
	}

	public String getITEM_KNAME() {
		return ITEM_KNAME;
	}

	public void setITEM_KNAME(String iTEM_KNAME) {
		ITEM_KNAME = iTEM_KNAME;
	}

	public String getITEM_ENAME() {
		return ITEM_ENAME;
	}

	public void setITEM_ENAME(String iTEM_ENAME) {
		ITEM_ENAME = iTEM_ENAME;
	}

	public String getITEM_UNIT() {
		return ITEM_UNIT;
	}

	public void setITEM_UNIT(String iTEM_UNIT) {
		ITEM_UNIT = iTEM_UNIT;
	}

	public String getENV_LOW() {
		return ENV_LOW;
	}

	public void setENV_LOW(String eNV_LOW) {
		ENV_LOW = eNV_LOW;
	}

	public String getENV_HIGH() {
		return ENV_HIGH;
	}

	public void setENV_HIGH(String eNV_HIGH) {
		ENV_HIGH = eNV_HIGH;
	}

	public String getEAT_LOW() {
		return EAT_LOW;
	}

	public void setEAT_LOW(String eAT_LOW) {
		EAT_LOW = eAT_LOW;
	}

	public String getEAT_HIGH() {
		return EAT_HIGH;
	}

	public void setEAT_HIGH(String eAT_HIGH) {
		EAT_HIGH = eAT_HIGH;
	}

	public String getWATER_TYPE() {
		return WATER_TYPE;
	}

	public void setWATER_TYPE(String wATER_TYPE) {
		WATER_TYPE = wATER_TYPE;
	}

	public String getWW_TYPE() {
		return WW_TYPE;
	}

	public void setWW_TYPE(String wW_TYPE) {
		WW_TYPE = wW_TYPE;
	}

	public String getREMARK() {
		return REMARK;
	}

	public void setREMARK(String rEMARK) {
		REMARK = rEMARK;
	}

	public String getCHECK_CYCLE() {
		return CHECK_CYCLE;
	}

	public void setCHECK_CYCLE(String cHECK_CYCLE) {
		CHECK_CYCLE = cHECK_CYCLE;
	}

	public int getOUTPUT_ORDER() {
		return OUTPUT_ORDER;
	}

	public void setOUTPUT_ORDER(int oUTPUT_ORDER) {
		OUTPUT_ORDER = oUTPUT_ORDER;
	}

	public String getITEM_16() {
		return ITEM_16;
	}

	public void setITEM_16(String iTEM_16) {
		ITEM_16 = iTEM_16;
	}

	public String getITEM_23() {
		return ITEM_23;
	}

	public void setITEM_23(String iTEM_23) {
		ITEM_23 = iTEM_23;
	}

	public String getITEM_47() {
		return ITEM_47;
	}

	public void setITEM_47(String iTEM_47) {
		ITEM_47 = iTEM_47;
	}

	public String getITEM_55() {
		return ITEM_55;
	}

	public void setITEM_55(String iTEM_55) {
		ITEM_55 = iTEM_55;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		String ret;		
		PageManualItemDao dao = new PageManualItemDao();
		Map<String, Object> item = null;
		
		Map<String, Object> params = null;
		params = _getParamMap();
		
		System.out.println(params);
		
		ret = "list";
		
		// MODE 검사
		if( getMODE().equals("") || getMODE().equals("add") ) {
			setMODE("save");
			ret = "view";
			
			item = dao.seletOneLabMeasureItemMaxOutputOrderData(params);
			if( item != null && item.size() > 0 ) {
				setOUTPUT_ORDER(WebUtils.String2Integer(WebUtils.CheckNull(item.get("OUTPUT_ORDER"), "")));
			}
		} else if( getMODE().equals("select") ) {
			setMODE("update");
			ret = "view";

			item = dao.seletOneLabMeasureItemData(params);			
			if( item != null && item.size() > 0 ) {
				setWW_TYPE(WebUtils.CheckNull(item.get("WW_TYPE"), ""));
				setCHECK_CYCLE(WebUtils.CheckNull(item.get("CHECK_CYCLE"), ""));
				setWATER_TYPE(WebUtils.CheckNull(item.get("WATER_TYPE"), ""));
				setITEM_CODE(WebUtils.CheckNull(item.get("ITEM_CODE"), ""));
				setITEM_16(String.valueOf(item.get("ITEM_16")));
				setITEM_23(String.valueOf(item.get("ITEM_23")));
				setITEM_47(String.valueOf(item.get("ITEM_47")));
				setITEM_55(String.valueOf(item.get("ITEM_55")));
				setITEM_KNAME(WebUtils.CheckNull(item.get("ITEM_KNAME"), ""));
				setITEM_ENAME(WebUtils.CheckNull(item.get("ITEM_ENAME"), ""));
				setITEM_UNIT(WebUtils.CheckNull(item.get("ITEM_UNIT"), ""));
				setENV_HIGH(WebUtils.CheckNull(item.get("ENV_HIGH"), ""));
				setENV_LOW(WebUtils.CheckNull(item.get("ENV_LOW"), ""));
				setEAT_HIGH(WebUtils.CheckNull(item.get("EAT_HIGH"), ""));
				setEAT_LOW(WebUtils.CheckNull(item.get("EAT_LOW"), ""));
				setOUTPUT_ORDER(WebUtils.String2Integer(WebUtils.CheckNull(item.get("OUTPUT_ORDER"), "")));
				if( item.get("REMARK") == null ) {
					setREMARK("");
				} else {
					setREMARK(WebConst.ToCheckWord(String.valueOf(item.get("REMARK"))));
				}
			} else {				
				// 메세지 출력
				this.addFieldError("message", "해당 데이터가 존재 하지 않습니다.");				
				ret = "view";
			}
		} else if( getMODE().equals("delete") ) {
			ret = "list";
			if( dao.deleteLabeMeasureItemData(params) > 0 ) {
				this.addFieldError("message", "해당 자료를 삭제하였습니다.");
			} else {
				// 메세지 출력
				this.addFieldError("message", "해당 자료를 삭제 할 수 없습니다.");
			}
		} else if( getMODE().equals("update") ) {
			ret = "list";
			
			if( params.get("REMARK") != null ) {
				params.put("REMARK", WebConst.ToReCheckWord(String.valueOf(params.get("REMARK"))));
			}
			
			if( dao.updateLabMeasureItemData(params) <= 0 ) {
				// 메세지 출력
				this.addFieldError("message", "해당 데이터를 수정 할 수 없습니다.");				
				ret = "view";
			}
		} else if( getMODE().equals("save") ) {
			ret = "list";
			
			if( params.get("REMARK") != null ) {
				params.put("REMARK", WebConst.ToReCheckWord(String.valueOf(params.get("REMARK"))));
			}

			item = dao.seletOneLabMeasureItemData(params);			
			if( item != null && item.size() > 0 ) {
				// 메세지 출력
				this.addFieldError("message", "항목코드가 중복되었습니다.\\n\\n확인후 다시 시도해주세요.");
				ret = "view";
			} else {
				if( dao.insertLabMeasureItemData(params) <= 0 ) {
					// 메세지 출력
					this.addFieldError("message", "해당 데이터를 추가 할 수 없습니다.");					
					ret = "view";
				}
			}
		} else if( getMODE().equals("append") ) {
			ret = "list";
			
			if( params.get("REMARK") != null ) {
				params.put("REMARK", WebConst.ToReCheckWord(String.valueOf(params.get("REMARK"))));
			}

			item = dao.seletOneLabMeasureItemData(params);			
			if( item != null && item.size() > 0 ) {
				// 메세지 출력
				this.addFieldError("message", "항목코드가 중복되었습니다.\\n\\n확인후 다시 시도해주세요.");
				ret = "view";
			} else {
				if( dao.insertLabMeasureItemData(params) <= 0 ) {
					// 메세지 출력
					this.addFieldError("message", "해당 데이터를 추가 할 수 없습니다.");					
					ret = "view";
				}
			}
		}
		
		return ret;
	}
}
