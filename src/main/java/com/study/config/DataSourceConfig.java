package com.study.config; 

import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.mybatis.spring.mapper.MapperScannerConfigurer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.core.env.Environment;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.github.pagehelper.PageHelper;

@Configuration
//加载资源文件
@PropertySource({"classpath:jdbc.properties"})
//加上这个注解，使得支持事务
@EnableTransactionManagement
@MapperScan(basePackages = {"com.study.dao"})
public class DataSourceConfig {
	private static final Logger logger = Logger.getLogger(DataSourceConfig.class);
	/*
	 * 绑定资源属性
	 */
	@Value("${jdbc.driver}")
	private String driverClass;
	@Value("${jdbc.url}")
	private String url;
	@Value("${jdbc.username}")
	private String userName;
	@Value("${jdbc.password}")
	private String passWord;
	@Value("${maxActive}")
    private int maxActive;
    @Value("${maxIdle}")
    private int maxIdle;
    @Value("${maxWait}")
    private long maxWait;
    

    /** 
     * 必须加上static 
     */  
    public static PropertySourcesPlaceholderConfigurer placehodlerConfigurer() {
		logger.info("PropertySourcesPlaceholderConfigurer");
        return new PropertySourcesPlaceholderConfigurer();
    }
    
    @Bean(destroyMethod="close")  
	public BasicDataSource dataSource() {
		logger.info("DataSource");
		 BasicDataSource dataSource = new BasicDataSource();
		dataSource.setDriverClassName(driverClass);
		dataSource.setUrl(url);
		dataSource.setUsername(userName);
		dataSource.setPassword(passWord);
		dataSource.setMaxActive(maxActive);
        dataSource.setMaxIdle(maxIdle);
        dataSource.setMaxWait(maxWait);
		return dataSource;
	}
	
    @Bean
    public PlatformTransactionManager txManager(DataSource dataSource) {
        return new DataSourceTransactionManager(dataSource);
    }
    
   @Bean  
    public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {  
        SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();  
        sessionFactory.setDataSource(dataSource);
        PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
        sessionFactory.setMapperLocations(resolver.getResources("classpath:mapping/*Mapping.xml"));
        //配置pageHelper 
        sessionFactory.setPlugins(new Interceptor[]{pageHelper()});
        return sessionFactory.getObject();
    }  
    
    /*@Bean
    public MapperScannerConfigurer scannerConfigurer(){
    	MapperScannerConfigurer configurer = new MapperScannerConfigurer();
    	configurer.setBasePackage("com.study.dao");
    	configurer.setSqlSessionFactoryBeanName("sqlSessionFactory");
    	return configurer;
    }*/
    /**
     * mybatis 分页插件配置
     * @return
     */
    @Bean  
    public PageHelper pageHelper() {  
    	logger.info("MyBatisConfiguration.pageHelper()");
        PageHelper pageHelper = new PageHelper();  
        Properties p = new Properties();  
        p.setProperty("offsetAsPageNum", "true");  
        p.setProperty("rowBoundsWithCount", "true");  
        p.setProperty("reasonable", "true");  
        pageHelper.setProperties(p);  
        return pageHelper;  
    }


  
  

}


