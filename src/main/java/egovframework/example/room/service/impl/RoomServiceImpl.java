package egovframework.example.room.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.room.service.RoomService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service
public class RoomServiceImpl implements RoomService {

	@Resource
	private RoomMapper roomMapper;
	
	@Override
	public List<EgovMap> selectRoomServiceList() throws Exception{
		// TODO Auto-generated method stub
		return roomMapper.selectRoomServiceList();
	}

}
