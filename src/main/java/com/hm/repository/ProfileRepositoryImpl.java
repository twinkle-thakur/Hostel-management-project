package com.hm.repository;

import com.hm.dto.Profile;
import com.hm.jdbc.utils.JdbcUtils;

import java.sql.*;

public class ProfileRepositoryImpl implements ProfileRepository {
    public Profile fetchProfile(String enrollmentNumber) {
        Profile profile = null;

        try (Connection conn = JdbcUtils.getMysqlConnection()) {
            String query = "SELECT * FROM student WHERE enrollment_no = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, enrollmentNumber);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                profile = new Profile();
                profile.setEnrollmentNumber(rs.getString("enrollment_no"));
                profile.setName(rs.getString("name"));
                profile.setEmail(rs.getString("email"));
                profile.setBranch(rs.getString("branch"));
                profile.setYear(rs.getString("year"));
                profile.setDob(rs.getString("dob"));
                profile.setBloodGroup(rs.getString("blood_group"));
                profile.setMobileNo(rs.getString("mobile_no"));
                profile.setFatherName(rs.getString("father_name"));
                profile.setFatherMobile(rs.getString("father_mobile"));
                profile.setRoomId(rs.getString("room_id"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return profile;
    }
}