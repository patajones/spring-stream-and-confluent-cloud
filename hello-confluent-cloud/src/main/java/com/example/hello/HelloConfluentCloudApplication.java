package com.example.hello;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.function.Supplier;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import reactor.core.publisher.Flux;

@SpringBootApplication
public class HelloConfluentCloudApplication {

	public static void main(String[] args) {
		SpringApplication.run(HelloConfluentCloudApplication.class, args);
	}

	@Bean
	Supplier<Flux<Hello>> hello() {
		return () -> {
			return fluxoHello().log();
		};
	}

	Flux<Hello> fluxoHello() {
		return Flux.range(1, 20).delayElements(Duration.ofSeconds(1)).map(i -> {
			return Hello.builder()//
				.saudacao("Olá Kafka "+String.valueOf(i))//
				.agora(LocalDateTime.now())//
				.build();
		});
	}

}
