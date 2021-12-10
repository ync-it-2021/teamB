package kr.ac.ync.service;

import java.util.List;

import kr.ac.ync.domain.GameInfoVO;
import kr.ac.ync.domain.NewsVO;

public interface NewsService {
	public List<NewsVO> getNewsList();
	
	public List<NewsVO> ontheSide();
	
	public NewsVO getNewsDetail(Long news_num);

		//등록
	public void registerNews(NewsVO news);

	public boolean modnews(NewsVO news);
	
	public boolean removenews(Long news_num);
}
