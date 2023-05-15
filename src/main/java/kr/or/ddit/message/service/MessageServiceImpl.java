package kr.or.ddit.message.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kr.or.ddit.attfile.vo.AttFileVO;
import kr.or.ddit.contact.vo.ContactVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.mapper.AttfileMapper;
import kr.or.ddit.mapper.ContactMapper;
import kr.or.ddit.mapper.EmployeeMapper;
import kr.or.ddit.mapper.MesRecMapper;
import kr.or.ddit.mapper.MessageMapper;
import kr.or.ddit.message.vo.MesrecVO;
import kr.or.ddit.message.vo.MessageVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MessageServiceImpl implements IMessageService {

	@Inject
	private MessageMapper messageMapper;

	@Inject
	private EmployeeMapper empMapper;
	
	
	@Inject 
	private AttfileMapper afMapper;
	
	@Inject
	private ContactMapper contactMapper;

	@Inject
	private MesRecMapper mesrecMapper;
	 

	
	
	@Override
	public List<MessageVO> getMessageList() {

		return messageMapper.getMessageList();
	}

	@Override
	public MessageVO getMessage(String mesCode) {

		return messageMapper.getMessage(mesCode);
	}

	
	@Override
	public List<EmployeeVO> getEmpByMsgList(List<MessageVO> messageList) {

		List<EmployeeVO> empList = new ArrayList<EmployeeVO>();

		for (int i = 0; i < messageList.size(); i++) {
			EmployeeVO empVO = new EmployeeVO();

			String empNo = messageList.get(i).getEmpNo();
			empVO.setEmpNo(empNo);

			empVO = empMapper.getEmp(empVO);
			empList.add(empVO);
		}
		return empList;

	}

	//쪽지 detail
	@Override
	public EmployeeVO getEmpByMessage(MessageVO messageVO) {
		
		EmployeeVO empVO = new EmployeeVO();
		
		empVO.setEmpNo(messageVO.getEmpNo());
		
		return empMapper.getEmp(empVO);
	}


	
	@Override 
	public AttFileVO getAf(AttFileVO afVO) {
	  
		return afMapper.getAf(afVO); 
	}

	  
	//쪽지 보내기 
	@Override
	public int write(String sendEmpNo,String[] recvEmpNOs,MessageVO msgVO) {
		log.debug("sendEmpNo 확인 : " + sendEmpNo);
		log.debug("sendEmpNo 확인 : " + recvEmpNOs);
		
		msgVO.setEmpNo(sendEmpNo);
		messageMapper.sendMessage(msgVO);
		log.debug("[ msgVO 확인 ] : "+ msgVO);
		
		int count =0;
		for (String recvEmpNo : recvEmpNOs) {
			msgVO.setEmpNo(recvEmpNo);
			messageMapper.write(msgVO);
			count++;
		}
		
		
		// 1. msgVO에 담겨져 넘어오는 empNo(회원이름)에 해당하는 사원번호들을 조회
		// - msgVO안에 empNo가 이름,이름,이름, .... 들어옴
		// - 이 녀석들을 ','단위로 짤라서 각 이름 하나하를 for문을 돌려서 이름에 해당하는 사원번호를 조회
		// - 그 사원번호를 아래 msgVO에 있는 empNo에 다시 넣어서 write를 진행한다.
		/*
		String allEmp = msgVO.getEmpNo();
		String[] arrEmp = allEmp.split(",");
		// [0]은 작성자 사원번호 들어있다.
		
		msgVO.setEmpNo(empNo);
		
		// 내가 보낸 쪽지 정보를 message 테이블에 한번 기록한다.
		int count = messageMapper.sendMessage(msgVO);
		
		// 데이터베이스를 통해서 사원이름에 해당하는 사원번호를 조회해서 가져왔다.
		for (int i = 0; i < arrEmp.length; i++) {
			String empNum = messageMapper.getEmpNo(arrEmp[i]);
			msgVO.setEmpNo(empNum);
			messageMapper.write(msgVO);
		}
		
		*/
		
		return count;
	}

	@Override
	public List<ContactVO> getContactList() {

		
		return contactMapper.getContactList();
	}

	//보낸쪽지 삭제
	@Override
	public void deleteMsg(MessageVO msgVO) {
		 
		messageMapper.deleteMsg(msgVO);
		
	}

	@Override
	public List<MessageVO> selectReceiveList(String empNo) {
		return messageMapper.selectReceiveList(empNo);
	}

	@Override
	public List<MessageVO> selectSendList(String empNo) {
		return messageMapper.selectSendList(empNo);
	}

	//받은쪽지 즐겨찾기
	@Override
	public void updateMsg(MesrecVO mesVO) {
		
		log.info("updateMsg>>>>");
		
		messageMapper.updateMsg(mesVO);
		
	}
	

	//Store
	@Override
	public List<MessageVO> getStoreList() {
		
		return messageMapper.getStoreList();
	}

	@Override
	public List<EmployeeVO> getEmpByStoreList(List<MessageVO> storeList) {
		
		List<EmployeeVO> empList = new ArrayList<EmployeeVO>();
		//log.info("empList",empList);
		for (int i = 0; i < storeList.size(); i++) {
			EmployeeVO empVO = new EmployeeVO();
			
			String empNo = storeList.get(i).getEmpNo();
			empVO.setEmpNo(empNo);
			
			empVO = empMapper.getEmp(empVO);
			empList.add(empVO);
			
			log.info("storeList",storeList);
			
		}
		
		return empList;
	}

	@Override
	public MessageVO getMSG(String mesCode) {

		return messageMapper.getMSG(mesCode);
	}

	

}

