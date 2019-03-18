package com.campus.rental.service;

import com.campus.rental.domain.Admin;

public interface AdminService {
    Admin login(String userName, String password);
}
