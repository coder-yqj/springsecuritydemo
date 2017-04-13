package com.study.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@Configuration
@ComponentScan(basePackages={"com.study"},excludeFilters={@Filter(type=FilterType.ANNOTATION,value=EnableWebMvc.class)})
//@ComponentScan(basePackages = "com.study", excludeFilters = { @ComponentScan.Filter(type = FilterType.ANNOTATION, value = { Controller.class }) })
public class RootConfig {

}
