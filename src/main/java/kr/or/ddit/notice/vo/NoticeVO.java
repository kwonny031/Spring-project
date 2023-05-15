package kr.or.ddit.notice.vo;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
	private String notCode;
	private String empNo;
	private String notTitle;
	private Date notDate;
	private String notContent;
	private int notHit;
	private String notStart;
	private String notEnd;
	private String notPop;
	
}
