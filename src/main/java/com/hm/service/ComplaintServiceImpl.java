package com.hm.service;

import com.hm.dto.Complaint;
import com.hm.repository.ComplaintRepository;
import com.hm.repository.ComplaintRepositoryImpl;

public class ComplaintServiceImpl implements ComplaintService {
    private ComplaintRepository repo = new ComplaintRepositoryImpl();

    public boolean lodgeComplaint(Complaint complaint) {
        return repo.saveComplaint(complaint);
    }
}