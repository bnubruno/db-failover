package com.example.dbtest.controller;

import com.example.dbtest.repository.CompanyJpaRepository;
import com.example.dbtest.repository.CompanyRepository;
import com.zaxxer.hikari.pool.ProxyConnection;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.EOFException;
import java.sql.SQLException;

@Slf4j
@RestController
@RequestMapping("/company")
@AllArgsConstructor
public class CompanyController {

    private CompanyRepository companyRepository;
    private CompanyJpaRepository companyJpaRepository;

    @GetMapping("/jdbc")
    public String jdbc() throws SQLException {
        log.info("Finding companies");
        Integer integer = companyRepository.countCompany();
        if (integer == 1) {
            return "Banco de dados 2";
        }
        return "Banco de dados 1";
    }

    @GetMapping("/jpa")
    public String jpa() throws EOFException {
        log.info("Finding companies");
        long count = companyJpaRepository.count();
        if (count == 1) {
            return "Banco de dados 2";
        }
        return "Banco de dados 1";
    }

}
