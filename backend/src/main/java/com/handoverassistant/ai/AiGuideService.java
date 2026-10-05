package com.handoverassistant.ai;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AiGuideService {

    public List<String> suggestNextActions(String handoverTitle) {
        return List.of(
            "Review the latest emails for pending equipment references.",
            "Validate the responsible owner for each critical task.",
            "Check document attachments before final handover completion."
        );
    }
}
