package com.example.BookStoreManager.controller;

import java.util.List;
import java.util.concurrent.Flow.Publisher;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.BookStoreManager.domain.Author;
import com.example.BookStoreManager.domain.Book;
import com.example.BookStoreManager.domain.Category;
import com.example.BookStoreManager.service.AuthorService;
import com.example.BookStoreManager.service.BookService;
import com.example.BookStoreManager.service.CategoryService;

@Controller
public class BookController {
    private final AuthorService authorService;
    private final CategoryService categoryService;
    private final BookService bookService;

    public BookController(AuthorService authorService, CategoryService categoryService, BookService bookService) {
        this.authorService = authorService;
        this.categoryService = categoryService;
        this.bookService = bookService;
    }

    @GetMapping("/admin/book/create")
    public String displayCreateBookPage(Model model) {
        List<Author> authors = authorService.getAll();
        List<Category> categories = categoryService.getAll();

        // Đưa dữ liệu vào model để hiển thị trên JSP
        model.addAttribute("authors", authors);
        model.addAttribute("categories", categories);
        model.addAttribute("newBook", new Book());

        return "admin/book/create";
    }
}
