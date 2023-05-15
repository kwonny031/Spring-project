package kr.or.ddit.mail.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.attfile.vo.AttFileVO;
import kr.or.ddit.contact.vo.ContactVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.mail.vo.MailRecVO;
import kr.or.ddit.mail.vo.MailVO;
import kr.or.ddit.mail.vo.SaveMailVO;
import kr.or.ddit.mapper.AttfileMapper;
import kr.or.ddit.mapper.ContactMapper;
import kr.or.ddit.mapper.EmployeeMapper;
import kr.or.ddit.mapper.MailMapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MailServiceImpl implements IMailService {

	@Inject
	private MailMapper mailMapper;

	@Inject
	private EmployeeMapper empMapper;

	@Inject
	private ContactMapper contactMapper;

	@Inject
	private AttfileMapper afMapper;

	@Override
	public List<MailVO> getMailList() {

		return mailMapper.getMailList();
	}

	// 메일 EmpList 갖고 오기.
	@Override
	public List<EmployeeVO> getEmpByMailList(List<MailVO> receiveList) {

		List<EmployeeVO> empList = new ArrayList<EmployeeVO>();

		for (int i = 0; i < receiveList.size(); i++) {
			EmployeeVO empVO = new EmployeeVO();

			String empNo = receiveList.get(i).getEmpNo();
			empVO.setEmpNo(empNo);

			empVO = empMapper.getEmp(empVO);
			empList.add(empVO);

		}

		return empList;
	}

	// 보낸쪽지함 리스트 가져오기
	@Override
	public List<MailVO> selectSendList(String empNo) {

		return mailMapper.selectSendList(empNo);
	}

	@Override
	public List<ContactVO> getContactList() {

		return contactMapper.getContactList();
	}

	// 메일 작성
	@Override
	public int write(String sendEmpNo, String[] recvEmpNos, MailVO mailVO) {

		mailVO.setEmpNo(sendEmpNo);
		mailMapper.sendMail(mailVO);
		log.info("sendEmpNo", sendEmpNo);

		int count = 0;
		for (String recvEmpNo : recvEmpNos) {
			mailVO.setEmpNo(recvEmpNo);
			mailMapper.write(mailVO);
			count++;

		}
		//파일 업로드 로직
		/*
		 * for (MultipartFile file : files) { if (!file.isEmpty()) { String fileName =
		 * file.getOriginalFilename(); String filePath = "C:/uploads/" + fileName; //
		 * 파일이 저장될 경로 try { byte[] bytes = file.getBytes(); Path path =
		 * Paths.get(filePath); Files.write(path, bytes); } catch (IOException e) {
		 * e.printStackTrace(); } mailVO.setFilePath(filePath);
		 * mailVO.setFileName(fileName); mailMapper.insertFile(mailVO); } }
		 */

		return count;
	}
	

	// 받은 메일함 리스트 정보 가져오기
	@Override
	public List<MailVO> selectReceiveList(String empNo) {

		return mailMapper.selectReceiveList(empNo);
	}
	
	//받은 메일함 상세 정보 가져오기
	@Override
	public List<MailVO> selectReceiveDetail(MailVO mailVO){
		return mailMapper.selectReceiveDetail(mailVO);
	}

	// 메일 detail
	@Override
	public MailVO getMail(String mailCode) {
		// TODO Auto-generated method stub
		return mailMapper.getMail(mailCode);
	}

	// 메일 detail
	@Override
	public EmployeeVO getEmpByMail(MailVO mailVO) {

		EmployeeVO empVO = new EmployeeVO();

		empVO.setEmpNo(mailVO.getEmpNo());

		return empMapper.getEmp(empVO);
	}

	// 메일 detail
	@Override
	public AttFileVO getAf(AttFileVO afVO) {

		return afMapper.getAf(afVO);
	}

	// 받은 쪽지 즐겨찾기
	@Override
	public void updateMail(MailRecVO marVO) {

		log.info("updateMail>>>>");

		mailMapper.updateMail(marVO);

	}

	@Override
	public List<MailVO> getStoreList() {

		return mailMapper.getStoreList();
	}

	@Override
	public List<EmployeeVO> getEmpByStoreList(List<MailVO> updateMailList) {

		List<EmployeeVO> empList = new ArrayList<EmployeeVO>();

		for (int i = 0; i < updateMailList.size(); i++) {
			EmployeeVO empVO = new EmployeeVO();

			String empNo = updateMailList.get(i).getEmpNo();
			empVO.setEmpNo(empNo);

			empVO = empMapper.getEmp(empVO);
			empList.add(empVO);

			log.info("updateMailList", updateMailList);
		}

		return empList;
	}

	//받은 메일 삭제
	@Override
	public void deleteMail(MailVO mailVO) {
		
		mailMapper.deleteMail(mailVO);
		
	}

	//임시저장
	@Override
	public int outboxWrite(String sendEmpNo, MailVO mailVO) {
		mailVO.setEmpNo(sendEmpNo);
		int count = mailMapper.outboxMail(mailVO);
		log.info("sendEmpNo", sendEmpNo);


		return count;
	}

	//임시저장
	@Override
	public List<ContactVO> getConList() {
		
		return contactMapper.getConList();
	}

	//임시저장 List
	@Override
	public List<MailVO> getOutboxList() {

		return mailMapper.getOutboxList();
	}

	//임시저장 List
	@Override
	public List<EmployeeVO> getEmpByOutboxList(List<MailVO> outboxList) {

		List<EmployeeVO> empList = new ArrayList<EmployeeVO>();

		for (int i = 0; i < outboxList.size(); i++) {
			EmployeeVO empVO = new EmployeeVO();

			String empNo = outboxList.get(i).getEmpNo();
			empVO.setEmpNo(empNo);

			empVO = empMapper.getEmp(empVO);
			empList.add(empVO);

			log.info("outboxList", outboxList);
		}

		return empList;
	}

	@Override
	public MailVO getoutboxMail(String mailCode) {

		return mailMapper.getoutboxMail(mailCode);
	}

	@Override
	public EmployeeVO getempByMail(MailVO mailVO) {

		EmployeeVO empVO = new EmployeeVO();
		
		empVO.setEmpNo(mailVO.getEmpNo());
		
		return empMapper.getEmp(empVO);
	}

	@Override
	public void updateTag(MailVO mailVO) {
		
		mailMapper.updateTag(mailVO);
		
	}

	//경영자료 List 
	@Override
	public List<MailVO> getMngList() {

		return mailMapper.getMngList();
	}

	//경영자료 List
	@Override
	public List<EmployeeVO> getEmpByMngList(List<MailVO> mngList) {
		List<EmployeeVO> empList = new ArrayList<EmployeeVO>();

		for (int i = 0; i < mngList.size(); i++) {
			EmployeeVO empVO = new EmployeeVO();

			String empNo = mngList.get(i).getEmpNo();
			empVO.setEmpNo(empNo);

			empVO = empMapper.getEmp(empVO);
			empList.add(empVO);

			log.info("mngList", mngList);
		}

		return empList;
		
	}

	@Override
	public List<MailVO> getActList() {

		return mailMapper.getActList();
	}

	@Override
	public List<MailVO> getRefList() {

		return mailMapper.getRefList();
	}

	//메일 다운로드
	@Override
	public AttFileVO mailDownload(int afCode) {

		AttFileVO attVO = mailMapper.mailDownload(afCode);
		if(attVO == null) {
			throw new RuntimeException();
		}
		mailMapper.incrementMailDowncount(afCode);
		return attVO;
		
	}

	@Override
	public int insertAf(AttFileVO afVO) {

		return afMapper.insertAf(afVO);
	}

	
}
