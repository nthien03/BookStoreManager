package com.example.BookStoreManager.domain;

import java.sql.Timestamp;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(name = "orders")
public class Order {
    private long id;
    private String orderType;
    private Timestamp orderTime;
    private double totalPrice;
    private String status;
    private Boolean isDisabled;
}
