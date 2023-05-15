package kr.or.ddit.approval.vo;

import java.sql.Clob;
import java.sql.Date;

import kr.or.ddit.employee.vo.EmployeeVO;
import lombok.Data;

@Data
public class AppVO {
	
	private String appCode;
	private String empNo;
	private String apfCode;
	private String appYear;
	private Date appDate;
	private Date appRepdate;
	private String appStatus;
	private String appUrgent;
	private String appComment;
	private String appContent;
	private String appTitle;
	private String appRef;
	
	private EmployeeVO empVO;
}
