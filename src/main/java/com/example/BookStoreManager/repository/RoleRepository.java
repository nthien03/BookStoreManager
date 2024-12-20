package com.example.BookStoreManager.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.BookStoreManager.domain.Role;

@Repository
public interface RoleRepository extends JpaRepository<Role, Long> {

    Role findById(long id);
}
