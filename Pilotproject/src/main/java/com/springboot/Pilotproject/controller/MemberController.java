package com.springboot.Pilotproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.Pilotproject.dao.MemberDAO;
import com.springboot.Pilotproject.dto.MemberDTO;

@Controller
public class MemberController {

    private final PasswordEncoder passwordEncoder;
	@Autowired
	private MemberDAO memberdao;

    MemberController(PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }
	
	@RequestMapping("/")
	public String root(){
		return "redirect:/main";
	}
	@RequestMapping("/main")
	public String main() {
		return "main";
	}
	@RequestMapping("/member/writeForm")
	public String login() {
		return "member/writeForm";
	}
	@RequestMapping("/member/jusoPopup")
    public String jusoPopup() {
        return "member/jusoPopup";
    }
	@RequestMapping("/insertMember")
	public String insertMember(MemberDTO dto,
							   @RequestParam("mtel1") String mtel1,
							   @RequestParam("mtel2") String mtel2,
							   @RequestParam("mtel3") String mtel3,
							   @RequestParam("maddr1") String maddr1,
							   @RequestParam("maddr2") String maddr2,
							   @RequestParam("mzip") String mzip,
							   @RequestParam(value="mhobby",required=false) String[] mhobby){
		dto.setMtel(mtel1+"-"+mtel2+"-"+mtel3);
		dto.setMprofile(maddr1+","+maddr2);
		dto.setMzip(mzip);
		dto.setMpasswd(passwordEncoder.encode(dto.getMpasswd()));
		
		if(mhobby != null) {
			dto.setMhobby(String.join(",",mhobby));			
		}
		
		memberdao.insertMember(dto);
		
		return "redirect:/main";
	}
	@RequestMapping("/admin/memberList")
	public String memberList(Model model) {
		model.addAttribute("memberList",memberdao.selectAllMember());
		return"admin/memberList";
	}
	
	@RequestMapping("/member/myPage")
	public String myPage() {
	    return "member/myPage";
	}
	@RequestMapping("/loginForm")
	public String loginForm() {
	    return "loginForm";
	}

	@RequestMapping("/loginError")
	public String loginError() {
	    return "loginError";
	}
	@RequestMapping("/member/updateForm")
	public String updateForm(Model model, Authentication auth) {
	    MemberDTO dto = memberdao.selectMemberById(auth.getName());
	    model.addAttribute("member", dto);
	    return "member/updateForm";
	}

	@RequestMapping("/member/updateMember")
	public String updateMember(MemberDTO dto,
	                           @RequestParam("mtel1") String mtel1,
	                           @RequestParam("mtel2") String mtel2,
	                           @RequestParam("mtel3") String mtel3,
	                           @RequestParam("maddr1") String maddr1,
	                           @RequestParam("maddr2") String maddr2,
	                           @RequestParam("mzip") String mzip,
	                           @RequestParam(value="mhobby", required=false) String[] mhobby,
	                           Authentication auth) {

	    // 기존 회원 정보 가져오기 (mno, mauthority 유지)
	    MemberDTO original = memberdao.selectMemberById(auth.getName());
	    dto.setMno(original.getMno());
	    dto.setMauthority(original.getMauthority());
	    dto.setMpasswd(original.getMpasswd()); // 비밀번호는 유지

	    dto.setMtel(mtel1 + "-" + mtel2 + "-" + mtel3);
	    dto.setMprofile(maddr1 + "," + maddr2);
	    dto.setMzip(mzip);

	    if(mhobby != null) {
	        dto.setMhobby(String.join(",", mhobby));
	    }

	    memberdao.updateMember(dto);
	    return "redirect:/main";
	}	
	@RequestMapping(value = "/member/esc", method = RequestMethod.GET)
    public String showEscPage() {
        return "member/esc"; 
    }

    // 2. 회원탈퇴 처리 (POST)
    @RequestMapping(value = "/member/esc", method = RequestMethod.POST)
    public String processEsc(Authentication auth) {
    	MemberDTO member = memberdao.selectMemberById(auth.getName());
        
        // 2. 조회된 회원 번호(mno)로 삭제 실행
        if(member != null) {
            memberdao.deleteMember(member.getMno());
        }
        return "redirect:/logout"; 
    }
}

