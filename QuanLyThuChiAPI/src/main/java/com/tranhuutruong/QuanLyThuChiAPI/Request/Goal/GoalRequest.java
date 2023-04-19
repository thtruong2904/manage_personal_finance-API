package com.tranhuutruong.QuanLyThuChiAPI.Request.Goal;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class GoalRequest {
    private String name;

    private Long balance;

    private Long amount;

    private Long deposit;

    private String deadline;
}
