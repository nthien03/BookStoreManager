package com.example.BookStoreManager.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(name = "orderdetails")
public class OrderDetail {
    private long id;
    private int quantity;
    private Boolean isDisabled;
}
