package kr.or.ddit.attfile.vo;

import java.util.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class AttFileVO {

	// VO에서 낙타표기법이 제대로 안되어있으면 에러 발생 예) aFNo
	private String afCode;
	private String afType;
	private String afTcode;
	private String afUse;
	private Date afDate;
	private String afName;
	private String afSave;
	private long afSize;
	private String afPath;
	private String afExt;
}
