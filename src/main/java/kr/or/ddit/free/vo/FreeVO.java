package kr.or.ddit.free.vo;

import java.util.Date;

import lombok.Data;

@Data
public class FreeVO {

	private String freeCode;
	private String empNo;
	private String freeTitle;
	private String freeContent;
	private Date freeDate;
	private int freeHit;
}
