package kr.or.ddit.common;

import java.util.Date;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;

import kr.or.ddit.common.vo.ComCodeVO;
import kr.or.ddit.mapper.ComCodeMapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class Utils {

	// 직급 정렬에 사용
	public static int calPos(String empPos) {
		
		if (empPos.equals("사원")) { return 1; }
		if (empPos.equals("대리")) { return 2; }
		if (empPos.equals("과장")) { return 3; }
		if (empPos.equals("차장")) { return 4; }
		if (empPos.equals("이사")) { return 5; }
		if (empPos.equals("대표이사")) { return 6; }
		
		return 1;
	}
	
	
	// 지난 날짜 계산(방금, 1시간 전, 1일 전 ...)
	public static String calDate(Date date) {
		
		// 3_600_000로 나누면 시간 차이 나옴. 
		Date now = new Date();
//		log.info("now >> " + now.getTime());
//		log.info("시간 차 >> " + (now.getTime() - date.getTime()) / 3_600_000d);
		
		double diff = (now.getTime() - date.getTime()) / 3_600_000d;
		
		ComCodeVO ccVO = new ComCodeVO();
		ccVO.setComGroup("timedisp");
		
		if (diff < 1) {
			
			return "1"; // 방금 
		} 
		if (diff < 2) {
			
			return "2"; // 1시간 전 
		} 
		if (diff < 3) {
			
			return "3"; // 2시간 전 
		} 
		if (diff < 7) {
			
			return "4"; // 6시간 전 
		} 
		if (diff < 36) { // 정확하게 계산하려면 now에서 시간 구해서 24 + x 로.
			
			return "5"; // 어제 
		} 
		if (diff < 60) {
			
			return "6"; 
		} 
		return "7"; // 날짜 데이터 그대로 출력되게 처리
	}
}
