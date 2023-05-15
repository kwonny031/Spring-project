package kr.or.ddit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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

public interface AppMapper {

	public ApFormVO selectForm(String apfName);
	public void create(RecVO rec) throws Exception;
	public void vacationInsert(VacationFormVO vacation) throws Exception;
	public void approvalInsert(VacationFormVO vacationVO) throws Exception;
	public void appLineInsert(VacationFormVO vacationVO) throws Exception;
	public List<AppVO> getAppList() throws Exception;
	public List<AppIngVO> getAppListByEmpNo(EmployeeVO empVO) throws Exception;
	public List<AppVO> getAppEndListByEmpNo(EmployeeVO empVO) throws Exception;
	public List<AplineVO> getAppLineListByEmpNo(EmployeeVO empVO) throws Exception;
	public List<AppIngVO> getTempstListByEmpNo(EmployeeVO empVO) throws Exception;
	public void approvalRecInsert(RecruitFormVO rec) throws Exception;
	public void recruitInsert(RecruitFormVO rec) throws Exception;
	public void appLineRecInsert(RecruitFormVO rec) throws Exception;
	public void approvalTempst(VacationFormVO vacation) throws Exception;
	public void vacationTempst(VacationFormVO vacation) throws Exception;
	public List<VacationAppFormVO> selectVacationAppForm(AppVO appVO) throws Exception;
	public AppVO selectTest(String appCode);
	public AppVO selectTest2(String appCode);
	public AppVO selectTest3(String appCode);
	public AppVO selectTest4(String appCode);
	public void aplineUpdate(@Param("empNo")String empNo, @Param("appCode")String appCode) throws Exception;
	public void companion(@Param("empNo")String empNo, @Param("appCode")String appCode, @Param("aplComment")String aplComment) throws Exception;
	public List<RecruitAppFormVO> selectRecruitAppForm(AppVO appVO) throws Exception;
	public List<VacationAppFormVO> selectVacationIngForm(AppVO appVO) throws Exception;
	public List<RecruitAppFormVO> selectRecruitIngForm(AppVO vaVO) throws Exception;
	public void approvalDelete(String appCode) throws Exception;
	public void aplineTopUpdate(@Param("empNo")String empNo, @Param("appCode")String appCode)throws Exception;
	public void approvalReTempst(RecruitFormVO recruit) throws Exception;
	public void recruitTempst(RecruitFormVO recruit) throws Exception;
	public AttFileVO selectAtt(String appCode) throws Exception;
	public void recruitModify(RecruitFormVO recruitVO) throws Exception;
	public void appRecModify(@Param("appCode")String appCode) throws Exception;
	public void appLineRecModify(@Param("appCode")String appCode)throws Exception;
	public void vacationModify(VacationFormVO vacationFormVO)throws Exception;
	public void appVacModify(@Param("appCode")String appCode)throws Exception;
	public void appLineVacModify(@Param("appCode")String appCode)throws Exception;

}
