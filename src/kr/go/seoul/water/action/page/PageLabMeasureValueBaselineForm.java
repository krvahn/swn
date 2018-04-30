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
		
		// PointCode 나누기
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
				this.addFieldError("message", "모든 자료를 저장하였습니다.");
			} else {
				this.addFieldError("message", "자료를 저장할 수 없습니다..");
			}
		} else {
			this.addFieldError("message", "저장할 자료가 존재하지 않습니다.");
		}
		
		return "list";
	}
}
