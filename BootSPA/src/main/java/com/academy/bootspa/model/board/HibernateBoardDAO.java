package com.academy.bootspa.model.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.academy.bootspa.exception.BoardException;
import com.academy.bootspa.model.domain.Board;

@Repository
public class HibernateBoardDAO implements BoardDAO {

	@Autowired
	//이걸로 쿼리문을 제어할 수 있음
	private HibernateBoardRepository boardRepository;
	
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
	public void insert(Board board) throws BoardException{
		// TODO Auto-generated method stub
		Board result =boardRepository.save(board);//자기가 알아서 board와 연결된 table insert까지 함
		if(result==null) {
			throw new BoardException("Hibernate로 등록실패");
		}

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
