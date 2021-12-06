package kr.ac.ync.domain;


import java.util.Date;

import lombok.Data;

@Data
public class NewsVO {
	private Long news_num;
	private String news_title;
	private String gubun;
	private String news_contents;
	private String userid;
	private Date news_date;
	
	private String file_1;
	private String file_2;
	private String file_3;
	
	private String keyword;

}
