package ch.noseryoung.restfood;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EntityScan(basePackages = "ch.noseryoung.restfood.domain")
@EnableJpaRepositories(basePackages = "ch.noseryoung.restfood.domain")
public class RestFoodApplication {
	public static void main(String[] args) {
		SpringApplication.run(RestFoodApplication.class, args);
	}
}

