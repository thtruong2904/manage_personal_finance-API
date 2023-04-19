package com.tranhuutruong.QuanLyThuChiAPI.Interface.Card;

import com.tranhuutruong.QuanLyThuChiAPI.Model.Card.CardModel;
import com.tranhuutruong.QuanLyThuChiAPI.Model.Category.CategoryModel;
import com.tranhuutruong.QuanLyThuChiAPI.Model.Transaction.TransactionModel;
import com.tranhuutruong.QuanLyThuChiAPI.Request.Card.CardRequest;
import com.tranhuutruong.QuanLyThuChiAPI.Response.Api.ApiResponse;

import java.util.List;

public interface CardInterface {
    public CardModel getCard(String username, Long cardId);
    public Iterable<CardModel> getAllCard(String username);
    public ApiResponse<Object> updateCard(String username, CardRequest cardRequest, Long idCard);
    public ApiResponse<Object> addCard(String username, CardRequest cardRequest);

    public ApiResponse<Object> deleteCard(String username, Long idCard);
    public List<TransactionModel> getTransactionByCard(String username, Long idCard);
}
