package com.springboot.Pilotproject.auth;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import jakarta.servlet.DispatcherType;

@Configuration
public class Pilotprojecsecurity {
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception{
		http.csrf((csrf) -> csrf.disable()) // CSRF 보호 비활성화
			.cors((cors) -> cors.disable()) // CORS 비활성화
			.authorizeHttpRequests( request -> request
					.dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll() // 내부 포워드 요청 | 허용
					.requestMatchers("/","/main","/member/main", "/member/jusoPopup","/member/writeForm",
							"/insertMember","/loginForm").permitAll() // 루투(/)는 모두 허용
					.requestMatchers("/css/**","/js/**","/images/**").permitAll() // 정적(static)리소스 모두허용
					.requestMatchers("/guest/**").permitAll() // guest 폴더는 모두 허용(JSP 파일 의미) /(게스트페이지)
					.requestMatchers("/member/**").hasAnyRole("USER","ADMIN") // memeber 폴더는 USER,ADMIN만 허용 (회원페이지)
					.requestMatchers("/admin/**").hasAnyRole("ADMIN") // admin 폴더는 ADMIN만 허용 (관리자페이지)
					.anyRequest().authenticated() // 나머지는 모두 인증 필요 
				);
		// 로그인 
		 http.formLogin((formLogin) -> formLogin 
			 .loginPage("/loginForm")
			 .loginProcessingUrl("/j_spring_security_check")
			 .defaultSuccessUrl("/")
			 .failureUrl("/loginError")
			 .usernameParameter("id")
			 .passwordParameter("passwd")
			 .permitAll()
		 );
		 
		// 로그아웃
		 http.logout((logout) -> logout
			 .logoutUrl("/logout")
			 .logoutSuccessUrl("/")
			 .permitAll()
		 );
		
		return http.build();
	}
	
}

