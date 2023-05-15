package kr.or.ddit.schedule.vo;

import lombok.Data;

@Data
public class MroomVO {
	
	private String mrCode;			// 회의실 코드
	private String assCode;			// 자산 코드
	private String mrName;			// 회의실 이름
	private int mrNum;				// 회의실 호수
	private int mrPerson;			// 수용인원
	private String mrUse;			// 사용여부
	
	private String schCode;			// 일정코드
	private String mrDate;			// 예약일시 (예약 등록일)
	
	private String schStart;		// 예약 일시
	private String schEnd;			// 예약일시
	private String schContent;		// 이용목적
	private String empNo;			// 예약 사번
	private String empName;			// 예약 사원 이름
	private String empPos;			// 직급코드
	private String depName;			// 부서이름
	
}
