package egovframework.example.room.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface RoomService {

	List<EgovMap> selectRoomServiceList()throws Exception;

}
