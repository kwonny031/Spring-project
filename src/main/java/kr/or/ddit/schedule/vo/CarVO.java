package kr.or.ddit.schedule.vo;

import java.util.List;

import lombok.Data;

@Data
public class CarVO {
	private String carCode;			// 차량코드
	private String asscode;			// 자산코드
	private String carNum;			// 차량번호
	private String carName;			// 차량이름
	private int carPerson;			// 승차인원
	private String carUse;			// 사용여부
	
	private List<CarVO> carList;	// 차량목록
	
	private String schCode;			// 일정코드
	
	
}
