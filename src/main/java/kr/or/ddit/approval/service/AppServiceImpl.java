package kr.or.ddit.approval.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

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
import kr.or.ddit.mapper.AppMapper;
import kr.or.ddit.mapper.TimelineMapper;
import kr.or.ddit.timeline.vo.TimelineVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AppServiceImpl implements IAppService {

	@Inject
	private AppMapper appMapper;
	
	@Inject
	private TimelineMapper timeMapper;
	

	@Override
	public void register(RecVO rec)throws Exception{
		appMapper.create(rec);
	}

//	@Override
//	public ApFormVO selectForm(String text) {
//		ApFormVO form = appMapper.selectForm(text);
//		return form;
//	}

	@Override
	public ApFormVO selectForm(String apfName) {
		return appMapper.selectForm(apfName);
	}

	@Override
	public List<AppVO> getAppList() throws Exception {
		return appMapper.getAppList();
	}

	@Override
	public List<AppIngVO> getAppListByEmpNo(EmployeeVO empVO) throws Exception {
		return appMapper.getAppListByEmpNo(empVO);
	}

	@Override
	public List<AppVO> getAppEndListByEmpNo(EmployeeVO empVO) throws Exception {
		return appMapper.getAppEndListByEmpNo(empVO);
	}

	@Override
	public List<AplineVO> getAppLineListByEmpNo(EmployeeVO empVO) throws Exception {
	    return appMapper.getAppLineListByEmpNo(empVO);
	}
	
	@Override
	public List<AppIngVO> getTempstListByEmpNo(EmployeeVO empVO) throws Exception {
		return appMapper.getTempstListByEmpNo(empVO);
	}
	
	@Override
	public void vacationInsert(VacationFormVO vacation) throws Exception {
		appMapper.approvalInsert(vacation);
		appMapper.vacationInsert(vacation);
		String[] empArr = vacation.getApline().getEmpNo().split(",");
		String[] posArr = vacation.getApline().getAplPos().split(",");
		for (int i = 0; i < 3; i++) {
			vacation.getApline().setAplPos(posArr[i]);
			vacation.getApline().setEmpNo(empArr[i]);
			vacation.getApline().setAplNum(i+1);
			appMapper.appLineInsert(vacation);
		}
		
		//타임라인
		TimelineVO timVO = new TimelineVO();
		timVO.setTimType("APP"); //null
		timVO.setEmpNo(vacation.getApp().getEmpNo());
		timVO.setTimContent("휴가신청서가 기안되었습니다.");
		timeMapper.insertTime(timVO);
	}
	
	@Override
	public void recruitInsert(RecruitFormVO rec) throws Exception {
		appMapper.approvalRecInsert(rec);
		appMapper.recruitInsert(rec);
		String[] empArr = rec.getApline().getEmpNo().split(",");
		log.info("empArrr길이: " + empArr.length);
		String[] posArr = rec.getApline().getAplPos().split(",");
		for (int i = 0; i < 3; i++) {
			rec.getApline().setAplPos(posArr[i]);
			rec.getApline().setEmpNo(empArr[i]);
			rec.getApline().setAplNum(i+1);
			appMapper.appLineRecInsert(rec);
		}
		
		//타임라인
		TimelineVO timVO = new TimelineVO();
		timVO.setTimType("APP"); //null
		timVO.setEmpNo(rec.getApp().getEmpNo());
		timVO.setTimContent("채용품의서가 기안되었습니다.");
		timeMapper.insertTime(timVO);
	}

	@Override
	public void vacationTempst(VacationFormVO vacation) throws Exception {
		appMapper.approvalTempst(vacation);
		appMapper.vacationTempst(vacation);
	}

	@Override
	public List<VacationAppFormVO> selectVacationAppForm(String appCode, String apfCode, String empNo) throws Exception {
		
		AppVO vaVO = new AppVO();
		vaVO.setAppCode(appCode);
		vaVO.setEmpNo(empNo);
		AppVO app = appMapper.selectTest(appCode);
		return appMapper.selectVacationAppForm(vaVO);
	}

	@Override
	public  void aplineUpdate(String empNo, String appCode) throws Exception {
		appMapper.aplineUpdate(empNo, appCode);
		
		
		//타임라인
		TimelineVO timVO = new TimelineVO();
		timVO.setTimType(appCode); //null
		timVO.setEmpNo(empNo);
		timVO.setTimContent("결재를 승인하였습니다..");
		timeMapper.insertTime(timVO);
		
	}

	@Override
	public void companion(String empNo, String appCode, String aplComment) throws Exception {
		appMapper.companion(empNo, appCode, aplComment);
		
		//타임라인
		TimelineVO timVO = new TimelineVO();
		timVO.setTimType(appCode); //null
		timVO.setEmpNo(empNo);
		timVO.setTimContent("결재를 반려하였습니다..");
		timeMapper.insertTime(timVO);
		
	}

	@Override
	public List<RecruitAppFormVO> selectRecruitAppForm(String appCode, String apfCode, String empNo) throws Exception {
		AppVO vaVO = new AppVO();
		vaVO.setAppCode(appCode);
		vaVO.setEmpNo(empNo);
		AppVO app = appMapper.selectTest2(appCode);
		return appMapper.selectRecruitAppForm(vaVO);
	}

	@Override
	public List<VacationAppFormVO> selectVacationIngForm(String appCode, String apfCode, String empNo) throws Exception {
		AppVO vaVO = new AppVO();
		vaVO.setAppCode(appCode);
		vaVO.setEmpNo(empNo);
		AppVO app = appMapper.selectTest3(appCode);
		return appMapper.selectVacationIngForm(vaVO);
	}

	@Override
	public List<RecruitAppFormVO> selectRecruitIngForm(String appCode, String apfCode, String empNo) throws Exception {
		AppVO vaVO = new AppVO();
		vaVO.setAppCode(appCode);
		vaVO.setEmpNo(empNo);
		AppVO app = appMapper.selectTest4(appCode);
		return appMapper.selectRecruitIngForm(vaVO);
	}

	@Override
	public void approvalDelete(String appCode) throws Exception {
		appMapper.approvalDelete(appCode);
	}

	@Override
	public void aplineTopUpdate(String empNo, String appCode) throws Exception {
		appMapper.aplineUpdate(empNo, appCode);
		appMapper.aplineTopUpdate(empNo, appCode);
		
	}

	@Override
	public void recruitTempst(RecruitFormVO recruit) throws Exception {
		appMapper.approvalReTempst(recruit);
		appMapper.recruitTempst(recruit);
		
	}

	@Override
	public AttFileVO selectAtt(String appCode) throws Exception {
		return appMapper.selectAtt(appCode);
	}

	@Override
	public void recruitModify(String appCode, RecruitFormVO rec) throws Exception {
		System.out.println("appCode넘어오는지 알려줘: " + appCode);
		appMapper.appRecModify(appCode);
		appMapper.recruitModify(rec);
		appMapper.appLineRecModify(appCode);
		
		//타임라인
//		TimelineVO timVO = new TimelineVO();
//		timVO.setTimType(appCode); //null
//		timVO.setEmpNo(rec.getApp().getEmpNo());
//		timVO.setTimContent("채용품의서가 수정되었습니다.");
//		timeMapper.insertTime(timVO);
		
	}

	@Override
	public void vacationModify(String appCode, VacationFormVO vacation) throws Exception {
		System.out.println(vacation.getVacation().getVacStart());
		appMapper.appVacModify(appCode);
		appMapper.vacationModify(vacation);
		appMapper.appLineVacModify(appCode);
		
		//타임라인
		TimelineVO timVO = new TimelineVO();
		timVO.setTimType(appCode); //null
		timVO.setEmpNo(vacation.getApp().getEmpNo());
		timVO.setTimContent("휴가신청서가 수정되었습니다.");
		timeMapper.insertTime(timVO);
				
	}

	


	

}
