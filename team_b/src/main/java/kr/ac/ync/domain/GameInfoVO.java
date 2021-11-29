package kr.ac.ync.domain;


import lombok.Data;

@Data
public class GameInfoVO {
	private int game_num ;
	private String title;
	private String info;
	private String korean;
	private String dev;
	private String publisher;
	private String platform;
	private String relase_date;
	private int price;
	private int sale_price;
	private int sale_enabled;
	
	private String file_1;
	private String file_2;
	private String file_3;
	
	private int genre_id;
	private int size_id;
	private int rec_id;
	
	private String genre_name;
	private String size_name;
	
	private String keyword;

}
