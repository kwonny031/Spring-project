package kr.or.ddit.main.vo;

import lombok.Data;

@Data
public class mailjoinVO {
	private String subject;
	private String message;
	private String to;
	private String from;
	private String joinNum;
	
	private String tempPw;
}
