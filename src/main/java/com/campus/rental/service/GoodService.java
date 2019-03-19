package com.campus.rental.service;

import com.campus.rental.domain.Good;
import com.campus.rental.domain.Result;

import java.util.List;

public interface GoodService {
    Good createGood(Good good);
    List<Good> getAllGoods();
    List<Good> getAllAllowedGoods();
    List<Good> getGoodsByStudentId(String studentId);
    Good getGoodById(String id);
    Good updateGood(Good good);
    Result deleteGood(String id);
    int deleteGoodsByStudentId(String studentId);
    List<Good> searchWord(String word);
}
