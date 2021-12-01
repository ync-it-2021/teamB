package kr.ac.ync.service;

import java.util.List;

import kr.ac.ync.domain.Criteria;
import kr.ac.ync.domain.GameInfoVO;

public interface GameInfoService {
	public List<GameInfoVO> getGamesList();
	//할인 적용 리스트
	public List<GameInfoVO> getGamesListforSale();
	//최근출시 순
	public List<GameInfoVO> getGamesListforNew();
	//최다판매 순 - 임시로 쓰기만 해놓음
	//public List<GameInfoVO> getGamesListforMost();
	
	public GameInfoVO getDetail(Long game_num);
	
	//등록
	public void registerGame(GameInfoVO games);
	
	//수정
	public boolean modify(GameInfoVO games);

	public List<GameInfoVO> getGenre();
	
	public List<GameInfoVO> getSizeSpec();
	
	public List<GameInfoVO> getGamesSearch(String keyword);
	
	public int getTotal(Criteria cri);
	
	//삭제
	public boolean remove(Long game_num);
}
