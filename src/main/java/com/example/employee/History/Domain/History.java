package com.example.employee.History.Domain;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;

import java.util.Date;

@Entity
@Table(name = "history_change")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class History {

    @Id
    @SequenceGenerator(
            name = "history_seq",
            sequenceName = "history_seq",
            allocationSize = 1
    )
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "history_seq")
    @Column(nullable = false)
    private Long id;

    @Column(nullable = false)
    private int position_id ;

    @Column(nullable = false)
    private int rule_id ;

    @Column(nullable = false)
    private int grade_level_id;

    @Column(nullable = false)
    private int salary;

    @Column(nullable = false)
    private Date date_change;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private Long actual_id;

}
