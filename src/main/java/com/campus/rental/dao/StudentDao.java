package com.campus.rental.dao;

import com.campus.rental.domain.Student;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StudentDao {
    List<Student> selectStudents();
    Student selectStudentById(String id);
    Student selectStudentByStuNum(String stuNum);
    int insertStudent(Student student);
    int deleteStudent(String id);
    int updateStudent(Student student);
    int updateStudentAll(Student student);
}
