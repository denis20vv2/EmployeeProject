package com.example.employee.History.Rep;

import com.example.employee.Employee.Domain.Employee;
import com.example.employee.History.Domain.History;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

//@Repository
public interface HistoryRep  extends JpaRepository<History, Long> {
}
