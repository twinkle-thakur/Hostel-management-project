package com.hm.service;

import java.util.List;
import com.hm.dto.Notification;
import com.hm.repository.NotificationRepository;

public class NotificationServiceImpl implements NotificationService {

    private NotificationRepository repo = new NotificationRepository();

    @Override
    public boolean sendNotification(String message) {
        return repo.saveNotification(message);
    }

    @Override
    public List<Notification> getNotifications() {
        return repo.getAllNotifications();
    }
}
