package com.example.BookStoreManager.service;

import org.springframework.stereotype.Service;

import com.example.BookStoreManager.domain.Account;
import com.example.BookStoreManager.repository.AccountRepository;

@Service
public class AccountService {
    private final AccountRepository accountRepository;

    public AccountService(AccountRepository accountRepository) {
        this.accountRepository = accountRepository;
    }

    public Account saveAccount(Account account) {
        return this.accountRepository.save(account);
    }
}
