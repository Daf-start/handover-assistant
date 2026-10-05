package com.handoverassistant.repository;

import com.handoverassistant.entity.HandoverEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface HandoverRepository extends JpaRepository<HandoverEntity, Long> {
}
