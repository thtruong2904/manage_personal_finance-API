package com.tranhuutruong.QuanLyThuChiAPI.Service.Transaction;

import com.tranhuutruong.QuanLyThuChiAPI.Interface.Transaction.TransactionInterface;
import com.tranhuutruong.QuanLyThuChiAPI.Model.Card.CardModel;
import com.tranhuutruong.QuanLyThuChiAPI.Model.Category.CategoryModel;
import com.tranhuutruong.QuanLyThuChiAPI.Model.Transaction.TransactionModel;
import com.tranhuutruong.QuanLyThuChiAPI.Model.User.AccountModel;
import com.tranhuutruong.QuanLyThuChiAPI.Model.User.UserInfoModel;
import com.tranhuutruong.QuanLyThuChiAPI.Repository.Card.CardRepository;
import com.tranhuutruong.QuanLyThuChiAPI.Repository.Category.CategoryRepository;
import com.tranhuutruong.QuanLyThuChiAPI.Repository.Transaction.TransactionRepository;
import com.tranhuutruong.QuanLyThuChiAPI.Repository.User.AccountRepository;
import com.tranhuutruong.QuanLyThuChiAPI.Repository.User.UserInfoRepository;
import com.tranhuutruong.QuanLyThuChiAPI.Request.Transaction.TransactionRequest;
import com.tranhuutruong.QuanLyThuChiAPI.Request.Transaction.UpdateTransactionRequest;
import com.tranhuutruong.QuanLyThuChiAPI.Response.Api.ApiResponse;
import com.tranhuutruong.QuanLyThuChiAPI.Utils.FormatDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.text.ParseException;
import java.util.Calendar;
import java.util.List;
import java.util.Optional;

@Service
public class TransactionService implements TransactionInterface {

    @Autowired
    TransactionRepository transactionRepository;

    @Autowired
    AccountRepository accountRepository;

    @Autowired
    UserInfoRepository userInfoRepository;

    @Autowired
    CardRepository cardRepository;

    @Autowired
    CategoryRepository categoryRepository;

    @Override
    public ApiResponse<Object> incomeTransaction(String username)
    {
        List<TransactionModel> list =  transactionRepository.findAllByUserInfoModel_AccountModel_UsernameaAndAndType(username, 1L);
        if(list.size() == 0)
        {
            return ApiResponse.builder().message("Không có giao dịch thu").status(101).build();
        }
        return ApiResponse.builder().message("Danh sách giao dịch thu tiền").status(200).data(list).build();
    }

    @Override
    public ApiResponse<Object> expenseTransaction(String username)
    {
        List<TransactionModel> list = transactionRepository.findAllByUserInfoModel_AccountModel_UsernameaAndAndType(username, 2L);
        if(list.size() == 0)
        {
            return ApiResponse.builder().message("Không có giao dịch chi tiêu").status(100).build();
        }
        return ApiResponse.builder().message("Danh sách giao dịch chi tiêu").status(200).data(list).build();
    }

    @Override
    public ApiResponse<Object> addTransaction(String username, Long idCategory,Long idCard, TransactionRequest transactionRequest) throws ParseException {
        AccountModel accountModel = accountRepository.findAccountModelByUsername(username);
        if(accountModel == null || accountModel.getId() <= 0)
            return ApiResponse.builder().message("Account không tồn tại!").status(101).build();
        Optional<UserInfoModel> userInfoModel = Optional.ofNullable(userInfoRepository.findUserInfoModelByAccountModel_Username(username));
        if(!userInfoModel.isPresent())
            return ApiResponse.builder().message("User không tồn tại!").build();
        CategoryModel categoryModel = categoryRepository.findCategoryModelByUserInfoModel_AccountModel_UsernameAndId(username, idCategory);
        if(transactionRequest.getType() != categoryModel.getType())
        {
            return ApiResponse.builder().message("Thể loại của giao dịch và danh mục giao dịch k trùng khớp!").status(101).build();
        }
        CardModel cardModel = cardRepository.findCardModelByUserInfoModel_AccountModel_UsernameAndId(username, idCard);
        if(transactionRequest.getType() == 2)
        {
            if(transactionRequest.getAmount() > cardModel.getBalance()) {
                return ApiResponse.builder().message("Số tiền trong thẻ không đủ để thực hiện giao dịch").status(101).build();
            }
            else
            {
                cardModel.setBalance(cardModel.getBalance() - transactionRequest.getAmount());
                cardRepository.save(cardModel);
            }
        }
        else
        {
            cardModel.setBalance(cardModel.getBalance() + transactionRequest.getAmount());
            cardRepository.save(cardModel);
        }

        TransactionModel transactionModel = TransactionModel.builder()
                            .userInfoModel(userInfoModel.get())
                            .categoryModel(categoryModel)
                            .cardModel(cardModel)
                            .name(transactionRequest.getName())
                            .amount(transactionRequest.getAmount())
                .location(transactionRequest.getLocation())
                .transactiondate(FormatDate.formatDateMySql(transactionRequest.getTransactiondate()))
                .type(transactionRequest.getType())
                .description(transactionRequest.getDescription()).build();
        transactionRepository.save(transactionModel);
        return ApiResponse.builder().message("Tạo giao dịch thành công!").status(200).build();
    }

    @Override
    public ApiResponse<Object> updateTransaction(String username,Long idCategory,Long idTransaction, UpdateTransactionRequest updateTransactionRequest) throws ParseException {
        TransactionModel transactionModel = transactionRepository.findTransactionModelByUserInfoModel_AccountModel_UsernameAndId(username, idTransaction);
        if(transactionModel == null || transactionModel.getId() <= 0)
        {
            return ApiResponse.builder().message("Không thể sửa giao dịch!").status(101).build();
        }
        CategoryModel newCategory = categoryRepository.findCategoryModelByUserInfoModel_AccountModel_UsernameAndId(username,idCategory);
        if(newCategory.getType() != transactionModel.getType())
        {
            return ApiResponse.builder().message("Thể loại của danh mục không phù hợp với thể loại của giao dịch!").status(101).build();
        }

        transactionModel.setCategoryModel(newCategory);
        transactionModel.setName(updateTransactionRequest.getName());
        CardModel cardModel = transactionModel.getCardModel();
        if(transactionModel.getType() == 2)
        {
            if(transactionModel.getAmount() == updateTransactionRequest.getAmount()) {
                transactionModel.setAmount(updateTransactionRequest.getAmount());
            }
            else if(updateTransactionRequest.getAmount() > transactionModel.getAmount())
            {
                if((updateTransactionRequest.getAmount() - transactionModel.getAmount()) > transactionModel.getCardModel().getBalance())
                {
                    return ApiResponse.builder().message("Số tiền còn lại trong thẻ không đủ để chi trả cho giao dịch").status(101).build();
                }
                else{
                    cardModel.setBalance(cardModel.getBalance() - (updateTransactionRequest.getAmount() - transactionModel.getAmount()));
                    transactionModel.setAmount(updateTransactionRequest.getAmount());
                    cardRepository.save(cardModel);
                }
            }
            else
            {
                cardModel.setBalance(cardModel.getBalance() + (transactionModel.getAmount() - updateTransactionRequest.getAmount()));
                transactionModel.setAmount(updateTransactionRequest.getAmount());
                cardRepository.save(cardModel);
            }
        }
        else
        {
            if(transactionModel.getAmount() == updateTransactionRequest.getAmount()) {
                transactionModel.setAmount(updateTransactionRequest.getAmount());
            }
            else if(updateTransactionRequest.getAmount() > transactionModel.getAmount())
            {
                cardModel.setBalance(cardModel.getBalance() + (updateTransactionRequest.getAmount() - transactionModel.getAmount()));
                transactionModel.setAmount(updateTransactionRequest.getAmount());
                cardRepository.save(cardModel);
            }
            else
            {
                cardModel.setBalance(cardModel.getBalance() - (transactionModel.getAmount() - updateTransactionRequest.getAmount()));
                transactionModel.setAmount(updateTransactionRequest.getAmount());
                cardRepository.save(cardModel);
            }
        }
        transactionModel.setLocation(updateTransactionRequest.getLocation());
        transactionModel.setTransactiondate(FormatDate.formatDateMySql(updateTransactionRequest.getTransactiondate()));
        transactionModel.setDescription(updateTransactionRequest.getDescription());
        transactionRepository.save(transactionModel);
        return ApiResponse.builder().message("Sửa giao dịch thành công").status(200).build();
    }

    @Override
    public ApiResponse<Object> deleteTransaction(String username, Long idTransaction)
    {
        TransactionModel transactionModel = transactionRepository.findTransactionModelByUserInfoModel_AccountModel_UsernameAndId(username, idTransaction);
        if(transactionModel == null || transactionModel.getId() <= 0)
        {
            return ApiResponse.builder().message("Không tìm thấy giao dịch").build();
        }
        transactionRepository.delete(transactionModel);
        return ApiResponse.builder().message("Xóa giao dịch thành công!").status(200).build();
    }

    // lấy danh sách các giao dịch trong ngày hôm nay
    @Override
    public ApiResponse<Object> getAllTransactionInDayCurrent(String username){
        Date current = new Date(System.currentTimeMillis());
        List<TransactionModel> list = transactionRepository.findAllByDateAndUsername(username, current);
        if(list.size() == 0)
        {
            return ApiResponse.builder().message("Không có giao dịch trong ngày").status(101).build();
        }
        return ApiResponse.builder().message("Danh sách giao dịch trong ngày").status(200).data(list).build();
    }

    // lấy tổng tiên thu về trong hôm nay
    @Override
    public ApiResponse<Object> getTotalIncomeToday(String username)
    {
        Date current = new Date(System.currentTimeMillis());
        Long total = transactionRepository.getTotalIncomeByDateAndUsername(username, current);
        if(total == null)
        {
            return ApiResponse.builder().message("Không có giao dịch thu về trong ngày").status(101).build();
        }
        return ApiResponse.builder().message("Tổng tiền thu trong ngày").status(200).data(total).build();
    }

    // lấy tổng tiền chi tiêu trong hôm nay
    @Override
    public ApiResponse<Object> getTotalExpenseToday(String username)
    {
        Date current = new Date(System.currentTimeMillis());
        Long total = transactionRepository.getTotalExpenseByDateAndUsername(username, current);
        if(total == null)
        {
            return ApiResponse.builder().message("Không có giao dịch chi tiêu trong ngày").status(101).build();
        }
        return ApiResponse.builder().message("Tổng tiền chi tiêu trong ngày").status(200).data(total).build();
    }

    // lấy danh sách các giao dịch trong tuần
    @Override
    public ApiResponse<Object> getAllInWeek(String usename)
    {
        // lấy ngày bắt đầu tuần
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.DAY_OF_WEEK, cal.getFirstDayOfWeek()+1);
        Date starWeek = new Date(cal.getTimeInMillis());

        // lấy ngày kết thúc tuần
        cal.add(Calendar.DAY_OF_MONTH, 6);
        Date endWeek = new Date(cal.getTimeInMillis());

        List<TransactionModel> list =  transactionRepository.findAllByUserInfoModel_AccountModel_UsernameAndTransactiondateBetween(usename, starWeek, endWeek);

        if(list.size() == 0)
        {
            return ApiResponse.builder().message("Không có giao dịch trong tuần").status(101).build();
        }
        return ApiResponse.builder().message("Danh sách các giao dịch trong tuần").status(200).data(list).build();
    }

    // lấy tổng tiền thu về của các giao dịch trong tuần hiện tại
    @Override
    public ApiResponse<Object> getTotalIncomeByWeek(String username)
    {
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.DAY_OF_WEEK, cal.getFirstDayOfWeek()+1);
        Date starWeek = new Date(cal.getTimeInMillis());

        // lấy ngày kết thúc tuần
        cal.add(Calendar.DAY_OF_MONTH, 6);
        Date endWeek = new Date(cal.getTimeInMillis());

        Long total = transactionRepository.getTotalIncomeByMonthAndUsername(username, starWeek, endWeek);
        if(total == null)
        {
            return ApiResponse.builder().message("Không có giao dịch thu về trong tuần!").status(101).build();
        }
        return ApiResponse.builder().message("Tổng tiền thu trong tuần").data(total).status(200).build();
    }

    // lấy tổng tiền chi tiêu của các giao dịch trong tuần hiện tại
    @Override
    public ApiResponse<Object> getTotalExpenseByWeek(String username)
    {
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.DAY_OF_WEEK, cal.getFirstDayOfWeek()+1);
        Date starWeek = new Date(cal.getTimeInMillis());

        // lấy ngày kết thúc tuần
        cal.add(Calendar.DAY_OF_MONTH, 6);
        Date endWeek = new Date(cal.getTimeInMillis());

        Long total = transactionRepository.getTotalExpenseByMonthAndUsername(username, starWeek, endWeek);
        if(total == null)
        {
            return ApiResponse.builder().message("Không có giao dịch chi tiêu trong tuần").status(101).build();
        }
        return ApiResponse.builder().message("Tổng tiền chi tiêu trong tuần").data(total).status(200).build();
    }

    // lấy danh sách các giao dịch trong tháng hiện tại
    @Override
    public ApiResponse<Object> getAllTransactionInCurrentMonth(String username)
    {
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.DATE, 1);
        Date fromDate = new Date(cal.getTimeInMillis());
        cal.set(Calendar.DATE, cal.getActualMaximum(Calendar.DATE));
        Date toDate = new Date(cal.getTimeInMillis());

        List<TransactionModel> list = transactionRepository.findAllByUserInfoModel_AccountModel_UsernameAndTransactiondateBetween(username, fromDate, toDate);
        if(list.size() == 0)
        {
            return ApiResponse.builder().message("Không có giao dịch trong tháng!").status(101).build();
        }
        return ApiResponse.builder().message("Danh sách các giao dịch trong tháng").status(200).data(list).build();
    }

    // lấy tổng tiền giao dịch thu về trong tháng hiện tại
    @Override
    public ApiResponse<Object> getTotalIncomeInCurrentMonth(String username)
    {
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.DATE, 1);
        Date fromDate = new Date(cal.getTimeInMillis());
        cal.set(Calendar.DATE, cal.getActualMaximum(Calendar.DATE));
        Date toDate = new Date(cal.getTimeInMillis());

        Long totalIncomeByMonth = transactionRepository.getTotalIncomeByMonthAndUsername(username, fromDate, toDate);
        if(totalIncomeByMonth == null)
        {
            return ApiResponse.builder().message("Không có giao dịch thu nhập trong tháng").status(101).build();
        }
        return ApiResponse.builder().message("Tổng tiền thu nhập trong tháng").status(200).data(totalIncomeByMonth).build();
    }

    // lấy tổng tiền giao dịch chi tiêu trong tháng hiện tại
    @Override
    public ApiResponse<Object> getTotalExpenseInCurrentMonth(String username)
    {
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.DATE, 1);
        Date fromDate = new Date(cal.getTimeInMillis());
        cal.set(Calendar.DATE, cal.getActualMaximum(Calendar.DATE));
        Date toDate = new Date(cal.getTimeInMillis());

        Long totalIncomeByMonth = transactionRepository.getTotalExpenseByMonthAndUsername(username, fromDate, toDate);
        if(totalIncomeByMonth == null)
        {
            return ApiResponse.builder().message("Không có giao dịch thu chi tiêu trong tháng").status(101).build();
        }
        return ApiResponse.builder().message("Tổng tiền chi tiêu trong tháng").status(200).data(totalIncomeByMonth).build();
    }


    // lấy ra tổng tiền thu nhập của tháng trước
    @Override
    public ApiResponse<Object> getTotalIncomeInPreviousMonth(String username)
    {
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.MONTH, -1);
        cal.set(Calendar.DATE, 1);
        Date fromDate = new Date(cal.getTimeInMillis());

        // lấy ngày cuối cùng của tháng trước
        cal.set(Calendar.DATE, cal.getActualMaximum(Calendar.DATE));
        Date toDate = new Date(cal.getTimeInMillis());

        Long total = transactionRepository.getTotalIncomeByMonthAndUsername(username, fromDate, toDate);
        if(total==null)
        {
            return ApiResponse.builder().message("Không có giao dịch thu về trong tháng trước").status(101).build();
        }
        return ApiResponse.builder().message("Tông tiền thu về trong tháng trước").status(200).data(total).build();
    }

    // lấy tổng tiền chi tiêu trong tháng trước
    @Override
    public ApiResponse<Object> getTotalExpenseInPreviousMonth(String username)
    {
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.MONTH, -1);
        cal.set(Calendar.DATE, 1);
        Date fromDate = new Date(cal.getTimeInMillis());

        // lấy ngày cuối cùng của tháng trước
        cal.set(Calendar.DATE, cal.getActualMaximum(Calendar.DATE));
        Date toDate = new Date(cal.getTimeInMillis());

        Long total = transactionRepository.getTotalExpenseByMonthAndUsername(username, fromDate, toDate);
        if(total==null)
        {
            return ApiResponse.builder().message("Không có giao dịch chi tiêu trong tháng trước").status(101).build();
        }
        return ApiResponse.builder().message("Tổng tiền chi tiêu trong tháng trước").status(200).data(total).build();
    }

    // ============================
    // lấy danh sách các giao dịch trong 1 ngày bất kì mà người dùng chọn
    @Override
    public ApiResponse<Object> getAllTransactionInDay(String username, Date date){
        List<TransactionModel> allInDay = transactionRepository.findAllByDateAndUsername(username, date);
        if(allInDay.size() == 0)
        {
            return ApiResponse.builder().message("Không có giao dịch trong ngày").status(101).build();
        }
        return ApiResponse.builder().message("Danh sách các giao dịch trong ngày").status(200).data(allInDay).build();
    }
    // lấy chi tiết 1 giao dịch
    @Override
    public TransactionModel getTransaction(String username, Long idTransaction)
    {
        return transactionRepository.findTransactionModelByUserInfoModel_AccountModel_UsernameAndId(username, idTransaction);
    }

    // lấy tổng tiền chi tiêu trong ngày
    @Override
    public ApiResponse<Object> getTransactionExpenseByDate(String username, Date date) {
        Long total =  transactionRepository.getTotalExpenseByDateAndUsername(username, date);
        if(total == null)
        {
            return ApiResponse.builder().message("Chưa có giao dịch chi tiêu trong ngày!").status(101).build();
        }
        return ApiResponse.builder().message("Tổng tiền chi trong ngày").status(200).data(total).build();
    }

    // lấy tổng tiền thu về trong ngày
    @Override
    public ApiResponse<Object> getTransactionIncomeByDate(String username, Date date){
        Long totalincomebydate = transactionRepository.getTotalIncomeByDateAndUsername(username, date);

        if(totalincomebydate == null)
        {
            return ApiResponse.builder().message("Chưa có giao dịch thu về trong ngày!").status(101).build();
        }
        return ApiResponse.builder().message("Tổng tiền thu trong ngày").status(200).data(totalincomebydate).build();
    }

    // lấy danh sách giao dịch theo danh mục
    @Override
    public List<TransactionModel> getAllByCategory(String username, Long categoryId)
    {
        return transactionRepository.findAllByCategoryModel_Id(username,categoryId);
    }


    // lấy danh sách các giao dịch theo khoảng thời gian
    @Override
    public ApiResponse<Object> getTransactionFromTo(String username, Date from, Date to)
    {
        if(from.compareTo(to) > 0)
        {
            return ApiResponse.builder().message("Ngày bắt đầu phải nhỏ hơn ngày kết thúc").status(101).build();
        }
        List<TransactionModel> transactionModels = transactionRepository.findAllByUserInfoModel_AccountModel_UsernameAndTransactiondateBetween(username, from, to);
        if(transactionModels.size() == 0)
        {
            return ApiResponse.builder().message("Chưa có giao dịch trong khoảng thời gian này!").status(101).build();
        }
        return ApiResponse.builder().message("Danh sách các giao dịch").status(200).data(transactionModels).build();
    }

    // lấy danh sách giao dịch trong 1 tháng mà người dùng chọn dựa vào danh mục
    @Override
    public ApiResponse<Object> getTransactionInMonthByCategory(String username, Long idCategory,int year, int month)
    {
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.YEAR, year);
        cal.set(Calendar.MONTH, month - 1);
        cal.set(Calendar.DATE, 1);
        Date fromDate = new Date(cal.getTimeInMillis());
        cal.set(Calendar.DATE, cal.getActualMaximum(Calendar.DATE));
        Date toDate = new Date(cal.getTimeInMillis());

        List<TransactionModel> transactionModels = transactionRepository.findAllByUserInfoModel_AccountModel_UsernameAndCategoryModel_IdAndTransactiondateIsBetween(username, idCategory, fromDate, toDate);
        if(transactionModels.size() == 0)
        {
            return ApiResponse.builder().message("Không có giao dịch loại danh mục chi tiêu bạn yêu cầu trong tháng!").status(101).build();
        }
        return ApiResponse.builder().message("Danh sách các giao dịch theo danh mục trong tháng").status(200).data(transactionModels).build();
    }



    // lấy tổng tiền thu về của các giao dịch trong 1 tháng của 1 năm nào đó do người dùng chọn
    @Override
    public ApiResponse<Object> getTotalIncomeByMonth(String username, int year, int month)
    {
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.YEAR, year);
        cal.set(Calendar.MONTH, month - 1);
        cal.set(Calendar.DATE, 1);
        Date fromDate = new Date(cal.getTimeInMillis());
        cal.set(Calendar.DATE, cal.getActualMaximum(Calendar.DATE));
        Date toDate = new Date(cal.getTimeInMillis());

        Long totalIncomeByMonth = transactionRepository.getTotalIncomeByMonthAndUsername(username, fromDate, toDate);
        if(totalIncomeByMonth == null)
        {
            return ApiResponse.builder().message("Không có giao dịch thu về trong tháng").status(101).build();
        }
        return ApiResponse.builder().message("Tổng tiền thu về trong tháng").status(200).data(totalIncomeByMonth).build();
    }

    // lấy tổng tiền chi tiêu của các giao dịch trong 1 tháng của 1 năm nào đó do người dùng chọn
    @Override
    public ApiResponse<Object> getTotalExpenseByMonth(String username, int year, int month)
    {
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.YEAR, year);
        cal.set(Calendar.MONTH, month - 1);
        cal.set(Calendar.DATE, 1);
        Date fromDate = new Date(cal.getTimeInMillis());
        cal.set(Calendar.DATE, cal.getActualMaximum(Calendar.DATE));
        Date toDate = new Date(cal.getTimeInMillis());

        Long totalExpense = transactionRepository.getTotalExpenseByMonthAndUsername(username, fromDate, toDate);
        if(totalExpense == null)
        {
            return ApiResponse.builder().message("Không có giao dịch chi tiêu trong tháng").status(101).build();
        }
        return ApiResponse.builder().message("Tổng tiền chi tiêu trong tháng").status(200).data(totalExpense).build();
    }

}
