package ch.noseryoung.restfood.domain.login;

import ch.noseryoung.restfood.domain.auth.JwtUtil;
import ch.noseryoung.restfood.domain.user.User;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import jakarta.validation.Valid;
import java.util.Map;

@RestController
@RequestMapping("/api/v1/login")
public class LoginController {

    private final LoginService loginService;
    private final JwtUtil jwtUtil;

    public LoginController(LoginService loginService, JwtUtil jwtUtil) {
        this.loginService = loginService;
        this.jwtUtil = jwtUtil;
    }

    @PostMapping
    public ResponseEntity<Map<String, Object>> login(@Valid @RequestBody LoginRequest request) {
        boolean success = loginService.login(request);
        if (success) {
            User user = loginService.getUserByUsername(request.getUsername());
            String token = jwtUtil.generateToken(user.getUsername());

            return ResponseEntity.ok(Map.of(
                    "message", "Login successful!",
                    "token", token,
                    "username", user.getUsername(),
                    "email", user.getEmail()
            ));
        } else {
            return ResponseEntity.status(401).body(Map.of("message", "Invalid username or password"));
        }
    }
}