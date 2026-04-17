package com.lgdx.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;

@Data
@Entity
public class WebBoard {
	
	@Id // primary key
	@GeneratedValue(strategy = GenerationType.IDENTITY) // inc by 1 automatically
	private Long idx;
	
	@Column(length = 1000)
	private String title;
	
	@Column(length = 2000)
	private String content;

	private String writer;
	
	@Column(insertable = false, updatable = false, columnDefinition = "datetime default now()")
	private Date indate;
	
	@Column(insertable = false, updatable = false, columnDefinition = "int default 0")
	private Long count;
}
