package com.tranhuutruong.QuanLyThuChiAPI.Interface.Transaction;

import com.tranhuutruong.QuanLyThuChiAPI.Model.Transaction.TransactionModel;
import com.tranhuutruong.QuanLyThuChiAPI.Request.Transaction.TransactionRequest;
import com.tranhuutruong.QuanLyThuChiAPI.Request.Transaction.UpdateTransactionRequest;
import com.tranhuutruong.QuanLyThuChiAPI.Response.Api.ApiResponse;

import java.sql.Date;
import java.text.ParseException;
import java.util.List;

public interface TransactionInterface {

    // lấy tất cả giao dịch
    public ApiResponse<Object> getAll(String username);
    // theo ngày
    public ApiResponse<Object> getAllTransactionInDayCurrent(String username);
    public ApiResponse<Object> getTotalIncomeToday(String username);

    public ApiResponse<Object> getTotalExpenseToday(String username);

    // theo tuần
    public ApiResponse<Object> getAllInWeek(String usename);

    public ApiResponse<Object> getTotalIncomeByWeek(String username);

    public ApiResponse<Object> getTotalExpenseByWeek(String username);

    // theo tháng

    public ApiResponse<Object> getAllTransactionInCurrentMonth(String username);
    public ApiResponse<Object> getTotalIncomeInCurrentMonth(String username);

    public ApiResponse<Object> getTotalExpenseInCurrentMonth(String username);

    public ApiResponse<Object> getTotalIncomeInPreviousMonth(String username);

    public ApiResponse<Object> getTotalExpenseInPreviousMonth(String username);

    // ===========
    public ApiResponse<Object> incomeTransaction(String username);
    public ApiResponse<Object> expenseTransaction(String username);


    public ApiResponse<Object> addTransactionIncome(String username, Long idCategory,Long idCard, TransactionRequest transactionRequest);

    public ApiResponse<Object> addTransactionExpense(String username, Long idCategory,Long idCard, TransactionRequest transactionRequest);

    public ApiResponse<Object> updateTransaction(String username,Long idCategory,Long idTransaction, UpdateTransactionRequest updateTransactionRequest);

    public ApiResponse<Object> deleteTransaction(String username, Long idTransaction);

    public TransactionModel getTransaction(String username, Long idTransaction);
    public ApiResponse<Object> getTransactionExpenseByDate(String username, Date date);
    public ApiResponse<Object> getTransactionIncomeByDate(String username, Date date);

    public List<TransactionModel> getAllByCategory(String username, Long categoryId);


    public ApiResponse<Object> getTransactionFromTo(String username, Date from, Date to);

    public ApiResponse<Object> getTransactionInMonthByCategory(String username, Long idCategory,int year, int month);

    public ApiResponse<Object> getTotalIncomeByMonth(String username, int year, int month);

    public ApiResponse<Object> getTotalExpenseByMonth(String username, int year, int month);


    public ApiResponse<Object> getAllTransactionInDay(String username, Date date);


}
