package com.academy.bootspa.model.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;

@Data
@Entity
public class Board {

	//프라이머리 키에 대하여 아래 2줄은 적어야함
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int board_id;
	
	private String title;
	private String writer;
	private String content;
	private String regdate;
	private int hit;
}
