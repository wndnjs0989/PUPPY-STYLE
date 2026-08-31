package com.springboot.Pilotproject.controller;

import java.io.File;
import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.springboot.Pilotproject.dao.MemberDAO;
import com.springboot.Pilotproject.dao.ProductDAO;
import com.springboot.Pilotproject.dto.MemberDTO;
import com.springboot.Pilotproject.dto.ProductDTO;

@Controller
public class ProductController {
	@Autowired
    private ProductDAO productDAO;

	 @Autowired
	private MemberDAO memberDAO;   
	 
    // 전체 공개 - 상품 목록
    @RequestMapping("/guest/productList")
    public String productList(Model model) {
        model.addAttribute("productList", productDAO.selectAllProducts());
        return "guest/productList";
    }
    // 상품 관리 페이지 버튼 도  admin만 볼수있게
    private boolean isAdmin(Principal principal) {
        if (principal == null) return false;
        MemberDTO mdto = memberDAO.selectMemberById(principal.getName());
        return mdto != null && "ADMIN".equals(mdto.getMauthority());
    }
   
    @RequestMapping("/guest/productDetail")
    public String productDetail(@RequestParam("pnum") long pnum, Model model) {
        ProductDTO product = productDAO.selectProductByPnum(pnum); 
        model.addAttribute("product", product);
        return "guest/productDetail";
    } 

    // 관리자 - 상품 등록 폼
    @RequestMapping("/admin/productWriteForm")
    public String productWriteForm() {
        return "admin/productWriteForm";
    }

    // 관리자 - 상품 등록 처리
    @RequestMapping("/admin/insertProduct")
    public String insertProduct(@RequestParam("pupload")MultipartFile pupload,ProductDTO pdto,Principal principal) throws Exception {
    	//로그인한 관리자 아이디
    	String mid =principal.getName();
    	//관리자정보 조회
    	 MemberDTO mdto = memberDAO.selectMemberById(mid);
    	//상품 등록자 번호 자동세팅
    	pdto.setMno(mdto.getMno());
    	
        if(!pupload.isEmpty()) {
        	String pimage =  pupload.getOriginalFilename();
        	pupload.transferTo(new File("C:\\SPRINGBOOT\\Pilotproject\\src\\main\\resources\\static\\images\\"+pimage));
        	pdto.setPimage(pimage);
        	}
        productDAO.insertProduct(pdto);
        return "redirect:/admin/productManage";
    }

    // 관리자 - 상품 관리 목록
    @RequestMapping("/admin/productManage")
    public String productManage(Model model) {
        model.addAttribute("productList", productDAO.selectAllProducts());
        return "admin/productManage";
    }

    // 관리자 - 상품 수정 폼
    @RequestMapping("/admin/productUpdateForm")
    public String productUpdateForm(@RequestParam("pnum") long pnum, Model model) {
        model.addAttribute("product", productDAO.selectProductByPnum(pnum));
        return "admin/productUpdateForm";
    }

    // 관리자 - 상품 수정 처리
    @RequestMapping("/admin/updateProduct")
    public String updateProduct(ProductDTO dto) {
        productDAO.updateProduct(dto);
        return "redirect:/admin/productManage";
    }

    // 관리자 - 상품 삭제
    @RequestMapping("/admin/deleteProduct")
    public String deleteProduct(@RequestParam("pnum") long pnum) {
        productDAO.deleteProduct(pnum);
        return "redirect:/admin/productManage";
    }
    @RequestMapping("/admin/memberDetail")
    public String memberDetail(@RequestParam("mid") String mid, Model model) {
        // 1. 서비스나 DAO를 통해 데이터 조회
        MemberDTO member = memberDAO.selectMemberById(mid);
        // 2. 모델에 담기
        model.addAttribute("member", member);
        // 3. JSP 파일 경로 반환 (WEB-INF 폴더 하위 경로 확인)
        return "admin/memberDetail"; 
    }
    @RequestMapping("/admin/memberDelete")
    public String memberDelete(@RequestParam("mno") int mno) {
        // mno라는 변수는 여기서 파라미터로 받아서 해결됩니다.
        memberDAO.deleteMember(mno); 
        return "redirect:/admin/memberList"; 
    }
}
