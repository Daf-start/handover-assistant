package com.handoverassistant.dto;

import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Data
public class DashboardSummaryDto {
    private long activeExpedientes;
    private long openTasks;
    private long pendingReviews;
    private long completedThisMonth;
    private List<RecentHandoverDto> recentHandovers;
}

@Data
public class RecentHandoverDto {
    private Long id;
    private String title;
    private String status;
    private LocalDate dueDate;
    private LocalDateTime updatedAt;
}

@Data
public class HandoverRequestDto {
    private String title;
    private String description;
    private LocalDate startDate;
    private LocalDate dueDate;
    private String sourceSystem;
    private String location;
}
