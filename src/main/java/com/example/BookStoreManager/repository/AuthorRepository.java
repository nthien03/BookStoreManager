package com.example.BookStoreManager.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.BookStoreManager.domain.Author;

@Repository
public interface AuthorRepository extends JpaRepository<Author, Long> {

}
