package com.elearn.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
public class SecurityConfig  extends WebSecurityConfigurerAdapter {


    private DataSource dataSource;

    private BCryptPasswordEncoder bCryptPasswordEncoder;


    @Autowired
    public SecurityConfig(DataSource dataSource, BCryptPasswordEncoder bCryptPasswordEncoder){

       this.dataSource = dataSource;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }

//    @Value("${spring.queries.users-query}")
//    private String usersQuery;
//
//    @Value("${spring.queries.roles-query}")
//    private String rolesQuery;

    @Override
    protected void configure(AuthenticationManagerBuilder auth)throws Exception{

         auth.jdbcAuthentication().usersByUsernameQuery("select username,password,enabled from users where username=?")
                .authoritiesByUsernameQuery("select username, authority from users where username=?")
                .dataSource(dataSource)
                .passwordEncoder(bCryptPasswordEncoder);

    }




    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http.csrf().disable()
                .authorizeRequests()
                //.antMatchers("/register/**").permitAll()
                .antMatchers("/resources/**").permitAll()
                .antMatchers("/admin/backup_data").hasRole("admin")
                .antMatchers("/admin/**").authenticated()
                .antMatchers("/profile").access("hasRole('ROLE_USER') || hasRole('ROLE_STUDENT')").and().authorizeRequests()
                .antMatchers("/admin/**").access("hasRole('ROLE_ADMIN') || hasRole('ROLE_TEACHER')").and().authorizeRequests()
                .and()
                .formLogin()
                .loginPage("/login").failureUrl("/login?error=true")
                .defaultSuccessUrl("/")
                .usernameParameter("username")
                .passwordParameter("password")
                .and()
                .logout()
                .logoutSuccessUrl("/loggedout")
                .permitAll();

    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        web
                .ignoring()
                .antMatchers("/resources/**","/exe/**","/fonts/**","/upload/**","/video/**", "/static/**", "/css/**", "/img/**", "/jsp/**","/admin_resources/**");
    }


}
