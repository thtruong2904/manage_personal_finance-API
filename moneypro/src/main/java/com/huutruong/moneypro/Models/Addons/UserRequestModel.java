package com.huutruong.moneypro.Models.Addons;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserRequestModel {
    public String account_type;
    public String email;
    public String password;
    public String firstname;
    public String lastname;
    public String avatar;
}
