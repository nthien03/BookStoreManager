package com.example.BookStoreManager.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.BookStoreManager.domain.Book;
import com.example.BookStoreManager.repository.BookRepository;

@Service
public class BookService {
    private final BookRepository bookRepository;

    public BookService(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    public Book createBook(Book book) {
        // Trim các trường trước khi lưu
        if (book.getName() != null) {
            book.setName(book.getName().trim());
        }
        if (book.getPublisher() != null) {
            book.setPublisher(book.getPublisher().trim());
        }
        if (book.getDescription() != null) {
            book.setDescription(book.getDescription().trim());
        }

        return bookRepository.save(book);
    }

    public List<Book> getAll() {
        return this.bookRepository.findAll();
    }
}
