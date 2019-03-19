package com.campus.rental.controller;

import com.alibaba.druid.util.StringUtils;
import com.campus.rental.domain.Good;
import com.campus.rental.domain.Result;
import com.campus.rental.domain.Student;
import com.campus.rental.domain.Trade;
import com.campus.rental.domain.enums.ResultEnum;
import com.campus.rental.service.GoodService;
import com.campus.rental.service.TradeService;
import com.campus.rental.util.ResultUtil;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

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
        Trade trade = new Trade();
        trade.setGoodId(goodId);
        trade.setFromId(fromId);
        trade.setToId((String) request.getSession().getAttribute("id"));
        trade.setRentTime(new Date());
        trade.setTotal(good.getPrice() * Double.valueOf(rentLast));
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

    @RequestMapping("/manage")
    public String manage(Model model, HttpServletRequest request) {
        String id = (String) request.getSession().getAttribute("id");
        String role = (String) request.getSession().getAttribute("role");
        if (id == null || !StringUtils.equals(role, "admin")) {
//            model.addAttribute("error", "请检查登录状态或权限");
            return "redirect:/";
        }
        List<Trade> trades = tradeService.getAllTrades();
        model.addAttribute("trades", trades);
        return "trade/manage";
    }

    @RequestMapping("/delete")
    public String delete(String id, Model model, HttpServletRequest request) {
        if (request.getSession().getAttribute("role") == null || !request.getSession().getAttribute("role").equals("admin")) {
            return "404";
        }
        if (id != null) {
            String ids[] = id.split(",");
            for (String id1 : ids) {
                tradeService.deleteTradeById(id1);
            }
        }
        List<Trade> trades = tradeService.getAllTrades();
        model.addAttribute("trades", trades);
        model.addAttribute("message", "删除成功！");
        return "trade/manage";
    }
}
