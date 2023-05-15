package kr.or.ddit.admin.vo;

import lombok.Data;

@Data
public class adminMailVO {

//		private String subeject;
		private String subject;
		private String message;
		private String to;
		private String from;
		private String empPw;
}
