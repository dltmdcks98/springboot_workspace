package com.academy.bootspa.exception;

public class BoardException extends RuntimeException{

	public BoardException(String msg) {
		// TODO Auto-generated constructor stub
		super(msg);
	}
	public BoardException(Throwable e) {
		// TODO Auto-generated constructor stub
		super(e);
	}
	public BoardException(String msg, Throwable e) {
		// TODO Auto-generated constructor stub
		super(msg,e);
	}
}
