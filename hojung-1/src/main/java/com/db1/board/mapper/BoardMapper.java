package com.db1.board.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.db1.board.domain.BoardVO;
import com.db1.board.domain.FileVO;
import com.db1.board.domain.Search;

@Repository("com.db1.board.mapper.BoardMapper")
public interface BoardMapper {
	public int boardCount() throws Exception;
	
	public List<BoardVO> boardList() throws Exception;
	
	public BoardVO boardDetail(int bno) throws Exception;
	
	public int boardInsert(BoardVO board) throws Exception;
	
	public int boardUpdate(BoardVO board) throws Exception;
	
	public int boardDelete(int bno) throws Exception;
	
	public int fileInsert(FileVO file) throws Exception;
	
	public FileVO fileDetail(int bno) throws Exception;

	public List<BoardVO> searchList(String how, String search) throws Exception;
}
