package com.example.BookStoreManager.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.BookStoreManager.domain.Author;
import com.example.BookStoreManager.domain.Book;

@Repository
public interface BookRepository extends JpaRepository<Book, Long> {
    Book findById(long id);

    boolean existsByNameAndAuthorAndPublisher(String name, Author author, String publisher);

    Page<Book> findAll(Pageable pageable);
}
