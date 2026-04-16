package com.lgdx.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.lgdx.entity.Member;

@Mapper
public interface MemberMapper {
	
	@Update("UPDATE MEMBER SET NICK=#{nick}, PW=#{pw}, PHONE=#{phone}  WHERE ID = #{id}")
	public abstract void update(Member vo);
	
	@Insert("INSERT INTO MEMBER(ID, PW, NICK, PHONE) VALUES(#{id}, #{pw}, #{nick}, #{phone})")
	public abstract void join(Member vo);
	
	@Select("SELECT * FROM MEMBER WHERE ID = #{id} AND PW = #{pw}")
	public abstract Member login(Member vo);
}
