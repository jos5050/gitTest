package com.db1.board.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.db1.board.domain.Comment;

@Repository("com.db1.board.mapper.CommentMapper")
public interface CommentMapper {
	
	public int commentCount() throws Exception;
	
	public List<Comment> commentList(int boardid) throws Exception;
	
	public int commentInsert(Comment comment) throws Exception;
	
	public int commentUpdate(Comment comment) throws Exception;
	
	public int commentDelete(int id) throws Exception;
	
	public int likeCount(int bno) throws Exception;
	
	public int likeAdd(int bno, String memberNum) throws Exception;	
}
