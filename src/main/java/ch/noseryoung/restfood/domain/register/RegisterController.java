package ch.noseryoung.restfood.domain.register;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/v1/register")
@RequiredArgsConstructor
public class RegisterController {
    private final RegisterService registerService;

    @PostMapping
    public ResponseEntity<Map<String, String>> register(@Valid @RequestBody RegisterRequest request) {
        try {
            registerService.register(request);
            return ResponseEntity.ok(Map.of("message", "User registered successfully!"));
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body(Map.of("message", e.getMessage()));
        }
    }
}