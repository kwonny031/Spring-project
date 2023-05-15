package kr.or.ddit.good.vo;

import java.util.Date;

import kr.or.ddit.alert.vo.AlertVO;
import kr.or.ddit.attfile.vo.AttFileVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import lombok.Data;

@Data
public class GoodVO {

	private String goodCode;
	private String empNo;
	private String goodType;
	private Date goodDate;
	private String goodPath;
	
	private EmployeeVO empVO;
	
	private AttFileVO afVO;
	private AlertVO aleVO;
	
}
