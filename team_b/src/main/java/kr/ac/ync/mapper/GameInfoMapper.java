package kr.ac.ync.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.ac.ync.domain.GameInfoVO;

public interface GameInfoMapper {
	
	@Select("select * from Game_Info where game_num > 0")
	public List<GameInfoVO> getList();
}
