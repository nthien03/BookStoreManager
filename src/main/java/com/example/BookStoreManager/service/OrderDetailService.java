package com.example.BookStoreManager.service;

import org.springframework.stereotype.Service;

import com.example.BookStoreManager.domain.OrderDetail;
import com.example.BookStoreManager.repository.OrderDetailRepository;

@Service
public class OrderDetailService {
    private final OrderDetailRepository orderDetailRepository;

    public OrderDetailService(OrderDetailRepository orderDetailRepository) {
        this.orderDetailRepository = orderDetailRepository;
    }

    public OrderDetail createOrderDetail(OrderDetail orderDetail) {
        return this.orderDetailRepository.save(orderDetail);
    }
}
