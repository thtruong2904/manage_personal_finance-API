package com.tranhuutruong.QuanLyThuChiAPI.Controller.Notification;

import com.tranhuutruong.QuanLyThuChiAPI.Response.Api.ApiResponse;
import com.tranhuutruong.QuanLyThuChiAPI.Service.Notification.NotificationService;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

@Slf4j
@SecurityRequirement(name = "bearerAuth")
@RestController
@RequestMapping(value = "/api/notification")
public class NotificationController {
    @Autowired
    private NotificationService notificationService;

    @GetMapping(value = "/all")
    public ApiResponse<Object> getAllNotifi(Principal principal)
    {
        return notificationService.getAllNotificationNotRead(principal.getName());
    }

    @PutMapping(value = "/update/{id}")
    public ApiResponse<Object> updateIsRead(Principal principal, @PathVariable("id") Long id)
    {
        return notificationService.updateIsRead(principal.getName(), id);
    }
}
