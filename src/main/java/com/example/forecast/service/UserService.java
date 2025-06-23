package com.example.forecast.service;

import com.example.forecast.model.User;
import com.example.forecast.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    public void saveUser(User user) {
        // System.out.println("保存前: " + user.getPassword());
        String rawPassword = user.getPassword();
        String encodedPassword = passwordEncoder.encode(rawPassword);
        user.setPassword(encodedPassword);
        // System.out.println("保存後: " + user.getPassword());
        userRepository.save(user);
    }

    // ユーザー名またはメールアドレスのどちらでも認証OK
    public boolean authenticate(String identifier, String rawPassword) {
        Optional<User> userOpt = userRepository.findByEmailAndIsDeletedFalse(identifier);
        if (userOpt.isEmpty()) {
            userOpt = userRepository.findByNameAndIsDeletedFalse(identifier);
        }
        if (userOpt.isPresent()) {
            // System.out.println("DBパス: " + userOpt.get().getPassword());
            // System.out.println("入力PW: " + rawPassword);
            // System.out.println("判定: " + passwordEncoder.matches(rawPassword,
            // userOpt.get().getPassword()));
            return passwordEncoder.matches(rawPassword, userOpt.get().getPassword());
        }
        return false;
    }

    public Optional<User> getUserByIdentifier(String identifier) {
        Optional<User> userOpt = userRepository.findByEmailAndIsDeletedFalse(identifier);
        if (userOpt.isEmpty()) {
            userOpt = userRepository.findByNameAndIsDeletedFalse(identifier);
        }
        return userOpt;
    }
}
