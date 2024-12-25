package com.example.employee.Employee.Domain;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "employee")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Employee {

    @Id
    @SequenceGenerator(
            name = "employee_seq",
            sequenceName = "employee_seq",
            allocationSize = 1
    )
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "employee_seq")
    @Column(nullable = false)
    private Long id;

    @Column(nullable = false)
    private int position_id ;

    @Column(nullable = false)
    private int rule_id ;

    @Column(nullable = false)
    private int grade_level_id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private int salary;

}
