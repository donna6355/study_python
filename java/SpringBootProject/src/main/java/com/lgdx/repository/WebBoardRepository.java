package com.lgdx.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.lgdx.entity.WebBoard;

@Repository
public interface WebBoardRepository extends JpaRepository<WebBoard, Long> { // data type and primary key data type

	@Transactional
	@Modifying
	@Query("UPDATE WebBoard w Set w.count = w.count +1 WHERE w.idx = :idx")
	public void count(@Param("idx") Long idx);

}
