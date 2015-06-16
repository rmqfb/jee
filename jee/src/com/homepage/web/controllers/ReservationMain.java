package com.homepage.web.controllers;

import com.homepage.web.serviceimpls.ReservationServiceImpl1;
import com.homepage.web.services.ReservationService1;

public class ReservationMain {
	public static void main(String[] args) {
		ReservationService1 service = new ReservationServiceImpl1();
		service.process();
	}
}
