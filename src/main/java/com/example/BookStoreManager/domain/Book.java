package com.example.BookStoreManager.domain;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name = "books")
public class Book {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotBlank(message = "Tên sách không được bỏ trống")
    private String name;

    @NotNull(message = "Đơn giá không được bỏ trống")
    @Min(value = 1, message = "Đơn giá bán phải lớn hơn 0")
    private Double salePrice;

    @NotNull(message = "Số lượng không được bỏ trống")
    @Min(value = 0, message = "Số lượng phải lớn hơn hoặc bằng 0")
    private int quantity;

    private String image;

    @Column(columnDefinition = "TEXT")
    private String description;

    @NotBlank(message = "Nhà xuất bản không được bỏ trống")
    private String publisher;
    private Boolean isDisabled;

    @NotNull(message = "Vui lòng chọn tác giả")
    @ManyToOne
    @JoinColumn(name = "author_id")
    private Author author;

    @NotNull(message = "Vui lòng chọn thể loại")
    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;

    @OneToMany(mappedBy = "book")
    private List<BookCopy> bookCopies;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(Double salePrice) {
        this.salePrice = salePrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public Boolean getIsDisabled() {
        return isDisabled;
    }

    public void setIsDisabled(Boolean isDisabled) {
        this.isDisabled = isDisabled;
    }

    public Author getAuthor() {
        return author;
    }

    public void setAuthor(Author author) {
        this.author = author;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public List<BookCopy> getBookCopies() {
        return bookCopies;
    }

    public void setBookCopies(List<BookCopy> bookCopies) {
        this.bookCopies = bookCopies;
    }

    @Override
    public String toString() {
        return "Book [id=" + id + ", name=" + name + ", salePrice=" + salePrice + ", quantity=" + quantity + ", image="
                + image + ", description=" + description + ", publisher=" + publisher + ", isDisabled=" + isDisabled
                + ", author=" + author + ", category=" + category + ", bookCopies=" + bookCopies
                + "]";
    }

}
