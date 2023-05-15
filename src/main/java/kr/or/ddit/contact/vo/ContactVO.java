package kr.or.ddit.contact.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ContactVO {

	private String conCode;
	private String abCode;
	private String conName;
	private String conCompany;
	private String conDep;
	private String conPos;
	private String conEmail;
	private String conTel;
	private String conAddr;
	private String conMemo;
	private Date conDate;
	private String conFav;
	private String empNo;
	
}
