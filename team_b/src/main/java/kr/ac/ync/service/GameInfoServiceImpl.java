package kr.ac.ync.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ync.domain.Criteria;
import kr.ac.ync.domain.GameInfoVO;
import kr.ac.ync.mapper.GameInfoMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class GameInfoServiceImpl implements GameInfoService {

	// @Setter(onMethod_ = @Autowired)
	// 스프링 4.3 이후 부터 묵시적 주입
	// BoardMappers는 interface 인데 객체로 주입받았다?
	// Java Proxy 기법을 활용해 Mybatis는 MapperProxy라는 InvocationHandler 구현체를 이용하여
	// 인터페이스의 구현체를 동적으로 생성
	//@Autowired
	private GameInfoMapper mapper;
	
	@Override
	 public List<GameInfoVO> getGamesList() {
	
		 log.info("getList all");
		
		 return mapper.getGamesList();
	 }
	
	@Override
	 public List<GameInfoVO> getGamesListforSale() {
	
		 log.info("getList for sale");
		
		 return mapper.getGamesListforSale();
	 }
	
	@Override
	 public List<GameInfoVO> getGamesListforNew() {
	
		 log.info("getList for new");
		
		 return mapper.getGamesListforNew();
	 }
	
//	@Override
//	 public List<GameInfoVO> getGamesListforMost() {
//	
//		 log.info("getList for most");
//		
//		 return mapper.getGamesListforMost();
//	 }

	@Override
	public GameInfoVO getDetail(Long game_num) {
		log.info("get" + game_num);

		return mapper.getDetail(game_num);
	}

	@Override
	public void registerGame(GameInfoVO games) {
		log.info("registerGAmes" + games);

		mapper.insertSelectKey(games);
	}

	@Override
	public boolean modify(GameInfoVO games) {
		return mapper.update(games) == 1;
	}

	@Override
	public List<GameInfoVO> getGenre() {
		return mapper.getGenre();
	}

	@Override
	public List<GameInfoVO> getSizeSpec() {
		return mapper.getSizeSpec();
	}

	@Override
	public List<GameInfoVO> getGamesSearch(String keyword) {
		 log.info("OK Searching..." + keyword);
			
		 return mapper.getGamesSearch(keyword);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotal(cri);
	}

}
