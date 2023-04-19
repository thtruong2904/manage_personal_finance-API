package com.tranhuutruong.QuanLyThuChiAPI.Interface.Notification;

import com.tranhuutruong.QuanLyThuChiAPI.Response.Api.ApiResponse;

public interface NotificationInterface {
    public ApiResponse<Object> getAllNotificationNotRead(String username);

    public ApiResponse<Object> updateIsRead(String username, Long idNotifi);
}
