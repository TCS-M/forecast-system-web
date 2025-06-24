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

    // ログイン成功時のカスタムハンドラ
    @Bean
    public CustomLoginSuccessHandler customLoginSuccessHandler() {
        return new CustomLoginSuccessHandler();
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                // .csrf().disable() // ✅ CSRF閉じる
                .userDetailsService(userDetailsService)
                .authorizeHttpRequests(authz -> authz
                        // ✅ 管理者専用ページ
                        .requestMatchers("/admin_homepage",
                                "/users_list", "/user_edit", "/user_form",
                                "/admin_data_detail", "/admin_forecast_list", "/admin_sales_list",
                                "/brand", "/brand_manage",
                                "/admin/sales/**" // ✅ ここで編集・削除エンドポイントも許可
                        ).hasRole("ADMIN")

                        // ✅ 一般ユーザー用ページ
                        .requestMatchers(
                                "/user_data_detail", "/user_forecast_list", "/user_homepage")
                        .hasRole("USER")

                        // ✅ 誰でもアクセス可
                        .requestMatchers("/", "/login", "/login.css", "/css/**", "/js/**").permitAll()

                        // その他のリクエストは認証が必要
                        .anyRequest().authenticated())

                .formLogin(form -> form
                        .loginPage("/login")
                        .loginProcessingUrl("/login")
                        .successHandler(customLoginSuccessHandler())
                        .failureUrl("/login?error")
                        .permitAll())
                .logout(logout -> logout.permitAll());

        return http.build();
    }
}
