package com.huutruong.moneypro.Models.User;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

import org.hibernate.validator.constraints.Length;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "users")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long id;

    @Column(name = "account_type", length = 10)
    public String accountType;

    @Email(message = "Email không đúng định dạng!")
    @Column(name = "email", length = 50, unique = true, nullable = false)
    public String email;

    // @Length(min = 5, max = 20, message = "Mật khẩu từ 5 đến 20 ký tự!")
    @Column(name = "password", length = 25)
    public String password;

    @NotBlank(message = "Họ không được để trống!")
    @Column(name = "firstname", length = 50)
    public String firstname;

    @NotBlank(message = "Tên không được để trống!")
    @Column(name = "lastname", length = 50)
    public String lastname;

    @Column(name = "date", length = 50)
    private String date;

    @Column(name = "avatar", length = 255)
    public String avatar;

    public String checkContraints() {
        try {
            if (this.getEmail() == null || this.getEmail().isEmpty())
                return "Email không được để trống !";
            else if (!this.getEmail().contains("@"))
                return "Email không đúng định dạng !";
            else if (this.getPassword().length() < 5 || this.getPassword().length() > 20)
                return "Mật khẩu từ 5 đến 20 ký tự!";
            else if (this.getFirstname().isEmpty())
                return "Họ không được để trống !";
            else if (this.getLastname().isEmpty())
                return "Tên không được để trống !";
            return "OK";
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return "Lỗi kiểm tra ràng buộc !";
        }
    }

    public void updateInformation(UserModel user) {
        this.setFirstname(user.firstname);
        this.setLastname(user.lastname);
        this.setAvatar(user.avatar);
    }

    public UserModel(String accountType, String email, String password, String firstname, String lastname,
            String avatar, String date) {
        this.accountType = accountType;
        this.email = email;
        this.password = password;
        this.firstname = firstname;
        this.lastname = lastname;
        this.avatar = avatar;
        this.date = date;
    }

}
