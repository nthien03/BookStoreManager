package com.example.BookStoreManager.service;

import java.util.List;

import org.eclipse.tags.shaded.org.apache.regexp.recompile;
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

        return this.bookRepository.save(book);
    }

    public List<Book> getAll() {
        return this.bookRepository.findAll();
    }

    public Book getById(long id) {
        return this.bookRepository.findById(id);
    }

    public Book updateBook(long id, Book book) {
        Book bookInDb = this.bookRepository.findById(id);
        if (bookInDb == null) {
            return null;
        }

        bookInDb.setName(book.getName().trim());
        bookInDb.setPublisher(book.getPublisher().trim());
        bookInDb.setQuantity(book.getQuantity());
        bookInDb.setSalePrice(book.getSalePrice());
        bookInDb.setDescription(book.getDescription().trim());
        bookInDb.setImage(book.getImage());
        bookInDb.setAuthor(book.getAuthor());
        bookInDb.setCategory(book.getCategory());
        bookInDb.setIsDisabled(book.getIsDisabled());

        return this.bookRepository.save(bookInDb);
    }
}
