package com.huutruong.moneypro.Controllers.Category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.huutruong.moneypro.Models.Category.CategoryModel;
import com.huutruong.moneypro.Repositories.Category.CategoryRepository;
import com.huutruong.moneypro.Utils.GenerateTime;

import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

@RestController
@RequestMapping(value = "/api/v1/category")
@CrossOrigin
public class CategoryController {

    @Autowired
    private CategoryRepository categoryRepository;

    @GetMapping(value = "/getAll")
    public List<CategoryModel> getCategory() {
        return categoryRepository.findAll();
    }

    // lấy danh mục chi tiêu dựa vào idUser
    @GetMapping(value = "/{userId}")
    public ResponseEntity<List<CategoryModel>> getCategoryByUserId(@PathVariable Long userId) {
        List<CategoryModel> categories = categoryRepository.findByUserId(userId);

        if (categories.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(categories, HttpStatus.OK);
    }

    // cập nhật danh mục
    @PutMapping(value = "/{id}")
    public CategoryModel updateCategory(@PathVariable Long id, @RequestBody CategoryModel categoryModel) {
        return categoryRepository.findById(id)
                .map(category -> {
                    category.setDescription(categoryModel.getDescription());
                    category.setName(category.getName());
                    category.setColor(category.getColor());
                    category.setUpdated_at(GenerateTime.getCurentTimeStamp());
                    return categoryRepository.save(category);
                }).orElseGet(() -> {
                    return categoryRepository.save(categoryModel);
                });
    }
}
