package kr.go.seoul.water.sql.vo;

public class UserInfoVO {
	private String USER_ID;
	private String WW_CODE;
	private String USER_NAME;
	private String PWD;
	private String GROUP_CODE;
	private String USER_AUTH;
	private String GROUP_AUTH;

	public UserInfoVO()
	{
		USER_ID = "";
		WW_CODE = "";
		USER_NAME = "";
		PWD = "";
		GROUP_CODE = "";
		USER_AUTH = "";
		GROUP_AUTH = "";
	}

	public String getUSER_ID() {
		return USER_ID;
	}

	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}

	public String getWW_CODE() {
		return WW_CODE;
	}

	public void setWW_CODE(String wW_CODE) {
		WW_CODE = wW_CODE;
	}

	public String getUSER_NAME() {
		return USER_NAME;
	}

	public void setUSER_NAME(String uSER_NAME) {
		USER_NAME = uSER_NAME;
	}

	public String getPWD() {
		return PWD;
	}

	public void setPWD(String pWD) {
		PWD = pWD;
	}

	public String getGROUP_CODE() {
		return GROUP_CODE;
	}

	public void setGROUP_CODE(String gROUP_CODE) {
		GROUP_CODE = gROUP_CODE;
	}
	
	public String getUSER_AUTH() {
		return USER_AUTH;
	}

	public void setUSER_AUTH(String uSER_AUTH) {
		USER_AUTH = uSER_AUTH;
	}

	public String getGROUP_AUTH() {
		return GROUP_AUTH;
	}

	public void setGROUP_AUTH(String gROUP_AUTH) {
		GROUP_AUTH = gROUP_AUTH;
	}
}
