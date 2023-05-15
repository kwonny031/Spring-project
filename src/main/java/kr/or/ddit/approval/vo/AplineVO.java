package kr.or.ddit.approval.vo;

import java.sql.Date;
import lombok.Data;

@Data
public class AplineVO {

	private int aplNum;
	private String appCode;
	private String empNo;
	private String aplResult;
	private Date aplDate;
	private String aplComment;
	private String aplPos;
	private String aplFav;
	
	private String aplName;
}
