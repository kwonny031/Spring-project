package kr.or.ddit.mail.vo;

import java.util.Date;
import java.util.List;

import kr.or.ddit.attfile.vo.AttFileVO;
import lombok.Data;

@Data
public class MailVO {
	private String mailCode;
	private String empNo;
	private String mailTitle;
	private String mailContent;
	private String mailImp;
	private String mailSave;
	private Date mailDate;
	private String mailSend;
	private String sendEmpNo;
	private String empName;
	private String comCode;
	private String afCode;
	
	//MailVO : MailRecVO = 1 : N
	private List<MailRecVO> mailRecVOList;
	
	//MailVO : AttFileVO = 1 : N
	private List<AttFileVO> attFileVOList;
}
