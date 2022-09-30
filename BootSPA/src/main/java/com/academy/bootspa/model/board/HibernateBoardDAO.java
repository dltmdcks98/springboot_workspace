package com.academy.bootspa.model.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.academy.bootspa.model.domain.Board;

@Repository
public class HibernateBoardDAO implements BoardDAO {

	@Autowired
	private MybatisBoardMapper boardMapper;

	@Override
	public List selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Board select(int board_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(Board board) {
		// TODO Auto-generated method stub

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
