package com.campus.rental.controller;

import com.campus.rental.domain.Result;
import com.campus.rental.domain.Student;
import com.campus.rental.domain.Trade;
import com.campus.rental.service.StudentService;
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
import java.util.List;

/**
 * @author hiram 2019年03月18日 23:19
 */
@Controller
public class StudentController {
    private static final Log logger = LogFactory.getLog(StudentController.class);

    @Autowired
    private StudentService studentService;
    @Autowired
    private TradeService tradeService;

    @RequestMapping(value = "/student/login", method = RequestMethod.POST)
    public String login(String stuNum, String password, Model model, HttpServletRequest request) {
        logger.info("-> student -> login -> ");
        Student student = studentService.login(stuNum, password);
        if (student != null) {
            logger.info("   success -> " + student);
            request.getSession().setAttribute("id", student.getId());
            request.getSession().setAttribute("realName", student.getRealName());
            request.getSession().setAttribute("role", "student");
            return "redirect:/";
        }
        logger.info("   error -> with stuNum : " + stuNum + " - password : " + password);
        model.addAttribute("error", "用户名或密码错误，登录失败");
        return "index";
    }

    @RequestMapping("student")
    public String index(HttpServletRequest request) {
        String id = (String) request.getSession().getAttribute("id");
        if (id == null) {
            return "redirect:/";
        }
        Student student = studentService.getStudentInfo(id);
        List<Trade> tradesFrom = tradeService.getTradesByFromStudentId(id);
        List<Trade> tradesTo = tradeService.getTradesByToStudentId(id);
        request.setAttribute("student", student);
        request.setAttribute("tradesFrom", tradesFrom);
        request.setAttribute("tradesTo", tradesTo);
        return "student/index";
    }

    @RequestMapping( value = "/student/tradesFrom", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Result tradesFrom(HttpServletRequest request) {
        return ResultUtil.success(tradeService.getTradesByFromStudentId((String) request.getSession().getAttribute("id")));
    }

    @RequestMapping( value = "/student/tradesTo", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Result tradesTo(HttpServletRequest request) {
        return ResultUtil.success(tradeService.getTradesByToStudentId((String) request.getSession().getAttribute("id")));
    }
}
