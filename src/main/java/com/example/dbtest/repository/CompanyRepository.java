package com.example.dbtest.repository;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.Optional;

@Slf4j
@Service
@AllArgsConstructor
public class CompanyRepository {

    private final NamedParameterJdbcTemplate jdbcTemplate;

    public Integer countCompany() throws SQLException {
        var countQuery = "select count(*) from company as count";
        return Optional.ofNullable(jdbcTemplate.queryForObject(countQuery, new MapSqlParameterSource(), Integer.class))
                .orElse(0);
    }


}
