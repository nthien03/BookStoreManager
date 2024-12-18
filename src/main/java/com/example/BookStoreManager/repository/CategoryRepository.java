package com.example.BookStoreManager.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.BookStoreManager.domain.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {

}
