package kr.go.seoul.water.action.page;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import kr.go.seoul.water.action.BaseActionImp;
import kr.go.seoul.water.comm.WebUtils;
import kr.go.seoul.water.sql.dao.PageManualValueDao;

public class PageLabMeasureValuePowerForm extends BaseActionImp {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 532518333828444636L;	
	
	private String WW_CODE;
	private String WORK_DATE;
	private String POINT_CODE_LIST;
	
	public PageLabMeasureValuePowerForm()
	{
		WW_CODE = "";
		WORK_DATE = "";
		POINT_CODE_LIST = "";
	}

	public String getWW_CODE() {
		return WW_CODE;
	}

	public void setWW_CODE(String wW_CODE) {
		WW_CODE = wW_CODE;
	}

	public String getWORK_DATE() {
		return WORK_DATE;
	}

	public void setWORK_DATE(String wORK_DATE) {
		WORK_DATE = wORK_DATE;
	}

	public String getPOINT_CODE_LIST() {
		return POINT_CODE_LIST;
	}

	public void setPOINT_CODE_LIST(String pOINT_CODE_LIST) {
		POINT_CODE_LIST = pOINT_CODE_LIST;
	}

	@Override
	public String execute() throws Exception {
		PageManualValueDao dao = new PageManualValueDao();
		Map<String, Object> params = null;
		params = _getParamMap();
		
		// PointCode 나누기
		List<String> pointCodeList = new ArrayList<String>();
		{
			StringTokenizer st = new StringTokenizer(WebUtils.CheckNull((params.get("POINT_CODE_LIST")),""), ",");
			while(st.hasMoreTokens()) {
				pointCodeList.add(st.nextToken().trim());
			}
		}		
		params.put("POINT_CODE_LIST", pointCodeList);
		
		if( pointCodeList.size() > 0 ) {
			if( dao.insertManualValuePowerDataList(params) > 0 ) {
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
