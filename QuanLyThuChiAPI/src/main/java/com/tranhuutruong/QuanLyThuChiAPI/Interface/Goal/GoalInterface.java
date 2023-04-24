package com.tranhuutruong.QuanLyThuChiAPI.Interface.Goal;

import com.tranhuutruong.QuanLyThuChiAPI.Model.Goal.GoalModel;
import com.tranhuutruong.QuanLyThuChiAPI.Request.Goal.DepositRequest;
import com.tranhuutruong.QuanLyThuChiAPI.Request.Goal.GoalRequest;
import com.tranhuutruong.QuanLyThuChiAPI.Request.Goal.UpdateGoalRequest;
import com.tranhuutruong.QuanLyThuChiAPI.Response.Api.ApiResponse;

import java.text.ParseException;

public interface GoalInterface {
    public ApiResponse<Object> getAllGoals(String username);
    public ApiResponse<Object> addGoal(String username, GoalRequest goalRequest) throws ParseException;
    public ApiResponse<Object> deleteGoal(String username, Long idGoal);
    public ApiResponse<Object> updateGoal(String username, UpdateGoalRequest updateGoalRequest, Long idGoal);

    public ApiResponse<Object> updateDeposit(String username, DepositRequest depositRequest, Long idGoal);
}
