package edu.ustb.mapper;

import edu.ustb.domain.Admin;

import java.util.List;

public interface adminMapper {
    Admin findByAdminName(String adminName);

    List<Admin> findAll();

}
