package com.campus.rental.controller;

import com.campus.rental.domain.Good;
import com.campus.rental.service.GoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author hiram 2019年03月18日 23:39
 */
@Controller
public class IndexController {

    @Autowired
    private GoodService goodService;

    @RequestMapping("/")
    public String index(Model model) {
        List<Good> allAllowedGoods = goodService.getAllAllowedGoods();
        model.addAttribute("goods", allAllowedGoods);
        return "index";
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect:/";
    }
}
