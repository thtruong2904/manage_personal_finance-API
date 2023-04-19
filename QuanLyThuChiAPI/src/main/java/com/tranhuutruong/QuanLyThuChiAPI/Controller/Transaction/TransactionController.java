package com.tranhuutruong.QuanLyThuChiAPI.Controller.Transaction;

import com.tranhuutruong.QuanLyThuChiAPI.Model.Transaction.TransactionModel;
import com.tranhuutruong.QuanLyThuChiAPI.Request.Transaction.TransactionRequest;
import com.tranhuutruong.QuanLyThuChiAPI.Request.Transaction.UpdateTransactionRequest;
import com.tranhuutruong.QuanLyThuChiAPI.Response.Api.ApiResponse;
import com.tranhuutruong.QuanLyThuChiAPI.Service.Transaction.TransactionService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Mono;

import java.security.Principal;
import java.sql.Date;
import java.text.ParseException;
import java.util.List;

@Slf4j
@RestController
@RequestMapping(value = "/api/transaction")
public class TransactionController {

    @Autowired
    private TransactionService transactionService;

    @GetMapping(value = "/{id}")
    public Mono<TransactionModel> getTransaction(Principal principal, @PathVariable("id") Long idTransaction)
    {
        return Mono.just(transactionService.getTransaction(principal.getName(), idTransaction));
    }
    @GetMapping(value = "/income")
    public Mono<ApiResponse<Object>> incomeTransaction(Principal principal)
    {
        return Mono.just(transactionService.incomeTransaction(principal.getName()));
    }
    @GetMapping(value = "/expense")
    public Mono<ApiResponse<Object>> expenseTransaction(Principal principal)
    {
        return Mono.just(transactionService.expenseTransaction(principal.getName()));
    }

    @Transactional
    @PostMapping(value = "/add/{idCategory}/{idCard}")
    public Mono<ApiResponse<Object>> addTransaction(Principal principal, @PathVariable("idCategory") Long idCategory, @PathVariable("idCard") Long idCard, @RequestBody TransactionRequest transactionRequest) throws ParseException {
        return Mono.just(transactionService.addTransaction(principal.getName(), idCategory, idCard, transactionRequest));
    }

    @PutMapping(value = "/update/{idCategory}/{idTransaction}")
    public Mono<ApiResponse<Object>> updateTransaction(Principal principal, @PathVariable("idCategory") Long idCategory, @PathVariable("idTransaction") Long idTransaction,@RequestBody UpdateTransactionRequest updateTransactionRequest) throws ParseException {
        return Mono.just(transactionService.updateTransaction(principal.getName(), idCategory, idTransaction, updateTransactionRequest));
    }

    @DeleteMapping(value = "/delete/{id}")
    public Mono<ApiResponse<Object>> deleteTransaction(Principal principal, @PathVariable("id") Long id)
    {
        return Mono.just(transactionService.deleteTransaction(principal.getName(), id));
    }

    // theo ngày
    @GetMapping(value = "/alltransactionintoday")
    public ApiResponse<Object> getAllTransactionToday(Principal principal)
    {
        return transactionService.getAllTransactionInDayCurrent(principal.getName());
    }

    @GetMapping(value = "/gettotalincometoday")
    public ApiResponse<Object> getTotalIncomeToday(Principal principal)
    {
        return transactionService.getTotalIncomeToday(principal.getName());
    }

    @GetMapping(value = "/gettotalexpensetoday")
    public ApiResponse<Object> getTotalExpenseToday(Principal principal)
    {
        return transactionService.getTotalExpenseToday(principal.getName());
    }


    // theo tuần
    @GetMapping(value = "/allofweek")
    public Mono<ApiResponse<Object>> getAllOfWeek(Principal principal)
    {
        return Mono.just(transactionService.getAllInWeek(principal.getName()));
    }

    @GetMapping(value = "/totalincomebyweek")
    public ApiResponse<Object> getTotalIncomeByWeek(Principal principal)
    {
        return transactionService.getTotalIncomeByWeek(principal.getName());
    }

    @GetMapping(value = "/totalexpensebyweek")
    public ApiResponse<Object> getTotalExpenseByWeek(Principal principal)
    {
        return transactionService.getTotalExpenseByWeek(principal.getName());
    }

    // theo tháng
    @GetMapping(value = "/allincurrentmonth")
    public ApiResponse<Object> getAllTransactionInCurrentMonth(Principal principal)
    {
        return transactionService.getAllTransactionInCurrentMonth(principal.getName());
    }

    @GetMapping(value = "/totalincome/currentmonth")
    public ApiResponse<Object> getTotalIncomeByCurrentMonth(Principal principal)
    {
        return transactionService.getTotalIncomeInCurrentMonth(principal.getName());
    }

    @GetMapping(value = "/totalexpense/currentmonth")
    public ApiResponse<Object> getTotalIncByCurrentMonth(Principal principal)
    {
        return transactionService.getTotalExpenseInCurrentMonth(principal.getName());
    }

    @GetMapping(value = "/totalincome/previousmonth")
    public ApiResponse<Object> getTotalIncomeInPreviousMonth(Principal principal)
    {
        return transactionService.getTotalIncomeInPreviousMonth(principal.getName());
    }

    @GetMapping(value = "/totalexpense/previousmonth")
    public ApiResponse<Object> getTotalExpenseInPreviousMonth(Principal principal)
    {
        return transactionService.getTotalExpenseInPreviousMonth(principal.getName());
    }

    // ====================
    @GetMapping(value = "/totalexpensebydate/{date}")
    public ApiResponse<Object> totalexpensebydate(Principal principal, @PathVariable("date") Date date){
        return transactionService.getTransactionExpenseByDate(principal.getName(), date);
    }

    @GetMapping(value = "/totalincomebydate/{date}")
    public ApiResponse<Object> totalincomdebydate(Principal principal, @PathVariable("date") Date date) {
        return transactionService.getTransactionIncomeByDate(principal.getName(), date);
    }

    @GetMapping(value = "/category/{idCategory}")
    public Mono<List<TransactionModel>> getAllByCategory(Principal principal, @PathVariable("idCategory") Long idCategory)
    {
        return Mono.just(transactionService.getAllByCategory(principal.getName(), idCategory));
    }

    @GetMapping(value = "/form/{date1}/to/{date2}")
    public ApiResponse<Object> getTransactionFromTo(Principal principal, @PathVariable("date1") Date date1, @PathVariable("date2") Date date2)
    {
        return transactionService.getTransactionFromTo(principal.getName(), date1, date2);
    }
    @GetMapping(value = "/bymonth/{idCategory}/{year}/{month}")
    public ApiResponse<Object> getTransactionByMonth(Principal principal, @PathVariable("idCategory") Long idCategory,@PathVariable("year") int year, @PathVariable("month") int month)
    {
        return transactionService.getTransactionInMonthByCategory(principal.getName(), idCategory, year, month);
    }


    @GetMapping(value = "/totalincomebymonth/{year}/{month}")
    public ApiResponse<Object> getTotalIncomeByMonth(Principal principal, @PathVariable("year") int year, @PathVariable("month") int month)
    {
        return transactionService.getTotalIncomeByMonth(principal.getName(), year, month);
    }

    @GetMapping(value = "/totalexpensebymonth/{year}/{month}")
    public ApiResponse<Object> getTotalExpenseByMonth(Principal principal, @PathVariable("year") int year, @PathVariable("month") int month)
    {
        return transactionService.getTotalExpenseByMonth(principal.getName(), year, month);
    }

    @GetMapping(value = "/allinday/{date}")
    public ApiResponse<Object> getAllTransactionInDay(Principal principal, @PathVariable("date") Date date)
    {
        return transactionService.getAllTransactionInDay(principal.getName(), date);
    }

}
