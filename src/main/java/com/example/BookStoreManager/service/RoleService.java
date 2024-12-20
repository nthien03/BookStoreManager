package com.example.BookStoreManager.service;

import org.springframework.stereotype.Service;

import com.example.BookStoreManager.domain.Role;
import com.example.BookStoreManager.repository.RoleRepository;

@Service
public class RoleService {
    private final RoleRepository roleRepository;

    public RoleService(RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
    }

    public Role getById(long id) {
        return this.roleRepository.findById(id);
    }
}
