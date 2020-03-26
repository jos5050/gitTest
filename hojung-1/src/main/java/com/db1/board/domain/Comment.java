package com.db1.board.domain;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Comment {

	private int id;
	
	private int boardid;
	
	private String content;
	
	private String writer;
	
	private LocalDate date;
}
