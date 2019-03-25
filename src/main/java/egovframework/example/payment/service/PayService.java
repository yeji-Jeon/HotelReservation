package egovframework.example.payment.service;

import java.util.HashMap;

public interface PayService {

	void insertPayServiceList(HashMap<String, Object> map)throws Exception;

	boolean selectTermsRequiredChk(String[] tERMS_TY_CD, String[] checkedTermNoArr)throws Exception;

}
