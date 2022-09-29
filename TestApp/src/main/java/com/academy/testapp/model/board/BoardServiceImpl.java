package com.academy.testapp.model.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.academy.testapp.exception.BoardException;
import com.academy.testapp.model.domain.Board;

@Service
public class BoardServiceImpl  implements BoardService{
	
	@Autowired
	private BoardDAO boardDAO;
	
	
	@Override
	public List selectAll() {
		// TODO Auto-generated method stub
		return boardDAO.selectAll();
	}

	@Override
	public Board select(int board_id) {
		// TODO Auto-generated method stub
		return boardDAO.select(board_id);
	}

	@Override
	public void insert(Board board) throws BoardException {
		// TODO Auto-generated method stub
		boardDAO.insert(board);
	}

	@Override
	public void update(Board board) throws BoardException {
		// TODO Auto-generated method stub
		boardDAO.update(board);
	}

	@Override
	public void delete(Board board) throws BoardException{
		// TODO Auto-generated method stub
		boardDAO.delete(board);
	}
	
}
