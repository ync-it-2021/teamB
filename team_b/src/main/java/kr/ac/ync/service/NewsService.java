package kr.ac.ync.service;

import java.util.List;

import kr.ac.ync.domain.NewsVO;

public interface NewsService {
	public List<NewsVO> getNewsList();
	
	public NewsVO getNewsDetail(Long news_num);

		//등록
	public void registerNews(NewsVO news);
}
