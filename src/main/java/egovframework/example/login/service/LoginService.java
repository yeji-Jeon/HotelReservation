package egovframework.example.login.service;

import java.util.HashMap;
import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface LoginService {

	boolean selectTermsRequiredChk(String[] tERMS_TY_CD, String[] checkedTermNoArr) throws Exception;

	List<EgovMap> selectEmailDomainList(String eMAIL_DOMAIN)throws Exception;

	List<EgovMap> selectTermsMngList(String[] tERMS_TY_CD)throws Exception;

	int selectDuplicateIdChk(String loginId)throws Exception;


}
