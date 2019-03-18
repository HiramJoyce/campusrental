package com.campus.rental.dao;

import com.campus.rental.domain.Admin;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminDao {
    Admin selectAdminByUserName(String userName);
}
