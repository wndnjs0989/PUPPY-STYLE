package com.springboot.Pilotproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.springboot.Pilotproject.dao.MemberDAO;
import com.springboot.Pilotproject.dto.MemberDTO;



@Service
public class PilotprojectService implements UserDetailsService { // 인터페이스 구현
    
    @Autowired
    private MemberDAO dao;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        MemberDTO dto = dao.selectMemberById(username);
        
        if (dto == null) {
            throw new UsernameNotFoundException("사용자를 찾을 수 없습니다: " + username);
        }
        return User.builder()
                   .username(dto.getMid())
                   .password(dto.getMpasswd())
                   .roles(dto.getMauthority())
                   .build();
    }
}

