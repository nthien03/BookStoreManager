package com.example.BookStoreManager.service;

import java.util.Optional;

import org.springframework.stereotype.Service;

@Service
public class PaginationService {
    public int getPage(Optional<String> pageIn) {
        int page = 1;
        try {
            if (pageIn.isPresent()) {
                page = Integer.parseInt(pageIn.get());
            }
        } catch (Exception e) {
        }
        return page;
    }
}
