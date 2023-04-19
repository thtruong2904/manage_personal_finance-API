package com.tranhuutruong.QuanLyThuChiAPI.Request.Goal;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class UpdateGoalRequest {
    private String name;

    private Long balance;

    private Long amount;

    private String deadline;
}
