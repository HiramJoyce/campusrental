package com.campus.rental.service.impl;

import com.campus.rental.dao.GoodDao;
import com.campus.rental.domain.Good;
import com.campus.rental.domain.Result;
import com.campus.rental.service.GoodService;
import com.campus.rental.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author hiram 2019年03月18日 23:25
 */
@Service
public class GoodServiceImpl implements GoodService {

    @Autowired
    private GoodDao goodDao;

    @Override
    public Good createGood(Good good) {
        return goodDao.insertGood(good) > 0 ? good : null;
    }

    @Override
    public List<Good> getAllGoods() {
        return goodDao.selectAllGoods();
    }

    @Override
    public List<Good> getAllAllowedGoods() {
        return goodDao.selectAllAllowedGoods();
    }

    @Override
    public List<Good> getGoodsByStudentId(String studentId) {
        return goodDao.selectGoodsByStudentId(studentId);
    }

    @Override
    public Good getGoodById(String id) {
        return goodDao.selectGoodById(id);
    }

    @Override
    public Good updateGood(Good good) {
        return goodDao.updateGood(good) > 0 ? good : null;
    }

    @Override
    public Result deleteGood(String id) {
        return goodDao.deleteGoodById(id) > 0 ? ResultUtil.success() : ResultUtil.error("");
    }

    @Override
    public int deleteGoodsByStudentId(String studentId) {
        return goodDao.deleteGoodsByStudentId(studentId);
    }

    @Override
    public List<Good> searchWord(String word) {
        return goodDao.selectTitleByWord(word);
    }

    @Override
    public int setGoodState(String id, String state) {
        return goodDao.setGoodState(id, state);
    }
}
