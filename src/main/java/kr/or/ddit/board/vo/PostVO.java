package kr.or.ddit.board.vo;

import java.util.List;

import kr.or.ddit.employee.vo.EmployeeVO;
import lombok.Data;

@Data
public class PostVO {

	private String postCode;
	private String boaCode;
	private String empNo;
	private String postTitle;
	private String postDate;
	private String postHit;
	private String postEss;
	private String postContent;
	
	private EmployeeVO postEmp;
}
