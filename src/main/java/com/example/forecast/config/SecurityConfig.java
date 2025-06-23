package com.example.forecast.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

import com.example.forecast.service.MyUserDetailsService;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
public class SecurityConfig {

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

     @Autowired
    private MyUserDetailsService userDetailsService;

    // ここでBean登録
    @Bean
    public CustomLoginSuccessHandler customLoginSuccessHandler() {
        return new CustomLoginSuccessHandler();
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
             .userDetailsService(userDetailsService)
            .authorizeHttpRequests(authz -> authz
                .requestMatchers("/admin_homepage",
                    "/users_list", "/user_edit", "/user_form", 
                    "/admin_data_detail", "/admin_forecast_list", "/admin_sales_list"
                    ,"/brand","/brand_manage"
                ).hasRole("ADMIN")
                .requestMatchers(
                    "/user_data_detail", "/user_forecast_list", "/user_homepage"
                ).hasRole("USER")
                .requestMatchers("/", "/login", "/css/**", "/js/**").permitAll()
                .anyRequest().authenticated()
            )
            .formLogin(form -> form
                .loginPage("/login")
                .loginProcessingUrl("/login")
                .successHandler(customLoginSuccessHandler())
                .failureUrl("/login?error") 
                .permitAll()
            )
            .logout(logout -> logout.permitAll());

        return http.build();
    }
}
