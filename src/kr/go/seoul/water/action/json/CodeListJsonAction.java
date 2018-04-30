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
		// Act�� ���� �б�
		if( act.equals("none") ) {
			// �� ������ ��� �ϱ�
			_listEmptReport();
		} else if( act.equals("wellwater.list") ) {
			// ��ü �������� �� ��������� �ڵ� ����Ʈ
			_listWaterWellCode();
		} else if( act.equals("point.list")) {
			_listPointCode();
		} else if( act.equals("user.select.point.list")) {
			_listUserSelectPointCode();
		} else if( act.equals("wellwater.all.list") ) {
			// �ش� well water �ڵ� ����Ʈ
			_listWaterWellAllCode();
		} else if( act.equals("wcode.list") ) {
			// ��������� �ڵ� ����Ʈ
			_listWaterCode();
		} else if( act.equals("pcode.list") ) {
			// �������� �ڵ� ����Ʈ
			_listPlantCode();
		} else if(act.equals("pcode.waterpath.analpoint.list") ) {
			// �������� ���賻 �������� �ڵ� ����Ʈ
			_listPlantWaterPathPointCode();
		} else if( act.equals("wcode.analpoint.list") ) {
			// ��������� �������� �ڵ� ����Ʈ
			_listWaterPointCode();
		} else if( act.equals("pcode.analpoint.list") ) {
			// �������� �������� �ڵ� ����Ʈ
			_listPlantPointCode();
		} else if( act.equals("pcode.analpoint.item.list") ) {
			// �������� ���������� ���������� ����Ʈ
			_listPlantPointItemCode();
		} else if( act.equals("wcode.analpoint.item.list") ) {
			// ��������� ���������� ���������� ����Ʈ
			_listWaterPointItemCode();
		} else if( act.equals("pcode.factory.list") ) {
			// �������� ���� �ڵ� ����Ʈ
			_listPlantFactoryCode();
		} else if( act.equals("pcode.factory.analpoint.list") ) {
			// �������� ������ �������� �ڵ� ����Ʈ
			_listPlantFactoryPointCode();
		} else if( act.equals("pointclass.list") ) {
			// ������ġ �ڵ� ����Ʈ
			_listPointClassCode();
		} else if( act.equals("pcode.pointclass.list") ) {
			// �������� ������ġ �ڵ� ����Ʈ
			_listPlantPointClassCode();
		} else if( act.equals("wcode.pointclass.list") ) {
			// ��������� ���ü���
			_listWaterPointClasseCode();
		} else if( act.equals("status.topcode.list") ) {
			// �������� �ڵ� - ��з�
			_listStatusTopCode();
		} else if( act.equals("lab.item_16.list")) {
			// ����� �����׸�(item_16) ����Ʈ
			_listLabItem16Code();
		} else if( act.equals("group.list") ) {
			// ����� �׷� �ڵ� ����Ʈ
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
		
		// JSON ������ ���
		_writeJsonResultPage(result);
		
		// �Ҹ�
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
			js.add("<center>������ �����Ͽ� �˻��Ͻʽÿ�.</center>");				
		} else {
			js.add("<center>��ϵ��� ���� Message Code �Դϴ�.</center>");
		}	
		
		for( int iLoop = 0; iLoop < nColSpan - 1; iLoop ++) {
			js.add("#colspan");
		}			
		array.add(js);
		
		result.put("aaData", array);
		
		// JSON ������ ���
		_writeJsonResultPage(result);
		
		// �Ҹ�
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
		
		// ������ �缳��
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
