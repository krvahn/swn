package kr.go.seoul.water.action.page;

import java.util.Map;

import kr.go.seoul.water.action.BaseActionImp;
import kr.go.seoul.water.sql.dao.PageSystemDao;

public class PageGroupManagerForm extends BaseActionImp {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -5522287928650482538L;
	
	private String MODE;	
	private String GROUP_CODE;
	private String GROUP_NAME;	
	private String GROUP_AUTH;
	
	public PageGroupManagerForm()
	{
		MODE = "";
		GROUP_CODE = "";
		GROUP_NAME = "";
		GROUP_AUTH = "";
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

	public String getGROUP_NAME() {
		return GROUP_NAME;
	}

	public void setGROUP_NAME(String gROUP_NAME) {
		GROUP_NAME = gROUP_NAME;
	}

	public String getGROUP_AUTH() {
		return GROUP_AUTH;
	}

	public void setGROUP_AUTH(String gROUP_AUTH) {
		GROUP_AUTH = gROUP_AUTH;
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
			
			item = dao.seletOneGroupManagerData(params);
			
			if( item != null && item.size() > 0 ) {
				setGROUP_CODE(String.valueOf(item.get("GROUP_CODE")));
				setGROUP_NAME(String.valueOf(item.get("GROUP_NAME")));
				setGROUP_AUTH(String.valueOf(item.get("GROUP_AUTH")));
			} else {				
				// 메세지 출력
				this.addFieldError("message", "해당 데이터가 존재 하지 않습니다.");
				
				ret = "list";
			}
		} else if( getMODE().equals("delete") ) {
			ret = "list";
			
			if( dao.deleteGroupManagerData(params) < 0 ) {
				// 메세지 출력
				this.addFieldError("message", "해당 데이터를 삭제 할 수 없습니다.");
			}
		} else if( getMODE().equals("update") ) {
			ret = "list";
			
			if( dao.updateGroupManagerData(params) <= 0 ) {
				// 메세지 출력
				this.addFieldError("message", "해당 데이터를 수정 할 수 없습니다.");
				
				ret = "view";
			}
		} else if( getMODE().equals("save") ) {
			ret = "list";
						
			if( dao.insertGroupManagerData(params) <= 0 ) {
				// 메세지 출력
				this.addFieldError("message", "해당 데이터를 추가 할 수 없습니다.");
				
				ret = "view";
			}
		}
		
		return ret;
	}
}
