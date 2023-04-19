package com.tranhuutruong.QuanLyThuChiAPI.Response.User;

import com.tranhuutruong.QuanLyThuChiAPI.Model.Role.RoleModel;
import com.tranhuutruong.QuanLyThuChiAPI.Model.User.UserInfoModel;
import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class UserResponse{
    private boolean status;

    private String message;

    private UserInfoModel userInfoModel;

    private RoleModel roleModel;
}
