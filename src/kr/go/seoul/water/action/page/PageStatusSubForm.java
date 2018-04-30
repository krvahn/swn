package kr.go.seoul.water.action.page;

import java.util.Map;

import kr.go.seoul.water.action.BaseActionImp;
import kr.go.seoul.water.comm.WebConst;
import kr.go.seoul.water.sql.dao.PageSystemDao;

public class PageStatusSubForm extends BaseActionImp {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -5522287928650482538L;
	
	private String MODE;	
	private String TOP_STATUS_CODE;
	private String STATUS_CODE;	
	private String STATUS_NAME;
	private String STATUS_TYPE;
	private String STATUS_DESC;
	
	public PageStatusSubForm()
	{
		MODE = "";
		TOP_STATUS_CODE = "";
		STATUS_CODE = "";
		STATUS_NAME = "";
		STATUS_TYPE = "";
		STATUS_DESC = "";
	}

	public String getMODE() {
		return MODE;
	}

	public void setMODE(String mODE) {
		MODE = mODE;
	}
	
	public String getTOP_STATUS_CODE() {
		return TOP_STATUS_CODE;
	}

	public void setTOP_STATUS_CODE(String tOP_STATUS_CODE) {
		TOP_STATUS_CODE = tOP_STATUS_CODE;
	}

	public String getSTATUS_CODE() {
		return STATUS_CODE;
	}

	public void setSTATUS_CODE(String sTATUS_CODE) {
		STATUS_CODE = sTATUS_CODE;
	}

	public String getSTATUS_NAME() {
		return STATUS_NAME;
	}

	public void setSTATUS_NAME(String sTATUS_NAME) {
		STATUS_NAME = sTATUS_NAME;
	}

	public String getSTATUS_TYPE() {
		return STATUS_TYPE;
	}

	public void setSTATUS_TYPE(String sTATUS_TYPE) {
		STATUS_TYPE = sTATUS_TYPE;
	}

	public String getSTATUS_DESC() {
		return STATUS_DESC;
	}

	public void setSTATUS_DESC(String sTATUS_DESC) {
		STATUS_DESC = sTATUS_DESC;
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
		
		// MODE �˻�
		if( getMODE().equals("") || getMODE().equals("add") ) {
			setMODE("save");
			ret = "view";
		} else if( getMODE().equals("select") ) {
			setMODE("update");
			ret = "view";
			
			item = dao.seletOneStatusSubData(params);
			
			if( item != null && item.size() > 0 ) {
				setTOP_STATUS_CODE(String.valueOf(item.get("TOP_STATUS_CODE")));
				setSTATUS_CODE(String.valueOf(item.get("STATUS_CODE")));
				setSTATUS_NAME(String.valueOf(item.get("STATUS_NAME")));
				setSTATUS_TYPE(String.valueOf(item.get("STATUS_TYPE")));
				
				if( item.get("STATUS_DESC") != null ) {
					setSTATUS_DESC(WebConst.ToReCheckWord(String.valueOf(item.get("STATUS_DESC"))));
				} else {
					setSTATUS_DESC("");
				}
			} else {				
				// �޼��� ���
				this.addFieldError("message", "�ش� �����Ͱ� ���� ���� �ʽ��ϴ�.");
				
				ret = "list";
			}
		} else if( getMODE().equals("delete") ) {
			ret = "list";
			
			if( dao.deleteStatusSubData(params) < 0 ) {
				// �޼��� ���
				this.addFieldError("message", "�ش� �����͸� ���� �� �� �����ϴ�.");
			}
		} else if( getMODE().equals("update") ) {
			ret = "list";
			
			if( params.get("STATUS_DESC") != null ) {
				params.put("STATUS_DESC", WebConst.ToCheckWord(String.valueOf(params.get("STATUS_DESC"))));
			} else {
				params.put("STATUS_DESC", "");
			}
			
			if( dao.updateStatusSubData(params) <= 0 ) {
				// �޼��� ���
				this.addFieldError("message", "�ش� �����͸� ���� �� �� �����ϴ�.");
				
				ret = "view";
			}
		} else if( getMODE().equals("save") ) {
			ret = "list";
			
			if( params.get("STATUS_DESC") != null ) {
				params.put("STATUS_DESC", WebConst.ToCheckWord(String.valueOf(params.get("STATUS_DESC"))));
			} else {
				params.put("STATUS_DESC", "");
			}
			
			if( dao.insertStatusSubData(params) <= 0 ) {
				// �޼��� ���
				this.addFieldError("message", "�ش� �����͸� �߰� �� �� �����ϴ�.");
				
				ret = "view";
			}
		}
		
		return ret;
	}
}
