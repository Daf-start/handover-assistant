package com.handoverassistant.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/api")
public class AuthController {

    @GetMapping("/auth/me")
    public ResponseEntity<Map<String, Object>> currentUser() {
        return ResponseEntity.ok(Map.of(
            "name", "Demo User",
            "email", "demo@handover.local",
            "roles", new String[] {"ADMIN"}
        ));
    }
}
