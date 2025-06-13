package ch.noseryoung.restfood.domain.menu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/v1")
public class MenuController {
    private final MenuService menuService;

    @Autowired
    public MenuController(MenuService menuService) {
        this.menuService = menuService;
    }


    @GetMapping("/menu-items")
    public ResponseEntity<List<MenuItem>> getMenuItems(
            @RequestParam(value = "category", required = false) String category) {
        List<MenuItem> items;

        if (category != null) {
            items = menuService.getItemsByCategory(category);
        } else {
            items = menuService.getAllItems();
        }

        items.sort((item1, item2) -> Boolean.compare(item2.isChefsChoice(), item1.isChefsChoice()));

        return ResponseEntity.ok(items);
    }

    @GetMapping("/menu-items/{id}")
    public ResponseEntity<MenuItem> getMenuItemById(@PathVariable UUID id) {
        MenuItem item = menuService.getItemById(id);
        return ResponseEntity.ok(item);
    }
}


