package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.attfile.vo.AttFileVO;
import kr.or.ddit.mail.vo.MailRecVO;
import kr.or.ddit.mail.vo.MailVO;
import kr.or.ddit.mail.vo.SaveMailVO;

public interface MailMapper {

	//받은 메일함 List
	public List<MailVO> getMailList();

	//보낸 메일함 List
	public List<MailVO> selectSendList(String empNo);

	//mail테이블에 내가 보낸 메일 정보를 한번 기록
	public int sendMail(MailVO mailVO);

	//메일 발신
	public void write(MailVO mailVO);

	//받은 메일함 목록 정보 가져오기
	public List<MailVO> selectReceiveList(String empNo);
	
	//받은 메일함 상세 정보 가져오기
	public List<MailVO> selectReceiveDetail(MailVO mailVO);

	//메일 detail
	public MailVO getMail(String mailCode);

	//받은메일 즐겨찾기
	public void updateMail(MailRecVO marVO);

	//store List
	public List<MailVO> getStoreList();

	//받은 메일 삭제
	public int deleteMail(MailVO mailVO);

	//임시저장
	public int outboxMail(MailVO mailVO);

	//임시저장 List
	public List<MailVO> getOutboxList();

	//임시저장 detail
	public MailVO getoutboxMail(String mailCode);

	public void updateTag(MailVO mailVO);

	//경영자료 List
	public List<MailVO> getMngList();

	//회계자료 List
	public List<MailVO> getActList();

	//참고자료 List
	public List<MailVO> getRefList();

	public AttFileVO mailDownload(int afCode);

	public void incrementMailDowncount(int afCode);


}
