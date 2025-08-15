package com.hm.repository;

import com.hm.dto.Complaint;

public interface ComplaintRepository {
    boolean saveComplaint(Complaint complaint);
}