package com.db1.board.domain;

import lombok.Builder;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Accessors(chain = true)
public class Member {

	private int memberNum;
	
	private String id;
	
	private String password;
	
	private String address;
	
	private String phoneNum;
	
	private String gender;
}
