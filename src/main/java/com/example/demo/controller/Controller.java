package com.example.demo.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Controller {

    @GetMapping("/")
    public String hello() throws UnknownHostException {
        InetAddress ip = InetAddress.getLocalHost();
        return "hello from server - "+ ip;
    }
}
