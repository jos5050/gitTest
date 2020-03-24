package com.db1.board.domain;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Accessors(chain = true)
@XmlRootElement(name="company")
public class Company {
	
	private int companyId;
	private String companyName;
	private String companyRepresentative;
	private String CompanyContractInfo;
	private String CompantAddress;
}
