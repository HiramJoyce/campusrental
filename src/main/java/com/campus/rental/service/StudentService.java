package com.campus.rental.service;

import com.campus.rental.domain.Student;

import java.util.List;

public interface StudentService {
    Student login(String userName, String password);

    Student getStudentInfo(String id);

    List<Student> getAllStudent();

    void deleteById(String id);

    Student updateStudentAll(Student student);

    Student addStudent(Student student);
}
