package com.example.BookStoreManager.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.BookStoreManager.domain.Category;
import com.example.BookStoreManager.repository.CategoryRepository;

@Service
public class CategoryService {
    private final CategoryRepository categoryRepository;

    public CategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    public List<Category> getAll() {
        return this.categoryRepository.findAll();
    }

}
