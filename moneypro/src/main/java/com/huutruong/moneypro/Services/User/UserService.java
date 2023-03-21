package com.huutruong.moneypro.Services.User;

import java.util.Optional;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.huutruong.moneypro.Interfaces.User.UserInterface;
import com.huutruong.moneypro.Models.Addons.ResponseObject;
import com.huutruong.moneypro.Models.Addons.UserRequestModel;
import com.huutruong.moneypro.Models.Addons.UserResponseModel;
import com.huutruong.moneypro.Models.User.UserModel;
import com.huutruong.moneypro.Repositories.User.UserRepository;
import com.huutruong.moneypro.Utils.GenerateId;
import com.huutruong.moneypro.Utils.GenerateTime;

@Service
public class UserService implements UserInterface {

    @Autowired
    UserRepository userRepository;

    @Override
    public Long insertUser(UserRequestModel userRequestModel) {
        UserModel userModel = new UserModel(
                userRequestModel.getAccount_type(),
                userRequestModel.getEmail(),
                userRequestModel.getPassword(),
                userRequestModel.getFirstname(),
                userRequestModel.getLastname(),
                userRequestModel.getAvatar(),
                GenerateTime.getCurentTimeStamp());

        userRepository.save(userModel);
        return userModel.getId();
    }
    // public ResponseEntity<ResponseObject> insertUser(UserRequestModel user)
    // throws Exception {
    // try {
    // UserModel userModel = new UserModel(
    // GenerateId.genetaredId(),
    // user.getAccount_type(),
    // user.getEmail(),
    // user.getPassword(),
    // user.getFirstname(),
    // user.getLastname(),
    // GenerateTime.getCurentTimeStamp(),
    // user.getAvatar());

    // if (user.getEmail() == null || user.getEmail().isEmpty())
    // return ResponseEntity.badRequest().body(new ResponseObject("failed", "Email
    // không được để trống!", ""));

    // else if (user.getPassword().length() < 5 || user.getPassword().length() > 20)
    // return ResponseEntity.badRequest().body(new ResponseObject("failed", "Mật
    // khẩu từ 5 đến 20 ký tự!", ""));
    // else {
    // userRepository.save(userModel);
    // return ResponseEntity.status(HttpStatus.CREATED).body(
    // new ResponseObject("success", "Tạo tài khoản thành công!", userModel));
    // }
    // } catch (Exception e) {
    // System.out.println(e.getMessage());
    // return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(
    // new ResponseObject("failed", "Lỗi truy cập", ""));
    // }
    // }

    @Override
    public ResponseEntity<ResponseObject> login(String email, String password, String ipClient) throws Exception {
        Optional<UserModel> foundUser = userRepository.findByEmailAndPassword(email, password);
        if (foundUser.isPresent()) {
            HttpHeaders headers = new HttpHeaders();
            headers.add("Content-Type", "application/json; charset=UTF-8");

            return ResponseEntity.status(HttpStatus.OK)
                    .headers(headers)
                    .body(new ResponseObject("success", "Đăng nhập thành công!",
                            foundUser.get().getId()));
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(new ResponseObject("failed", "Tài khoản hoặc mật khẩu sai!", ""));
        }
    }

    @Override
    public ResponseEntity<ResponseObject> selectUserById(Long id) throws Exception {
        Optional<UserModel> foundUser = userRepository.findById(id);
        UserResponseModel user = new UserResponseModel();
        if (foundUser.isPresent()) {
            user.setUser(foundUser.get());
        }
        return foundUser.isPresent() ? ResponseEntity.status(HttpStatus.OK).body(
                new ResponseObject("success", "Tìm tài khoản thành công", user))
                : ResponseEntity.status(HttpStatus.NOT_FOUND).body(
                        new ResponseObject("failed", "Không tìm thấy tài khoản", ""));
    }

}
