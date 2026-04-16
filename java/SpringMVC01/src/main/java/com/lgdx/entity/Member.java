package com.lgdx.entity;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	private String id;
	private String pw;
	private String nick;
	private String phone;
}
