package com.phoenix.carrot.model.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WeekendFarmController {
	
	@RequestMapping("/map.do")
	public String mapForm() {
			return "map";
	}
}
