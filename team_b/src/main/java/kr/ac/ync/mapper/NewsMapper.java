package kr.ac.ync.mapper;

import java.util.List;

import kr.ac.ync.domain.NewsVO;

public interface NewsMapper {

	List<NewsVO> getNewsList();

	NewsVO getNewsDetail(Long news_num);
	
	public void insert(NewsVO news);

	public Integer insertSelectKey(NewsVO news);

}
