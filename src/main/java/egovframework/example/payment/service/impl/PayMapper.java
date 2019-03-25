package egovframework.example.payment.service.impl;

import java.util.HashMap;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface PayMapper {

	void inserPayServiceList(HashMap<String, Object> map);

}
