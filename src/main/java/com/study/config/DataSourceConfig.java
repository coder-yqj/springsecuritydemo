package com.study.config; 

import java.util.Properties;

import javax.sql.DataSource;

import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperScannerConfigurer;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import com.github.pagehelper.PageHelper;

@Configuration
//加载资源文件
@PropertySource({"classpath:jdbc.properties"})
public class DataSourceConfig {
	private static final Logger logger = Logger.getLogger(DataSourceConfig.class);
	/*
	 * 绑定资源属性
	 */
	@Value("${jdbc.driver}")
	String driverClass;
	@Value("${jdbc.url}")
	String url;
	@Value("${jdbc.username}")
	String userName;
	@Value("${jdbc.password}")
	String passWord;
	
	@Bean(name = "dataSource")
	public DataSource dataSource() {
		logger.info("DataSource");
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://localhost:3306/mytest?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&autoReconnect=true&failOverReadOnly=false");
		dataSource.setUsername("root");
		dataSource.setPassword("root");
		return dataSource;
	}
	
	@Bean  
    public DataSourceTransactionManager txManager() {  
        return new DataSourceTransactionManager(dataSource());  
    }  
	    
    @Bean  
    public SqlSessionFactory sqlSessionFactory() throws Exception {  
        SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();  
        sessionFactory.setDataSource(dataSource());
        PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
        sessionFactory.setMapperLocations(resolver.getResources("classpath:com/study/mapping/*Mapping.xml"));
        //配置pageHelper 
        sessionFactory.setPlugins(new Interceptor[]{pageHelper()});
        return sessionFactory.getObject();
    }  
    
    @Bean
    public MapperScannerConfigurer scannerConfigurer(){
    	MapperScannerConfigurer configurer = new MapperScannerConfigurer();
    	configurer.setBasePackage("com.study.dao");
    	configurer.setSqlSessionFactoryBeanName("sqlSessionFactory");
    	return configurer;
    }
    /**
     * mybatis 分页插件配置
     * @return
     */
    @Bean  
    public PageHelper pageHelper() {  
       System.out.println("MyBatisConfiguration.pageHelper()");  
        PageHelper pageHelper = new PageHelper();  
        Properties p = new Properties();  
        p.setProperty("offsetAsPageNum", "true");  
        p.setProperty("rowBoundsWithCount", "true");  
        p.setProperty("reasonable", "true");  
        pageHelper.setProperties(p);  
        return pageHelper;  
    }  

}


