package ch.noseryoung.restfood.domain.reservation;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
public class RestaurantTable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private Integer tableNumber;

    @Column(nullable = false)
    private Integer capacity;
}