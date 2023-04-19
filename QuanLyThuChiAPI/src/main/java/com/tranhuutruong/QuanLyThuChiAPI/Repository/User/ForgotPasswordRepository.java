package com.tranhuutruong.QuanLyThuChiAPI.Repository.User;

import com.tranhuutruong.QuanLyThuChiAPI.Model.User.AccountModel;
import com.tranhuutruong.QuanLyThuChiAPI.Model.User.ForgotPassword;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ForgotPasswordRepository extends JpaRepository<ForgotPassword, Long> {
    ForgotPassword findByVerifyCode(String verifyCode);

    ForgotPassword findForgotPasswordByAccountModel(AccountModel accountModel);
}
