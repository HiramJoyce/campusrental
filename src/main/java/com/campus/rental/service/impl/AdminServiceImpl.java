package com.campus.rental.service.impl;

import com.alibaba.druid.util.StringUtils;
import com.campus.rental.dao.AdminDao;
import com.campus.rental.domain.Admin;
import com.campus.rental.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author hiram 2019年03月18日 23:25
 */
@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao adminDao;

    @Override
    public Admin login(String userName, String password) {
        Admin admin = adminDao.selectAdminByUserName(userName);
        if (admin != null && StringUtils.equals(password, admin.getPassword())) {
            return admin;
        }
        return null;
    }
}
