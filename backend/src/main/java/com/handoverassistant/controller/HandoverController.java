package com.handoverassistant.controller;

import com.handoverassistant.dto.DashboardSummaryDto;
import com.handoverassistant.dto.HandoverRequestDto;
import com.handoverassistant.entity.HandoverEntity;
import com.handoverassistant.service.DashboardService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class HandoverController {

    private final DashboardService dashboardService;

    @GetMapping("/dashboard")
    public ResponseEntity<DashboardSummaryDto> getDashboard() {
        return ResponseEntity.ok(dashboardService.getDashboardSummary());
    }

    @GetMapping("/handover")
    public ResponseEntity<List<HandoverEntity>> listHandovers() {
        return ResponseEntity.ok(List.of());
    }

    @PostMapping("/handover")
    public ResponseEntity<HandoverEntity> createHandover(@RequestBody HandoverRequestDto request) {
        HandoverEntity handover = new HandoverEntity();
        handover.setTitle(request.getTitle());
        handover.setDescription(request.getDescription());
        handover.setSourceSystem(request.getSourceSystem());
        handover.setLocation(request.getLocation());
        return ResponseEntity.ok(handover);
    }
}
