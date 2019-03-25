package egovframework.example.payment.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.payment.service.PayService;

@Controller
public class PaymentController {

	@Resource
	private PayService payService;
	
	@RequestMapping(value = "/payment.do")
	public String Main(@RequestParam Map<String,Object> payList) throws Exception {
		System.out.println("payList  : " + payList);
		
		return "payment/payment.login";
	}
	
	@RequestMapping(value = "/completePay.do", produces = "application/json; charset=utf-8")
	public String completePay(@RequestParam(required=true) HashMap<String, Object> map) throws Exception {
		
		System.out.println("map  :  " + map);
		 
		payService.insertPayServiceList(map);
		
		return "payment/complete.tiles";
	}
}
