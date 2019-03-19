package com.campus.rental.service.impl;

import com.alibaba.druid.util.StringUtils;
import com.campus.rental.dao.StudentDao;
import com.campus.rental.domain.Student;
import com.campus.rental.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author hiram 2019年03月18日 23:25
 */
@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentDao studentDao;

    @Override
    public Student login(String stuNum, String password) {
        Student student = studentDao.selectStudentByStuNum(stuNum);
        if (student != null && StringUtils.equals(password, student.getPassword())) {
            return student;
        }
        return null;
    }

    @Override
    public Student getStudentInfo(String id) {
        return studentDao.selectStudentById(id);
    }
}
