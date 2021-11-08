package kr.ac.ync.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
		 log.info("getList..........");
		
		 return mapper.getGamesList();
	 }

	@Override
	public GameInfoVO getDetail(Long game_num) {
		log.info("get......" + game_num);

		return mapper.getDetail(game_num);
	}

}
