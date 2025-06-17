package com.example.forecast;

import com.example.forecast.model.User;
import com.example.forecast.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.List;

@SpringBootApplication
public class ForecastSystemWebMavenApplication implements CommandLineRunner {

    @Autowired
    private UserRepository userRepository;

    public static void main(String[] args) {
        SpringApplication.run(ForecastSystemWebMavenApplication.class, args);
    }

    @Override
    public void run(String... args) throws Exception {
        System.out.println("✅ データ内容：");
        List<User> users = userRepository.findAll();
        for (User u : users) {
            System.out.println(" - " + u.getEmail() + " / " + u.getPassword());
        }
        
    }
}
