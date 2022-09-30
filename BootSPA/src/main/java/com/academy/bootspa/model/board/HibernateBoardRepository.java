package com.academy.bootspa.model.board;

import org.springframework.data.jpa.repository.JpaRepository;

import com.academy.bootspa.model.domain.Board;

//Hibernate가 지원하는 JpaRepository 로 정의									DTO	primary-key
public interface HibernateBoardRepository extends JpaRepository<Board, Integer> {
	
}
