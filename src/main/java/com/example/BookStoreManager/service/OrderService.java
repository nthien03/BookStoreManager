package com.example.BookStoreManager.service;

import java.util.Date;
import java.util.List;
import java.text.SimpleDateFormat;
import java.util.Random;

import org.springframework.stereotype.Service;

import com.example.BookStoreManager.domain.Order;
import com.example.BookStoreManager.repository.OrderRepository;

@Service
public class OrderService {
    private final OrderRepository orderRepository;

    public OrderService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    public Order createOrder(Order order) {
        return this.orderRepository.save(order);
    }

    // Phương thức tạo mã đơn hàng
    public String generateOrderCode() {
        // Lấy thời gian hiện tại
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyMMddHHmmss");
        String timeStamp = dateFormat.format(new Date());

        // Thêm một chuỗi ngẫu nhiên
        String randomPart = generateRandomString(4);
        // Tạo mã đơn hàng
        return timeStamp + randomPart;
    }

    // Phương thức tạo chuỗi ngẫu nhiên
    private String generateRandomString(int length) {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        Random random = new Random();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < length; i++) {
            int index = random.nextInt(characters.length());
            sb.append(characters.charAt(index));
        }
        return sb.toString();
    }

    public List<Order> getAll() {
        return this.orderRepository.findAll();
    }

    public Order getById(long id) {
        return this.orderRepository.findById(id);
    }
}
