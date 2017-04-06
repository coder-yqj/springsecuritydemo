package com.study.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.stereotype.Controller;

@Configuration
//@ComponentScan(basePackages={"com.study"},excludeFilters={@Filter(type=FilterType.ANNOTATION,value=EnableWebMvc.class)})
@ComponentScan(basePackages = "com.study", excludeFilters = { @ComponentScan.Filter(type = FilterType.ANNOTATION, value = { Controller.class }) })
public class RootConfig {

}
