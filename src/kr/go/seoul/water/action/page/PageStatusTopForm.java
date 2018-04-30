package kr.go.seoul.water.action.page;

import java.util.Map;

import kr.go.seoul.water.action.BaseActionImp;
import kr.go.seoul.water.sql.dao.PageSystemDao;

public class PageStatusTopForm extends BaseActionImp {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -4239962557336609750L;
	
	private String MODE;	
	private String TOP_STATUS_CODE;
	private String TOP_STATUS_NAME;
	private String USE_FLAG;
	
	public PageStatusTopForm()
	{
		MODE = "";
		TOP_STATUS_CODE = "";
		TOP_STATUS_NAME = "";
		USE_FLAG = "";
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

	public String getTOP_STATUS_NAME() {
		return TOP_STATUS_NAME;
	}

	public void setTOP_STATUS_NAME(String tOP_STATUS_NAME) {
		TOP_STATUS_NAME = tOP_STATUS_NAME;
	}

	public String getUSE_FLAG() {
		return USE_FLAG;
	}

	public void setUSE_FLAG(String uSE_FLAG) {
		USE_FLAG = uSE_FLAG;
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
			
			item = dao.seletOneStatusTopData(params);
			
			if( item != null && item.size() > 0 ) {
				setTOP_STATUS_CODE(String.valueOf(item.get("TOP_STATUS_CODE")));
				setTOP_STATUS_NAME(String.valueOf(item.get("TOP_STATUS_NAME")));
				setUSE_FLAG(String.valueOf(item.get("USE_FLAG")));
			} else {				
				// �޼��� ���
				this.addFieldError("message", "�ش� �����Ͱ� ���� ���� �ʽ��ϴ�.");
				
				ret = "list";
			}
		} else if( getMODE().equals("delete") ) {
			ret = "list";
			
			if( dao.deleteStatusTopData(params) < 0 ) {
				// �޼��� ���
				this.addFieldError("message", "�ش� �����͸� ���� �� �� �����ϴ�.");
			}
		} else if( getMODE().equals("update") ) {
			ret = "list";
			
			if( dao.updateStatusTopData(params) <= 0 ) {
				// �޼��� ���
				this.addFieldError("message", "�ش� �����͸� ���� �� �� �����ϴ�.");
				
				ret = "view";
			}
		} else if( getMODE().equals("save") ) {
			ret = "list";
			
			if( dao.insertStatusTopData(params) <= 0 ) {
				// �޼��� ���
				this.addFieldError("message", "�ش� �����͸� �߰� �� �� �����ϴ�.");
				
				ret = "view";
			}
		}
		
		return ret;
	}
}
