package com.tranhuutruong.QuanLyThuChiAPI.Request.User;

import lombok.Data;

@Data
public class ResetPasswordRequest {
    private String verifyCode;
    private String password;
}
