package kr.go.seoul.water.action.page;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import kr.go.seoul.water.action.BaseActionImp;
import kr.go.seoul.water.comm.WebConst;
import kr.go.seoul.water.sql.dao.PageSystemDao;

public class PageMeasureItemForm extends BaseActionImp {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -5522287928650482538L;
	
	private String MODE;
	
	private String POINT_CLASS;
	private String USE_FLAG;
	private String ITEM_CODE;
	private String ITEM_NAME;
	private String ANAL_UNIT;
	private Double HIGH_HIGH;
	private Double HIGH;
	private Double LOW_LOW;
	private Double LOW;
	private String ITEM_REMARK;
	private String USER_ID;
	
	public PageMeasureItemForm()
	{
		MODE = "";
		POINT_CLASS = "";
		USE_FLAG = "";
		ITEM_CODE = "";
		ITEM_NAME = "";
		ANAL_UNIT = "";
		HIGH_HIGH = null;
		HIGH = null;
		LOW_LOW = null;
		LOW = null;
		ITEM_REMARK = "";
		USER_ID = "test1";
	}

	public String getMODE() {
		return MODE;
	}

	public void setMODE(String mODE) {
		MODE = mODE;
	}	

	public String getPOINT_CLASS() {
		return POINT_CLASS;
	}

	public void setPOINT_CLASS(String pOINT_CLASS) {
		POINT_CLASS = pOINT_CLASS;
	}

	public String getUSE_FLAG() {
		return USE_FLAG;
	}

	public void setUSE_FLAG(String uSE_FLAG) {
		USE_FLAG = uSE_FLAG;
	}

	public String getITEM_CODE() {
		return ITEM_CODE;
	}

	public void setITEM_CODE(String iTEM_CODE) {
		ITEM_CODE = iTEM_CODE;
	}

	public String getITEM_NAME() {
		return ITEM_NAME;
	}

	public void setITEM_NAME(String iTEM_NAME) {
		ITEM_NAME = iTEM_NAME;
	}

	public String getANAL_UNIT() {
		return ANAL_UNIT;
	}

	public void setANAL_UNIT(String aNAL_UNIT) {
		ANAL_UNIT = aNAL_UNIT;
	}
	
	public Double getHIGH_HIGH() {
		return HIGH_HIGH;
	}

	public void setHIGH_HIGH(Double hIGH_HIGH) {
		HIGH_HIGH = hIGH_HIGH;
	}

	public Double getHIGH() {
		return HIGH;
	}

	public void setHIGH(Double hIGH) {
		HIGH = hIGH;
	}

	public Double getLOW_LOW() {
		return LOW_LOW;
	}

	public void setLOW_LOW(Double lOW_LOW) {
		LOW_LOW = lOW_LOW;
	}

	public Double getLOW() {
		return LOW;
	}

	public void setLOW(Double lOW) {
		LOW = lOW;
	}

	public String getITEM_REMARK() {
		return ITEM_REMARK;
	}

	public void setITEM_REMARK(String iTEM_REMARK) {
		ITEM_REMARK = iTEM_REMARK;
	}

	public String getUSER_ID() {
		return USER_ID;
	}

	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		String ret;		
		PageSystemDao dao = new PageSystemDao();
		Map<String, Object> item = null;
		
		Map<String, Object> params = null;
		params = _getParamMap();
		
		System.out.println(params);
		
		ret = "list";
		
		// MODE 검사
		if( getMODE().equals("") || getMODE().equals("add") ) {
			setMODE("save");
			ret = "view";
		} else if( getMODE().equals("select") ) {
			setMODE("update");
			ret = "view";
			
			item = dao.seletOneMeasureItemData(params);
			
			if( item != null && item.size() > 0 ) {
				setPOINT_CLASS(String.valueOf(item.get("POINT_CLASS")));
				setUSE_FLAG(String.valueOf(item.get("USE_FLAG")));
				setITEM_CODE(String.valueOf(item.get("ITEM_CODE")));
				setITEM_NAME(String.valueOf(item.get("ITEM_NAME")));
				setANAL_UNIT(String.valueOf(item.get("ANAL_UNIT")));
				if( item.get("HIGH_HIGH") == null ) {
					setHIGH_HIGH(null);
				} else {
					setHIGH_HIGH((Double) item.get("HIGH_HIGH"));
				}
				if( item.get("HIGH") == null ) {
					setHIGH(null);
				} else {
					setHIGH((Double) item.get("HIGH"));
				}
				if( item.get("LOW_LOW") == null ) {
					setLOW_LOW(null);
				} else {
					setLOW_LOW((Double) item.get("LOW_LOW"));
				}
				if( item.get("LOW") == null ) {
					setLOW(null);
				} else {
					setLOW((Double) item.get("LOW"));
				}
				if( item.get("ITEM_REMARK") == null ) {
					setITEM_REMARK("");
				} else {
					setITEM_REMARK(WebConst.ToCheckWord(String.valueOf(item.get("ITEM_REMARK"))));
				}
			} else {				
				// 메세지 출력
				this.addFieldError("message", "해당 데이터가 존재 하지 않습니다.");				
				ret = "list";
			}
		} else if( getMODE().equals("update") ) {
			ret = "list";
			
			if( params.get("ITEM_REMARK") != null ) {
				params.put("ITEM_REMARK", WebConst.ToReCheckWord(String.valueOf(params.get("ITEM_REMARK"))));
			}
			
			if( dao.updateMeasureItemData(params) <= 0 ) {
				// 메세지 출력
				this.addFieldError("message", "해당 데이터를 수정 할 수 없습니다.");				
				ret = "view";
			}
		} else if( getMODE().equals("save") ) {
			ret = "list";
			
			if( params.get("ITEM_REMARK") != null ) {
				params.put("ITEM_REMARK", WebConst.ToReCheckWord(String.valueOf(params.get("ITEM_REMARK"))));
			}
			
			item = dao.selectOneExistAddMeasureItemData(params);
			if( item != null && item.size() > 0 && item.get("ITEM_CNT") != null && ((Integer) item.get("ITEM_CNT")) > 0 ) {
				// 메세지 출력
				this.addFieldError("message", "항목코드가 중복되었습니다.\\n\\n확인후 다시 시도해주세요.");
				ret = "view";
			} else {
				if( dao.insertAddMeasureItemData(params) <= 0 ) {
					// 메세지 출력
					this.addFieldError("message", "해당 데이터를 추가 할 수 없습니다.");					
					ret = "view";
				}
			}
		} else if( getMODE().equals("append") ) {
			ret = "list";
			
			if( params.get("ITEM_REMARK") != null ) {
				params.put("ITEM_REMARK", WebConst.ToReCheckWord(String.valueOf(params.get("ITEM_REMARK"))));
			}
			
			item = dao.selectOneExistAppendMeasureItemData(params);
			if( item != null && item.size() > 0 && item.get("ITEM_CNT") != null && ((Integer) item.get("ITEM_CNT")) > 0 ) {
				// 메세지 출력
				this.addFieldError("message", "이미 같은 내용의 항목이 등록되어있습니다.\\n\\n확인후 다시 시도해주세요.");
				ret = "view";
			} else {
				if( dao.insertAppendMeasureItemData(params) <= 0 ) {
					// 메세지 출력
					this.addFieldError("message", "해당 데이터를 추가 할 수 없습니다.");					
					ret = "view";
				}
			}
		}
		
		return ret;
	}

	@Override
	public void validate() {
		// TODO Auto-generated method stub
		HttpServletRequest req = null;
		
		req = ServletActionContext.getRequest();
	
		if( req != null ) {
			try {
				if( req.getParameter("HIGH_HIGH") != null && req.getParameter("HIGH_HIGH").equals("") == false ) {
					Double.valueOf(req.getParameter("HIGH_HIGH")); 
				}
			} catch(Exception e) {
				this.addFieldError("validate_HIGH_HIGH", "최상한 기준값을 숫자로 입력하셔야 합니다.");
			}
			
			try {
				if( req.getParameter("HIGH") != null && req.getParameter("HIGH").equals("") == false  ) {
					Double.valueOf(req.getParameter("HIGH")); 
				}
			} catch(Exception e) {
				this.addFieldError("validate_HIGH", "상한 기준값을 숫자로 입력하셔야 합니다.");
			}
			
			try {
				if( req.getParameter("LOW_LOW") != null && req.getParameter("LOW_LOW").equals("") == false  ) {
					Double.valueOf(req.getParameter("LOW_LOW")); 
				}
			} catch(Exception e) {
				this.addFieldError("validate_LOW_LOW", "최하한 기준값을 숫자로 입력하셔야 합니다.");
			}
			
			try {
				if( req.getParameter("LOW") != null && req.getParameter("LOW").equals("") == false  ) {
					Double.valueOf(req.getParameter("LOW")); 
				}
			} catch(Exception e) {
				this.addFieldError("validate_LOW", "하한 기준값을 숫자로 입력하셔야 합니다.");
			}
		}
		
		super.validate();
	}
}
