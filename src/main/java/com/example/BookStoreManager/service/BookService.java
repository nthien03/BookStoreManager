package com.example.BookStoreManager.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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

        if (book.getName() != null) {
            book.setName(book.getName().trim());
        }
        if (book.getPublisher() != null) {
            book.setPublisher(book.getPublisher().trim());
        }
        if (book.getDescription() != null) {
            book.setDescription(book.getDescription().trim());
        }

        if (this.bookRepository.existsByNameAndAuthorAndPublisher(book.getName(), book.getAuthor(),
                book.getPublisher())) {
            throw new IllegalArgumentException("Sách có tên, tác giả và nhà xuất bản như này đã tồn tại.");
        }
        return this.bookRepository.save(book);
    }

    public Page<Book> getAll(Pageable pageable) {
        return this.bookRepository.findAll(pageable);
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
