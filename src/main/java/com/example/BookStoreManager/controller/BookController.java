package com.example.BookStoreManager.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.BookStoreManager.domain.Author;
import com.example.BookStoreManager.domain.Book;
import com.example.BookStoreManager.domain.Category;
import com.example.BookStoreManager.service.AuthorService;
import com.example.BookStoreManager.service.BookService;
import com.example.BookStoreManager.service.CategoryService;
import com.example.BookStoreManager.service.PaginationService;
import com.example.BookStoreManager.service.UploadService;

import jakarta.validation.Valid;

@Controller
public class BookController {
    private final AuthorService authorService;
    private final CategoryService categoryService;
    private final BookService bookService;
    private final UploadService uploadService;
    private final PaginationService paginationService;

    public BookController(AuthorService authorService, CategoryService categoryService, BookService bookService,
            UploadService uploadService, PaginationService paginationService) {
        this.authorService = authorService;
        this.categoryService = categoryService;
        this.bookService = bookService;
        this.uploadService = uploadService;
        this.paginationService = paginationService;
    }

    @GetMapping("/admin/book")
    public String displayBookPage(Model model,
            @RequestParam("page") Optional<String> pageIn) {

        // int page = 1;
        // try {
        // if (pageIn.isPresent()) {
        // page = Integer.parseInt(pageIn.get());
        // }
        // } catch (Exception e) {
        // // TODO: handle exception
        // }
        int page = this.paginationService.getPage(pageIn);
        Pageable pageable = PageRequest.of(page - 1, 10);
        Page<Book> books = this.bookService.getAll(pageable);

        List<Book> lBooks = books.getContent();

        model.addAttribute("books", lBooks);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", books.getTotalPages());
        return "admin/book/show";
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

    @PostMapping("/admin/book/create")
    public String handleCreateBook(@ModelAttribute("newBook") @Valid Book book, BindingResult newBookBindingResult,
            Model model,
            @RequestParam("imageBookFile") MultipartFile file) {

        // validate
        if (newBookBindingResult.hasErrors()) {
            List<Author> authors = authorService.getAll();
            List<Category> categories = categoryService.getAll();

            model.addAttribute("authors", authors);
            model.addAttribute("categories", categories);
            return "admin/book/create";
        }

        String image = this.uploadService.handleSaveUploadFile(file, "book");
        book.setImage(image);
        book.setIsDisabled(false);
        this.bookService.createBook(book);
        return "redirect:/admin/book";
    }

    @GetMapping("/admin/book/{bookId}")
    public String displayBookDetailPage(Model model, @PathVariable long bookId) {
        List<Author> authors = authorService.getAll();
        List<Category> categories = categoryService.getAll();
        Book book = this.bookService.getById(bookId);
        // Đưa dữ liệu vào model để hiển thị trên JSP
        model.addAttribute("authors", authors);
        model.addAttribute("categories", categories);
        model.addAttribute("newBook", book);

        return "admin/book/detail";
    }

    @PostMapping("/admin/book/update/{bookId}")
    public String handleUpdateBook(Model model, @ModelAttribute("newBook") @Valid Book book,
            BindingResult newBookBindingResult, @RequestParam("imageBookFile") MultipartFile file) {
        // validate
        if (newBookBindingResult.hasErrors()) {
            List<Author> authors = authorService.getAll();
            List<Category> categories = categoryService.getAll();

            model.addAttribute("authors", authors);
            model.addAttribute("categories", categories);
            return "admin/book/detail";
        }
        String image = this.uploadService.handleSaveUploadFile(file, "book");
        if (!image.isEmpty()) {
            book.setImage(image);
        }

        this.bookService.updateBook(book.getId(), book);

        return "redirect:/admin/book";
    }

}
