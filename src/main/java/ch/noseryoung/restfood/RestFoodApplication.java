package ch.noseryoung.restfood;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@EntityScan(basePackages = "ch.noseryoung.domain.menu")
@EnableJpaRepositories(basePackages = "ch.noseryoung.domain.menu")
@SpringBootApplication
@ComponentScan(basePackages = {"ch.noseryoung.restfood", "ch.noseryoung.domain.menu"})
public class RestFoodApplication {
	public static void main(String[] args) {
		SpringApplication.run(RestFoodApplication.class, args);
	}
}

