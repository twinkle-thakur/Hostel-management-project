package com.hm.repository;

import com.hm.dto.Complaint;
import com.hm.jdbc.utils.JdbcUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ComplaintRepositoryImpl implements ComplaintRepository {
    public boolean saveComplaint(Complaint complaint) {
        boolean success = false;

        try (Connection conn = JdbcUtils.getMysqlConnection()) {
            String query = "INSERT INTO complaint (type, description) VALUES (?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, complaint.getType());
            ps.setString(2, complaint.getDescription());

            success = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }
}