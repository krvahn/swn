package kr.go.seoul.water.action.page;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import kr.go.seoul.water.action.BaseActionImp;
import kr.go.seoul.water.comm.WebUtils;
import kr.go.seoul.water.sql.dao.PageManualValueDao;

public class PageLabMeasureValuePlantForm extends BaseActionImp {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 532518333828444636L;	
	
	public PageLabMeasureValuePlantForm()
	{
	}

	@Override
	public String execute() throws Exception {
		PageManualValueDao dao = new PageManualValueDao();
		Map<String, Object> params = null;
		params = _getParamMap();
		
		List<String> itemCodeList = null;
		
		// PS_POINT_CODES 나누기
		itemCodeList = new ArrayList<String>();
		{
			StringTokenizer st = new StringTokenizer(WebUtils.CheckNull((params.get("PS_POINT_CODES")),""), ",");
			while(st.hasMoreTokens()) {
				itemCodeList.add(st.nextToken().trim());
			}
			
			params.put("PS_POINT_CODE_LIST", itemCodeList);
		}
		
		// SS_POINT_CODES 나누기
		itemCodeList = new ArrayList<String>();
		{
			StringTokenizer st = new StringTokenizer(WebUtils.CheckNull((params.get("SS_POINT_CODES")),""), ",");
			while(st.hasMoreTokens()) {
				itemCodeList.add(st.nextToken().trim());
			}
			
			params.put("SS_POINT_CODE_LIST", itemCodeList);
		}
		
		// RS_POINT_CODES 나누기
		itemCodeList = new ArrayList<String>();
		{
			StringTokenizer st = new StringTokenizer(WebUtils.CheckNull((params.get("RS_POINT_CODES")),""), ",");
			while(st.hasMoreTokens()) {
				itemCodeList.add(st.nextToken().trim());
			}
			
			params.put("RS_POINT_CODE_LIST", itemCodeList);
		}
		
		// AS_POINT_CODES 나누기
		itemCodeList = new ArrayList<String>();
		{
			StringTokenizer st = new StringTokenizer(WebUtils.CheckNull((params.get("AS_POINT_CODES")),""), ",");
			while(st.hasMoreTokens()) {
				itemCodeList.add(st.nextToken().trim());
			}
			
			params.put("AS_POINT_CODE_LIST", itemCodeList);
		}
		
		// AS_POINT_VAL_CNT 나누기
		itemCodeList = new ArrayList<String>();
		{
			StringTokenizer st = new StringTokenizer(WebUtils.CheckNull((params.get("AS_POINT_VAL_CNT")),""), ",");
			while(st.hasMoreTokens()) {
				itemCodeList.add(st.nextToken().trim());
			}
			
			params.put("AS_POINT_VAL_CNT_LIST", itemCodeList);
		}
		
		// ITEM_CODE 나누기
		itemCodeList = new ArrayList<String>();
		{
			StringTokenizer st = new StringTokenizer(WebUtils.CheckNull((params.get("ITEM_CODES")),""), ",");
			while(st.hasMoreTokens()) {
				itemCodeList.add(st.nextToken().trim());
			}
			
			params.put("ITEM_CODE_LIST", itemCodeList);
		}
		
		if( dao.insertManualValuePlantDataList(params) > 0 ) {
			this.addFieldError("message", "요기다.");
			this.addFieldError("message", "모든 자료를 저장하였습니다.");
		} else {
			this.addFieldError("message", "자료를 저장할 수 없습니다..");
		}
		
		return "list";
	}
}
