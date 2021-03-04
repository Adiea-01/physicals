package cn.rails.physicals;

import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@Slf4j
@SpringBootApplication(scanBasePackages = {"cn.rails.physicals"})
@MapperScan(basePackages = {"cn.rails.physicals.mapper"})
public class PhysicalsApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(PhysicalsApplication.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(PhysicalsApplication.class);
    }
}
