package kr.or.ddit.cloud.vo;

import java.util.Date;

import lombok.Data;

@Data
public class FolderVO {
	
	private String folCode;			// 폴더 코드(FOL1)
	private String cloCode;			// 클라우드 코드
	private String folParCode;		// 상위 폴더 코드 
	private String folName;			// 폴더명
	private Date folDate;			// 생성일
	private int folUse;				// 사용용량
	private String folFav;			// 즐겨찾기 여부
}
