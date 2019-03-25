package egovframework.example.main.service.impl;


import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.main.service.MainService;


@Service
public class MainServiceImpl implements MainService {

	@Resource
	private MainMapper mainMapper;

	@Override
	public Map<String, Object> selectRoomServiceList(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return mainMapper.selectRoomServiceList(param);
	}
	
	

}
