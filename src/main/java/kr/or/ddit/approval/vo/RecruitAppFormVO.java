package kr.or.ddit.approval.vo;

import kr.or.ddit.employee.vo.EmployeeVO;
import lombok.Data;

@Data
public class RecruitAppFormVO {
	private RecVO recruit;
	private AplineVO apline;
	private AppVO app;
	private EmployeeVO emp;
}
