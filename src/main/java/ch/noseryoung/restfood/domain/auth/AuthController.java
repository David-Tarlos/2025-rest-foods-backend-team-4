package ch.noseryoung.restfood.domain.auth;

import ch.noseryoung.restfood.domain.login.LoginRequest;
import ch.noseryoung.restfood.domain.user.User;
import ch.noseryoung.restfood.domain.user.UserService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.AuthenticationException;
import org.springframework.web.bind.annotation.*;

import jakarta.validation.Valid;
import java.util.Map;

@RestController
@RequestMapping("/api/v1/auth")
public class AuthController {

    private final AuthenticationManager authenticationManager;
    private final JwtUtil jwtUtil;
    private final UserService userService;

    public AuthController(AuthenticationManager authenticationManager,
                          JwtUtil jwtUtil,
                          UserService userService) {
        this.authenticationManager = authenticationManager;
        this.jwtUtil = jwtUtil;
        this.userService = userService;
    }

    @PostMapping("/login")
    public ResponseEntity<Map<String, Object>> login(@Valid @RequestBody LoginRequest request) {
        try {
            authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(request.getUsername(), request.getPassword())
            );
            String token = jwtUtil.generateToken(request.getUsername());

            User user = userService.findByUsername(request.getUsername());

            return ResponseEntity.ok(Map.of(
                    "message", "Login successful with JWT!",
                    "token", token,
                    "username", user.getUsername(),
                    "email", user.getEmail()
            ));
        } catch (AuthenticationException e) {
            return ResponseEntity.status(401).body(Map.of("message", "Invalid username or password"));
        }
    }
}