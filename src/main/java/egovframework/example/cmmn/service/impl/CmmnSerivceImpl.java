package egovframework.example.cmmn.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import egovframework.example.cmmn.service.CmmnService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service
public class CmmnSerivceImpl implements CmmnService {

	@Resource
	private CmmnMapper cmmnMapper;
	
	@Override
	@Cacheable(value = "selectMenuList")
	public List<EgovMap> selectMenuList() throws Exception {
		// TODO Auto-generated method stub
		return cmmnMapper.selectMenuList();
	}

	@Override
	@Cacheable(value = "selectRoomImgServiceList")
	public List<EgovMap> selectRoomImgServiceList() throws Exception {
		// TODO Auto-generated method stub
		return cmmnMapper.selectRoomImgServiceList();
	}

	@Override
	@Cacheable(value = "selectPageNameServceList")
	public List<EgovMap> selectPageNameServceList() throws Exception {
		// TODO Auto-generated method stub
		return cmmnMapper.selectPageNameServceList();
	}

}
