package ch.noseryoung.restfood.domain.menu;

import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class MenuService {
    private final MenuItemRepository menuItemRepository;

    @Autowired
    public MenuService(MenuItemRepository menuItemRepository) {
        this.menuItemRepository = menuItemRepository;
    }

    public List<MenuItem> getAllItems() {
        List<MenuItem> items = menuItemRepository.findAll();
        if (items.isEmpty()) {
            throw new EntityNotFoundException("Keine Menüeinträge gefunden.");
        }
        return items;
    }

    public List<MenuItem> getItemsByCategory(String category) {
        try {
            MenuCategory enumCategory = MenuCategory.valueOf(category.toUpperCase());
            List<MenuItem> items = menuItemRepository.findByCategory(enumCategory);

            if (items.isEmpty()) {
                throw new EntityNotFoundException("Keine Menüeinträge für Kategorie: " + category);
            }

            return items;
        } catch (IllegalArgumentException e) {
            throw new EntityNotFoundException("Ungültige Kategorie: " + category);
        }
    }

    public MenuItem getItemById(UUID id) {
        return menuItemRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Menüeintrag mit ID " + id + " nicht gefunden."));
    }
}



