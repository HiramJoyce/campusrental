package com.campus.rental.controller;

import com.campus.rental.domain.Good;
import com.campus.rental.domain.Result;
import com.campus.rental.domain.Trade;
import com.campus.rental.domain.enums.ResultEnum;
import com.campus.rental.service.GoodService;
import com.campus.rental.service.TradeService;
import com.campus.rental.util.ResultUtil;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Controller
@RequestMapping("trade")
public class TradeController {

    private static Log logger = LogFactory.getLog(TradeController.class);

    private final TradeService tradeService;
    private final GoodService goodService;

    @Autowired
    public TradeController(TradeService tradeService, GoodService goodService) {
        this.tradeService = tradeService;
        this.goodService = goodService;
    }

    @RequestMapping( value = "create", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Result create(String goodId, String rentLast, String fromId, HttpServletRequest request) {
        logger.info("-> trade -> create -> " + goodId + " - " + rentLast + " - " + fromId);
        if (request.getSession().getAttribute("id") == null) {
            return ResultUtil.error(ResultEnum.NOT_LOGIN);
        }
        Good good = goodService.getGoodById(goodId);
        if (good == null) {
            return ResultUtil.error(ResultEnum.ERROR);
        }
        System.out.println("---");
        System.out.println(good);
        System.out.println("---");
        Trade trade = new Trade();
        System.out.println(goodId);
        trade.setGoodId(goodId);
        System.out.println(fromId);
        trade.setFromId(fromId);
        System.out.println((String) request.getSession().getAttribute("id"));
        trade.setToId((String) request.getSession().getAttribute("id"));
        trade.setRentTime(new Date());
        System.out.println(good.getPrice() * Double.valueOf(rentLast));
        trade.setTotal(good.getPrice() * Double.valueOf(rentLast));
        System.out.println(Double.valueOf(rentLast));
        trade.setRentLast(Double.valueOf(rentLast));
        logger.info(trade);
        return tradeService.createTrade(trade);
    }

    @RequestMapping("item")
    public String item(String id, HttpServletRequest request) {
        Trade trade = tradeService.getTradeById(id);
        if (trade == null) {
            return "404";
        }
        Good good = goodService.getGoodById(trade.getGoodId());
        request.setAttribute("trade", trade);
        request.setAttribute("good", good);
        return "trade/index";
    }
}
