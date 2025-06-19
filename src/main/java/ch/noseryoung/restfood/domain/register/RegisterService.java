package ch.noseryoung.restfood.domain.register;

import ch.noseryoung.restfood.domain.user.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class RegisterService {
    private final UserService userService;

    public User register(RegisterRequest request) {
        if (userService.existsByUsername(request.getUsername())) {
            throw new RuntimeException("Username already exists");
        }
        if (userService.existsByEmail(request.getEmail())) {
            throw new RuntimeException("Email already exists");
        }
        User user = User.builder()
                .username(request.getUsername())
                .email(request.getEmail())
                .password(request.getPassword())
                .build();
        return userService.saveUser(user);
    }
}