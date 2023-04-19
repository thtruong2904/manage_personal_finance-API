package com.tranhuutruong.QuanLyThuChiAPI.Interface.Category;

import com.tranhuutruong.QuanLyThuChiAPI.Model.Category.CategoryModel;
import com.tranhuutruong.QuanLyThuChiAPI.Request.Category.CategoryRequest;
import com.tranhuutruong.QuanLyThuChiAPI.Request.Category.UpdateCategoryRequest;
import com.tranhuutruong.QuanLyThuChiAPI.Response.Api.ApiResponse;

import java.util.List;
import java.util.Map;

public interface CategoryInterface {
    public ApiResponse<Object> addCategory(String username, CategoryRequest categoryRequest);

    public ApiResponse<Object> updateCategory(String username, CategoryRequest categoryRequest, Long idCategory);
    public CategoryModel getCategory(String username, Long categoryId);
    public Iterable<CategoryModel> getAllCategory(String username);
    public List<CategoryModel> expenseCategory(String username);

    public ApiResponse<Object> deleteCategory(String username, Long categoryId);
    public List<CategoryModel> imcomeCategory(String username);
}
