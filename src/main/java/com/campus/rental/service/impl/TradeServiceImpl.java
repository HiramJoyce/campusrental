package com.campus.rental.service.impl;

import com.campus.rental.dao.TradeDao;
import com.campus.rental.domain.Result;
import com.campus.rental.domain.Trade;
import com.campus.rental.service.TradeService;
import com.campus.rental.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author hiram 2019年03月18日 23:25
 */
@Service
public class TradeServiceImpl implements TradeService {

    @Autowired
    private TradeDao tradeDao;

    @Override
    public Result createTrade(Trade trade) {
        return tradeDao.insertTrade(trade) > 0 ? ResultUtil.success(trade) : ResultUtil.error("");
    }

    @Override
    public Trade getTradeById(String id) {
        return tradeDao.selectTradeById(id);
    }

    @Override
    public List<Trade> getTradesByFromStudentId(String fromId) {
        return tradeDao.selectTradesByFromStudentId(fromId);
    }

    @Override
    public List<Trade> getTradesByToStudentId(String toId) {
        return tradeDao.selectTradesByToStudentId(toId);
    }

    @Override
    public Result getAllTrades() {
        return ResultUtil.success(tradeDao.selectAllTrades());
    }
}
