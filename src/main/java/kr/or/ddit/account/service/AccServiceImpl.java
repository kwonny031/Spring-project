package kr.or.ddit.account.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.AccMapper;

@Service
public class AccServiceImpl implements IAccService{
	
	@Inject
	private AccMapper accMapper;
}
