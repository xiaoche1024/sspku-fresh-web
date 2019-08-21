package com.sspku.common.datasource;

import org.apache.ibatis.mapping.DatabaseIdProvider;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.boot.autoconfigure.ConfigurationCustomizer;
import org.mybatis.spring.boot.autoconfigure.MybatisAutoConfiguration;
import org.mybatis.spring.boot.autoconfigure.MybatisProperties;
import org.springframework.beans.factory.ObjectProvider;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.jdbc.DataSourceBuilder;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

import javax.sql.DataSource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Mybatis配置文件
 */
@Configuration
@PropertySource({"file:${datasource.filepath}"})
public class MybatisConfiguration extends MybatisAutoConfiguration {

    /**
     * 数据库类型
     */
    @Value("${druid.datasource.type}")
    private Class<? extends DataSource> dataSourceType;


    public MybatisConfiguration(MybatisProperties properties, ObjectProvider<Interceptor[]> interceptorsProvider, ResourceLoader resourceLoader, ObjectProvider<DatabaseIdProvider> databaseIdProvider, ObjectProvider<List<ConfigurationCustomizer>> configurationCustomizersProvider) {
        super(properties, interceptorsProvider, resourceLoader, databaseIdProvider, configurationCustomizersProvider);
    }

    /**
     * 读数据库源
     *
     * @return
     */
    @Bean
    @Primary
    @ConfigurationProperties(prefix = "druid.datasource.write")
    public DataSource writeDataSource() {
        DataSource dataSource= DataSourceBuilder.create().type(dataSourceType).build();
        return dataSource;
    }


    @Bean
    public SqlSessionFactory sqlSessionFactorys() throws Exception {
        return super.sqlSessionFactory(roundRobinDataSourceProxy());
    }

    @Bean
    public AbstractRoutingDataSource roundRobinDataSourceProxy() {
        FreshAbstractRoutingDataSource proxyDataSource = new FreshAbstractRoutingDataSource();
        Map<Object, Object> targetDataSource = new HashMap<>();
        //设置写数据源
        targetDataSource.put("0", writeDataSource());
        proxyDataSource.setTargetDataSources(targetDataSource);
        proxyDataSource.setDefaultTargetDataSource(writeDataSource());
        return proxyDataSource;
    }
}
