package com.phoenix.carrot.model.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TaerinController {

	@RequestMapping("/weather.do")
	public String weatherForm() {
			return "weather";
	}
}