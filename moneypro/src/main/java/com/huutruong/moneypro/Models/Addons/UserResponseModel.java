package com.huutruong.moneypro.Models.Addons;

import com.huutruong.moneypro.Models.User.UserModel;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserResponseModel {
    public String account_type;
    public String firstname;
    public String lastname;
    public String avatar;

    public void setUser(UserModel userModel) {
        this.account_type = userModel.accountType;
        this.firstname = userModel.firstname;
        this.lastname = userModel.lastname;
        this.avatar = userModel.avatar;
    }
}
