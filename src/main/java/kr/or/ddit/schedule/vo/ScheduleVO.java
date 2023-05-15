package kr.or.ddit.schedule.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ScheduleVO {
   private String schCode;               // 일정번호
   private String empNo;               	 // 사원번호
   private String empName;               // 사원이름
   private String empPos;                // 직급 코드
   private String depCode;               // 부서코드
   private String depName;               // 부서이름
   private String schTitle;            	 // 제목
   private String schContent;            // 내용
   private String schStart;            	 // 시작일
   private String schEnd;                // 종료일
   private String schLocation;           // 장소
   private String schType;               // 일정타입 (개인/부서/회사전체)
   private String schRead;               // 공개여부
   private String schColor;            	 // 일정 색상
   
   private List<ScheduleVO> list;        // 일정목록
   private String schEmpNo;              // 일정참여 사원번호
   
   private String mrCode;                // 회의실 코드
   private List<MroomVO> roomList;       // 회의실 목록         
   
   private String carCode;               // 차량 코드
   private Date mrDate;                  // 예약 일시
   
   
}