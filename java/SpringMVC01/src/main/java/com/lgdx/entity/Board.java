package com.lgdx.entity;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Board {
	private int idx;
	private String title;
	private String content;
	private String writer;
	private String indate;
	private int count;
	private String id;
	private String filepath;
	
}
