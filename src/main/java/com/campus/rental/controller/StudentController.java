package com.campus.rental.controller;

import com.alibaba.druid.util.StringUtils;
import com.campus.rental.domain.Good;
import com.campus.rental.domain.Result;
import com.campus.rental.domain.Student;
import com.campus.rental.domain.Trade;
import com.campus.rental.service.GoodService;
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
@RequestMapping("/student")
public class StudentController {
    private static final Log logger = LogFactory.getLog(StudentController.class);

    @Autowired
    private StudentService studentService;
    @Autowired
    private TradeService tradeService;
    @Autowired
    private GoodService goodService;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(String stuNum, String password, Model model, HttpServletRequest request) {
        logger.info("-> student -> login -> ");
        Student student = studentService.login(stuNum, password);
        List<Good> allAllowedGoods = goodService.getAllAllowedGoods();
        model.addAttribute("goods", allAllowedGoods);
        if (student != null) {
            logger.info("   success -> " + student);
            request.getSession().setAttribute("id", student.getId());
            request.getSession().setAttribute("realName", student.getRealName());
            request.getSession().setAttribute("role", "student");
            model.addAttribute("message", "登录成功！");
            return "index";
        }
        logger.info("   error -> with stuNum : " + stuNum + " - password : " + password);
        model.addAttribute("error", "用户名或密码错误，登录失败！");
        return "index";
    }

    @RequestMapping("")
    public String index(HttpServletRequest request) {
        String id = (String) request.getSession().getAttribute("id");
        if (id == null) {
            return "redirect:/";
        }
        Student student = studentService.getStudentInfo(id);
//        List<Trade> tradesFrom = tradeService.getTradesByFromStudentId(id);
//        List<Trade> tradesTo = tradeService.getTradesByToStudentId(id);
        request.setAttribute("student", student);
//        request.setAttribute("tradesFrom", tradesFrom);
//        request.setAttribute("tradesTo", tradesTo);
        return "student/index";
    }

    @RequestMapping("/manage")
    public String manage(Model model, HttpServletRequest request) {
        String id = (String) request.getSession().getAttribute("id");
        String role = (String) request.getSession().getAttribute("role");
        if (id == null || !StringUtils.equals(role, "admin")) {
//            model.addAttribute("error", "请检查登录状态或权限");
            return "redirect:/";
        }
        List<Student> students = studentService.getAllStudent();
        model.addAttribute("students", students);
        return "student/manage";
    }

    @RequestMapping( value = "/tradesFrom", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Result tradesFrom(HttpServletRequest request) {
        return ResultUtil.success(tradeService.getTradesByFromStudentId((String) request.getSession().getAttribute("id")));
    }

    @RequestMapping( value = "/tradesTo", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Result tradesTo(HttpServletRequest request) {
        return ResultUtil.success(tradeService.getTradesByToStudentId((String) request.getSession().getAttribute("id")));
    }

    @RequestMapping("/delete")
    public String delete(String id, Model model, HttpServletRequest request) {
        if (request.getSession().getAttribute("role") == null || !request.getSession().getAttribute("role").equals("admin")) {
            return "404";
        }
        if (id != null) {
            String ids[] = id.split(",");
            for (String id1 : ids) {
                studentService.deleteById(id1);
            }
        }
        List<Student> students = studentService.getAllStudent();
        model.addAttribute("students", students);
        model.addAttribute("message", "删除成功！");
        return "student/manage";
    }

    @RequestMapping("/update")
    public String updateStudent(String id, Model model, HttpServletRequest request) {
        if (request.getSession().getAttribute("role") == null || !request.getSession().getAttribute("role").equals("admin")) {
            return "404";
        }
        Student student = studentService.getStudentInfo(id);
        if (student != null) {
            model.addAttribute("student", student);
            return "student/update";
        }
        List<Student> students = studentService.getAllStudent();
        model.addAttribute("students", students);
        model.addAttribute("error", "学生信息错误！");
        return "student/manage";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updateStudent(Student student, Model model, HttpServletRequest request) {
        System.out.println("-> updateStudent ->");
        System.out.println(student);
        if (studentService.updateStudentAll(student) != null) {
            model.addAttribute("message", "信息修改成功！");
        } else {
            model.addAttribute("error", "信息修改失败！");
        }
        request.setAttribute("student", student);
        return "student/index";
    }

    @RequestMapping("/add")
    public String addStudent(Model model, HttpServletRequest request) {
        if (request.getSession().getAttribute("role") == null || !request.getSession().getAttribute("role").equals("admin")) {
            return "404";
        }
        Student student = new Student();
        model.addAttribute("student", student);
        return "student/update";
    }

    @RequestMapping(value = "/updateAll", method = RequestMethod.POST)
    public String updateStudentAll(Student student, Model model, HttpServletRequest request) {
        if (request.getSession().getAttribute("role") == null || !request.getSession().getAttribute("role").equals("admin")) {
            return "404";
        }
        System.out.println("-> updateStudent ->");
        System.out.println(student);
        if (student.getId() == null || StringUtils.equals(student.getId(), "")) {
            if (studentService.addStudent(student) != null) {
                model.addAttribute("message", "学生信息添加成功！");
            } else {
                model.addAttribute("error", "学生信息添加失败！");
            }
        } else if (studentService.updateStudentAll(student) != null) {
            model.addAttribute("message", "学生信息修改成功！");
        } else {
            model.addAttribute("error", "学生信息修改失败！");
        }
        List<Student> students = studentService.getAllStudent();
        model.addAttribute("students", students);
        return "student/manage";
    }
}
