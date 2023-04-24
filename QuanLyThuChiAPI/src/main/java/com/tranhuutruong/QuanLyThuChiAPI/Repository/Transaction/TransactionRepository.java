package com.tranhuutruong.QuanLyThuChiAPI.Repository.Transaction;

import com.tranhuutruong.QuanLyThuChiAPI.Model.Transaction.TransactionModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;

@Repository
public interface TransactionRepository extends JpaRepository<TransactionModel, Long> {
    @Query("SELECT c FROM TransactionModel c JOIN c.userInfoModel u JOIN u.accountModel a WHERE a.username = :username AND c.type = :type")
    List<TransactionModel> findAllByUserInfoModel_AccountModel_UsernameaAndAndType(@Param("username") String username, @Param("type") Long type);
    @Query("SELECT t FROM TransactionModel t WHERE t.userInfoModel.accountModel.username = :username AND t.transactiondate = :date")
    List<TransactionModel> findAllByDateAndUsername(@Param("username") String username, @Param("date") Date date);
    @Query("SELECT c FROM TransactionModel c JOIN c.userInfoModel u JOIN u.accountModel a WHERE a.username = :username AND c.id = :id")
    TransactionModel findTransactionModelByUserInfoModel_AccountModel_UsernameAndId(@Param("username") String username, @Param("id") Long id);
    @Query("SELECT SUM(t.amount) FROM TransactionModel t WHERE t.type = 2 AND t.userInfoModel.accountModel.username = :username AND t.transactiondate = :date")
    Long getTotalExpenseByDateAndUsername(@Param("username") String username, @Param("date") Date date);

    @Query("SELECT SUM(t.amount) FROM TransactionModel t WHERE t.type = 1 AND t.userInfoModel.accountModel.username = :username AND t.transactiondate = :date")
    Long getTotalIncomeByDateAndUsername(@Param("username") String username, @Param("date") Date date);

    @Query("SELECT SUM(t.amount) FROM TransactionModel t WHERE t.type = 1 AND t.userInfoModel.accountModel.username = :username AND t.transactiondate BETWEEN :startDate AND :endDate")
    Long getTotalIncomeByMonthAndUsername(@Param("username") String username, @Param("startDate") Date startDate, @Param("endDate") Date endDate);

    @Query("SELECT SUM(t.amount) FROM TransactionModel t WHERE t.type = 2 AND t.userInfoModel.accountModel.username = :username AND t.transactiondate BETWEEN :startDate AND :endDate")
    Long getTotalExpenseByMonthAndUsername(@Param("username") String username, @Param("startDate") Date startDate, @Param("endDate") Date endDate);
    @Query("SELECT t FROM TransactionModel t WHERE t.userInfoModel.accountModel.username = :username AND t.categoryModel.id = :categoryId")
    List<TransactionModel> findAllByCategoryModel_Id(@Param("username") String username, @Param("categoryId") Long categoryId);

    @Query("SELECT t FROM TransactionModel t WHERE t.userInfoModel.accountModel.username = :username AND t.transactiondate BETWEEN :startDate AND :endDate")
    List<TransactionModel> findAllByUserInfoModel_AccountModel_UsernameAndTransactiondateBetween(@Param("username") String username, @Param("startDate")Date startDate, @Param("endDate") Date endDate);

    @Query("SELECT t FROM TransactionModel t WHERE t.userInfoModel.accountModel.username = :username AND t.categoryModel.id = :idCategory AND t.transactiondate BETWEEN :fromDate AND :toDate")
    List<TransactionModel> findAllByUserInfoModel_AccountModel_UsernameAndCategoryModel_IdAndTransactiondateIsBetween(@Param("username") String username, @Param("idCategory") Long idCategory, @Param("fromDate") Date fromDate, @Param("toDate") Date toDate);

    @Query("SELECT t FROM TransactionModel t WHERE t.userInfoModel.accountModel.username = :username")
    List<TransactionModel> findAllByUsername(@Param("username") String username);
}
