package com.tranhuutruong.QuanLyThuChiAPI.Response.Category;

import com.tranhuutruong.QuanLyThuChiAPI.Model.Category.CategoryModel;
import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class CategoryResponse {
    private boolean status;

    private String message;

    private CategoryModel categoryModel;
}
