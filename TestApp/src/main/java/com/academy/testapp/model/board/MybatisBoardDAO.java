package com.academy.testapp.model.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.academy.testapp.exception.BoardException;
import com.academy.testapp.model.domain.Board;

@Repository
public class MybatisBoardDAO implements BoardDAO{

	@Autowired
	private BoardMapper boardMapper; 
	
	@Override
	public List selectAll() {
		// TODO Auto-generated method stub
		return boardMapper.selectAll();
	}

	@Override
	public Board select(int board_id) {
		// TODO Auto-generated method stub
		return boardMapper.select(board_id);
	}

	@Override
	public void insert(Board board) throws BoardException{
		// TODO Auto-generated method stub
		int result = boardMapper.insert(board);
		if(result==0) {
			throw new BoardException("등록실패");
		}
	}

	@Override
	public void update(Board board) throws BoardException{
		// TODO Auto-generated method stub
		int result = boardMapper.update(board);
		if(result==0) {
			throw new BoardException("수정실패");
		}
	}

	@Override
	public void delete(Board board) throws BoardException {
		// TODO Auto-generated method stub
		int result = boardMapper.delete(board);
		if(result==0) {
			throw new BoardException("삭제실패");
		}
	}

}
