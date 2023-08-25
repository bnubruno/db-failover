package com.example.dbtest.repository;

import com.example.dbtest.entity.Company;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface CompanyJpaRepository extends JpaRepository<Company, UUID> {
}
