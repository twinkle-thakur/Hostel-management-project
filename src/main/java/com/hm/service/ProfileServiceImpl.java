package com.hm.service;

import com.hm.dto.Profile;
import com.hm.repository.ProfileRepository;
import com.hm.repository.ProfileRepositoryImpl;

public class ProfileServiceImpl implements ProfileService {
    private ProfileRepository repo = new ProfileRepositoryImpl();

    public Profile getProfile(String enrollmentNumber) {
        return repo.fetchProfile(enrollmentNumber);
    }
}