package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.cloud.vo.CloudVO;
import kr.or.ddit.employee.vo.EmployeeVO;

public interface CloudMapper {

	public List<CloudVO> empCloud(String empNo);				// 
		
	public List<CloudVO> depCloud(String empNo);				//

	public List<CloudVO> depFolderList(String depCode);			// 
	
	public int createChildFolder(CloudVO cloudVO);				//

	public int createParentFolder(CloudVO cloudVO);				//

	public List<CloudVO> empFolderList(String empNo);			//

	public String searchFolCode(String fileName);				// 

	public int register(EmployeeVO empVO);						// 신규 사원 등록시 개인 클라우드 생성



}
