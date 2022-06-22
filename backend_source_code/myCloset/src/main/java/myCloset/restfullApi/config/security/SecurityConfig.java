package myCloset.restfullApi.config.security;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@EnableWebSecurity
@RequiredArgsConstructor
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    private final CustomUserDetailsService userDetailsService;

    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().mvcMatchers("/swagger-ui/**", "/swagger-resources/**", "/v3/api-docs/**");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .httpBasic().disable()
                .formLogin().disable()
                .csrf().disable()
                .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                .and()
                    .authorizeRequests()
                        .antMatchers(HttpMethod.POST, "/api/sign-in", "/api/sign-up", "/api/refresh-token").permitAll()
                        .antMatchers(HttpMethod.POST, "/api/sign-down").authenticated()
                        .antMatchers(HttpMethod.POST, "/api/modify-info").authenticated()
                        .antMatchers(HttpMethod.POST, "/api/find-id").authenticated()
                        .antMatchers(HttpMethod.POST, "/api/find-pw").authenticated()
                        .antMatchers(HttpMethod.POST, "/api/record").authenticated()
                        .antMatchers(HttpMethod.GET, "/api/record").authenticated()
                        .antMatchers(HttpMethod.PUT, "/api/record").authenticated()
                        .antMatchers(HttpMethod.DELETE, "/api/record").authenticated()
                        .antMatchers(HttpMethod.POST, "/api/cloth").authenticated()
                        .antMatchers(HttpMethod.GET, "/api/cloth").authenticated()
                        .antMatchers(HttpMethod.PUT, "/api/cloth").authenticated()
                        .antMatchers(HttpMethod.DELETE, "/api/cloth").authenticated()
                        .antMatchers(HttpMethod.GET, "/api/**").permitAll()
                        .anyRequest().hasAnyRole("ADMIN")
                .and()
                    .exceptionHandling().accessDeniedHandler(new CustomAccessDeniedHandler())
                .and()
                    .exceptionHandling().authenticationEntryPoint(new CustomAuthenticationEntryPoint())
                .and()
                    .addFilterBefore(new JwtAuthenticationFilter(userDetailsService), UsernamePasswordAuthenticationFilter.class);
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return PasswordEncoderFactories.createDelegatingPasswordEncoder();
    }
}
