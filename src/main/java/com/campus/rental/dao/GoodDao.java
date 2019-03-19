package com.campus.rental.dao;

import com.campus.rental.domain.Good;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GoodDao {
    int insertGood(Good good);

    List<Good> selectAllGoods();

    List<Good> selectAllAllowedGoods();

    List<Good> selectGoodsByStudentId(String studentId);

    Good selectGoodById(String id);

    int updateGood(Good good);

    int deleteGoodById(String id);

    int deleteGoodsByStudentId(String studentId);

    List<Good> selectTitleByWord(String word);
}
