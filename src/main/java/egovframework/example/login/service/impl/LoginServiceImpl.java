package egovframework.example.login.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.login.service.LoginService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service
public class LoginServiceImpl implements LoginService {

	@Resource
	private LoginMapper LoginMapper;

	@Override
	public boolean selectTermsRequiredChk(String[] tERMS_TY_CD, String[] checkedTermNoArr) throws Exception {
		
		int 	essnAgrYnCnt 		= 0,
				termsMngInfoCnt 	= 0;
			
		// 약관 공통 코드와 일치하는 최신 약관을 가져온다.
		// 공통 코드를 하나씩 빼서 mapper에 보내야함.
		
		for (int i = 0; i < tERMS_TY_CD.length; i++){
			EgovMap termsMngInfo = LoginMapper.selectTermsMngList(tERMS_TY_CD[i]);
			
			String 	essnAgrYn 		= (String) termsMngInfo.get("essnAgrYn");
			int 	termsMngNo 	= (int) 	termsMngInfo.get("termsMngNo");
			
			
			if("Y".equals(essnAgrYn)){
				essnAgrYnCnt++;
				
				for(int k = 0; k < checkedTermNoArr.length; k++){
					
					if(termsMngNo == Integer.parseInt(checkedTermNoArr[k])){
						termsMngInfoCnt++;
					}
				}
			}
		}
		
		if(essnAgrYnCnt == termsMngInfoCnt) {
			return true;
		} else {
			return false;
		}
	}
	
	
	@Override
	public List<EgovMap> selectEmailDomainList(String eMAIL_DOMAIN) throws Exception {
		// TODO Auto-generated method stub
		return LoginMapper.selectEmailDomainList(eMAIL_DOMAIN);
	}


	@Override
	public List<EgovMap> selectTermsMngList(String[] tERMS_TY_CD) throws Exception {
		
		List<EgovMap> termsMngList = new ArrayList<EgovMap>();
		
		for(int i = 0; i < tERMS_TY_CD.length; i++){
			termsMngList.add(LoginMapper.selectTermsMngList(tERMS_TY_CD[i]));
			System.out.println("----------------------------" + termsMngList);
		}
		
		return termsMngList;
	}


	@Override
	public int selectDuplicateIdChk(String loginId) throws Exception {
		;
		return LoginMapper.selectDuplicateIdChk(loginId);
	}
}
