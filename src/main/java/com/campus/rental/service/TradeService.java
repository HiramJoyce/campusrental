package com.campus.rental.service;

import com.campus.rental.domain.Result;
import com.campus.rental.domain.Trade;

import java.util.List;

public interface TradeService {
    Result createTrade(Trade trade);
    Trade getTradeById(String id);
    List<Trade> getTradesByFromStudentId(String fromId);
    List<Trade> getTradesByToStudentId(String toId);
//    Result startTrade(String id);
//    Result endTrade(String id);
//    Result finishTrade(String id);
//    Result unFinishTrade(String id);
//    List<Trade> getEndTrade();
//    Result endTrade();
//    Result rate(String userId, String tradeId, String rate, String comment);
    List<Trade> getAllTrades();
    int deleteTradeById(String id);
}
