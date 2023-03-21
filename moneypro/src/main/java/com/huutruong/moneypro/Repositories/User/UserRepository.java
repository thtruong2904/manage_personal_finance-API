package com.huutruong.moneypro.Repositories.User;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.huutruong.moneypro.Models.User.UserModel;

@Repository
public interface UserRepository extends JpaRepository<UserModel, Long> {
    public Optional<UserModel> findById(Long id);

    public Optional<UserModel> findByEmailAndPassword(String email, String password);

    public Optional<UserModel> findByEmail(String email);

}
