package com.example.demo.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Controller {
    private static boolean isHealthy = true;

    @GetMapping("/")
    public String hello() throws UnknownHostException {
        InetAddress ip = InetAddress.getLocalHost();
        if(isHealthy){
            return "hello from server - "+ ip + "- healthy";
        } else {
            return "hello from server - "+ ip + "- unhealthy";
        }
        
    }

    @GetMapping("/check")
    public ResponseEntity<?> check() throws UnknownHostException {
        if(isHealthy){
            return ResponseEntity.status(HttpStatus.OK).body("Server is Healthy");
            // return "Server is healthy";
        } else {
            return ResponseEntity.status(HttpStatus.SERVICE_UNAVAILABLE).body("Server is UnHealthy");
        }
    }

    @GetMapping("/healthy")
    public String healthy() {
        isHealthy = true;
        return ""+isHealthy;
    }

    @GetMapping("/unhealthy")
    public String unhealthy() {
        isHealthy = false;
        return ""+isHealthy;
    }
}
