package com.hm.service;

import java.util.List;
import com.hm.dto.Notification;

public interface NotificationService {
    boolean sendNotification(String message);
    List<Notification> getNotifications();
}
