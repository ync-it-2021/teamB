package kr.ac.ync.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.ac.ync.domain.BoardVO;
import kr.ac.ync.domain.Criteria;
import kr.ac.ync.domain.GameInfoVO;
import kr.ac.ync.domain.NewsVO;
import kr.ac.ync.mapper.BoardMapper;
import kr.ac.ync.mapper.NewsMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class NewsServiceImpl implements NewsService {
	
	private NewsMapper mapper;

	@Override
	public List<NewsVO> getNewsList() {
		 log.info("getList all");
			
		 return mapper.getNewsList();
	}

	@Override
	public NewsVO getNewsDetail(Long news_num) {
		log.info("get news : " + news_num);

		return mapper.getNewsDetail(news_num);
	}

	@Override
	public void registerNews(NewsVO news) {
		log.info("reg_news : " + news);

		mapper.insertSelectKey(news);
	}

}
