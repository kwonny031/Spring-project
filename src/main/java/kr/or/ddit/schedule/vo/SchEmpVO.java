package kr.or.ddit.schedule.vo;

import java.util.List;

import lombok.Data;

@Data
public class SchEmpVO {
	private String schCode;			// 일정코드
	private String empNo;			// 참여사원번호
	private String empName;			// 참여사원 이름
	private String empPos;			// 참여사원 직급
	
	private List<SchEmpVO> list;	// 일정참여 사원 목록
}
