package com.campus.rental.service.impl;

import com.alibaba.druid.util.StringUtils;
import com.campus.rental.dao.StudentDao;
import com.campus.rental.domain.Student;
import com.campus.rental.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

    @Override
    public List<Student> getAllStudent() {
        return studentDao.selectStudents();
    }

    @Override
    public void deleteById(String id) {
        studentDao.deleteStudent(id);
    }

    @Override
    public Student updateStudentAll(Student student) {
        return studentDao.updateStudentAll(student) > 0 ? student : null;
    }

    @Override
    public Student addStudent(Student student) {
        return studentDao.insertStudent(student) > 0 ? student : null;
    }
}
