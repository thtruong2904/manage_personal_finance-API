package com.huutruong.moneypro.Controllers.User;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.huutruong.moneypro.Models.Addons.ResponseObject;
import com.huutruong.moneypro.Models.Addons.UserRequestModel;
import com.huutruong.moneypro.Models.Addons.UserResponseModel;
import com.huutruong.moneypro.Models.User.UserModel;
import com.huutruong.moneypro.Repositories.User.UserRepository;
import com.huutruong.moneypro.Services.User.UserService;

@RestController
@RequestMapping(value = "/api/v1/user")
@CrossOrigin
public class UserController {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private UserService userService;

    @GetMapping(value = "/getAll")
    public List<UserModel> getUsers() {
        return userRepository.findAll();
    }

    @PostMapping(value = "/register")
    public Long addUser(@RequestBody @Valid UserRequestModel userRequestModel) {
        Long id = userService.insertUser(userRequestModel);
        return id;
    }

    @GetMapping(value = "/{id}")
    public ResponseEntity<ResponseObject> selectById(@PathVariable("id") Long id) {
        try {
            return userService.selectUserById(id);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(
                    new ResponseObject("failed", "Lỗi truy cập", ""));
        }
    }

    @PostMapping(value = "/login")
    public ResponseEntity<ResponseObject> login(
            @RequestParam(name = "email", required = true) String email,
            @RequestParam(name = "password", required = true) String password,
            HttpServletRequest request) {
        try {
            return userService.login(email, password, request.getRemoteAddr());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(
                            new ResponseObject("failed", "Lỗi truy cập", ""));
        }
    }
}
