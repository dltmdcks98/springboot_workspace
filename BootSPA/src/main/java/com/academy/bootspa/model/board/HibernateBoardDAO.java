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
		return boardRepository.findAll();
	}

	@Override
	public Board select(int board_id) {
		
		return boardRepository.findById(board_id).get();
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
	public void update(Board board) throws BoardException{
		// TODO Auto-generated method stub
		Board result =boardRepository.save(board);
		if(result==null) {
			throw new BoardException("Hibernate로 수정실패");
		}
	}

	@Override
	public void delete(Board board) throws BoardException{
		// TODO Auto-generated method stub
		try {
			boardRepository.delete(board);
		} catch (Exception e) {
			// TODO Auto-generated catch block	
			e.printStackTrace();
			throw new BoardException("Hibernate로 삭제실패",e);
		
		}
	}

}
