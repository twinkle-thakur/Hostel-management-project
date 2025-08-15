package com.hm.repository;

import com.hm.dto.Profile;

public interface ProfileRepository {
    Profile fetchProfile(String enrollmentNumber);
}