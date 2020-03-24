package com.db1.board.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FileVO {
	
	private int fno;
	private int bno;
	private String fileName;
	private String fileOriName;
	private String fileUrl;
}
