package com.lgdx.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.lgdx.entity.Board;

@Mapper
public interface BoardMapper {
	@Select("SELECT * FROM BOARD")
	public abstract ArrayList<Board> boardList();
}	
