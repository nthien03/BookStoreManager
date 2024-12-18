package com.example.BookStoreManager.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.BookStoreManager.domain.Author;
import com.example.BookStoreManager.repository.AuthorRepository;

@Service
public class AuthorService {

    private final AuthorRepository authorRepository;

    public AuthorService(AuthorRepository authorRepository) {
        this.authorRepository = authorRepository;
    }

    public List<Author> getAll() {
        return this.authorRepository.findAll();
    }
}
