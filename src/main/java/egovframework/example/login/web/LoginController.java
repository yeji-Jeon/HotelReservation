package egovframework.example.login.web;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.cmmn.utils.JsonUtil;
import egovframework.example.login.service.LoginService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class LoginController {

	@Resource
	private LoginService loginService;
	
	/*  회원 약관동의 공통코드 번호 : 10 이용약관 , 20 개인정보처리, 30 제 3자 동의(선택)   */
	private final String[]  TERMS_TY_CD  = {"10", "20", "30"};
	/* 이메일 도메인 공통코드번호 */
	private final String	EMAIL_DOMAIN = "CM002";
	 
	@RequestMapping(value = "/LOGIN.do")
	public String Main(@RequestParam Map<String,Object> payList) throws Exception {
		
		return "login/login.login";
	}
	
	@RequestMapping(value = "/SIGN_UP.do")
	public String SIGNUP(ModelMap model) throws Exception {
		
		 List<EgovMap> termsMngList = loginService.selectTermsMngList(TERMS_TY_CD);
	      System.out.println("*****termsMngList"+termsMngList);
	      
	      for(int i =0; i < termsMngList.size(); i++){
	         String termsCd = (String) termsMngList.get(i).get("termsTyCd");
	         model.addAttribute("termsMngList" + termsCd, termsMngList.get(i));
	      }
		
		return "login/joinAgreeWrite.join";
	}
	
	// 필수약관동의 유효성 체크
	   @RequestMapping(value = "/selectTermsRequireDataChk.do")
	   @ResponseBody
	   public String selectTermsRequireDataChk(@RequestParam(required=true) String[] checkedTermNoArr) throws Exception {
		   System.out.println("checkedTermNoArr 확인 >>>>> " + Arrays.toString(checkedTermNoArr)); // 필수약관의 관리번호를 ajax로 받아옴.
		   
		   boolean result = loginService.selectTermsRequiredChk(TERMS_TY_CD, checkedTermNoArr);
		   System.out.println(result);
		   
		   EgovMap resultMap = new EgovMap();
		   
		   if(result){
			   resultMap.put("result", "success");
		   } else {
			   resultMap.put("result", "fail");
		   }
		   
		   System.out.println(resultMap);
		   return JsonUtil.EgovMapToJson(resultMap);
		   
	   }
	   
	   @RequestMapping(value = "/selectJoinInput.do")
	   public String selectJoinInput(ModelMap model) throws Exception {
		   List<EgovMap> emailDomainList = loginService.selectEmailDomainList(EMAIL_DOMAIN);
		   System.out.println(emailDomainList);
		   model.addAttribute("emailDomainList", emailDomainList);
		   
	      return "login/signUp.join";
	   }
	   @RequestMapping(value = "/selectDuplicateIdChk.do")
	   @ResponseBody
	   public String selectDuplicateIdChk(@RequestParam(required=true) String loginId) throws Exception {
		  int duplicateIdInt = loginService.selectDuplicateIdChk(loginId);
		 
	      return String.valueOf(duplicateIdInt);
	   }
	
}
