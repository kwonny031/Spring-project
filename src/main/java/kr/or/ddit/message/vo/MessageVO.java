package kr.or.ddit.message.vo;

import java.util.Date;

import lombok.Data;

@Data
 public class MessageVO {
	 private String mesCode;
	 private String empNo;
	 private String sendEmpNo;
	 private String mesContent;
	 private Date mesDate;
	 private String mesSave;
	 private String mesDelete;
	 private String empName;
	 
	 private String mrSave;
	 
 }
 