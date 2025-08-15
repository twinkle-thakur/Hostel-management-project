package com.hm.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.hm.dto.Notification;
import com.hm.jdbc.utils.JdbcUtils;


public class NotificationRepository {

    public boolean saveNotification(String message) {
        String sql = "INSERT INTO notifications (message) VALUES (?)";
        try (Connection con = JdbcUtils.getMysqlConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, message);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Notification> getAllNotifications() {
        List<Notification> list = new ArrayList<>();
        String sql = "SELECT * FROM notifications ORDER BY created_at DESC";
        try (Connection con = JdbcUtils.getMysqlConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Notification n = new Notification();
                n.setId(rs.getInt("id"));
                n.setMessage(rs.getString("message"));
                n.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                list.add(n);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
