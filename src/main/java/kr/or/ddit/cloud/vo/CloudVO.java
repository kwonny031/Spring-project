package kr.or.ddit.cloud.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class CloudVO {
	
	private String cloCode;		// 클라우드 코드 (CLO1)
	private String empNo;		// 사원번호
	private double cloMax;		// 최대용량 (10 GB)
	private double cloUse;		// 사용용량 (0 GB)
	private String depCode;		// 부서코드 (부서코드가 null이면 개인클라우드)
	 
	private List<CloudVO> list;	// 기본 클라우드 리스트
	
	private String depName;		// 부서이름
	
	// 폴더 테이블
	private String folCode;		// 폴더 코드
	private String folParcode;	// 상위 폴더 코드
	private String folName;		// 폴더명
	private Date folDate;		// 폴더 생성일
	private double folUse;		// 사용용량
	private String folFav;		// 즐겨찾기 여부 (Y:즐겨찾기o, N: 즐겨찾기x)
}
