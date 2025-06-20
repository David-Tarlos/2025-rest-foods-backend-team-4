package ch.noseryoung.restfood.domain.menu;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.PositiveOrZero;
import lombok.Data;
import java.util.UUID;

@Entity
@Data
@Table(name = "menu_item")
public class MenuItem {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)

    private UUID id;

    @NotBlank
    @Column(length = 100, nullable = false)
    private String name;

    @Column(length = 500)
    private String description;

    @PositiveOrZero
    @Column(nullable = false)
    private Double price;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private MenuCategory category;

    @Column(nullable = false)
    private boolean isChefsChoice = false;

    @Column(length = 1000)
    private String imageUrl;
}