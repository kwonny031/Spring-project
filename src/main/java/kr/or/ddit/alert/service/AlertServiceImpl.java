package kr.or.ddit.alert.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.alert.vo.AlertVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.free.vo.FreeVO;
import kr.or.ddit.good.vo.GoodVO;
import kr.or.ddit.mapper.AlertMapper;
import kr.or.ddit.mapper.EmployeeMapper;
import kr.or.ddit.mapper.FreeMapper;
import kr.or.ddit.mapper.GoodMapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AlertServiceImpl implements IAlertService {
	
	@Inject
	private AlertMapper alertMapper;

	@Override
	public void update(AlertVO aleVO) {
		// TODO Auto-generated method stub
		alertMapper.update(aleVO);
	}



}
