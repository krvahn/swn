package kr.go.seoul.water.action.json;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kr.go.seoul.water.action.BaseActionImp;
import kr.go.seoul.water.comm.WebConst;
import kr.go.seoul.water.sql.dao.CodeDao;

public class CodeListJsonAction extends BaseActionImp {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -74012627475040384L;

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		String act;
		
		act = getAct();

		//System.out.println(getAct());
		// Act에 따른 분기
		if( act.equals("none") ) {
			// 빈 데이터 출력 하기
			_listEmptReport();
		} else if( act.equals("wellwater.list") ) {
			// 전체 정수센터 및 수도사업소 코드 리스트
			_listWaterWellCode();
		} else if( act.equals("point.list")) {
			_listPointCode();
		} else if( act.equals("user.select.point.list")) {
			_listUserSelectPointCode();
		} else if( act.equals("wellwater.all.list") ) {
			// 해당 well water 코드 리스트
			_listWaterWellAllCode();
		} else if( act.equals("wcode.list") ) {
			// 수도사업소 코드 리스트
			_listWaterCode();
		} else if( act.equals("pcode.list") ) {
			// 정수센터 코드 리스트
			_listPlantCode();
		} else if(act.equals("pcode.waterpath.analpoint.list") ) {
			// 정수센터 수계내 측정지점 코드 리스트
			_listPlantWaterPathPointCode();
		} else if( act.equals("wcode.analpoint.list") ) {
			// 수도사업소 측정지점 코드 리스트
			_listWaterPointCode();
		} else if( act.equals("pcode.analpoint.list") ) {
			// 정수센터 측정지점 코드 리스트
			_listPlantPointCode();
		} else if( act.equals("pcode.analpoint.item.list") ) {
			// 정수센터 측정지점별 측정아이템 리스트
			_listPlantPointItemCode();
		} else if( act.equals("wcode.analpoint.item.list") ) {
			// 수도사업소 측정지점별 측정아이템 리스트
			_listWaterPointItemCode();
		} else if( act.equals("pcode.factory.list") ) {
			// 정수센터 공정 코드 리스트
			_listPlantFactoryCode();
		} else if( act.equals("pcode.factory.analpoint.list") ) {
			// 정수센터 공정별 측정지점 코드 리스트
			_listPlantFactoryPointCode();
		} else if( act.equals("pointclass.list") ) {
			// 측정위치 코드 리스트
			_listPointClassCode();
		} else if( act.equals("pcode.pointclass.list") ) {
			// 정수센터 측정위치 코드 리스트
			_listPlantPointClassCode();
		} else if( act.equals("wcode.pointclass.list") ) {
			// 수도사업소 관련수계
			_listWaterPointClasseCode();
		} else if( act.equals("status.topcode.list") ) {
			// 상태정보 코드 - 대분류
			_listStatusTopCode();
		} else if( act.equals("lab.item_16.list")) {
			// 실험실 측정항목(item_16) 리스트
			_listLabItem16Code();
		} else if( act.equals("group.list") ) {
			// 사용자 그룹 코드 리스트
			_listGroupList();
		}
		
		return null;
	}
	
	@SuppressWarnings("unchecked")
	private void _writeCodeList(List<Map<String, String>> list)
	{
		Iterator<Map<String, String>> it;
		Map<String, String> item;
		
		JSONObject result = new JSONObject();
		JSONArray array = new JSONArray();
		JSONArray js = null;
		
		if( list != null ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				js = new JSONArray();
				js.add(item.get("CODE"));
				js.add(item.get("NAME"));
				
				array.add(js);
			}
		}
		
		result.put("aaItems", array);
		
		// JSON 데이터 출력
		_writeJsonResultPage(result);
		
		// 소멸
		list = null;
		result = null;
		array = null;
		js = null;
	}
	
	@SuppressWarnings("unchecked")
	private void _listEmptReport()
	{
		int nColSpan = 0;
		String msgCode;			
		JSONObject result = new JSONObject();
		JSONArray array = null;
		
		nColSpan = Integer.valueOf(String.valueOf(_getParamMap().get("COLSPAN")));		
		msgCode = (String) _getParamMap().get("MSG_CODE");
		
		array = new JSONArray();
		JSONArray js = new JSONArray();
		
		if( msgCode == null || msgCode.equals("") ) {
			js.add("<center>조건을 지정하여 검색하십시오.</center>");				
		} else {
			js.add("<center>등록되지 않은 Message Code 입니다.</center>");
		}	
		
		for( int iLoop = 0; iLoop < nColSpan - 1; iLoop ++) {
			js.add("#colspan");
		}			
		array.add(js);
		
		result.put("aaData", array);
		
		// JSON 데이터 출력
		_writeJsonResultPage(result);
		
		// 소멸
		result = null;
		array = null;
		js = null;		
	}
	
	private void _listWaterWellCode()
	{
		CodeDao dao = new CodeDao();
		List<Map<String, String>> list = null;
		Map<String, Object> params;
		
		params = new HashMap<String, Object>();
		list = dao.selectWallWaterCodeAllList(params);
		_writeCodeList(list);
		
		list = null;
		params = null;
		dao = null;
	}
	
	private void _listPointCode()
	{
		CodeDao dao = new CodeDao();
		List<Map<String, String>> list = null;
		Map<String, Object> params;
		
		params = new HashMap<String, Object>();
		list = dao.selectPointCodeAllList(params);
		_writeCodeList(list);
		
		list = null;
		params = null;
		dao = null;
	}
	
	private void _listUserSelectPointCode()
	{
		CodeDao dao = new CodeDao();
		List<Map<String, String>> list = null;
		
		list = dao.selectUserSelectPointCodeList(_getParamMap());
		_writeCodeList(list);
		
		list = null;
		dao = null;
	}
	
	private void _listWaterWellAllCode()
	{
		CodeDao dao = new CodeDao();
		List<Map<String, String>> list = null;
		
		list = dao.selectWallWaterCodeList(_getParamMap());
		_writeCodeList(list);
		
		list = null;
		dao = null;
	}
	
	private void _listWaterCode()
	{
		CodeDao dao = new CodeDao();
		List<Map<String, String>> list = null;
		Map<String, Object> params;
		
		params = new HashMap<String, Object>();
		params.put("WW_TYPE", "W");
		list = dao.selectWallWaterCodeList(params);
		_writeCodeList(list);
		
		list = null;
		params = null;
		dao = null;
	}
	
	private void _listPlantCode()
	{
		CodeDao dao = new CodeDao();
		List<Map<String, String>> list = null;
		Map<String, Object> params;
		
		params = new HashMap<String, Object>();
		params.put("WW_TYPE", "P");
		list = dao.selectWallWaterCodeList(params);
		_writeCodeList(list);
		
		params = null;
		dao = null;
	}
	
	private void _listPlantWaterPathPointCode()
	{
		CodeDao dao = new CodeDao();
		List<Map<String, String>> list = null;
		Iterator<Map<String, String>> it = null;
		Map<String, String> item = null;
		String tmp;
		
		list = dao.selectPlantWaterPathPointCodeList(_getParamMap());
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();				
				
				tmp = WebConst.GetPointShortFullName(String.valueOf(item.get("NAME")), String.valueOf(item.get("TYPE_NAME")));
				item.put("NAME", tmp);
			}
		}
		
		_writeCodeList(list);
		
		list = null;
		dao = null;
	}
	
	private void _listWaterPointCode()
	{
		CodeDao dao = new CodeDao();
		List<Map<String, String>> list = null;
		Iterator<Map<String, String>> it = null;
		Map<String, String> item = null;
		String tmp;
		
		list = dao.selectWaterPointCodeList(_getParamMap());
		
		// 데이터 재설정
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				tmp = WebConst.GetPointShortFullName(String.valueOf(item.get("NAME")), String.valueOf(item.get("TYPE_NAME")));
				item.put("NAME", tmp);
			}
		}
		
		_writeCodeList(list);
		
		list = null;
		dao = null;
	}
	
	private void _listPlantPointCode()
	{
		CodeDao dao = new CodeDao();
		List<Map<String, String>> list = null;
		
		list = dao.selectPlantPointCodeList(_getParamMap());
		
		_writeCodeList(list);
		
		list = null;
		dao = null;
	}
	
	private void _listPlantPointItemCode()
	{
		CodeDao dao = new CodeDao();
		List<Map<String, String>> list = null;
		
		list = dao.selectPlantPointItemCodeList(_getParamMap());
		
		_writeCodeList(list);
		
		list = null;
		dao = null;
	}
	
	private void _listWaterPointItemCode()
	{
		CodeDao dao = new CodeDao();
		List<Map<String, String>> list = null;
		
		list = dao.selectWaterPointItemCodeList(_getParamMap());
		
		_writeCodeList(list);
		
		list = null;
		dao = null;
	}
	
	private void _listPlantFactoryCode()
	{
		CodeDao dao = new CodeDao();
		List<Map<String, String>> list = null;
		
		list = dao.selectPlantFactoryCodeList(_getParamMap());
		
		_writeCodeList(list);
		
		list = null;
		dao = null;
	}
	
	private void _listPlantFactoryPointCode()
	{
		CodeDao dao = new CodeDao();
		List<Map<String, String>> list = null;
		
		list = dao.selectPlantFactoryPointCodeList(_getParamMap());
		
		_writeCodeList(list);
		
		list = null;
		dao = null;
	}
	
	private void _listPointClassCode()
	{
		CodeDao dao = new CodeDao();
		List<Map<String, String>> list = null;
		
		list = dao.selectPointClassCodeList(_getParamMap());
		
		_writeCodeList(list);
		
		list = null;
		dao = null;
	}
	
	private void _listPlantPointClassCode()
	{
		CodeDao dao = new CodeDao();
		List<Map<String, String>> list = null;
		
		list = dao.selectPlantPointClassCodeList(_getParamMap());
		
		_writeCodeList(list);
		
		list = null;
		dao = null;
	}
	
	private void _listWaterPointClasseCode()
	{
		CodeDao dao = new CodeDao();
		List<Map<String, String>> list = null;
		
		list = dao.selectWaterPointClassCodeList(_getParamMap());
		
		_writeCodeList(list);
		
		list = null;
		dao = null;
	}
	
	private void _listStatusTopCode()
	{
		CodeDao dao = new CodeDao();
		List<Map<String, String>> list = null;
		
		list = dao.selectStatusTopCodeList(_getParamMap());
		
		_writeCodeList(list);
		
		list = null;
		dao = null;
	}
	
	private void _listLabItem16Code()
	{
		CodeDao dao = new CodeDao();
		List<Map<String, String>> list = null;
		
		list = dao.selectLabItem16CodeList(_getParamMap());
		
		_writeCodeList(list);
		
		list = null;
		dao = null;
	}
	
	private void _listGroupList()
	{
		CodeDao dao = new CodeDao();
		List<Map<String, String>> list = null;
		
		list = dao.selectGroupCodeList(_getParamMap());
		
		_writeCodeList(list);
		
		list = null;
		dao = null;
	}
}
