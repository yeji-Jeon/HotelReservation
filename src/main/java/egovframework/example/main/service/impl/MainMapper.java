package egovframework.example.main.service.impl;


import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;


@Mapper
public interface MainMapper {

	Map<String, Object> selectRoomServiceList(Map<String, Object> param)throws Exception;

	
}
