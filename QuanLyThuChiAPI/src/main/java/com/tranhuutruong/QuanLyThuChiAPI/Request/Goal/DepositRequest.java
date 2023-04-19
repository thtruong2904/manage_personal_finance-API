package com.tranhuutruong.QuanLyThuChiAPI.Request.Goal;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class DepositRequest {
    private Long deposit;
}
