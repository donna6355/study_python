package com.lgdx.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.lgdx.entity.Board;

@Mapper
public interface BoardMapper {
	
	@Insert("INSERT INTO BOARD(TITLE, CONTENT, WRITER) VALUES(#{title}, #{content}, #{writer})")
	public abstract void boardInsert(Board vo);
	
	@Select("SELECT * FROM BOARD ORDER BY INDATE DESC")
	public abstract ArrayList<Board> boardList();
	
	@Select("SELECT * FROM BOARD WHERE IDX = #{idx}")
	public abstract Board boardContent(int idx);
	
	@Delete("DELETE FROM BOARD WHERE IDX = #{idx}")
	public abstract void deleteContent(int idx);

	@Update("UPDATE BOARD SET COUNT = COUNT +1 WHERE IDX = #{idx}")
	public abstract void boardCount(int idx);
	
	@Update("UPDATE BOARD SET TITLE = #{title}, CONTENT=#{content}, WRITER=#{writer}  WHERE IDX = #{idx}")
	public abstract void boardUpdate(Board vo);
}	
