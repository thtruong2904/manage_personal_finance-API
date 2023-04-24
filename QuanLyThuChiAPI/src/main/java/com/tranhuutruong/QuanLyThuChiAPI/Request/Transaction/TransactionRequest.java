package com.tranhuutruong.QuanLyThuChiAPI.Request.Transaction;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class TransactionRequest {
    private String name;

    private Long amount;

    private String location;

    private Long type;

    private String transactiondate;

    private String description;

}
