package egovframework.example.cmmn.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface CmmnService {

	List<EgovMap> selectMenuList( ) throws Exception;

	List<EgovMap> selectRoomImgServiceList()throws Exception;

	List<EgovMap> selectPageNameServceList()throws Exception;

}
