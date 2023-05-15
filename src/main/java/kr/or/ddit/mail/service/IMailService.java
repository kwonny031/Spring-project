package kr.or.ddit.mail.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.attfile.vo.AttFileVO;
import kr.or.ddit.contact.vo.ContactVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.mail.vo.MailRecVO;
import kr.or.ddit.mail.vo.MailVO;
import kr.or.ddit.mail.vo.SaveMailVO;

public interface IMailService {
	
	
	//메일 발신함
	public List<MailVO> getMailList();

	//메일 발신함 (사원)
	public List<EmployeeVO> getEmpByMailList(List<MailVO> receiveList);

	//보낸 메일함 리스트 정보 가져오기
	public List<MailVO> selectSendList(String empNo);

	// 메일 보내기 주소록 List
	public List<ContactVO> getContactList();

	//메일 작성write
	public int write(String sendEmpNo, String[] recvEmpNos, MailVO mailVO);

	//받은 메일함 List
	public List<MailVO> selectReceiveList(String empNo);

	

	//메일 detail List
	public MailVO getMail(String mailCode);

	//메일 detail 사원 프로필
	public AttFileVO getAf(AttFileVO afVO);

	//메일 detail List
	public EmployeeVO getEmpByMail(MailVO mailVO);

	//받은 쪽지 즐겨찾기
	public void updateMail(MailRecVO marVO);

	//받은쪽지 즐겨찾기 List
	public List<MailVO> getStoreList();

	//받은쪽지 즐겨찾기 List
	public List<EmployeeVO> getEmpByStoreList(List<MailVO> updateMailList);

	//받은 메일함 삭제
	public void deleteMail(MailVO mailVO);

	//임시보관함
	public int outboxWrite(String sendEmpNo, MailVO mailVO);

	//임시보관함 주소록
	public List<ContactVO> getConList();

	//임시보관함 List
	public List<MailVO> getOutboxList();

	//임시보관함 리스트에서 사원List불러오기
	public List<EmployeeVO> getEmpByOutboxList(List<MailVO> outboxList);

	//임시보관함 detail
	public MailVO getoutboxMail(String mailCode);

	//임시보관함 detail
	public EmployeeVO getempByMail(MailVO mailVO);

	//태그 update
	public void updateTag(MailVO mailVO);

	//경영자료 List
	public List<MailVO> getMngList();

	//경영자료 List Emp
	public List<EmployeeVO> getEmpByMngList(List<MailVO> mngList);

	//회계자료 List
	public List<MailVO> getActList();

	//참고자료 List
	public List<MailVO> getRefList();

	//메일다운로드
	public AttFileVO mailDownload(int afCode);

	//파일업로드
	public int insertAf(AttFileVO afVO);
	
	//받은 메일함 상세 정보 가져오기
	public List<MailVO> selectReceiveDetail(MailVO mailVO);

	
	

}
