package ch.noseryoung.restfood.domain.user;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/users")
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;

    @GetMapping("/{username}")
    public ResponseEntity<User> getUserByUsername(@PathVariable String username) {
        User user = userService.findByUsername(username);
        if (user != null) {
            user.setPassword(null); // Hide password
            return ResponseEntity.ok(user);
        }
        return ResponseEntity.notFound().build();
    }
}