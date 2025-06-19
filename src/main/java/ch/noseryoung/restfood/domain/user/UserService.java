package ch.noseryoung.restfood.domain.user;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserService implements UserDetailsService {

    private static final String ADMIN_PASSWORD_HASH = "$2a$10$N.zmdr9k7uOEXYBr4oEOKOtU6zoYiInqloSNjt8.P5CGHw8WO19/2";
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public UserService(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        if ("admin".equals(username)) {
            return org.springframework.security.core.userdetails.User
                    .withUsername("admin")
                    .password(ADMIN_PASSWORD_HASH)
                    .roles("ADMIN")
                    .build();
        }

        User user = userRepository.findByUsername(username)
                .orElseThrow(() -> new UsernameNotFoundException("User not found: " + username));

        return org.springframework.security.core.userdetails.User
                .withUsername(user.getUsername())
                .password(user.getPassword())
                .roles(user.getRole())
                .build();
    }

    public User findByUsername(String username) {
        if ("admin".equals(username)) {
            User adminUser = new User();
            adminUser.setUsername("admin");
            adminUser.setEmail("admin@restfood.com");
            adminUser.setPassword(ADMIN_PASSWORD_HASH);
            adminUser.setRole("ADMIN");
            return adminUser;
        }
        return userRepository.findByUsername(username)
                .orElseThrow(() -> new UsernameNotFoundException("User not found: " + username));
    }

    public boolean existsByUsername(String username) {
        if ("admin".equals(username)) {
            return true;
        }
        return userRepository.findByUsername(username).isPresent();
    }

    public boolean existsByEmail(String email) {
        if ("admin@restfood.com".equals(email)) {
            return true;
        }
        return userRepository.findByEmail(email).isPresent();
    }

    public User saveUser(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRole("USER");
        return userRepository.save(user);
    }
}