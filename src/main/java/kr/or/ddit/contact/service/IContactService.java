package kr.or.ddit.contact.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.contact.vo.ContactVO;

public interface IContactService {

	//전체사원 주소록 리스트
	public List<ContactVO> getContactList();

	//주소록 insert
	public void register(ContactVO conVO);

	//기술지원본부 사원 리스트
	public List<ContactVO> getTehList();

	//영업부 사원 리스트
	public List<ContactVO> getSalesList();

	//관리본부 사원 리스트
	public List<ContactVO> getMnList();

	//메일 주소록
	public List<ContactVO> contactList(Map<String, String> map);

	//네트워크기술부 사원 리스트
	public List<ContactVO> getNtList();

	//전체사원 리스트 삭제
	public void deleteContactList(ContactVO conVO);

	//보안기술부 리스트
	public List<ContactVO> getSecList();


	

}
