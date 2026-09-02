package com.springboot.Pilotproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.Pilotproject.dto.MemberDTO;

@Mapper
public interface MemberDAO {
	List<MemberDTO> selectAllMember();
	// 회원 가입
    int insertMember(MemberDTO member);
    
    // 아이디로 회원 조회
    MemberDTO selectMemberById(String mid);
    
    // 회원 정보 수정
    int updateMember(MemberDTO member);
    
    // 회원 삭제
    int deleteMember(int mno);
   
}
