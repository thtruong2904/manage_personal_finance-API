package com.tranhuutruong.QuanLyThuChiAPI.Service.Notification;

import com.tranhuutruong.QuanLyThuChiAPI.Interface.Notification.NotificationInterface;
import com.tranhuutruong.QuanLyThuChiAPI.Model.Notification.NotificationModel;
import com.tranhuutruong.QuanLyThuChiAPI.Repository.Notification.NotificationRepository;
import com.tranhuutruong.QuanLyThuChiAPI.Response.Api.ApiResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class NotificationService implements NotificationInterface {
    @Autowired
    NotificationRepository notificationRepository;

    @Override
    public ApiResponse<Object> getAllNotificationNotRead(String username)
    {
        List<NotificationModel> listNotifi = notificationRepository.findAllNotRead(username);
        if(listNotifi.size() == 0)
        {
            return ApiResponse.builder().message("Chưa có thông báo mới").status(101).build();
        }
        return ApiResponse.builder().message("Danh sách thông báo").status(200).data(listNotifi).build();
    }

    @Override
    public ApiResponse<Object> updateIsRead(String username, Long idNotifi)
    {
        NotificationModel notificationModel = notificationRepository.findNotifiById(username, idNotifi);
        if(notificationModel == null)
        {
            return ApiResponse.builder().message("Thông báo không tồn tại").status(101).build();
        }
        notificationRepository.delete(notificationModel);
        return ApiResponse.builder().message("Xóa thông báo thành công!").status(200).build();
    }
}
