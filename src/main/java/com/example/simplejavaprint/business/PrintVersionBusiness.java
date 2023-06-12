package com.example.simplejavaprint.business;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.context.event.ApplicationStartedEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class PrintVersionBusiness {

    @EventListener
    public void printVersion(ApplicationStartedEvent event) throws InterruptedException {
        while (true) {
            log.info("Version 0.0.3");
            Thread.sleep(1000L);
        }
    }
}
