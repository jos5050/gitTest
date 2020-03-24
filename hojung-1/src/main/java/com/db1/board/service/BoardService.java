package com.db1.board.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.db1.board.domain.BoardVO;
import com.db1.board.domain.FileVO;
import com.db1.board.mapper.BoardMapper;

@Service("com.db1.board.service.BoardService")
public class BoardService {

	@Resource(name = "com.db1.board.mapper.BoardMapper")
	BoardMapper mBoardMapper;

	public List<BoardVO> boardListService() throws Exception {
		return mBoardMapper.boardList();
	}

	public BoardVO boardDetailService(int bno) throws Exception {
		return mBoardMapper.boardDetail(bno);
	}

	public int boardInsertService(BoardVO board) throws Exception {
		return mBoardMapper.boardInsert(board);

	}

	public int boardUpdateService(BoardVO board) throws Exception {
		return mBoardMapper.boardUpdate(board);
	}

	public int boardDeleteService(int bno) throws Exception {
		return mBoardMapper.boardDelete(bno);
	}

	public int fileInsertService(FileVO file) throws Exception {
		return mBoardMapper.fileInsert(file);
	}

	public FileVO fileDetailService(int bno) throws Exception {

		return mBoardMapper.fileDetail(bno);
	}

}
