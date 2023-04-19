package com.tranhuutruong.QuanLyThuChiAPI.Controller.User;

import com.tranhuutruong.QuanLyThuChiAPI.Request.User.ForgotPasswordRequest;
import com.tranhuutruong.QuanLyThuChiAPI.Request.User.LoginRequest;
import com.tranhuutruong.QuanLyThuChiAPI.Request.User.UserRequest;
import com.tranhuutruong.QuanLyThuChiAPI.Response.Api.ApiResponse;
import com.tranhuutruong.QuanLyThuChiAPI.Response.Login.LoginResponse;
import com.tranhuutruong.QuanLyThuChiAPI.Response.User.PasswordResponse;
import com.tranhuutruong.QuanLyThuChiAPI.Response.User.UserResponse;
import com.tranhuutruong.QuanLyThuChiAPI.Security.JWT.JwtProvider;
import com.tranhuutruong.QuanLyThuChiAPI.Service.User.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Mono;

import javax.validation.Valid;

@RestController
@RequestMapping(value = "/api/auth")
public class AuthController {
    @Autowired
    private UserService userService;

    @Autowired
    JwtProvider jwtProvider;
    @Autowired
    AuthenticationManager authenticationManager;

    @PostMapping(value = "/login")
    public Mono<ApiResponse<LoginResponse>> loginUser(@Valid @RequestBody LoginRequest loginRequest)
    {
        LoginResponse resp = userService.login(loginRequest);
        return Mono.just(ApiResponse.of(resp));
    }
    @Transactional
    @PostMapping(value = "/register")
    public UserResponse registerUser(@Valid @RequestBody UserRequest userRequest)
    {
        UserResponse userResponse = userService.registerUser(userRequest);
        return userResponse;
    }

    @GetMapping(value = "/refresh/{refresh-token}")
    public Mono<ApiResponse<LoginResponse>> refreshToken(@PathVariable("refresh-token") String refreshToken) {
        return Mono.just(ApiResponse.of(userService.refreshToken(refreshToken)));
    }



    @Transactional
    @PostMapping(value = "/forgot-password")
    public Mono<ApiResponse<PasswordResponse>> forgotPassword(@Valid @RequestBody ForgotPasswordRequest forgotPasswordRequest)
    {
        PasswordResponse resp =userService.forgotPass(forgotPasswordRequest);
        return Mono.just(ApiResponse.of(resp));
    }
}
