package com.tranhuutruong.QuanLyThuChiAPI.Request.Transaction;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class UpdateTransactionRequest {
    private String name;

    private Long amount;

    private String location;

    private String transactiondate;
    private String description;
}
