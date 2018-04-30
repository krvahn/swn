package kr.go.seoul.water.action.page;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import kr.go.seoul.water.action.BaseActionImp;
import kr.go.seoul.water.comm.WebUtils;
import kr.go.seoul.water.sql.dao.PageManualValueDao;

public class PageLabMeasureValueBaselineForm extends BaseActionImp {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 532518333828444636L;
	
	public PageLabMeasureValueBaselineForm()
	{
	}

	@Override
	public String execute() throws Exception {
		PageManualValueDao dao = new PageManualValueDao();
		Map<String, Object> params = null;
		params = _getParamMap();
		
		// PointCode ������
		List<String> itemCodeList = new ArrayList<String>();
		{
			StringTokenizer st = new StringTokenizer(WebUtils.CheckNull((params.get("ITEM_LIST")),""), ",");
			while(st.hasMoreTokens()) {
				itemCodeList.add(st.nextToken().trim());
			}
		}		
		params.put("ITEM_LIST", itemCodeList);
		
		if( itemCodeList.size() > 0 ) {
			if( dao.insertManualValueInOutResultDataList(params) > 0 ) {
				this.addFieldError("message", "��� �ڷḦ �����Ͽ����ϴ�.");
			} else {
				this.addFieldError("message", "�ڷḦ ������ �� �����ϴ�..");
			}
		} else {
			this.addFieldError("message", "������ �ڷᰡ �������� �ʽ��ϴ�.");
		}
		
		return "list";
	}
}
