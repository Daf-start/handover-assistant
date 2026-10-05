package com.handoverassistant.service;

import com.handoverassistant.dto.DashboardSummaryDto;
import com.handoverassistant.entity.HandoverEntity;
import com.handoverassistant.repository.HandoverRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class DashboardService {

    private final HandoverRepository handoverRepository;

    public DashboardSummaryDto getDashboardSummary() {
        DashboardSummaryDto dto = new DashboardSummaryDto();
        List<HandoverEntity> handovers = handoverRepository.findAll();

        dto.setActiveExpedientes(handovers.size());
        dto.setOpenTasks(handovers.stream().mapToLong(h -> h.getTasks() == null ? 0 : h.getTasks().size()).sum());
        dto.setPendingReviews(0L);
        dto.setCompletedThisMonth(0L);
        dto.setRecentHandovers(List.of());

        return dto;
    }
}
