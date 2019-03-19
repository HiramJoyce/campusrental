package com.campus.rental.controller;

import com.campus.rental.domain.Admin;
import com.campus.rental.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * @author hiram 2019年03月18日 23:19
 */
@Controller
@RequestMapping("admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage() {
        return "admin/loginPage";
    }

    @RequestMapping("")
    public String index(HttpServletRequest request) {
        String id = (String) request.getSession().getAttribute("id");
        if (id == null) {
            return "redirect:/admin/login";
        }
        return "admin/index";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(String userName, String password, HttpServletRequest request) {
        Admin admin = adminService.login(userName, password);
        if (admin != null) {
            request.getSession().setAttribute("id", admin.getId());
            request.getSession().setAttribute("realName", admin.getUserName());
            request.getSession().setAttribute("role", "admin");
            return "admin/index";
        }
        return "admin/loginPage";
    }
}
