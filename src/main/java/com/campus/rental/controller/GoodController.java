package com.campus.rental.controller;

import com.alibaba.druid.util.StringUtils;
import com.campus.rental.domain.Good;
import com.campus.rental.domain.Result;
import com.campus.rental.domain.Student;
import com.campus.rental.service.GoodService;
import com.campus.rental.util.ResultUtil;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("good")
public class GoodController {
    private static final Log logger = LogFactory.getLog(GoodController.class);

    @Autowired
    private GoodService goodService;

    @RequestMapping("create")
    public String newProgramme(@RequestParam(value = "img", required = false) MultipartFile[] img, HttpServletRequest request) throws IOException {
        Good good = new Good();
        good.setType(request.getParameter("type"));
        good.setOld(request.getParameter("old"));
        good.setTitle(request.getParameter("title"));
        good.setContent(request.getParameter("content"));
        good.setName(request.getParameter("name"));
        if (img != null) {
            StringBuilder sb = new StringBuilder();
            for (MultipartFile mf : img) {
                if (!mf.isEmpty()) {
                    String path = request.getServletContext().getRealPath("/resource/uploadImg/");

                    File dir = new File(path);
                    boolean dirExist = dir.exists() || dir.mkdirs();
                    if (dirExist) {
                        String originalFileName = mf.getOriginalFilename();
                        String newFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileName.substring(originalFileName.lastIndexOf("."));
                        File newFile = new File(path + "/" + newFileName);
                        mf.transferTo(newFile);
                        sb.append(newFileName).append(",");
                    }
                }
            }
            String imgStr = sb.toString();
            good.setImg(imgStr.length() > 0 ? imgStr.substring(0, imgStr.length() - 1) : null);
        }
        good.setPhone(request.getParameter("phone"));
        good.setWeChat(request.getParameter("weChat"));
        good.setQq(request.getParameter("qq"));
        good.setPrice(Double.valueOf(request.getParameter("price")));
        good.setTimeUnit(Integer.parseInt(request.getParameter("timeUnit")));
        good.setCreateTime(new Date());
        good.setState(0);
        good.setStudentId((String) request.getSession().getAttribute("id"));
        System.out.println(good.toString());
        if (goodService.createGood(good) != null) {
            logger.info("-> 存数据库成功 -> " + good.getId());
            return "redirect:/good/item?id=" + good.getId();
        } else {
            return "redirect:/student";
        }
    }

//        @RequestMapping( value = "search", produces = "application/json;charset=UTF-8")
//    @ResponseBody
//    public Result search(String word) {
////        String word = new String(request.getParameter("word").getBytes(StandardCharsets.ISO_8859_1) , StandardCharsets.UTF_8);
//        System.out.println("-> programme -> search -> " + word);
//        List<Programme> programmes = programmeService.searchWord(word);
////        System.out.println(programmes);
////        request.setAttribute("programmes", programmes);
//        return programmes != null ? ResultUtil.success(programmes) : ResultUtil.error("No data!");
//    }

    @RequestMapping( value = "goods", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Result search(String studentId) {
        System.out.println("-> good -> goods -> " + studentId);
        List<Good> goods = goodService.getGoodsByStudentId(studentId);
        return goods != null ? ResultUtil.success(goods) : ResultUtil.error("No data!");
    }


    @RequestMapping("item")
    public String programmeItem(String id, HttpServletRequest request) {
        System.out.println("--->>> item : " + id);
        Good good = goodService.getGoodById(id);
        if (good != null) {
            System.out.println("--->>> good : " + good.toString());
            request.setAttribute("good", good);
            return "good/index";
        }
        return "404";
    }

    @RequestMapping("/delete")
    public String delete(String id, Model model, HttpServletRequest request) {
        if (request.getSession().getAttribute("role") == null || !request.getSession().getAttribute("role").equals("admin")) {
            return "404";
        }
        if (id != null) {
            String ids[] = id.split(",");
            for (String id1 : ids) {
                goodService.deleteGood(id1);
            }
        }
        List<Good> goods = goodService.getAllGoods();
        model.addAttribute("goods", goods);
        model.addAttribute("message", "删除成功！");
        return "good/manage";
    }

    @RequestMapping("/allow")
    public String allow(String id, Model model, HttpServletRequest request) {
        if (request.getSession().getAttribute("role") == null || !request.getSession().getAttribute("role").equals("admin")) {
            return "404";
        }
        if (id != null) {
            String ids[] = id.split(",");
            for (String id1 : ids) {
                goodService.setGoodState(id1, "1");
            }
        }
        List<Good> goods = goodService.getAllGoods();
        model.addAttribute("goods", goods);
        model.addAttribute("message", "已通过！");
        return "good/manage";
    }

    @RequestMapping("/notAllow")
    public String notAllow(String id, Model model, HttpServletRequest request) {
        if (request.getSession().getAttribute("role") == null || !request.getSession().getAttribute("role").equals("admin")) {
            return "404";
        }
        if (id != null) {
            String ids[] = id.split(",");
            for (String id1 : ids) {
                goodService.setGoodState(id1, "0");
            }
        }
        List<Good> goods = goodService.getAllGoods();
        model.addAttribute("goods", goods);
        model.addAttribute("message", "已禁止！");
        return "good/manage";
    }

    @RequestMapping( value = "delete", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Result deleteProgramme(String id) {
        return goodService.deleteGood(id);
    }

    @RequestMapping("/manage")
    public String manage(Model model, HttpServletRequest request) {
        String id = (String) request.getSession().getAttribute("id");
        String role = (String) request.getSession().getAttribute("role");
        if (id == null || !StringUtils.equals(role, "admin")) {
            model.addAttribute("error", "请检查登录状态或权限");
            return "redirect:/";
        }
        List<Good> goods = goodService.getAllGoods();
        model.addAttribute("goods", goods);
        return "good/manage";
    }

    @RequestMapping("/update")
    public String updateGood(String id, Model model, HttpServletRequest request) {
        if (request.getSession().getAttribute("role") == null || !request.getSession().getAttribute("role").equals("admin")) {
            return "404";
        }
        Good good = goodService.getGoodById(id);
        if (good != null) {
            model.addAttribute("good", good);
            return "good/update";
        }
        List<Good> goods = goodService.getAllGoods();
        model.addAttribute("goods", goods);
        model.addAttribute("error", "商品信息错误！");
        return "good/manage";
    }

    @RequestMapping("/add")
    public String addGood(Model model, HttpServletRequest request) {
        if (request.getSession().getAttribute("role") == null || !request.getSession().getAttribute("role").equals("admin")) {
            return "404";
        }
        Good good = new Good();
        model.addAttribute("good", good);
        return "good/update";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updateGood(Good good, Model model, HttpServletRequest request) {
        if (request.getSession().getAttribute("role") == null || !request.getSession().getAttribute("role").equals("admin")) {
            return "404";
        }
        System.out.println("-> updateGood ->");
        System.out.println(good);
        if (good.getId() == null || StringUtils.equals(good.getId(), "")) {
            good.setCreateTime(new Date());
            if (goodService.createGood(good) != null) {
                model.addAttribute("message", "商品信息添加成功！");
            } else {
                model.addAttribute("error", "商品信息添加失败！");
            }
        } else if (goodService.updateGood(good) != null) {
            model.addAttribute("message", "商品信息修改成功！");
        } else {
            model.addAttribute("error", "商品信息修改失败！");
        }
        List<Good> goods = goodService.getAllGoods();
        model.addAttribute("goods", goods);
        return "good/manage";
    }
}
