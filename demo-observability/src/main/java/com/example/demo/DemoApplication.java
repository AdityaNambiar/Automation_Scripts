/**
 * @author ChatGPT
 * @description A simple Spring Boot application with health check, greeting, and error simulation endpoints.
 */
package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.*;
import java.util.*;

@SpringBootApplication
@RestController
@RequestMapping("/api")
public class DemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }
    @Autowired
    private Environment env;
    
    @GetMapping("/health")
    public Map<String, String> health() {
        String port = env.getProperty("server.port","8080");
        return Map.of("status", "UP", "timestamp", new Date().toString(), "nextEndpoint", "http://127.0.0.1:" + port + "/api/greet?name="+System.getenv().getOrDefault("HOSTNAME", "local"));
    }

    @GetMapping("/greet")
    public Map<String, String> greet(@RequestParam(defaultValue = "World") String name) {
        return Map.of("message", "Hello " + name + "!", "servedBy", System.getenv().getOrDefault("HOSTNAME", "local"));
    }

    @GetMapping("/error")
    public Map<String, String> error() {
        throw new RuntimeException("Simulated failure for observability demo");
    }
}
