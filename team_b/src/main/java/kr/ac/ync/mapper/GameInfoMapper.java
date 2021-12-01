package kr.ac.ync.mapper;

import java.util.List;

import kr.ac.ync.domain.Criteria;
import kr.ac.ync.domain.GameInfoVO;

public interface GameInfoMapper {
	//기본 목록
	public List<GameInfoVO> getGamesList();
	//할인적용 목록
	public List<GameInfoVO> getGamesListforSale();
	//최근 출시 목록
	public List<GameInfoVO> getGamesListforNew();
	
//	public List<GameInfoVO> getGamesListforMost();
	//
	public GameInfoVO getDetail(Long game_num);

	public void insert(GameInfoVO games);
	
	public Integer insertSelectKey(GameInfoVO games);
	
	public int update(GameInfoVO games);

	public List<GameInfoVO> getGenre();
	
	public List<GameInfoVO> getSizeSpec();
	//검색
	public List<GameInfoVO> getGamesSearch(String keyword);
	
	public int getTotal(Criteria cri);
	//삭제
	public int delete(Long game_num);

	

}
