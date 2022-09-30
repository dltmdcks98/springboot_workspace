package com.academy.bootspa.model.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.academy.bootspa.exception.BoardException;
import com.academy.bootspa.model.domain.Board;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	@Qualifier("mybatisBoardDAO")
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
	public void insert(Board board)throws BoardException{
		// TODO Auto-generated method stub
		boardDAO.insert(board);

	}

	@Override
	public void update(Board board) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(Board board) {
		// TODO Auto-generated method stub

	}

}
