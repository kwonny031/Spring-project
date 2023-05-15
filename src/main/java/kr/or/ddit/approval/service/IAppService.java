package kr.or.ddit.approval.service;

import java.util.List;

import kr.or.ddit.approval.vo.ApFormVO;
import kr.or.ddit.approval.vo.AplineVO;
import kr.or.ddit.approval.vo.AppIngVO;
import kr.or.ddit.approval.vo.AplineUpdateVO;
import kr.or.ddit.approval.vo.AppVO;
import kr.or.ddit.approval.vo.RecVO;
import kr.or.ddit.approval.vo.RecruitAppFormVO;
import kr.or.ddit.approval.vo.RecruitFormVO;
import kr.or.ddit.approval.vo.VacationAppFormVO;
import kr.or.ddit.approval.vo.VacationFormVO;
import kr.or.ddit.approval.vo.VacationVO;
import kr.or.ddit.attfile.vo.AttFileVO;
import kr.or.ddit.employee.vo.EmployeeVO;

public interface IAppService {

	public void register(RecVO rec) throws Exception;	//채용품의서 등록
	public ApFormVO selectForm(String apfName);
	public void vacationInsert(VacationFormVO vacation) throws Exception;
	public List<AppVO> getAppList() throws Exception;
	public List<AppIngVO> getAppListByEmpNo(EmployeeVO empVO) throws Exception;
	public List<AppVO> getAppEndListByEmpNo(EmployeeVO empVO) throws Exception;
	public List<AplineVO> getAppLineListByEmpNo(EmployeeVO empVO) throws Exception;
	public List<AppIngVO> getTempstListByEmpNo(EmployeeVO empVO) throws Exception;
	public void recruitInsert(RecruitFormVO rec) throws Exception;
	public void vacationTempst(VacationFormVO vacation) throws Exception;
	public List<VacationAppFormVO> selectVacationAppForm(String appCode, String apfCode, String empNo) throws Exception;
	public void aplineUpdate(String empNo, String appCode) throws Exception;
	public void companion(String empNo, String appCode, String aplComment) throws Exception;
	public List<RecruitAppFormVO> selectRecruitAppForm(String appCode, String apfCode, String empNo) throws Exception;
	public List<VacationAppFormVO> selectVacationIngForm(String appCode, String apfCode, String empNo) throws Exception;
	public List<RecruitAppFormVO> selectRecruitIngForm(String appCode, String apfCode, String empNo) throws Exception;
	public void approvalDelete(String appCode) throws Exception;
	public void aplineTopUpdate(String empNo, String appCode)throws Exception;
	public void recruitTempst(RecruitFormVO recruit) throws Exception;
	public AttFileVO selectAtt(String appCode) throws Exception;
	public void recruitModify(String appCode, RecruitFormVO rec)throws Exception;
	public void vacationModify(String appCode, VacationFormVO vacation)throws Exception;

}
