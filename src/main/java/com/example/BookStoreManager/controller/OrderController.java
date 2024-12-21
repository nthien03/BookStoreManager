package com.example.BookStoreManager.controller;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.BookStoreManager.domain.Book;
import com.example.BookStoreManager.domain.Order;
import com.example.BookStoreManager.service.AccountService;
import com.example.BookStoreManager.service.OrderService;

@Controller
public class OrderController {

    private final OrderService orderService;
    private final AccountService accountService;

    public OrderController(OrderService orderService, AccountService accountService) {
        this.orderService = orderService;
        this.accountService = accountService;
    }

    @GetMapping("/order/create")
    public void createOrder() {
        Order order = new Order();
        order.setOrderCode(this.orderService.generateOrderCode());
        order.setOrderType("Chưa thanh toán");
        order.setOrderTime(new Timestamp(System.currentTimeMillis()));
        order.setTotalPrice(50000);
        order.setStatus("Chờ xử lý");
        order.setNote("Giao hàng nhanh");
        order.setIsDisabled(false);
        order.setAccount(this.accountService.getAccountByUsername("duongnd"));
        // this.orderService.createOrder(order);

    }

    @GetMapping("/admin/order")
    public String displayOrderPage(Model model) {
        List<Order> orders = this.orderService.getAll();

        model.addAttribute("orders", orders);

        return "admin/order/show";
    }

    @GetMapping("/admin/order/{orderId}")
    public String displayOrderDetailPage(Model model, @PathVariable long orderId) {
        Order order = this.orderService.getById(orderId);

        model.addAttribute("order", order);

        return "admin/order/detail";
    }

}
