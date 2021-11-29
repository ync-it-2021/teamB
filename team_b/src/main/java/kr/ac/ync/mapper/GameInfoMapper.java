package kr.ac.ync.mapper;

import java.util.List;

import kr.ac.ync.domain.GameInfoVO;

public interface GameInfoMapper {
	
	public List<GameInfoVO> getGamesList();
	
	public List<GameInfoVO> getGamesListforSale();
	
	public List<GameInfoVO> getGamesListforNew();
	
//	public List<GameInfoVO> getGamesListforMost();
	
	public GameInfoVO getDetail(Long game_num);

	public void insert(GameInfoVO games);
	
	public Integer insertSelectKey(GameInfoVO games);
	
	public int update(GameInfoVO games);

	public List<GameInfoVO> getGenre();
	
	public List<GameInfoVO> getSizeSpec();

	

}
