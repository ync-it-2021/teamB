package kr.ac.ync.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {

	private String userid;
	private String userpw;
	private String userName;
	private int userPhone;
	private String userMail;
	private String enabled;

	private Date regDate;
	private Date updateDate;
	private List<AuthVO> authList;

}
