package kr.or.ddit.employee.vo;

import java.util.Date;

import kr.or.ddit.attfile.vo.AttFileVO;
import lombok.Data;

@Data
public class EmployeeVO {

	private String empNo;			// 사원코드 ( ex_20230001)
	private String coCode;			// 회사코드
	private String depCode;			// 부서코드(부서)
	private String empPos;			// 직급코드(직급)
	private String empName;			// 이름
	private String empReg;			// 주민등록번호
	private String empPostcode;		// 우편번호
	private String empAddr;			// 기본주소
	private String empAddr2;		// 상세주소
	private String empDate;			// 입사일
	private String empEmail;		// 이메일
	private String empTel;			// 핸드폰번호
	private String empPw;			// 비밀번호
	private String empMsg;			// 상태메세지
	private int empPv;				// 연차
	private Date empRdate;			// 퇴사일
	
	// DEP table
	private String depName;			// 부서이름
	private String depParCode;		// 상위부서코드
	private String HempNo;			// 부서장 사번
	
	private AttFileVO afVO;
	
}


