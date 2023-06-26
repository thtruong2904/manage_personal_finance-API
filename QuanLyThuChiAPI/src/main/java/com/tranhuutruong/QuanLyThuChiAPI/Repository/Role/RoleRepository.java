package com.tranhuutruong.QuanLyThuChiAPI.Repository.Role;

import com.tranhuutruong.QuanLyThuChiAPI.Model.Role.RoleModel;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RoleRepository extends CrudRepository<RoleModel, String> {
    RoleModel findByName(String name);

}
