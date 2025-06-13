package ch.noseryoung.restfood.domain.admin;

import ch.noseryoung.restfood.domain.menu.MenuItem;
import ch.noseryoung.restfood.domain.menu.MenuService;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.URI;
import java.util.UUID;

@RestController
@RequestMapping("/api/v1/admin/menu-items")
public class AdminMenuController {

    private final MenuService menuService;

    public AdminMenuController(MenuService menuService) {
        this.menuService = menuService;
    }


    @PostMapping
    public ResponseEntity<MenuItem> createMenuItem(@Valid @RequestBody MenuItem menuItem) {

        MenuItem created = menuService.saveMenuItem(menuItem);
        return ResponseEntity.created(URI.create("/api/v1/admin/menu-items/" + created.getId())).body(created);
    }


    @PutMapping("/{id}")
    public ResponseEntity<MenuItem> updateMenuItem(@PathVariable UUID id, @Valid @RequestBody MenuItem menuItem) {
        MenuItem updated = menuService.updateMenuItem(id, menuItem);
        return ResponseEntity.ok(updated);
    }


    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteMenuItem(@PathVariable UUID id) {
        menuService.deleteMenuItem(id);
        return ResponseEntity.noContent().build();
    }
}
