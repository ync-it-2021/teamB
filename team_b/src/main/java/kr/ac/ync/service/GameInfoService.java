package kr.ac.ync.service;

import java.util.List;

import kr.ac.ync.domain.GameInfoVO;

public interface GameInfoService {
	public List<GameInfoVO> getGamesList();
	
	public GameInfoVO getDetail(Long game_num);
	
	// 글 등록
	public void registerGame(GameInfoVO games);
}
