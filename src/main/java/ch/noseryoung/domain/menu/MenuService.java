package ch.noseryoung.domain.menu;

import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
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

}
