package com.tranhuutruong.QuanLyThuChiAPI;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.annotation.PostConstruct;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.TimeZone;

//@EnableTransactionManagement
//@EnableJpaAuditing
//@EnableJpaRepositories({"com.tranhuutruong.QuanLyThuChiAPI.Repository", "com.tranhuutruong.QuanLyThuChiAPI.Model"})
//@EntityScan({"com.tranhuutruong.QuanLyThuChiAPI.Repository", "com.tranhuutruong.QuanLyThuChiAPI.Model"})
//@SpringBootApplication(exclude = {ErrorWebFluxAutoConfiguration.class, ValidationAutoConfiguration.class},
//				scanBasePackages = {"com.tranhuutruong.QuanLyThuChiAPI.Http" ,"com.tranhuutruong.QuanLyThuChiAPI.Repository","com.tranhuutruong.QuanLyThuChiAPI.Service" ,"com.tranhuutruong.QuanLyThuChiAPI.Controller"
//						,"com.tranhuutruong.QuanLyThuChiAPI.Security.JWT", "com.tranhuutruong.QuanLyThuChiAPI.Utils", "com.tranhuutruong.QuanLyThuChiAPI.Request", "com.tranhuutruong.QuanLyThuChiAPI.Response",
//						"com.tranhuutruong.QuanLyThuChiAPI.Model"})
@EnableScheduling
@SpringBootApplication
public class QuanLyThuChiApiApplication {

	public static void main(String[] args) {
		SpringApplication application = new SpringApplication(QuanLyThuChiApiApplication.class);
		application.setDefaultProperties(Collections.singletonMap("server.port", "8080"));
		application.run(args);
	}

	@PostConstruct
	public void init() {
		TimeZone.setDefault(TimeZone.getTimeZone("Asia/Ho_Chi_Minh"));   // It will set UTC timezone
		System.out.println("Spring boot application running in UTC timezone :" + new Date());   // It will print UTC timezone
	}
//	@Bean
//	public RouterFunction<ServerResponse> swaggerUI() {
//		return RouterFunctions.route(RequestPredicates.GET("/swagger"),
//				request -> ServerResponse.permanentRedirect(URI.create(request.path() + "/index.html?url=/api-docs")).build()).and(RouterFunctions
//				.resources("/swagger/**", new ClassPathResource("swagger-ui/")));
//	}

}
