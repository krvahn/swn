package kr.go.seoul.water.comm;

import java.util.ArrayList;
import java.util.List;

public class MapConst {
	// 사업소 데이터
	// {"코드", "명칭", "전화번호"},
	private static String _aCorpWaterData[][] = 
	{
		{"WW0001", "중부수도사업소", "02-3146-2000"},
		{"WW0006", "서부수도사업소", "02-3146-3500"},
		{"WW0003", "동부수도사업소", "02-3146-2600"},
		{"WW0005", "북부수도사업소", "02-3146-3200"},
		{"WW0007", "강서수도사업소", "02-3146-3800"},
		{"WW0009", "남부수도사업소", "02-3146-4400"},
		{"WW0010", "강남수도사업소", "02-3146-4700"},
		{"WW0011", "강동수도사업소", "02-3146-5000"}
	};

	// 정수센터 데이터
	// {"코드", "명칭", "전화번호"},
	private static String _aWellWaterData[][] = {
		{"PR0055", "광암아리수정수센터",    "02-3146-5300"}, 
		{"PR0370", "암사아리수정수센터",    "02-3146-5700"}, 
		{"PR0407", "영등포아리수정수센터", "02-3146-5600"}, 
		{"PR0710", "강북아리수정수센터",    "02-3146-5800"}, 
		{"PR0065", "구의아리수정수센터",    "02-3146-5400"}, 
		{"PR0183", "뚝도아리수정수센터",    "02-3146-5500"} 
	};

	// 지점별 데이터
	// {"코드", "명칭", "설치장소(없는경우 명칭과 동일}", "정류센터코드", "사업소코드"}
	// 취수장, 중부, 서부, 동부, 북부, 강서, 남부, 강남, 강동
	private static String _aPointData[][] = {	
		{"051", "강북취수장", 		"", "", ""}, 
		{"041", "암사취수장", 		"", "", ""}, 
		{"035", "풍납취수장", 		"", "", ""}, 
		{"008", "구의취수장", 		"", "", ""}, 
		{"024", "자양취수장", 		"", "", ""}, 
		
		{"100", "장충동", 				"중부수도사업소", "PR0183", "WW0001"}, 
		{"101", "삼청가압장", 		"", "PR0183", "WW0001"}, 
		{"113", "남산배수지", 		"", "PR0183", "WW0001"}, 
		{"114", "보광가압장", 		"", "PR0183", "WW0001"}, 
		{"115", "보광배수지", 		"", "PR0183", "WW0001"}, 
		{"130", "종암가압장", 		"", "PR0710", "WW0001"}, 
		{"131", "성북1가압장", 		"", "PR0710", "WW0001"}, 
		{"132", "월곡대배수지", 		"", "PR0710", "WW0001"}, 
		{"133", "월곡소배수지", 		"", "PR0710", "WW0001"}, 
		{"102", "종암1동", 			"성북소방소", "PR0710", "WW0001"}, 
		{"103", "삼선2동", 			"돈암119", "PR0710", "WW0001"}, 
		{"104", "이화동", 				"사대부속초등학교", "PR0183", "WW0001"}, 
		{"306", "소공동", 				"시청사", "PR0183", "WW0001"}, 
		{"401", "정릉2배수지", 		"", "PR0710", "WW0001"}, 
		{"402", "정릉3배수지", 		"", "PR0710", "WW0001"}, 
		{"403", "성북2배수지", 		"", "PR0710", "WW0001"}, 
		{"404", "낙산배수지", 		"", "PR0183", "WW0001"}, 
		{"405", "경내가압장", 		"", "PR0183", "WW0001"}, 
		{"406", "무악배수지", 		"", "PR0183", "WW0001"}, 
		{"407", "세종로", 				"광화문광장", "PR0183", "WW0001"}, 
		{"408", "서빙고동", 				"서빙고초등학교", "PR0183", "WW0001"}, 
		
		{"110", "만리가압장", 		"", "PR0183", "WW0006"}, 
		{"111", "만리배수지", 		"", "PR0183", "WW0006"}, 
		{"112", "와우산배수지", 		"", "PR0183", "WW0006"}, 
		{"150", "증산배수지", 		"", "PR0407", "WW0006"}, 
		{"151", "북악배수지", 		"", "PR0710", "WW0006"}, 
		{"152", "현행가압장", 		"", "PR0183", "WW0006"}, 
		{"153", "독박골배수지", 		"", "PR0710", "WW0006"}, 
		{"155", "불광배수지", 		"", "PR0710", "WW0006"}, 
		{"156", "삼우배수지", 		"", "PR0710", "WW0006"}, 
		{"157", "백련배수지", 		"", "PR0710", "WW0006"}, 
		{"116", "신수동", 				"마포소방소", "PR0183", "WW0006"}, 
		//{"117", "홍제4동", 			"서부수도사업소", "PR0710", "WW0006"}, 
		{"118", "성산동", 				"월드컵공원", "PR0407", "WW0006"}, 
		{"119", "응암동", 				"서울시립소년의집", "PR0407", "WW0006"}, 
		{"158", "홍제1동", 			"송죽원", "PR0710", "WW0006"}, 
		{"302", "도화동", 				"마포쌍용아파트", "PR0183", "WW0006"}, 
		{"307", "진관배수지", 		"", "PR0710", "WW0006"}, 
		{"409", "가좌배수지", 		"", "PR0710", "WW0006"}, 
		{"410", "홍은배수지", 		"", "PR0710", "WW0006"}, 
		{"411", "홍제배수지", 		"", "PR0710", "WW0006"}, 
		{"412", "연희배수지", 		"", "PR0710", "WW0006"}, 
		{"413", "수색배수지", 		"", "PR0407", "WW0006"}, 
		{"414", "노고산배수지", 		"", "PR0183", "WW0006"}, 
		{"415", "남가좌2배수지", 	"", "PR0710", "WW0006"}, 
		{"416", "진관동", 				"진관동동사무소", "PR0710", "WW0006"}, 
		
		{"120", "행당1동", 			"동부수도사업소", "PR0183", "WW0003"}, 
		{"121", "용마배수지", 		"", "PR0065", "WW0003"}, 
		{"122", "아차산배수지", 		"", "PR0370", "WW0003"}, 
		{"123", "대현산배수지", 		"", "PR0183", "WW0003"}, 
		{"124", "구의2동", 			"서울물연구원", "PR0370", "WW0003"}, 
		{"125", "성수1동", 			"성수2가1동사무소", "PR0370", "WW0003"}, 
		{"126", "신내동", 				"중랑소방소", "PR0065", "WW0003"}, 
		{"127", "신설동", 				"시립동부병원", "PR0370", "WW0003"}, 
		{"128", "옥수2동", 			"옥정초등학교", "PR0183", "WW0003"}, 
		{"417", "용마소배수지", 		"", "PR0065", "WW0003"}, 
		{"418", "아차산소배수지", 	"", "PR0370", "WW0003"}, 
		{"419", "금호배수지", 		"", "PR0183", "WW0003"}, 
		{"420", "용봉배수지", 		"응봉배수지", "PR0183", "WW0003"}, 
		{"421", "전농동", 				"시립대학교", "PR0710", "WW0003"}, 
		{"422", "장안3동", 			"동대문소방소", "PR0710", "WW0003"}, 
		{"423", "면목7동", 			"사가정공원", "PR0065", "WW0003"}, 
		{"424", "중곡4동", 			"중곡119", "PR0370", "WW0003"}, 
		
		{"140", "상계가압장", 		"", "PR0710", "WW0005"}, 
		{"141", "공릉배수지", 		"", "PR0710", "WW0005"}, 
		{"142", "수유가압장", 		"", "PR0710", "WW0005"}, 
		{"143", "월계배수지", 		"", "PR0710", "WW0005"}, 
		{"144", "번2동", 				"북부수도사업소", "PR0710", "WW0005"}, 
		{"145", "수유2동", 			"흰구름어린이공원", "PR0710", "WW0005"}, 
		{"146", "월계2동(119)", 			"월계119안전센터", "PR0710", "WW0005"}, 
		{"147", "방학3동", 			"발바닥공원(방학3동사무소}", "PR0710", "WW0005"}, 
		//{"303", "중계본동", 			"중계현대6차", "PR0710", "WW0005"}, 
		{"304", "상계3동", 			"상계불암대림", "PR0710", "WW0005"}, 
		{"425", "번동소배수지", 		"", "PR0710", "WW0005"}, 
		{"426", "419배수지", 			"", "PR0710", "WW0005"}, 
		{"428", "도봉1동", 			"도봉1주민센터", "PR0710", "WW0005"}, 
		{"429", "도봉2동", 			"도봉2주민센터", "PR0710", "WW0005"}, 
			
		{"160", "신정배수지", 		"", "PR0407", "WW0007"}, 
		{"161", "목동배수지", 		"", "PR0407", "WW0007"}, 
		{"162", "우장산배수지", 		"", "PR0407", "WW0007"}, 
		{"163", "화곡배수지", 		"", "PR0407", "WW0007"}, 
		{"164", "신월배수지", 		"", "PR0407", "WW0007"}, 
		{"165", "신정6동", 		"강서수도사업소", "PR0407", "WW0007"}, 
		{"170", "구로4동", 			"강서수도민원센터", "PR0370", "WW0007"}, 
		{"166", "구로3동", 			"공단119", "PR0370", "WW0007"}, 
		{"471", "고척2동", 			"고척도서관", "PR0407", "WW0007"}, 
		{"168", "방화3동", 			"국립국어원", "PR0407", "WW0007"}, 
		{"430", "오류2배수지", 		"", "PR0407", "WW0007"}, 
		{"431", "개봉배수지", 		"", "PR0407", "WW0007"}, 
		{"432", "등촌동", 				"신기술창업센터", "PR0407", "WW0007"}, 
		{"433", "신정2동", 				"신정현대아파트", "PR0407", "WW0007"}, 
		
		{"171", "영등포공원", 		"영등포공원", "PR0370", "WW0009"}, 
		{"172", "독산배수지", 		"", "PR0370", "WW0009"}, 
		{"173", "법원가압장", 		"", "PR0407", "WW0009"}, 
		{"174", "금천배수지", 		"", "PR0407", "WW0009"}, 
		{"175", "선우배수지", 		"", "PR0407", "WW0009"}, 
		{"180", "대방배수지", 		"", "PR0370", "WW0009"}, 
		{"181", "낙성대배수지", 		"", "PR0370", "WW0009"}, 
		{"182", "신대방동", 			"남부수도사업소", "PR0370", "WW0009"}, 
		{"183", "노량진배수지", 		"", "PR0370", "WW0009"}, 
		{"184", "상도배수지", 		"", "PR0370", "WW0009"}, 
		{"185", "신림6배수지", 		"", "PR0370", "WW0009"}, 
		{"186", "장군봉배수지", 		"", "PR0370", "WW0009"}, 
		{"187", "사당4동", 			"사당4동주민센터", "PR0370", "WW0009"}, 
		{"188", "봉천6동", 			"까치산공원", "PR0370", "WW0009"}, 
		{"189", "독산4동", 			"독산119", "PR0407", "WW0009"}, 
		{"301", "영등포-경남아너스빌", "영등포-경남아너스빌", "PR0370", "WW0009"}, 
		{"434", "신림2-1배수지", 		"", "PR0370", "WW0009"}, 
		{"435", "남현배수지", 		"", "PR0370", "WW0009"}, 
		{"436", "사당3배수지", 		"", "PR0370", "WW0009"}, 
		{"437", "사당4배수지", 		"", "PR0370", "WW0009"}, 
		{"438", "봉천6-2배수지", 		"", "PR0370", "WW0009"}, 
		{"439", "봉천11배수지", 		"", "PR0370", "WW0009"}, 
		{"440", "봉현배수지", 		"", "PR0370", "WW0009"}, 
		{"441", "상도3배수지", 		"", "PR0370", "WW0009"}, 
		{"442", "시흥동", 				"시흥119", "PR0407", "WW0009"}, 
		{"443", "신대방1동", 				"상떼빌아파트", "PR0370", "WW0009"}, 
		{"444", "신대방2동", 				"보라매파크빌", "PR0370", "WW0009"}, 
		
		{"190", "서초배수지", 		"", "PR0370", "WW0010"}, 
		{"191", "방배배수지", 		"", "PR0370", "WW0010"}, 
		{"192", "일원가압장", 		"", "PR0370", "WW0010"}, 
		{"193", "우면산배수지", 		"", "PR0370", "WW0010"}, 
		{"194", "도곡2동", 				"강남수도사업소", "PR0370", "WW0010"}, 
		{"195", "청담배수지", 		"", "PR0370", "WW0010"}, 
		{"196", "반포배수지", 		"", "PR0370", "WW0010"}, 
		{"197", "양재2동", 				"매헌초등학교", "PR0370", "WW0010"}, 
		{"504", "삼성동", 				"삼성증압장", "PR0370", "WW0010"}, 
		{"503", "세곡동", 				"자곡증압장", "PR0370", "WW0010"}, 
		{"305", "반포1동", 			"반포자이", "PR0370", "WW0010"}, 
		{"445", "내곡배수지", 		"", "PR0370", "WW0010"}, 
		{"446", "도곡1동", 		"도곡경남아너스빌", "PR0370", "WW0010"}, 
		
		{"200", "성내1동", 				"강동수도사업소", "PR0055", "WW0011"}, 
		{"201", "오금배수지", 		"", "PR0055", "WW0011"}, 
		{"202", "거마가압장", 		"", "PR0055", "WW0011"}, 
		{"203", "천호2동", 			"천호동공원", "PR0370", "WW0011"}, 
		{"204", "길동배수지", 		"", "PR0370", "WW0011"}, 
		{"205", "가락본동", 			"가락공원", "PR0055", "WW0011"}, 
		{"498", "문정1동", 			"문덕초등학교", "PR0055", "WW0011"}, 
		{"448", "삼전동", 				"삼전지구대", "PR0055", "WW0011"}, 
		{"449", "고덕2동", 				"온조대왕체육관", "PR0370", "WW0011"}, 
		{"450", "상일동", 				"상일동우체국", "PR0370", "WW0011"} 
	};
	
	public static String GetWellWaterTitle(String code)
	{
		String retData = "-";
		
		for(int i = 0; i < _aWellWaterData.length; i ++) {
			if( code.equals(_aWellWaterData[i][0]) ) {
				return _aWellWaterData[i][1];
			}
		}
		
		return retData;
	}
	
	public static String GetCorpWaterTitle(String code)
	{
		String retData = "-";
		
		for(int i = 0; i < _aCorpWaterData.length; i ++) {
			if( code.equals(_aCorpWaterData[i][0]) ) {
				return _aCorpWaterData[i][1] + " (" + _aCorpWaterData[i][2] + ")";
			}
		}
		
		return retData;
	}
	
	public static String GetCorpWaterName(String code)
	{
		String retData = "-";
		
		for(int i = 0; i < _aCorpWaterData.length; i ++) {
			if( code.equals(_aCorpWaterData[i][0]) ) {
				return _aCorpWaterData[i][1];
			}
		}
		
		return retData;
	}

	public static String[] GetAnalPointInfo(String analPointCode)
	{
		for(int i = 0; i < _aPointData.length; i ++) {
			if( analPointCode.equals(_aPointData[i][0]) ) {
				String[] aData = new String[5];
				
				aData[0] = _aPointData[i][0];
				aData[1] = _aPointData[i][1];
				aData[2] = _aPointData[i][2];
				if( aData[2].equals("") ) {
					aData[2] = aData[1];
				}
				aData[3] = MapConst.GetWellWaterTitle(_aPointData[i][3]);
				aData[4] = MapConst.GetCorpWaterTitle(_aPointData[i][4]);
				
				return aData;
			}
		}
		
		return null;
	}
	
	public static List<String[]> GetAnalPointList(String corpCode)
	{
		List<String[]> aList = new ArrayList<String[]>();
		
		for(int i = 0; i < _aPointData.length; i ++) {
			if( corpCode.equals(_aPointData[i][4]) ) {
				String[] aData = new String[2];
				
				aData[0] = _aPointData[i][0];
				aData[1] = _aPointData[i][1];
				
				aList.add(aData);
			}
		}
		
		return aList;
	}
}
