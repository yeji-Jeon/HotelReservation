package egovframework.example.payment.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.concurrent.TimeUnit;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.payment.service.PayService;

@Service
public class PayServiceImpl implements PayService {

	@Resource
	private PayMapper payMapper;

	@Override
	public void insertPayServiceList(HashMap<String, Object> map) throws Exception {
		
		//예약번호 생성
		String revNm = (String)map.get("gdCd") + Math.floor(Math.random() * (99999 - 10000 + 1)) + 10000;
		map.put("REV_NO", revNm);
		
		int tntDay = Integer.parseInt((String) map.get("totalDay")); 
		
		//Parsing the date with java8
		LocalDate dateBefore = LocalDate.parse((map.get("checkin_date")).toString());
		LocalDate dateAfter = LocalDate.parse((map.get("checkout_date")).toString());
		
		//calculating number of days in between
		long noOfDaysBetween = ChronoUnit.DAYS.between(dateBefore,dateAfter);
		
		map.put("tnt_prc", tntDay*noOfDaysBetween);
		System.out.println(map);
		payMapper.inserPayServiceList(map);
	}

	@Override
	public boolean selectTermsRequiredChk(String[] tERMS_TY_CD, String[] checkedTermNoArr) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}
}
