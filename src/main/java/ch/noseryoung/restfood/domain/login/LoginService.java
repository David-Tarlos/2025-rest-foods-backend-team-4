package ch.noseryoung.restfood.domain.login;

import ch.noseryoung.restfood.domain.user.User;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

    private final PasswordEncoder passwordEncoder;
    private static final String ADMIN_PASSWORD_HASH = "$2a$10$N.zmdr9k7uOEXYBr4oEOKOtU6zoYiInqloSNjt8.P5CGHw8WO19/2";

    public LoginService(PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }

    public boolean login(LoginRequest request) {
        if ("admin".equals(request.getUsername())) {
            return passwordEncoder.matches(request.getPassword(), ADMIN_PASSWORD_HASH);
        }
        return false;
    }

    public User getUserByUsername(String username) {
        if ("admin".equals(username)) {
            User adminUser = new User();
            adminUser.setUsername("admin");
            adminUser.setEmail("admin@restfood.com");
            adminUser.setPassword(ADMIN_PASSWORD_HASH);
            adminUser.setRole("ADMIN");
            return adminUser;
        }
        throw new RuntimeException("User not found: " + username);
    }
}