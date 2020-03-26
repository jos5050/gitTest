package com.db1.board.mapper;

import org.springframework.stereotype.Repository;

import com.db1.board.domain.Member;

@Repository("com.db1.board.mapper.MemberMapper")
public interface MemberMapper {
	
	public int memberInsert(Member member) throws Exception;
	
	public int memberLogin(String id, String password) throws Exception;

}
