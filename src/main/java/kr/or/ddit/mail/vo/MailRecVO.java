package kr.or.ddit.mail.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MailRecVO {
	private String empNo;
	private String mailCode;
	private String sendEmpNo;
	private Date mrDate;
	private String mrType;
	
	

}
