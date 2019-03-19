package com.campus.rental.controller;

import com.campus.rental.domain.Good;
import com.campus.rental.service.GoodService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
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
        good.setCreateTIme(new Date());
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

    //    @RequestMapping( value = "search", produces = "application/json;charset=UTF-8")
//    @ResponseBody
//    public Result search(String word) {
////        String word = new String(request.getParameter("word").getBytes(StandardCharsets.ISO_8859_1) , StandardCharsets.UTF_8);
//        System.out.println("-> programme -> search -> " + word);
//        List<Programme> programmes = programmeService.searchWord(word);
////        System.out.println(programmes);
////        request.setAttribute("programmes", programmes);
//        return programmes != null ? ResultUtil.success(programmes) : ResultUtil.error("No data!");
//    }
//
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
//
//    @RequestMapping( value = "delete", produces = "application/json;charset=UTF-8")
//    @ResponseBody
//    public Result deleteProgramme(String id) {
//        return programmeService.deleteProgramme(id);
//    }
//
//    @RequestMapping( value = "allowProgrammes", produces = "application/json;charset=UTF-8")
//    @ResponseBody
//    public Result allowProgrammes() {
//        return ResultUtil.success(programmeService.getAllAllowedProgrammes());
//    }
}
