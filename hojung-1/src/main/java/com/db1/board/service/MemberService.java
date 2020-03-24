package com.db1.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.db1.board.domain.Member;
import com.db1.board.mapper.MemberMapper;

@Service
public class MemberService {
	@Autowired
	MemberMapper memberMapper;
	
	public int memberInsert(Member member) throws Exception {
		
		return memberMapper.memberInsert(member);
	}
	
	public Member memberLogin(String id, String password) throws Exception{
		
		return memberMapper.memberLogin(id, password);
	}
}	
