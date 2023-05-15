package kr.or.ddit.comment.vo;

import kr.or.ddit.attfile.vo.AttFileVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import lombok.Data;

@Data
public class CommentVO {

	private String commCode;
	private String empNo;
	private String commType;
	private String commContent;
	private String commDate;
	private String commPath;
	
	private EmployeeVO empVO;
	
	private AttFileVO afVO;
}
