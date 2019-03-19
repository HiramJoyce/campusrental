package com.campus.rental.dao;

import com.campus.rental.domain.Trade;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TradeDao {
    int insertTrade(Trade trade);
    Trade selectTradeById(String id);
    List<Trade> selectTradesByFromStudentId(String fromId);
    List<Trade> selectTradesByToStudentId(String toId);
    List<Trade> selectAllTrades();
    int deleteTradeById(String id);
}
