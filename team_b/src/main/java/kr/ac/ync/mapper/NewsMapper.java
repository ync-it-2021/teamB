package kr.ac.ync.mapper;

import java.util.List;

import kr.ac.ync.domain.GameInfoVO;
import kr.ac.ync.domain.NewsVO;

public interface NewsMapper {

	List<NewsVO> getNewsList();

	public NewsVO getNewsDetail(Long news_num);
	
	public void insert(NewsVO news);

	public Integer insertSelectKey(NewsVO news);

	public int update(NewsVO news);
	
	public int delete(Long news_num);

}
