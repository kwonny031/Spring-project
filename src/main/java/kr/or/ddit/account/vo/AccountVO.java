package kr.or.ddit.account.vo;

import lombok.Data;

@Data
public class AccountVO {
	private String accNo;			// 거래처 번호
	private String afNo;			// 파일번호
	private String accName;			// 거래처 이름
	private String accAddr;			// 거래처 주소
	private String accEmail;		// 거래처 메일
	private String accNum;			// 거래처 전화번호
}
