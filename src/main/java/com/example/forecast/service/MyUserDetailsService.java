package com.example.forecast.service;

import com.example.forecast.model.User;
import com.example.forecast.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.Optional;

@Service
public class MyUserDetailsService implements UserDetailsService {
    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String identifier) throws UsernameNotFoundException {
        // まずメールアドレスで検索
        Optional<User> userOpt = userRepository.findByEmailAndIsDeletedFalse(identifier);

        // 見つからなければユーザー名で再検索
        if (userOpt.isEmpty()) {
            userOpt = userRepository.findByNameAndIsDeletedFalse(identifier);
        }

        // どちらにも該当しなければエラー
        User user = userOpt.orElseThrow(() -> new UsernameNotFoundException("Not found: " + identifier));

        GrantedAuthority authority = new SimpleGrantedAuthority("ROLE_" + user.getRole().toUpperCase());
        return new org.springframework.security.core.userdetails.User(
                identifier,
                user.getPassword(),
                Collections.singleton(authority));
    }
}
