package kr.go.seoul.water.action.page;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import kr.go.seoul.water.action.BaseActionImp;
import kr.go.seoul.water.comm.WebUtils;
import kr.go.seoul.water.sql.dao.PageOperDao;

public class PageOperResultForm extends BaseActionImp {	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -7576634298717079415L;
	
	public PageOperResultForm()
	{
	}	

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		PageOperDao dao = new PageOperDao();
		
		Map<String, Object> params = null;
		params = _getParamMap();
		
		// WWCode ������
		List<String> wwCodeList = new ArrayList<String>();
		{
			StringTokenizer st = new StringTokenizer(WebUtils.CheckNull((params.get("WW_CODE_LIST")),""), ",");
			while(st.hasMoreTokens()) {
				wwCodeList.add(st.nextToken().trim());
			}
		}	
		params.put("WW_CODE_LIST", wwCodeList);
				
		if( dao.updateOperResultDataList(params) <= 0 ) {
			this.addFieldError("message", "�ش� �ڷḦ ���� �� �� �����ϴ�.");
		} else {
			this.addFieldError("message", "��� �ڷḦ �����Ͽ����ϴ�.");
		}
		
		// �Ҹ�
		dao = null;
		
		return "list";
	}
}
