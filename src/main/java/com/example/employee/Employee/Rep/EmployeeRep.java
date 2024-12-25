package com.example.employee.Employee.Rep;

import com.example.employee.Employee.Domain.Employee;
import org.springframework.boot.autoconfigure.data.jpa.JpaRepositoriesAutoConfiguration;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface  EmployeeRep extends JpaRepository<Employee, Long> {
}
