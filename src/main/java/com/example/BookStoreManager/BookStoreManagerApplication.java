package com.example.BookStoreManager;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(exclude = org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration.class)
public class BookStoreManagerApplication {

	public static void main(String[] args) {
		SpringApplication.run(BookStoreManagerApplication.class, args);
	}

}
