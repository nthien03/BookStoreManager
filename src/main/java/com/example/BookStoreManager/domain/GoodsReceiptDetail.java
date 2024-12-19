package com.example.BookStoreManager.domain;

import org.hibernate.annotations.ManyToAny;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "goodsreceiptdetails")
public class GoodsReceiptDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private int quantity;
    private Boolean isDisabled;

    @ManyToOne
    @JoinColumn(name = "goods_receipt_id")
    private GoodsReceipt goodsReceipt;

    @ManyToOne
    @JoinColumn(name = "book_id")
    private Book book;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Boolean getIsDisabled() {
        return isDisabled;
    }

    public void setIsDisabled(Boolean isDisabled) {
        this.isDisabled = isDisabled;
    }

    public GoodsReceipt getGoodsReceipt() {
        return goodsReceipt;
    }

    public void setGoodsReceipt(GoodsReceipt goodsReceipt) {
        this.goodsReceipt = goodsReceipt;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

}
