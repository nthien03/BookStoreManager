package com.example.BookStoreManager.controller;

import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.BookStoreManager.domain.Order;
import com.example.BookStoreManager.service.AccountService;
import com.example.BookStoreManager.service.OrderService;
import com.example.BookStoreManager.service.PaginationService;

@Controller
public class OrderController {

    private final OrderService orderService;
    private final AccountService accountService;
    private final PaginationService paginationService;

    public OrderController(OrderService orderService, AccountService accountService,
            PaginationService paginationService) {
        this.orderService = orderService;
        this.accountService = accountService;
        this.paginationService = paginationService;
    }

    @GetMapping("/order/create")
    public void createOrder() {
        Order order = new Order();
        order.setOrderCode(this.orderService.generateOrderCode());
        order.setOrderType("Đã thanh toán");
        order.setOrderTime(new Timestamp(System.currentTimeMillis()));
        order.setTotalPrice(234000);
        order.setStatus("Chờ xử lý");
        order.setNote("Giao hàng tận nơi");
        order.setIsDisabled(false);
        order.setAccount(this.accountService.getAccountByUsername("duongnd"));
        this.orderService.createOrder(order);

    }

    @GetMapping("/admin/order")
    public String displayOrderPage(Model model,
            @RequestParam("page") Optional<String> pageIn) {

        int page = this.paginationService.getPage(pageIn);
        Pageable pageable = PageRequest.of(page - 1, 5);
        Page<Order> orders = this.orderService.getAll(pageable);
        List<Order> lOrders = orders.getContent();

        model.addAttribute("orders", lOrders);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", orders.getTotalPages());

        return "admin/order/show";
    }

    @GetMapping("/admin/order/{orderId}")
    public String displayOrderDetailPage(Model model, @PathVariable long orderId) {
        Order order = this.orderService.getById(orderId);

        model.addAttribute("order", order);

        return "admin/order/detail";
    }

    @PostMapping("/admin/order/update/{orderId}")
    public String handleUpdateOrderStatus(@PathVariable long orderId,
            @RequestParam("orderType") String orderType,
            @RequestParam("status") String status) {

        this.orderService.handleUpdateStatus(orderId, status, orderType);
        return "redirect:/admin/order";
    }

}
