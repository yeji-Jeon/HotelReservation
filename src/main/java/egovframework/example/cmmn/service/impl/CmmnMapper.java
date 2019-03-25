package egovframework.example.cmmn.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper
public interface CmmnMapper {

	List<EgovMap> selectMenuList() throws Exception;

	List<EgovMap> selectRoomImgServiceList()throws Exception;

	List<EgovMap> selectPageNameServceList()throws Exception;

}
