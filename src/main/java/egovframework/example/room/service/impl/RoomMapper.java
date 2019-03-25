package egovframework.example.room.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper
public interface RoomMapper {

	List<EgovMap> selectRoomServiceList()throws Exception;

}
