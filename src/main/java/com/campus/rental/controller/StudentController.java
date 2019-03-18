package com.campus.rental.controller;

import com.campus.rental.domain.Student;
import com.campus.rental.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * @author hiram 2019年03月18日 23:19
 */
@Controller
public class StudentController {

    @Autowired
    private StudentService studentService;

    @RequestMapping(value = "/student/login", method = RequestMethod.POST)
    public String login(String stuNum, String password, Model model, HttpServletRequest request) {
        Student student = studentService.login(stuNum, password);
        if (student != null) {
            request.getSession().setAttribute("id", student.getId());
            request.getSession().setAttribute("realName", student.getRealName());
            request.getSession().setAttribute("role", "student");
        }
        model.addAttribute("error", "用户名或密码错误，登录失败");
        return "index";
    }
}
