package com.hm.service;

import com.hm.dto.Profile;

public interface ProfileService {
    Profile getProfile(String enrollmentNumber);
}