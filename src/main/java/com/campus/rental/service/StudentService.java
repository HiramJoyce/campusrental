package com.campus.rental.service;

import com.campus.rental.domain.Student;

public interface StudentService {
    Student login(String userName, String password);
}
