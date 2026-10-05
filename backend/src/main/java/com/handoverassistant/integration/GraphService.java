package com.handoverassistant.integration;

import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class GraphService {

    public Map<String, Object> fetchInboxSummary() {
        return Map.of(
            "messages", 0,
            "unread", 0,
            "lastSync", "2026-10-05T00:00:00Z"
        );
    }
}
