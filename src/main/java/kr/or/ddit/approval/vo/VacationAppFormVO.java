package kr.or.ddit.approval.vo;

import kr.or.ddit.employee.vo.EmployeeVO;
import lombok.Data;

@Data
public class VacationAppFormVO {
	private VacationVO vacation;
	private AplineVO apline;
	private AppVO app;
	private EmployeeVO emp;
}
