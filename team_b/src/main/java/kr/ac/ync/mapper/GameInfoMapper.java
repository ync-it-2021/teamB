package kr.ac.ync.mapper;

import java.util.List;

import kr.ac.ync.domain.GameInfoVO;

public interface GameInfoMapper {
	
	//@Select("select * from game_info where game_num > 0")
	public List<GameInfoVO> getGamesList();
	
	public GameInfoVO getDetail(Long game_num);

	public void insert(GameInfoVO games);
	
	public Integer insertSelectKey(GameInfoVO games);

}
