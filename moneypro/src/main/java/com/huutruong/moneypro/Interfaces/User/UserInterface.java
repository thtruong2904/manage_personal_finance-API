package com.huutruong.moneypro.Interfaces.User;

import org.springframework.http.ResponseEntity;

import com.huutruong.moneypro.Models.Addons.ResponseObject;
import com.huutruong.moneypro.Models.Addons.UserRequestModel;
import com.huutruong.moneypro.Models.Addons.UserResponseModel;

public interface UserInterface {
    Long insertUser(UserRequestModel userRequestModel);
    // public ResponseEntity<ResponseObject> insertUser(UserRequestModel user)
    // throws Exception;

    public ResponseEntity<ResponseObject> login(String email, String password, String ipClient) throws Exception;

    public ResponseEntity<ResponseObject> selectUserById(Long id) throws Exception;
}
