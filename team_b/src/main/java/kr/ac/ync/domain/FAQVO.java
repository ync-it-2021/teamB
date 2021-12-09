package kr.ac.ync.domain;

import java.util.Date;

import lombok.Data;

@Data
public class FAQVO {
	private Long faq_num;
	private String faq_title;
	private String faq_contents;
	private String userid;

}
