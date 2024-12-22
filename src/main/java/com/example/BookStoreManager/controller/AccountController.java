package com.example.BookStoreManager.controller;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.BookStoreManager.domain.Account;
import com.example.BookStoreManager.domain.Role;
import com.example.BookStoreManager.service.AccountService;
import com.example.BookStoreManager.service.RoleService;

@Controller
public class AccountController {
    private final PasswordEncoder passwordEncoder;
    private final AccountService accountService;
    private final RoleService roleService;

    public AccountController(AccountService accountService, RoleService roleService) {
        this.passwordEncoder = new BCryptPasswordEncoder();
        this.accountService = accountService;
        this.roleService = roleService;
    }

    @GetMapping("/account/create")
    public void registerAccount() {
        Account account = new Account();
        account.setUsername("duongnd");
        account.setPassword(this.passwordEncoder.encode("duongnd"));
        account.setFullName("Nguyễn Đăng Dương");
        account.setPhoneNumber("0122222288");
        account.setAddress("01 Yên Hòa, Hà Nội");
        account.setDisabled(false);
        Role role = this.roleService.getById(3);
        account.setRole(role);
        // this.accountService.saveAccount(account);
    }

    @GetMapping("/login")
    public String login() {
        return "admin/auth/login";
    }

}
