package egovframework.example.login.service.impl;

import java.util.HashMap;
import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper
public interface LoginMapper {

	EgovMap selectTermsMngList(String string)throws Exception;

	List<EgovMap> selectEmailDomainList(String eMAIL_DOMAIN)throws Exception;

	int selectDuplicateIdChk(String loginId)throws Exception;






}
