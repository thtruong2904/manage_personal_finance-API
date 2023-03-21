package com.huutruong.moneypro.Repositories.Category;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.huutruong.moneypro.Models.Category.CategoryModel;

@Repository
public interface CategoryRepository extends JpaRepository<CategoryModel, Long> {
    List<CategoryModel> findByUserId(Long userId);
}
