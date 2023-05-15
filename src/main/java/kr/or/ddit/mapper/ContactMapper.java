package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.contact.vo.ContactVO;

public interface ContactMapper {

	public List<ContactVO> getTehList();

	//쪽지 보내기
	public List<ContactVO> getContactList();

	public void register(ContactVO conVO);

	public List<ContactVO> getSalesList();

	public List<ContactVO> getMnList();

	public List<ContactVO> getNtList();

	public void deleteContactList(ContactVO conVO);

	//임시저장
	public List<ContactVO> getConList();

	//보안기술부
	public List<ContactVO> getSecList();


}
